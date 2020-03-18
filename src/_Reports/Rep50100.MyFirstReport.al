report 50100 "MyFirstReport"
{
    UsageCategory = Administration;
    ApplicationArea = All;
    CaptionML = ENU = 'My First Report', HRV = 'Moj prvi izvještaj';
    Description = 'My First Report';
    DefaultLayout = RDLC;
    RDLCLayout = 'layouts/My First Report.rdl';


    dataset
    {
        dataitem(ReportVariables; Integer)
        {
            DataItemTableView = sorting(number) where(Number = const(1));

            column(DisplayLedgerInformation; DisplayLedgerInformations)
            {

            }

            column(companyName; CompanyInfo.Name)
            {
                IncludeCaption = true;
            }

            column(companyAdress; CompanyInfo.Address)
            {
                IncludeCaption = true;
            }
            column(companyCity; CompanyInfo.City)
            {
                IncludeCaption = true;
            }
            column(logo; CompanyInfo.Picture)
            {
                IncludeCaption = true;
            }
        }

        dataitem(Customer; Customer)
        {
            DataItemTableView = SORTING(Name);
            RequestFilterFields = "No.", City, "Bill-to Customer No.";

            column(No_; "No.")
            {
                IncludeCaption = true;
            }
            column(Name; Name)
            {
                IncludeCaption = true;
            }
            column(BalanceLCY; "Balance (LCY)")
            {
                IncludeCaption = true;
            }

            dataitem(CustLedgerEntry; "Cust. Ledger Entry")
            {
                DataItemLinkReference = Customer;
                DataItemLink = "Customer No." = field("No.");
                DataItemTableView = sorting("Posting Date");

                column(Amount; Amount)
                {
                    IncludeCaption = true;
                }
                column(Posting_Date; "Posting Date")
                {
                    IncludeCaption = true;
                }

                trigger OnAfterGetRecord()
                begin
                    if "Customer No." = '32656565' then
                        Message('bla');
                end;
            }

            trigger OnAfterGetRecord()
            begin
                CalcFields(Balance);
                if Balance = 0 then
                    CurrReport.Skip();
            end;
        }
    }

    requestpage
    {
        SaveValues = true;
        layout
        {
            area(Content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(DisplayLedgerInformation; DisplayLedgerInformations)
                    {
                        ApplicationArea = All;
                        Caption = 'Show Ledgers';
                        ToolTipML = ENG = 'Specifies that ledgers are shown on the report', HRV = 'Prikaži stavke na izvještaju';
                    }
                }
            }
        }
    }

    var
        CompanyInfo: Record "Company Information";
        DisplayLedgerInformations: Boolean;

    trigger OnPreReport()
    begin
        CompanyInfo.Get();
        CompanyInfo.CalcFields(Picture);
    end;
}