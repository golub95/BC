tableextension 50113 "SalesCrMemoHeaderExtension" extends "Sales Cr.Memo Header"
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