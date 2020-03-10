tableextension 50105 "ExtendedPurchRcptLine" extends "Purch. Rcpt. Line"
{
    fields
    {
        field(50100; "Key waste number"; Code[20])
        {
            Caption = 'Key waste number';
            DataClassification = CustomerContent;
            TableRelation = "Waste records"."Waste code";

            trigger OnValidate()
            var
                Cod50101_WarehouseRecLineSubscriber: Codeunit "WarehouseRecLine Subscriber";
            begin
                Cod50101_WarehouseRecLineSubscriber.ModifyItemLedgerEntry("Document No.", "Line No.", "Key waste number");
                // itemLedgEntry.SetRange(itemLedgEntry."Document No.", "Document No.");
                // itemLedgEntry.SetRange(itemLedgEntry."Document Line No.", "Line No.");
                // itemLedgEntry.FindSet();
                // itemLedgEntry."Key waste number" := "Key waste number";
                // itemLedgEntry.Modify();
            end;
        }
    }
}