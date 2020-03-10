pageextension 50104 ExtendedWarehouseReceipts extends "Whse. Receipt Subform"
{
    layout
    {
        addlast(Control1)
        {
            field("Key waste number"; "Key waste number")
            {
                Caption = 'Key waste number';
                ApplicationArea = All;
                Editable = false;
            }

            field("Ship to"; "Shipping Name")
            {
                Caption = 'Shipping Name';
                ApplicationArea = All;
            }
        }
    }
}