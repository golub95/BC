tableextension 50113 "SalesCrMemoHeaderExtension" extends "Sales Cr.Memo Header"
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