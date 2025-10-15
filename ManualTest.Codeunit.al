codeunit 50102 "Manual Test"
{
    [EventSubscriber(ObjectType::Page, Page::"Customer List", OnOpenPageEvent, '', true, true)]
    local procedure ManualTest()
    var
        WebServiceMethods: Codeunit "WebService Methods";
    begin
        WebServiceMethods.SalesInvoices();
    end;
}