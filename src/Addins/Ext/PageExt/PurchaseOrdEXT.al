

pageextension 50142 PurchaseOrdExt extends "Purchase Order"
{
    layout
    {
        addafter("Quote No.")
        {
            field("Expense Type"; Rec."Expense Type")
            {
                ApplicationArea = all;
                ShowMandatory = true;
                ToolTip = 'Specifies the value of Expense Type';
            }
        }
    }

    actions
    {
        // Add changes to page actions here
        // addafter(Print)
        // {
        //     action(PostType)
        //     {
        //         ApplicationArea = Basic, Suite;
        //         Caption = 'Print (Expense Type)';
        //         Image = PostOrder;
        //         Promoted = true;
        //         PromotedCategory = Category6;
        //         PromotedIsBig = true;
        //         ShortCutKey = 'F9';
        //         ToolTip = 'Finalize the document or journal by posting the amounts and quantities to the related accounts in your company books.';

        //         trigger OnAction()
        //         var

        //             purchases: Record "Purchase Header";

        //         begin
        //             purchases.SetRange("No.", Rec."No.");
        //             purchases.SetRange("Document Type");
        //             Report.Run(50100, true, true, purchases);
        //         end;
        //     }
        // }
    }

}