pageextension 50110 "SalesOrderArchiveExtension" extends "Sales Order Archive"
{
    layout
    {
        addlast(General)
        {
            field("Customer Status"; "Customer Status")
            {
                ApplicationArea = All;
            }
        }
    }
}