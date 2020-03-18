codeunit 50106 "Sales-PostSubscriber"
{
    EventSubscriberInstance = StaticAutomatic;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post (Yes/No)", 'OnBeforeConfirmSalesPost', '', true, true)]

    local procedure CheckCustomerCreditLimits(var SalesHeader: Record "Sales Header")
    var
        Cust: Record Customer;
        LineTable: Record "Sales Line";
        custMessage: TextConst ENU = 'Customer is blocked', HRV = 'Kupac je prekoračio novčani limit!';

    begin
        //Dohvati polje sa settings-a i provjeri je li checked
        if isParamInSettingsIsChecked() and (SalesHeader."Document Type" = SalesHeader."Document Type"::Order) then begin
            //Dohvati Customer limit i usporedi sa cijenom na dokumentu. Ako je cijena doc > od limita na customeru izbaci poruku i nemoj knjižiti dokument
            Cust.GET(SalesHeader."Sell-to Customer No.");
            Cust.CalcFields("Balance (LCY)");
            // LineTable.SetRange("Document Type", SalesHeader."Document Type");
            // LineTable.SetRange("Document No.", SalesHeader."No.");
            // LineTable.FindSet;
            // LineTable.CalcSums("Amount Including VAT");
            SalesHeader.CalcFields("Amount Including VAT");
            if Cust."Credit Limit (LCY)" < SalesHeader."Amount Including VAT" + Cust."Balance (LCY)" then
                Error(custMessage);
        end;
    end;

    local procedure isParamInSettingsIsChecked(): Boolean
    var
        SalesSetup: Record "Sales & Receivables Setup";
    begin
        SalesSetup.Get();
        exit(SalesSetup."Credit Limit Block");
    end;
}