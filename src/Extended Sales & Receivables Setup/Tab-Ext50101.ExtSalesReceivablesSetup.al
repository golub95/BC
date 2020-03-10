tableextension 50101 "Ext Sales & Receivables Setup" extends "Sales & Receivables Setup"
{
    fields
    {
        field(50100; "Credit Limit Block"; Boolean)
        {
            Caption = 'Credit Limit Block';
            DataClassification = CustomerContent;
        }
    }
}