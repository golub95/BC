pageextension 50112 "CustomerListExtension" extends "Customer List"
{
    trigger OnOpenPage()
    begin
        //report.Run(Report::MyFirstReport);
        //test
        report.Run(Report::"Adacta Fixed Asset - List");
    end;
}