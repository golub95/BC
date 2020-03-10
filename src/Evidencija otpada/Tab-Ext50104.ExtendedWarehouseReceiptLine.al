tableextension 50104 "ExtendedWarehouseReceiptLine" extends "Warehouse Receipt Line"
{
    fields
    {
        field(50100; "Key waste number"; Code[20])
        {
            DataClassification = CustomerContent;
        }

        field(50101; "Shipping Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Header"."Ship-to Name";
        }
    }
}