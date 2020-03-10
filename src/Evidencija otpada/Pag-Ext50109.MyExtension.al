pageextension 50109 "MyExtension" extends "User Setup"
{
    layout
    {
        addlast(Control1)
        {
            field(IsAdmin; IsAdmin)
            {
                ApplicationArea = All;
                Caption = 'IsAdmin';
            }
        }
    }
}