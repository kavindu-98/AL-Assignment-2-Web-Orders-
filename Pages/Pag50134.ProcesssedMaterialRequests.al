page 50138 "Processed Material Requests"
{
    ApplicationArea = All;
    Caption = 'Processed Material Requests';
    PageType = List;
    SourceTable = "Material Request Header";
    SourceTableView = WHERE(Status = const(Processed));
    CardPageId = "Processing Material Req";
    Editable = false;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Created Date"; Rec."Created Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Created Date field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
        }
    }


}
