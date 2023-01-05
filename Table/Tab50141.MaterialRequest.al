table 50141 "Material Request Header"
{
    Caption = 'Material Request Header';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
        }

        field(2; Status; Enum Status)
        {
            Caption = 'Status';
            DataClassification = ToBeClassified;
        }
        field(3; "Created Date"; Date)
        {
            Caption = 'Created Date';
            DataClassification = ToBeClassified;
        }
        field(4; "Used for PO"; Boolean)
        {
            Caption = 'Used for PO';
            DataClassification = ToBeClassified;
        }
        field(5; "Name"; Text[100])
        {
            Caption = 'Name';
            DataClassification = ToBeClassified;
        }
        field(6; "Auth"; Text[50])
        {
            Caption = 'Auth';
            DataClassification = ToBeClassified;
        }
        field(7; "Staff No."; Code[20])
        {
            Caption = 'Staff No.';
            DataClassification = ToBeClassified;
        }
        field(8; "Date"; Date)
        {
            Caption = 'Date';
            DataClassification = ToBeClassified;
        }
        field(9; "Processed Name"; Text[50])
        {
            Caption = 'Processed Name';
            DataClassification = ToBeClassified;
        }
        field(10; "Sent for Processing Date"; Date)
        {
            Caption = 'Sent for Processing Date';
            DataClassification = ToBeClassified;
        }
        field(11; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }



    var
        MaterialRequestExt: Record "Purchases & Payables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;



    trigger OnInsert()
    begin
        InitInsert();
        "Created Date" := Today; //auto fill date
    end;

    procedure InitInsert()
    begin
        if "No." = '' then begin
            TestNoSeries;
            // CheckFullyPaid;
            NoSeriesMgt.InitSeries(GetNoSeriesCode, xRec."No. Series", Today, "No.", "No. Series");
        end;
    end;

    procedure TestNoSeries()
    begin
        MaterialRequestExtSetup();
        MaterialRequestExt.TestField("Material Request Nos");


    end;



    procedure GetNoSeriesCode(): Code[20]
    var
        NoSeriesCode: Code[20];
    begin
        MaterialRequestExtSetup();
        NoSeriesCode := MaterialRequestExt."Material Request Nos";
        exit(NoSeriesCode);
    end;

    local procedure MaterialRequestExtSetup()
    begin
        MaterialRequestExt.Get();
    end;
}
