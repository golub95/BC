pageextension 50106 "Ext Item Ledger Entries" extends "Item Ledger Entries"
{
    layout
    {
        addafter("Variant Code")
        {
            field("Key waste number"; "Key waste number")
            {
                Caption = 'Key waste number';
                ToolTip = 'This field is transferred from purchase order.';
                ApplicationArea = All;
            }
        }
    }
}