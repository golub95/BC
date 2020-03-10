tableextension 50115 "DropShptPostBufferExtension" extends "Drop Shpt. Post. Buffer"
{
    fields
    {
        field(50100; "Customer Status"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Customer Status".Code;
        }
    }

    var
        myInt: Integer;
}