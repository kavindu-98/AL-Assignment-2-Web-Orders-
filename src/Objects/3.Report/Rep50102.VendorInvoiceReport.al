report 50102 "Vendor Invoice Report"
{
    Caption = 'Vendor Invoice Report';
    ApplicationArea = All;

    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = './layout/VendorInvoiceReport.rdl';
    DefaultLayout = RDLC;
    dataset
    {
        dataitem(PurchInvHeader; "Purch. Inv. Header")
        {
            RequestFilterFields = "Expense Type";

            column(BuyfromVendorName; "Buy-from Vendor Name")
            {
            }
            column(VendorInvoiceNo; "Vendor Invoice No.")
            {
            }
            column(AmountIncludingVAT; "Amount Including VAT")
            {
            }
            column(InvoiceDiscountAmount; "Invoice Discount Amount")
            {
            }
            column(ComInfoName; ComInfo.Name)
            {
            }
            column(ComInfoAddress; ComInfo.Address)
            {
            }

            column(Expense_Type; "Expense Type")
            {
            }
            column(Document_Date; "Document Date")
            {
            }
            column(Remaining_Amount; "Remaining Amount")
            {
            }

            // trigger OnPreDataItem()
            // begin
            //     SetRange();
            // end;


        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {

                group(Filtering)
                {
                    // Caption = 'Expense Type Filter';
                    // field(ExpenseType; ExpenseType)
                    // {
                    //     ApplicationArea = All;
                    //     Caption = 'Expense Type';

                    // }
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }

    var
        TitleLb1: Label 'Vendor Invoice Report';
        // PostingDate: Date;

        ComInfo: Record "Company Information";
        Document_Date: Date;
        ExpenseType: Enum ExpenseType;

    trigger OnPreReport()
    Begin

        ComInfo.Get;

        // CalcDate('7D', Today);

    End;
}
