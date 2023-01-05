table 50138 "Material Request Line"
{
    Caption = 'Material Request Line';
    DataClassification = ToBeClassified;


    fields
    {
        field(1; "Part Number"; Code[20])
        {
            Caption = 'Part Number';
            DataClassification = ToBeClassified;

            TableRelation = Item;
            trigger OnValidate()

            begin
                items.Reset();
                if items.Get("Part Number") then begin
                    "ALT Part Number" := items."Alternative Part 1";
                    "Location Code" := items."Location Code";
                    "Aircraft Type" := items."Aircraft Type";
                    Description := items.Description;
                    "Aircraft Chapter" := items."ATA (Aircraft Chapter)";
                    "Reference Number" := items."IPC (Reference Number)";
                end
                else begin
                    "ALT Part Number" := '';
                    "Location Code" := '';
                    "Aircraft Type" := '';
                    Description := '';
                    "Aircraft Chapter" := '';
                    "Reference Number" := '';
                end;


            end;



        }

        field(2; "ALT Part Number"; Code[20])
        {
            Caption = '"ALT Part Number"';
            DataClassification = ToBeClassified;
        }
        field(3; "Quantity"; Integer)
        {
            Caption = 'Quantity';
            DataClassification = ToBeClassified;
        }
        field(4; "Location Code"; Text[50])
        {
            Caption = 'Location Code';
            DataClassification = ToBeClassified;
            TableRelation = Location;
        }
        field(5; "Aircraft Chapter"; Text[100])
        {
            Caption = 'Aircraft Chapter';
            DataClassification = ToBeClassified;
        }
        field(6; "Reference Number"; Text[50])
        {
            Caption = 'Reference Number';
            DataClassification = ToBeClassified;
        }
        field(7; "Description"; Text[200])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
        field(8; "Aircraft Type"; Code[20])
        {
            Caption = 'Aircraft Type';
            TableRelation = "Aircraft Type".Code;
            DataClassification = ToBeClassified;
        }
        field(9; "Impact Reason"; Text[50])
        {
            Caption = 'Impact Reason';
            DataClassification = ToBeClassified;
        }
        field(10; "Request Number"; Code[20])
        {
            Caption = 'Request Number';
            DataClassification = ToBeClassified;
        }
        field(11; "Line Number"; Integer)
        {
            Caption = 'Line Number';
            DataClassification = ToBeClassified;

        }
    }
    keys
    {
        key(PK; "Request Number", "Line Number")
        {
            Clustered = true;
        }
    }

    var
        items: Record Item;
}
