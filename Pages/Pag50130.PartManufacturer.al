page 50130 "Part Manufacturers"
{
    ApplicationArea = All;
    Caption = 'Part Manufacturers';
    PageType = List;
    SourceTable = "Part Manufacturer";
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




