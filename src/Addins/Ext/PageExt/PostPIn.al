

pageextension 50144 PostoOrdExt extends "Posted Purchase Invoice"
{
    layout
    {
        addafter("Vendor Invoice No.")
        {
            field("Expense Type"; Rec."Expense Type")
            {
                ApplicationArea = all;
                // ShowMandatory = true;
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

        //             purchases: Record "Purch. Inv. Header";

        //         begin
        //             purchases.SetRange("No.", Rec."No.");

        //             Report.Run(50101, true, true, purchases);
        //         end;
        //     }
        // }
    }

}