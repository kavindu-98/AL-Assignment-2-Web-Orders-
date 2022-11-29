tableextension 50102 "Purchase Reciept Header Ext" extends "Purch. Rcpt. Header"
{
    fields
    {
        field(50100; "Expense Type"; enum ExpenseType)
        {
            Caption = 'Expense Type';
            DataClassification = CustomerContent;
            Editable = false;
        }
    }
}