

pageextension 50132 "Material Request No" extends "Purchase Order"
{
    layout
    {
        addafter("Quote No.")
        {
            field("Material Req No"; Rec."Material Req No")
            {
                ApplicationArea = all;
                ShowMandatory = true;
                Editable = false;
                ToolTip = 'Specifies the value of Material requst no';
            }
        }
    }





}