tableextension 50116 "GLEntryExtension" extends "G/L Entry"
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
        if (userSetup.Get(UserID)) then begin
            UserID := userSetup."User ID";
            InsertDate := CurrentDateTime;
        end;
    end;
}