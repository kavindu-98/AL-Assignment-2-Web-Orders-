page 50112 "Processing Material Req"
{
    Caption = 'Processing Material Request';
    PageType = Card;
    SourceTable = "Material Request Header";
    UsageCategory = Administration;


    layout
    {
        area(content)
        {
            group(General)
            {
                Editable = false;

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
                    ToolTip = 'Specifies the value of the Used for PO field.';
                }
            }

            part("Material Request Line"; "Material Request Subform")
            {
                SubPageLink = "Request Number" = field("No.");
                ApplicationArea = All;
                Editable = false;

            }



            group("Requested By Details")
            {
                Editable = false;

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
                Editable = false;

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
            action("Create Purchase Order")
            {


                ApplicationArea = All;
                Caption = 'Create Purchase Order';
                Image = Create;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                Visible = IsVisible;

                trigger OnAction()
                var
                    CreatePurOdr: Report "Create Purchase Order";

                begin
                    CreatePurOdr.GetMaterialReq(Rec);
                    CreatePurOdr.Run();
                    //    if Confirm('Do you want to create a purchase order?') then


                end;



            }
            // action("Delete Purchase Line zeros")
            // {


            //     ApplicationArea = All;
            //     Caption = 'Delete Purchase Line zeros';
            //     Image = Create;
            //     Promoted = true;
            //     PromotedCategory = Process;
            //     PromotedOnly = true;
            //     Visible = IsVisible;

            //     trigger OnAction()
            //     var
            //         PurH: Record "Purchase Header";
            //         PurL: Record "Purchase Line";

            //     begin

            //         PurH.Reset();
            //         PurL.Reset();
            //         PurH.SetRange("No.", '');
            //         PurH.DeleteAll();
            //         PurL.SetRange("Document No.", '');
            //         PurL.DeleteAll();
            //         Message('mee haraka');


            //     end;



            // }

            action("Open Document")
            {


                ApplicationArea = All;
                Caption = 'Open Document';
                Image = Create;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                Visible = IsVisible1;
                RunObject = page "Purchase Order";
                RunPageLink = "Material Req No" = field("No.");
            }

        }
    }

    trigger OnOpenPage()
    var
        myInt: Integer;
    begin
        if Rec.Status = Rec.Status::Processed then begin
            CurrPage.Caption('Processed Material Requests');
            IsVisible := false;
            IsVisible1 := true;
        end
        else begin
            CurrPage.Caption('Processing Material Request');
            IsVisible := true;
        end;
    end;


    var

        username: Record User;
        IsVisible: Boolean;
        IsVisible1: Boolean;

}
