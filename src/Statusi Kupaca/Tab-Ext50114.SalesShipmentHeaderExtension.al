tableextension 50114 "SalesShipmentHeaderExtension" extends "Sales Shipment Header"
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