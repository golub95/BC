tableextension 50119 "DetVendorLedgEntryExtension" extends "Detailed Vendor Ledg. Entry"
{
    fields
    {
        field(50100; UserID; Code[50])
        {
            DataClassification = ToBeClassified;
        }

        field(50101; InsertDate; DateTime)
        {
            DataClassification = ToBeClassified;
        }
    }

    trigger OnInsert()
    var
        userSetup: Record "User Setup";
    begin
        if (userSetup.Get(Database.UserId)) then begin
            UserID := userSetup."User ID";
            InsertDate := CurrentDateTime;
        end;
    end;
}