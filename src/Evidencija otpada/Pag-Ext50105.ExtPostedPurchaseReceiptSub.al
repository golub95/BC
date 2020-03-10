pageextension 50105 "ExtPostedPurchaseReceiptSub" extends "Posted Purchase Rcpt. Subform"
{
    Editable = true;
    layout
    {
        addlast(Control1)
        {
            field("Key waste number"; "Key waste number")
            {
                Caption = 'Key waste number';
                ApplicationArea = All;
                Editable = IsAdmin;
            }
        }
    }
    trigger OnOpenPage()
    begin
        IsCurrentUserAdmin();
    end;

    local procedure IsCurrentUserAdmin(): Boolean
    var
        userSetup: Record "User Setup";
    begin
        userSetup.Get(Database.UserId);
        IsAdmin := userSetup.IsAdmin;
    end;

    var
        IsAdmin: Boolean;
}