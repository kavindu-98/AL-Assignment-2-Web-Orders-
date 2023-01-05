// codeunit 50140 "Get Invoice and shippment no"
// {
//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterPostSalesDoc', '', true, true)]
//     local procedure GetInvoiceAndShipNo(var SalesHeader: Record "Sales Header"; SalesShptHdrNo: Code[20]; SalesInvHdrNo: Code[20])
//     var
//         WebOrderIntegrataion: Record "Web Order";


//     begin

//         Clear(WebOrderIntegrataion);
//         WebOrderIntegrataion.SetCurrentKey("Document Type", "Document No.", "Line No.");
//         WebOrderIntegrataion.SetRange("Document Type", WebOrderIntegrataion."Document Type"::"Sales Order");
//         WebOrderIntegrataion.SetRange("Document No.", SalesHeader."No.");
//         WebOrderIntegrataion.ModifyAll("Posted Invoice No.", SalesInvHdrNo);
//         WebOrderIntegrataion.ModifyAll("Posted Shipment No.", SalesShptHdrNo);

//     end;




// }
