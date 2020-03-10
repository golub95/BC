pageextension 50101 "Ext Sales & Receivables Setup" extends "Sales & Receivables Setup" //MyTargetPageId
{
    layout
    {
        addlast(general)
        {
            field("Credit Limit Block"; "Credit Limit Block")
            {
                Caption = 'Credit Limit Block';
                ApplicationArea = All;
            }
        }
    }
}