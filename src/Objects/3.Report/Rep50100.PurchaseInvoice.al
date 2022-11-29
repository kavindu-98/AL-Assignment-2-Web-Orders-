report 50100 "Purchase Invoice"
{
    Caption = 'Purchase Invoice';

    RDLCLayout = './Layout/PurchaseInvoice.rdl';
    ApplicationArea = All;
    UsageCategory = ReportsAndAnalysis;

    DefaultLayout = RDLC;
    dataset
    {
        dataitem(PurchaseHeader; "Purchase Header")
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
            column(Amount_Including_VAT; "Amount Including VAT")
            {
            }
            column(Invoice_Discount_Amount; "Invoice Discount Amount")
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
            column(ComInfoRegNo; ComInfo."Company Registration No. ")
            {
            }

            column(TitleLb1; TitleLb1)
            {


            }
            dataitem("Purchase Line"; "Purchase Line")
            {

                DataItemLink = "Document No." = field("no."), "Document Type" = field("Document Type");
                DataItemLinkReference = PurchaseHeader;
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
        ExpenseType: Enum ExpenseType;

    trigger OnPreReport()
    Begin

        ComInfo.Get;


    End;


}





