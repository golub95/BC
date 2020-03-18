tableextension 50110 "SalesHeaderExtension" extends "Sales Header"
{
    fields
    {
        field(50100; "Customer Status"; Code[20])
        {
            DataClassification = CustomerContent;
        }

        modify("Sell-to Customer No.")
        {
            trigger OnAfterValidate()
            var
                customerStatus: Record "Customer Status";
            begin
                if (customer.Get("Sell-to Customer No.")) then
                    if (customerStatus.Get(customer."Customer Status")) then begin
                        if (customer.Blocked <> customer.Blocked::" ") then
                            Message(customerStatusMessage, customer."No.", customerStatus.Description, customerStatus."Status warning message");
                        Clear(customer);
                    end;

            end;
        }

        modify("Bill-to Customer No.")
        {
            trigger OnAfterValidate()
            var
                customerStatus: Record "Customer Status";
            begin
                if (customer.Get("Bill-to Customer No.")) then begin

                    if (customerStatus.Get(customer."Customer Status")) then
                        if (customer.Blocked <> customer.Blocked::" ") then
                            Message(customerStatusMessage, customer."No.", customerStatus.Description, customerStatus."Status warning message");

                    Clear(customer);

                end;
            end;
        }
    }

    var
        customer: Record Customer;
        customerStatusMessage: TextConst ENU = 'Customer %1 has status %2 - %3', HRV = 'Kupac %1 je u statusu %2 - %3';
}