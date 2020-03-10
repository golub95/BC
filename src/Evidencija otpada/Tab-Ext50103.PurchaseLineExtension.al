tableextension 50103 "PurchaseLineExtension" extends "Purchase Line"
{
    fields
    {
        field(50100; "Key waste number"; Code[20])
        {
            Caption = 'Key waste number';
            DataClassification = CustomerContent;
            TableRelation = "Waste records"."Waste code";

            // trigger OnValidate()
            // var
            //     Item: Record Item;
            // begin
            //     Item.SetRange("No.");
            //     if (Item."Key waste number required" = true) then begin
            //         Message('Key waste number required');
            //     end;
            // end;
        }
    }
}


