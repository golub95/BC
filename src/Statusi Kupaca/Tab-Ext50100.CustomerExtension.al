tableextension 50100 "CustomerExtension" extends Customer
{
    fields
    {
        field(50100; "Customer Status"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Customer Status".Code;

            trigger OnValidate()
            var
                customerStatus: Record "Customer Status";
                Number: RecordRef;
            begin
                customerStatus.Get("Customer Status");
                Blocked := customerStatus."Blocked Status";
            end;
        }
    }
}

