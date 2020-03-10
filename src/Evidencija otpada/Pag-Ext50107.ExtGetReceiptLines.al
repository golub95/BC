pageextension 50107 "ExtGetReceiptLines" extends "Get Receipt Lines"
{
    layout
    {
        addlast(Control1)
        {
            field("Key waste number"; "Key waste number")
            {
                Caption = 'Key waste number';
                ToolTip = 'Value from Item';
                ApplicationArea = All;
            }
        }
    }
}