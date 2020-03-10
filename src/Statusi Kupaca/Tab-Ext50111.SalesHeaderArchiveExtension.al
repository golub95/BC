tableextension 50111 "SalesHeaderArchiveExtension" extends "Sales Header Archive"
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