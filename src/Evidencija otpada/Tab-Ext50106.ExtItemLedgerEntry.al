tableextension 50106 "Ext Item Ledger Entry" extends "Item Ledger Entry"
{
    fields
    {
        field(50100; "Key waste number"; Code[20])
        {
            Caption = 'Key waste number';
            DataClassification = CustomerContent;
        }
    }
}