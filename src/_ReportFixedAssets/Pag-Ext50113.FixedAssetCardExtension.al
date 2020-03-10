pageextension 50113 "FixedAssetCardExtension" extends "Fixed Asset Card"
{
    layout
    {
        addlast(General)
        {
            field("External No."; "External No.")
            {
                ApplicationArea = All;
            }
        }
    }
}