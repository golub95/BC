page 50103 "Customer Status Lists"
{
    Caption = 'Customer Status Lists';
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = "Customer Status";

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Code; Code)
                {
                    ApplicationArea = All;
                }
                field(Description; Description)
                {
                    ApplicationArea = All;

                }
                field("Blocked Status"; "Blocked Status")
                {
                    ApplicationArea = All;

                }
                field("Status warning message"; "Status warning message")
                {
                    ApplicationArea = All;
                }

            }
        }
        area(Factboxes)
        {

        }
    }
}