tableextension 50117 "VendorLedgerEntryExtension" extends "Vendor Ledger Entry"
{
    fields
    {
        field(50100; UserID; Code[50])
        {
            DataClassification = CustomerContent;
        }

        field(50101; InsertDate; DateTime)
        {
            DataClassification = CustomerContent;
        }
    }

    trigger OnInsert()
    var
        userSetup: Record "User Setup";
    begin
        if (userSetup.Get(Database.UserId())) then begin
            UserID := userSetup."User ID";
            InsertDate := CurrentDateTime();
        end;
    end;
}