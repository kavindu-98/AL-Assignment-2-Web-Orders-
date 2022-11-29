report 50103 "Vendor Invoice Detailed Report"
{
    Caption = 'Vendor Invoice Detailed Report';
    ApplicationArea = All;
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = './layout/VendorInvoiceDetailReport.rdl';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem(PurchInvHeader; "Purch. Inv. Header")
        {
            RequestFilterFields = "Expense Type";
            column(BuyfromVendorName; "Buy-from Vendor Name")
            {
            }
            column(No; "No.")
            {
            }
            column(VendorInvoiceNo; "Vendor Invoice No.")
            {
            }
            column(Expense_Type; "Expense Type")
            {
            }
            column(Document_Date; "Document Date")
            {
            }
            column(ComInfoName; ComInfo.Name)
            {
            }
            column(ComInfoAddress; ComInfo.Address)
            {
            }
            column(ComInfoAddress2; ComInfo."Address 2")
            {
            }
            column(ComInfoCity; ComInfo.City)
            {
            }
            dataitem("Purch. Inv. Line"; "Purch. Inv. Line")
            {
                DataItemLink = "Document No." = field("No.");
                DataItemLinkReference = PurchInvHeader;
                RequestFilterFields = "No.";
                column(No_; "No.")
                {
                    IncludeCaption = true;
                }
                column(Buy_from_Vendor_No_; "Buy-from Vendor No.")
                {
                    IncludeCaption = true;
                }
                column(Quantity; Quantity)
                {
                    IncludeCaption = true;
                }
                column(Line_Amount; "Line Amount")
                {
                    IncludeCaption = true;
                }
                column(Inv__Discount_Amount; "Inv. Discount Amount")
                {
                    IncludeCaption = true;
                }

                trigger OnAfterGetRecord()
                var
                    myInt: Integer;
                begin

                end;
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

    var
        TitleLb1: Label 'VENDOR INVOICE DETAILS REPORT';
        // PostingDate: Date;
        ComInfo: Record "Company Information";

    trigger OnPreReport()
    Begin
        ComInfo.Get;
    End;
}
