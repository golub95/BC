page 50102 "Waste Records List"
{
    Caption = 'Waste Records List';
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = "Waste records";

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Waste code"; "Waste code")
                {
                    ApplicationArea = All;
                }
                field(Description; Description)
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