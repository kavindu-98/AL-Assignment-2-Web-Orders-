enum 50141 ExpenseType
{
    Extensible = true;

    value(0; "")
    {
        Caption = 'Blank';
    }

    value(1; OpEx)
    {
        Caption = 'Operational Expenditure';
    }
    value(2; "CapEX")
    {
        Caption = 'Capital Expenditure';
    }
}