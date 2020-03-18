tableextension 50111 "SalesHeaderArchiveExtension" extends "Sales Header Archive"
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