tableextension 50139 "User Permission" extends "User Setup"
{
    fields
    {
        field(50100; "Import web order permission"; Boolean)
        {
            Caption = ' Import web order permission';
            DataClassification = ToBeClassified;
        }
        field(50101; "Create web order permission"; Boolean)
        {
            Caption = 'Create web order permission';
            DataClassification = ToBeClassified;
        }
        field(50102; "Web order posting permission"; Boolean)
        {
            Caption = 'Web order posting permission';
            DataClassification = ToBeClassified;
        }
    }
}
