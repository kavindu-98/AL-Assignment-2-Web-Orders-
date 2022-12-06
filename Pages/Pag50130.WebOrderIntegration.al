page 50130 "Web Order Integration"
{
    ApplicationArea = All;
    Caption = 'Web Order Integration';
    PageType = List;
    SourceTable = "Web Order";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field("Location Code "; Rec."Location Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Location Code  field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Customer No. "; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer No.  field.';
                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Item No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Unit Price field.';
                }
                field("Discount Amount"; Rec."Discount Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Discount Amount field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("Order/Quote Created"; Rec."Order/Quote Created")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Order/Quote Created field.';
                }
                field("Order/Quote Created User"; Rec."Order/Quote Created User")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Order/Quote Created User field.';
                }
                field("Order/Quote Created Date"; Rec."Order/Quote Created Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Order/Quote Created Date field.';
                }
                field("Order/Quote Created Time "; Rec."Order/Quote Created Time")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Order/Quote Created Time  field.';
                }
                field("Imported User"; Rec."Imported User")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Imported User field.';
                }
                field("Imported Date"; Rec."Imported Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Imported Date field.';
                }
                field("Imported Time"; Rec."Imported Time")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Imported Time field.';
                }
                field("SO Posting Command"; Rec."SO Posting Command")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SO Posting Command field.';
                }
                field("SO Posted "; Rec."SO Posted ")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SO Posted  field.';
                }
                field("Posted Invoice No."; Rec."Posted Invoice No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posted Invoice No. field.';
                }
                field("Posted Shipment No."; Rec."Posted Shipment No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posted Shipment No. field.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Import In Excel")
            {
                ApplicationArea = All;
                //    ApplicationArea = basic, suite;
                Caption = 'Import In Excel';
                Image = Excel;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                ShortCutKey = 'F9';
                ToolTip = 'Finalize the document or journal by posting the amounts and quantities to the related accounts in your company books.';

                trigger OnAction()
                var
                    UserSetupRec: Record "User Setup";
                begin
                    UserSetupRec.Get(UserId);
                    if not UserSetupRec."Import web order permission" then
                        Error('You don''t have following permission to import.');
                    ImportTimeSheetFromExcel();



                end;
            }
            action("Generate Sales Orders/Quotes")
            {
                ApplicationArea = All;
                //    ApplicationArea = basic, suite;
                Caption = 'Generate Sales Orders/Quotes';
                Image = Excel;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                ShortCutKey = 'F9';
                ToolTip = 'Finalize the document or journal by posting the amounts and quantities to the related accounts in your company books.';

                trigger OnAction()
                var
                    UserSetupRec: Record "User Setup";
                begin

                    UserSetupRec.Get(UserId);
                    if not UserSetupRec."Create web order permission" then
                        Error('You don''t have following permission to Generate.');

                    GenerateSaleOder();

                end;
            }
        }

    }

    procedure ImportTimeSheetFromExcel()
    var
        WebOrderIntegrataion: Record "Web Order";
        WebOrderIntegrataion2: Record "Web Order";
        DateVariant: Variant;
        DateCheck: Boolean;

        Inx: Integer;
        WebOrderType: Enum "Web Order Type";
        CustomerMaster: Record Customer;

    begin

        Rec_ExcelBuffer.DeleteAll();
        Rows := 0;
        Columns := 0;
        DialogCaption := 'Select File to upload';
        UploadResult := UploadIntoStream(DialogCaption, '', '', Name, NVInStream);
        Sheetname := 'Sheet1';
        if not UploadResult then
            exit;
        Rec_ExcelBuffer.Reset();
        Rec_ExcelBuffer.OpenBookStream(NVInStream, Sheetname); //SheetName
        Rec_ExcelBuffer.ReadSheet();
        Commit();

        //finding total number of Rows to Import
        Rec_ExcelBuffer.Reset();
        Rec_ExcelBuffer.SetRange("Column No.", 1);
        If Rec_ExcelBuffer.FindFirst() then
            repeat
                Rows := Rows + 1;
            until Rec_ExcelBuffer.Next() = 0;

        //Finding total number of columns to import
        Rec_ExcelBuffer.Reset();
        Rec_ExcelBuffer.SetRange("Row No.", 1);
        if Rec_ExcelBuffer.FindFirst() then
            repeat
                Columns := Columns + 1;
            until Rec_ExcelBuffer.Next() = 0;

        for RowNo := 2 to Rows do begin
            if GetValueAtIndex(RowNo, 1) = 'Order' then
                WebOrderType := WebOrderType::"Sales Order"
            else
                if GetValueAtIndex(RowNo, 1) = 'Quote' then
                    WebOrderType := WebOrderType::"Sales Quote";

            Clear(WebOrderIntegrataion2);
            if not WebOrderIntegrataion2.Get(WebOrderType, GetValueAtIndex(RowNo, 2), GetValueAtIndex(RowNo, 3)) then begin
                WebOrderIntegrataion.Init();
                WebOrderIntegrataion."Document Type" := WebOrderType;
                Evaluate(WebOrderIntegrataion."Document No.", GetValueAtIndex(RowNo, 2));
                Evaluate(WebOrderIntegrataion."Line No.", GetValueAtIndex(RowNo, 3));
                Evaluate(WebOrderIntegrataion."Document Date", GetValueAtIndex(RowNo, 5));
                Evaluate(WebOrderIntegrataion.Description, GetValueAtIndex(RowNo, 8));
                Evaluate(WebOrderIntegrataion.Quantity, GetValueAtIndex(RowNo, 9));
                Evaluate(WebOrderIntegrataion."Unit Price", GetValueAtIndex(RowNo, 10));
                Evaluate(WebOrderIntegrataion."Discount Amount", GetValueAtIndex(RowNo, 11));
                Evaluate(WebOrderIntegrataion.Amount, GetValueAtIndex(RowNo, 12));
                WebOrderIntegrataion."Imported User" := UserId;
                WebOrderIntegrataion."Imported Date" := Today;
                WebOrderIntegrataion."Imported Time" := Time;
                WebOrderIntegrataion.Validate("Item No.", GetValueAtIndex(RowNo, 7));
                WebOrderIntegrataion.Validate("Customer No.", GetValueAtIndex(RowNo, 6));
                WebOrderIntegrataion.Validate("Location Code", GetValueAtIndex(RowNo, 4));
                if WebOrderIntegrataion.Insert(true) then
                    Inx += 1;
            end;

        end;
        if Inx > 0 then
            Message('%1 of Web Orders has been Imported Successfully !\', Inx)
        else
            Error('Nothing to process.');




    end;

    local procedure GetValueAtIndex(RowNo: Integer;
   ColNo: Integer): Text
    var
        Rec_ExcelBuffer: Record "Excel Buffer";
    begin
        Rec_ExcelBuffer.Reset();
        If Rec_ExcelBuffer.Get(RowNo, ColNo) then exit(Rec_ExcelBuffer."Cell Value as Text");
    end;



    procedure GenerateSaleOder()
    var
        WebOrderType: Enum "Web Order Type";

        WebOrderIntegrataion: Record "Web Order";
        WebOrderIntegrataion2: Record "Web Order";
        Salesheader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        GrpDocNo: Code[20];
        Window: Dialog;
        Inx: Integer;
    begin
        Window.Open('Processing Web Orders...\Document No. #1#######\Line No. #2#######\Loop #3#######\Count #4#######');

        Clear(WebOrderIntegrataion);
        WebOrderIntegrataion.SetCurrentKey("Document Type", "Document No.", "Line No.");
        WebOrderIntegrataion.SetRange("Order/Quote Created", false);
        Window.Update(4, WebOrderIntegrataion.Count);
        if WebOrderIntegrataion.FindSet() then
            repeat begin
                Inx += 1;
                Window.Update(1, WebOrderIntegrataion."Document No.");
                Window.Update(2, WebOrderIntegrataion."Line No.");
                Window.Update(3, Inx);
                if GrpDocNo <> WebOrderIntegrataion."Document No." then begin
                    GrpDocNo := WebOrderIntegrataion."Document No.";
                    Salesheader.Init();
                    if WebOrderIntegrataion."Document Type" = WebOrderIntegrataion."Document Type"::"Sales Order" then
                        Salesheader."Document Type" := Salesheader."Document Type"::Order
                    else
                        if WebOrderIntegrataion."Document Type" = WebOrderIntegrataion."Document Type"::"Sales Quote" then
                            Salesheader."Document Type" := Salesheader."Document Type"::Quote;

                    SalesHeader."No." := WebOrderIntegrataion."Document No.";
                    SalesHeader.Insert();
                    Salesheader.Validate("Sell-to Customer No.", WebOrderIntegrataion."Customer No.");
                    Salesheader.Validate("Location Code", WebOrderIntegrataion."Location Code");
                    Salesheader.Validate("Posting Date", WebOrderIntegrataion."Document Date");
                    Salesheader.Ship := true;
                    Salesheader.Invoice := true;
                    Salesheader.Modify();
                end;

                SalesLine.Init();
                if WebOrderIntegrataion."Document Type" = WebOrderIntegrataion."Document Type"::"Sales Order" then
                    SalesLine."Document Type" := SalesLine."Document Type"::Order
                else
                    if WebOrderIntegrataion."Document Type" = WebOrderIntegrataion."Document Type"::"Sales Quote" then
                        SalesLine."Document Type" := SalesLine."Document Type"::Quote;
                SalesLine."Document No." := WebOrderIntegrataion."Document No.";
                SalesLine."Line No." := WebOrderIntegrataion."Line No.";
                if SalesLine.Insert() then begin
                    SalesLine.Validate(Type, SalesLine.Type::Item);
                    SalesLine.Validate("No.", WebOrderIntegrataion."Item No.");
                    SalesLine.Description := WebOrderIntegrataion.Description;
                    SalesLine.Validate(Quantity, WebOrderIntegrataion.Quantity);
                    SalesLine.Validate("Qty. to Ship", WebOrderIntegrataion.Quantity);
                    SalesLine.Validate("Qty. to Invoice", WebOrderIntegrataion.Quantity);
                    SalesLine.Validate("Unit Price", WebOrderIntegrataion."Unit Price");
                    SalesLine.Validate("Line Discount Amount", WebOrderIntegrataion."Discount Amount");
                    SalesLine.Validate(Amount, WebOrderIntegrataion.Amount);
                    SalesLine.Modify();
                    WebOrderIntegrataion."Order/Quote Created" := true;
                    WebOrderIntegrataion."Order/Quote Created Date" := Today;
                    WebOrderIntegrataion."Order/Quote Created Time" := Time;
                    WebOrderIntegrataion."Order/Quote Created User" := UserId;
                    WebOrderIntegrataion.Modify();
                end

            end until WebOrderIntegrataion.Next() = 0;
        Window.Close();


        Clear(WebOrderIntegrataion);
        WebOrderIntegrataion.SetCurrentKey("Document Type", "Document No.", "Line No.");
        WebOrderIntegrataion.SetRange("Document Type", WebOrderIntegrataion."Document Type"::"Sales Order");
        WebOrderIntegrataion.SetRange("Order/Quote Created", true);
        WebOrderIntegrataion.SetRange("SO Posted ", false);
        WebOrderIntegrataion.SetRange("SO Posting Command", true);
        if WebOrderIntegrataion.FindFirst() then
            repeat
                Clear(Salesheader);
                Salesheader.SetRange("Document Type", Salesheader."Document Type"::Order);
                Salesheader.SetRange("No.", WebOrderIntegrataion."Document No.");

                if Salesheader.FindFirst() then
                    if Salesheader.SendToPosting(80) then begin
                        // if Codeunit.Run(Codeunit::"Sales-Post") then begin
                        Clear(WebOrderIntegrataion2);
                        WebOrderIntegrataion2.SetRange("Document Type", WebOrderIntegrataion."Document Type");
                        WebOrderIntegrataion2.SetRange("Document No.", WebOrderIntegrataion."Document No.");
                        WebOrderIntegrataion2.ModifyAll("SO Posted ", true);
                        WebOrderIntegrataion2.ModifyAll("SO Posting Command", false);

                        // WebOrderIntegrataion."Posted Shipment No." := postedsalesIn."No.";
                        // WebOrderIntegrataion."Posted Invoice No." := postedsalesIn."No.";
                        Message('Generate Sales order post it Successfully !\')
                    end


            until WebOrderIntegrataion.Next() = 0;

    end;

    var
        Rec_ExcelBuffer: Record "Excel Buffer";
        Rows: Integer;
        Columns: Integer;
        Fileuploaded: Boolean;
        UploadIntoStream: InStream;
        FileName: Text;
        Sheetname: Text;
        UploadResult: Boolean;
        DialogCaption: Text;
        Name: Text;
        NVInStream: InStream;
        RowNo: Integer;
        TxtDate: Text;
        DocumentDate: Date;
        TimeDataUpload: Record "Web Order";
        LineNo: Integer;

        postedsalesIn: Record "Sales Invoice Header";

}




