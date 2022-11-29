codeunit 50100 "Validate Expense Type"
{
    [EventSubscriber(ObjectType::Page, Page::"Purchase Order", 'OnBeforeActionEvent', 'Post and &Print', true, true)]
    local procedure RunOnBeforeActionEvent5(var Rec: Record "Purchase Header")
    var


    begin
        Rec.TestField("Expense Type");
        // Error('You Cannot post without Expense Type');

    end;

    [EventSubscriber(ObjectType::Page, Page::"Purchase Order", 'OnBeforeActionEvent', 'Post', true, true)]
    local procedure RunOnBeforeActionEvent6(var Rec: Record "Purchase Header")
    var


    begin
        Rec.TestField("Expense Type");
        // Error('You Cannot post without Expense Type');

    end;

    // [EventSubscriber(ObjectType::Page, Page::"Posted Purchase Invoice", 'OnBeforeActionEvent', 'Print', true, true)]
    // local procedure RunOnBeforeActionEvent(var Rec: Record "Purch. Inv. Header")
    // begin
    //     Rec.SetRange("No.", Rec."No.");
    //     Report.Run(50101, true, true, Rec);
    // end;

    [EventSubscriber(ObjectType::Page, Page::"Posted Purchase Invoices", 'OnBeforeActionEvent', '&Print', true, true)]
    local procedure RunOnBeforeActionEvent2(var Rec: Record "Purch. Inv. Header")

    begin
        Rec.TestField("Expense Type");
        // Error('You Cannot post without Expense Type');
    end;

    // [EventSubscriber(ObjectType::Page, Page::"Purchase Order List", 'OnBeforeActionEvent', 'Print', true, true)]
    // local procedure RunOnBeforeActionEvent3(var Rec: Record "Purchase Header")
    // begin
    //     Rec.SetRange("Document Type", Rec."Document Type");
    //     Rec.SetRange("No.", Rec."No.");
    //     Report.Run(50100, true, true, Rec);
    // end;


    // [EventSubscriber(ObjectType::Page, Page::"Purchase Order", 'OnBeforeActionEvent', '&Print', true, true)]
    // local procedure RunOnBeforeActionEvent4(var Rec: Record "Purchase Header")
    // begin
    //     Rec.SetRange("Document Type", Rec."Document Type");
    //     Rec.SetRange("No.", Rec."No.");
    //     Report.Run(50100, true, true, Rec);
    // end;
}
