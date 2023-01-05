page 50131 "Aircraft Types"
{
    ApplicationArea = All;
    Caption = 'Aircraft Type';
    PageType = List;
    SourceTable = "Aircraft Type";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
            }
        }
    }

    actions
    {


    }
}




