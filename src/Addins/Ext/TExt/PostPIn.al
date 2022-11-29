tableextension 50148 PurchineOrdExt extends "Purch. Inv. Header"
{
    fields
    {
        field(50100; "Expense Type"; Enum ExpenseType)
        {
            Caption = 'Expense Type';
            DataClassification = CustomerContent;
            Editable = false;

        }

    }


}