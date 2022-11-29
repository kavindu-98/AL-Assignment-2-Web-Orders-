pageextension 50103 "Posted Purchase Receipt Ext" extends "Posted Purchase Receipt"
{
    layout
    {
        addafter("Order No.")
        {
            field("Expense Type"; Rec."Expense Type")
            {
                ApplicationArea = all;
                ShowMandatory = true;
                ToolTip = 'Specifies the value of Expense Type';
            }
        }


    }


}


