tableextension 50144 PurchaseOrdExt extends "Purchase Header"
{
    fields
    {
        field(50100; "Expense Type"; Enum ExpenseType)
        {
            DataClassification = ToBeClassified;

        }

    }


}