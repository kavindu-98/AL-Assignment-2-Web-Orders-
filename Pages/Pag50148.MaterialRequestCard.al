page 50148 "Material Request Card"
{
    Caption = 'Material Request Card';
    PageType = Card;
    SourceTable = "Material Request Header";
    UsageCategory = Administration;
    PromotedActionCategories = 'New,Process,Report,Request,Create';
    // AutoSplitKey = true;

    layout
    {
        area(content)
        {
            group(General)
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
                    Editable = false;
                }

                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
                    Editable = false;
                }
                field("Used for PO"; Rec."Used for PO")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Used for PO field.';
                }
            }

            part("Material Request Line"; "Material Request Subform")
            {
                SubPageLink = "Request Number" = field("No.");
                ApplicationArea = All;

            }



            group("Requested By Details")
            {
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Staff No."; Rec."Staff No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Staff No. field.';
                }
                field(Auth; Rec.Auth)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Auth field.';
                }
                field("Date"; Rec."Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date field.';
                }


            }

            group("Processed By Details")
            {
                field("Processed Name"; Rec."Processed Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Processed Name field.';
                    Editable = false;
                }
                field("Sent for Processing Date"; Rec."Sent for Processing Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sent for Processing Date field.';
                    Editable = false;
                }



            }
        }

    }


    actions
    {

        area(Processing)
        {
            action("Sent to Processing")
            {


                ApplicationArea = All;
                Caption = 'Sent to Processing';
                Image = SendTo;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedOnly = true;

                trigger OnAction()
                var
                    UserName: Record User;

                begin

                    Rec.TestField(Name);
                    Rec.TestField(Auth);
                    Rec.TestField("Staff No.");
                    Rec.TestField(Date);


                    if Confirm('Do you want sent this to processing?') then
                        UserName.Reset();
                    UserName.SetRange("User Name", UserId);
                    UserName.FindFirst();
                    Rec.Status := Rec.Status::"Sent for Processing";
                    Rec."Sent for Processing Date" := Today;
                    Rec."Processed Name" := UserName."User Name";

                    Rec.Modify();
                    Message('Successfully send for processing');
                end;



            }


        }
    }
}
