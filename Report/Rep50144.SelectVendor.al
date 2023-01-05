report 50144 "Create Purchase Order"
{
    ApplicationArea = All;
    Caption = 'Create Purchase Order';
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;
    dataset
    {
        // dataitem(; "")
        // {
        // }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                    field("Vender ID"; VendorID)
                    {
                        ApplicationArea = All;
                        TableRelation = Vendor;
                        ToolTip = 'Specifies the value of the No. field.';
                    }
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



    trigger OnPreReport()
    var
        CreatePurchaseOdr: Record "Purchase Header";
        CreatePurOdrLine: Record "Purchase Line";

    begin
        if Confirm('Do you want to create a purchase order?') then
            if VendorID <> '' then
                CreatePurchaseOdr.InsertCreatePurchaseOdrRec(MaterialReq, GetVendorID())

            else
                Message('Enter Vender ID ');
    end;

    procedure GetMaterialReq(var NewMaterialReq: Record "Material Request Header")
    begin
        MaterialReq := NewMaterialReq;


    end;

    procedure GetVendorID(): Code[20]
    begin
        if VendorRec.get(VendorID) then
            exit(VendorRec."No.");
    end;



    procedure GetItemNo(): Code[20]
    begin
        if MaterialReqLine.get(ItemID) then
            exit(MaterialReqLine."Request Number");
    end;

    procedure GetItemQty(): Integer
    begin
        if MaterialReqLine.get(ItemID) then
            exit(MaterialReqLine.Quantity);
    end;

    procedure GetLocationCode(): Code[20]
    begin
        if MaterialReqLine.get(VendorID) then
            exit(MaterialReqLine."Location Code");
    end;



    var
        MaterialReq: Record "Material Request Header";
        MaterialReqLine: Record "Material Request Line";
        VendorRec: Record Vendor;
        // ItemRec: Record Item;
        MaterialReqNo: Code[20];

        VendorID: Code[20];
        ItemID: Code[20];


}
