page 50128 "Material Request List"
{
    ApplicationArea = All;
    Caption = 'Material Request List';
    PageType = List;
    SourceTable = "Material Request Header";
    CardPageId = "Material Request Card";
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
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
                }

                field("Created Date"; Rec."Created Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Created Date field.';
                }
                field("Used for PO"; Rec."Used for PO")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Used for PO field.';
                }

                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Auth; Rec.Auth)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Auth field.';
                }
                field("Staff No."; Rec."Staff No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Staff No. field.';
                }
                field("Date"; Rec."Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date field.';
                }

                field("Processed Name"; Rec."Processed Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Processed Name field.';
                }
                field("Sent for Processing Date"; Rec."Sent for Processing Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sent for Processing Date field.';
                }



            }
        }
    }
}
