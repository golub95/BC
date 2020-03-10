pageextension 50100 "Item Card Extension" extends "Item Card"
{
    layout
    {
        addlast(ItemTracking)
        {
            field("Key waste number required"; "Key waste number required")
            {
                ApplicationArea = All;
            }
        }
    }
}
