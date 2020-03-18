codeunit 50101 "WarehouseRecLine Subscriber"
{
    EventSubscriberInstance = StaticAutomatic;
    Permissions = Tabledata "Item Ledger Entry" = rm; // dodaje (Read and Modify) prava Codeunitu na tablici ITEM LEDGER ENTRY

    [EventSubscriber(ObjectType::Table, Database::"Warehouse Receipt Line", 'OnBeforeInsertEvent', '', true, true)]
    local procedure GetWarehouseReciptLine(var Rec: Record "Warehouse Receipt Line")
    var
        purchaseLine: Record "Purchase Line";
        item: Record Item;
    begin
        if (Rec."Source Type" = Database::"Purchase Line") then begin // IF WAREHOUSE RECEIPT - SOURCE DOC IS PURCHASE ORDER

            item.Get(Rec."Item No."); // GET ITEM
            purchaseLine.Get(Rec."Source Subtype", Rec."Source No.", Rec."Source Line No."); // GET: DOC TYPE, DOC. No., SOURCE LINE No.

            if (item."Key waste number required" = true) then begin // IF FIELD Key waste number is REQUIRED ON ITEM AND
                purchaseLine.TestField("Key waste number"); // IF KEY WASTE NUMBER IS NOT EMPTY IN PURCHASE ORDER LINE THEN
                Rec."Key waste number" := purchaseLine."Key waste number";  // SET KEY WASTE NUMBER ON WAREHOUSE RECEIPT LINE
            end;
        end;
    end;

    // Na recima naloga za prijem treba se vidjeti i polje "Ime za otpremu" s narudžbenice
    [EventSubscriber(ObjectType::Page, Page::"Whse. Receipt Subform", 'OnAfterGetRecordEvent', '', true, true)]
    local procedure SetShippingName(var Rec: Record "Warehouse Receipt Line")
    var
        purchaseHeader: Record "Purchase Header";
    begin
        if (Rec."Source Type" = Database::"Purchase Line") then begin
            purchaseHeader.Get(Rec."Source Subtype", Rec."Source No.");
            if (purchaseHeader."Ship-to Name" <> '') then
                Rec."Shipping Name" := purchaseHeader."Ship-to Name";
        end;
    end;

    // Knjiženje - nova polja će se prenjeti na "POSTED PURCHASE RECEIPT" tablicu
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Whse.-Post Receipt", 'OnAfterInitPostedRcptLine', '', true, true)]
    local procedure GetRecieptLines(var WarehouseReceiptLine: Record "Warehouse Receipt Line"; var PostedWhseReceiptLine: Record "Posted Whse. Receipt Line")
    begin
        if (WarehouseReceiptLine."Key waste number" <> '') then
            PostedWhseReceiptLine."Key waste number" := WarehouseReceiptLine."Key waste number";
    end;

    // Knjiženje - Proslijedi Key waste number na Item Journal Line (zato što ne može direktno na ITEM LEDGER ENTRIES tablicu)
    [EventSubscriber(ObjectType::Table, Database::"Item Journal Line", 'OnAfterCopyItemJnlLineFromPurchLine', '', true, true)]
    local procedure SetKeywastenumberNewItemLedgEntry(PurchLine: Record "Purchase Line"; var ItemJnlLine: Record "Item Journal Line")
    begin
        if (PurchLine."Key waste number" <> '') then
            ItemJnlLine."Key waste number" := PurchLine."Key waste number";
    end;

    // Knjiženje - nova polja će se prenjeti na ITEM LEDGER ENTRIES tablicu sa Item Journal Line - tablice
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", 'OnAfterInitItemLedgEntry', '', true, true)]
    local procedure SetKeywastenumberOnItemJournalLine(ItemJournalLine: Record "Item Journal Line"; var NewItemLedgEntry: Record "Item Ledger Entry")
    begin
        if (ItemJournalLine."Key waste number" <> '') then
            NewItemLedgEntry."Key waste number" := ItemJournalLine."Key waste number";
    end;

    // Ako admin promijeni Key waste number na proknjiženom dokumentu /POSTED PURCHASE RECEIPT, promijena će se odraziti i na ITEM LEDGER ENTRIES!!!
    // Ova logika se mogla nalaziti na /tableextension 50105 "ExtendedPurchRcptLine", ali ekstenzije tablice ne mogu koristiti property Permissions, koji omogućava uređivanje bazne tablice
    // 
    procedure ModifyItemLedgerEntry(var DocumentNo: Code[20]; DocLineNo: Integer; KeywasteNumber: Code[20])
    var
        itemLedgEntry: Record "Item Ledger Entry";
    begin
        itemLedgEntry.SetRange(itemLedgEntry."Document No.", "DocumentNo");
        itemLedgEntry.SetRange(itemLedgEntry."Document Line No.", "DocLineNo");
        itemLedgEntry.FindSet();
        itemLedgEntry."Key waste number" := "KeywasteNumber";
        itemLedgEntry.Modify();
    end;
}