tableextension 50112 "SalesInvoiceHeaderExtension" extends "Sales Invoice Header"
{
    fields
    {
        field(50100; "Customer Status"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Customer Status".Code;
        }
    }
}