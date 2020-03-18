table 50102 "Customer Status"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            DataClassification = CustomerContent;
        }
        field(2; Description; Text[250])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(3; "Blocked Status"; Option)
        {
            Caption = 'Blocked Status';
            DataClassification = CustomerContent;
            OptionCaption = ' ,Ship,Invoice,All';
            OptionMembers = " ",Ship,Invoice,All;
            //TableRelation = Customer.Blocked;
        }
        field(4; "Status warning message"; Text[50])
        {
            Caption = 'Status warning message';
            DataClassification = CustomerContent;
        }
        field(5; "saadas"; Option)
        {
            DataClassification = CustomerContent;
            OptionMembers = TextVar;
        }
    }

    keys
    {
        key(PK; Code)
        {
            Clustered = true;
        }
    }
}