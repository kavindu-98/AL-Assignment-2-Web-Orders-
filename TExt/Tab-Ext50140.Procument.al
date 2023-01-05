tableextension 50140 "Procument" extends Item
{
    fields
    {
        field(50100; "International Vendor Number"; Text[100])
        {
            Caption = 'International Vendor Number';
            DataClassification = ToBeClassified;
        }
        field(50101; "ATA (Aircraft Chapter)"; Text[100])
        {
            Caption = 'ATA (Aircraft Chapter)';
            DataClassification = ToBeClassified;
        }
        field(50102; "IPC (Reference Number)"; Text[100])
        {
            Caption = 'IPC (Reference Number)';
            DataClassification = ToBeClassified;
        }
        field(50103; "CMM (Component Maintain ..)"; Text[100])
        {
            Caption = 'CMM (Component Maintain ..)';
            DataClassification = ToBeClassified;
        }
        field(50104; "Alternative Part 1"; Code[20])
        {
            Caption = 'Alternative Part 1';
            DataClassification = ToBeClassified;
        }
        field(50105; "Alternative Part 2"; Code[20])
        {
            Caption = 'Alternative Part 2';
            DataClassification = ToBeClassified;
        }
        field(50106; "Alternative Part 3"; Code[20])
        {
            Caption = 'Alternative Part 3';
            DataClassification = ToBeClassified;
        }
        field(50107; "Alternative Part 4"; Code[20])
        {
            Caption = 'Alternative Part 4';
            DataClassification = ToBeClassified;
        }

        field(50108; "Type of Spare Part"; Enum "FA Values")
        {
            Caption = 'Type of Spare Part';
            DataClassification = ToBeClassified;
        }
        field(50109; "Manufacturer Name"; Code[20])
        {
            Caption = 'Manufacturer Name';
            TableRelation = "Part Manufacturer";
            DataClassification = ToBeClassified;
        }
        field(50110; "Aircraft Type"; Code[20])
        {
            Caption = 'Aircraft Type';
            TableRelation = "Aircraft Type";
            DataClassification = ToBeClassified;
        }

        field(50111; "FA Subclass"; Code[10])
        {
            Caption = 'FA Subclass';
            TableRelation = "FA Subclass";
            DataClassification = ToBeClassified;
        }
        field(50112; "FA Class Code"; Code[10])
        {
            Caption = 'FA Class Code';
            TableRelation = "FA Class";
            DataClassification = ToBeClassified;
        }

        field(50113; "Inv. Adj Acc"; Code[20])
        {
            Caption = 'Inv. Adj Acc';
            TableRelation = "G/L Account"."No." where(Blocked = filter(false), "Direct Posting" = filter(true));
            DataClassification = ToBeClassified;
        }
        field(50114; "Location Code"; Code[20])
        {
            Caption = 'Location Code';
            TableRelation = Location WHERE("Use As In-Transit" = CONST(false));
            DataClassification = ToBeClassified;
        }

    }
}
