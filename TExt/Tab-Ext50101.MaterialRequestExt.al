tableextension 50101 "Material Request Ext" extends "Purchases & Payables Setup"
{
    fields
    {
        field(50100; "Material Request Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
    }
}
