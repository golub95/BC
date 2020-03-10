pageextension 50102 "PurchaseOrderSubform" extends "Purchase Order Subform"
{
    layout
    {
        addlast(Control1)
        {
            field("Key waste number"; "Key waste number")
            {
                Caption = 'Key waste number';
                ApplicationArea = All;
                ToolTip = 'If Key waste number (on Item) is required, This field is also requierd.';
            }
        }
    }
}