report 50101 "Posted Purchase Invoice"
{
    ApplicationArea = All;
    Caption = 'Posted Purchase Invoice';
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = './layout/PostedPurchaseInvoice.rdl';
    DefaultLayout = RDLC;
    dataset
    {
        dataitem(PurchInvHeader; "Purch. Inv. Header")
        {
            CalcFields = Amount, "Amount Including VAT", "Invoice Discount Amount";
            column(BuyfromVendorName; "Buy-from Vendor Name")
            {
            }
            column(BuyfromAddress; "Buy-from Address")
            {
            }
            column(BuyfromContactNo; "Buy-from Contact No.")
            {
            }
            column(PostingDate; "Posting Date")
            {
            }
            column(No; "No.")
            {
            }
            column(PurchInvNo; "No.")
            {
            }
            column(VendorInvoiceNo; "Vendor Invoice No.")
            {
            }
            column(PaymentTermsCode; "Payment Terms Code")
            {
            }
            column(DueDate; "Due Date")
            {
            }
            column(Amount; Amount)
            {
            }
            column(AmountIncludingVAT; "Amount Including VAT")
            {
            }
            column(InvoiceDiscountAmount; "Invoice Discount Amount")
            {
            }
            column(ExpenseType; "Expense Type")
            {
            }
            column(ComInfoName; ComInfo.Name)
            {
            }
            column(ComInfoAddress; ComInfo.Address)
            {
            }
            column(ComInfoEmail; ComInfo."E-Mail")
            {
            }
            column(ComInfoTel; ComInfo."Phone No.")
            {
            }
            column(ComInfoWebsite; ComInfo."Company Website")
            {
            }
            column(ComInforegNo; ComInfo."Company Registration No. ")
            {
            }

            column(TitleLb1; TitleLb1)
            {


            }

            dataitem("Purch. Inv. Line"; "Purch. Inv. Line")
            {

                DataItemLink = "Document No." = field("no.");
                DataItemLinkReference = PurchInvHeader;
                RequestFilterFields = "No.";
                column(No_; "No.")
                {
                    IncludeCaption = true;

                }
                column(Description; Description)
                {
                    IncludeCaption = true;

                }
                column(Unit_of_Measure; "Unit of Measure")
                {
                    IncludeCaption = true;

                }
                column(Quantity; Quantity)
                {
                    IncludeCaption = true;

                }
                column(Direct_Unit_Cost; "Direct Unit Cost")
                {
                    IncludeCaption = true;

                }


            }
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
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

    labels
    {

        TitleLable = 'PURCHASE INVOICE';

    }




    var
        TitleLb1: Label 'PURCHASE INVOICE';
        // PostingDate: Date;

        ComInfo: Record "Company Information";

    trigger OnPreReport()
    Begin

        ComInfo.Get;


    End;


}