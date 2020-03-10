pageextension 50103 "CustomerCardExtension" extends "Customer Card"
{
    layout
    {
        // addlast(General)
        // {
        //     field("Customer Status"; "Customer Status")
        //     {
        //         Caption = 'Customer Status';
        //         ApplicationArea = All;
        //     }
        // }
    }

    actions
    {
        addafter("Co&mments")
        {
            action("Export Customer to XML")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Xmlport.Run(5100);
                end;
            }
        }
    }
}