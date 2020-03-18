tableextension 50115 "DropShptPostBufferExtension" extends "Drop Shpt. Post. Buffer"
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