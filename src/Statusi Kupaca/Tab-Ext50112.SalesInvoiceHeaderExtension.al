tableextension 50112 "SalesInvoiceHeaderExtension" extends "Sales Invoice Header"
{
    fields
    {
        field(50100; "Customer Status"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Customer Status".Code;
        }
    }
}