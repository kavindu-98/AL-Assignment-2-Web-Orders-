table 50134 "Web Order"
{
    Caption = ' Web Order';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document Type"; Enum "Web Order Type")
        {
            Caption = 'Document Type';
            DataClassification = ToBeClassified;
        }
        field(2; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            DataClassification = ToBeClassified;
        }
        field(3; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = ToBeClassified;
        }
        field(4; "Location Code"; Code[20])
        {
            Caption = 'Location Code ';
            DataClassification = ToBeClassified;
            TableRelation = Location;
        }
        field(5; "Document Date"; Date)
        {
            Caption = 'Document Date';
            DataClassification = ToBeClassified;
        }
        field(6; "Customer No."; Code[20])
        {
            Caption = 'Customer No. ';
            DataClassification = ToBeClassified;
            TableRelation = Customer;
        }
        field(7; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            DataClassification = ToBeClassified;
            TableRelation = Item;
        }
        field(8; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
        field(9; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DataClassification = ToBeClassified;
        }
        field(10; "Unit Price"; Decimal)
        {
            Caption = 'Unit Price';
            DataClassification = ToBeClassified;
        }
        field(11; "Discount Amount"; Decimal)
        {
            Caption = 'Discount Amount';
            DataClassification = ToBeClassified;
        }
        field(12; Amount; Decimal)
        {
            Caption = 'Amount';
            DataClassification = ToBeClassified;
        }
        field(13; "Order/Quote Created"; Boolean)
        {
            Caption = 'Order/Quote Created';
            DataClassification = ToBeClassified;
        }
        field(14; "Order/Quote Created User"; Code[50])
        {
            Caption = 'Order/Quote Created User';
            DataClassification = ToBeClassified;
        }
        field(15; "Order/Quote Created Date"; Date)
        {
            Caption = 'Order/Quote Created Date';
            DataClassification = ToBeClassified;
        }
        field(16; "Order/Quote Created Time"; Time)
        {
            Caption = 'Order/Quote Created Time ';
            DataClassification = ToBeClassified;
        }
        field(17; "Imported User"; Code[50])
        {
            Caption = 'Imported User';
            DataClassification = ToBeClassified;
        }
        field(18; "Imported Date"; Date)
        {
            Caption = 'Imported Date';
            DataClassification = ToBeClassified;
        }
        field(19; "Imported Time"; Time)
        {
            Caption = 'Imported Time';
            DataClassification = ToBeClassified;
        }
        field(20; "SO Posting Command"; Boolean)
        {
            Caption = 'SO Posting Command';
            DataClassification = ToBeClassified;
        }
        field(21; "SO Posted "; Boolean)
        {
            Caption = 'SO Posted ';
            DataClassification = ToBeClassified;
        }
        field(22; "Posted Invoice No."; Code[20])
        {
            Caption = 'Posted Invoice No.';
            DataClassification = ToBeClassified;
        }
        field(23; "Posted Shipment No."; Code[20])
        {
            Caption = 'Posted Shipment No.';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Document Type", "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }
}
