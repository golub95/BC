table 50101 "Waste records"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Waste code"; Code[10])
        {
            Caption = 'Waste code';
            DataClassification = CustomerContent;
        }
        field(2; Description; Text[250])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Waste code")
        {
            Clustered = true;
        }
    }
}