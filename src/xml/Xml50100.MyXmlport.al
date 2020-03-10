xmlport 50100 "MyXmlport"
{
    CaptionML = ENU = 'IC G/L Account Import/Export', HRV = 'IC G/L Account Uvoz/Izvoz';
    Format = FixedText;

    schema
    {

        textelement(Root)
        {
            tableelement(Integer; Integer)
            {
                XmlName = 'CUstomerHeader';
                SourceTableView = sorting(Number) where(Number = const(1));

                textelement(custNoTitle)
                {
                    Width = 10;

                    trigger OnBeforePassVariable()
                    begin
                        custNoTitle := customer.FieldCaption("No.")
                    end;
                }
            }
            tableelement(customer; Customer)
            {
                XmlName = 'ICGLAccount';
                fieldattribute("No."; customer."No.")
                {
                }
                fieldattribute(Id; customer.SystemId)
                {
                }
                fieldelement(Name; customer.Name)
                {
                }
                fieldelement(Amount; customer.Amount)
                {
                }
            }
        }
    }

    requestpage
    {
        actions
        {
            area(processing)
            {
                action(ActionName)
                {

                }
            }
        }
    }

    var
        myInt: Integer;
}