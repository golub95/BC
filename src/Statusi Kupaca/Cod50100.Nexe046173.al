codeunit 50100 "Nexe046173"
{
    [EventSubscriber(ObjectType::Table, Database::"Customer", 'OnBeforeCheckBlockedCust', '', true, true)]
    procedure CustomLogic(var IsHandled: Boolean)
    begin
        IsHandled := true;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnBeforePostSalesDoc', '', true, true)]
    local procedure SetCustomerStatusOnSalesHeader(var SalesHeader: Record "Sales Header")
    var
        customer: Record Customer;
    begin
        if (customer.Get(SalesHeader."Sell-to Customer No.")) then
            SalesHeader."Customer Status" := customer."Customer Status";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::ArchiveManagement, 'OnBeforeSalesHeaderArchiveInsert', '', true, true)]
    local procedure SetCustomerStatus(var SalesHeaderArchive: Record "Sales Header Archive"; SalesHeader: Record "Sales Header")
    var
        customer: Record Customer;
    begin
        if (customer.get(SalesHeader."Sell-to Customer No.")) then
            SalesHeaderArchive."Customer Status" := customer."Customer Status";
    end;

    // SetCustomerStatusOnInvoiceHeader on Sales Docs: Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order

    // Sales Invoice Header
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterSalesInvHeaderInsert', '', true, true)]
    local procedure SetCustomerStatusOnInvoiceHeader(SalesHeader: Record "Sales Header"; var SalesInvHeader: Record "Sales Invoice Header")
    begin
        SalesInvHeader."Customer Status" := SalesHeader."Customer Status";
    end;

    // Sales Cr.Memo Header
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterSalesCrMemoHeaderInsert', '', true, true)]
    local procedure SetCustomerStatusOnSalesCrMemoHeader(SalesHeader: Record "Sales Header"; var SalesCrMemoHeader: Record "Sales Cr.Memo Header")
    begin
        SalesCrMemoHeader."Customer Status" := SalesHeader."Customer Status";
    end;

    // Sales Shipment Header
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterFinalizePostingOnBeforeCommit', '', true, true)]
    local procedure SetCustomerStatusOnSalesShipmentHeader(SalesHeader: Record "Sales Header"; var SalesShipmentHeader: Record "Sales Shipment Header")
    begin
        //napravi neku provjeru
        SalesShipmentHeader."Customer Status" := SalesHeader."Customer Status";
    end;
}