codeunit 50100 "WebService Methods"
{
    //These codeunits implements the methods used to integrate Business Central with the third party software


    procedure SalesInvoices()
    var
        ExampleIntegrationManagement: Codeunit "Example Integration Management";
        JsonRequest: Text;
    //JsonResponse: Text;

    begin
        //build as JSON
        JsonRequest := ExampleIntegrationManagement.GetSalesInvoicesAsJson();
        Message(JsonRequest);
        //call WebService
        //JsonResponse := CallTheWebService('URL', JsonRequest);
        //process the answer
        //ProcessResponseData(JsonResponse);
        //update the log (not always)
        //UpadteLog();

    end;

    local procedure SalesCrMemos()
    begin
        //build as JSON
        //call WebService
        //process the answer
        //update the log (not always)
    end;

    local procedure Customers()
    begin
        //build as JSON
        //call WebService
        //process the answer
        //update the log (not always)
    end;

    local procedure Payments()
    begin
        //build as JSON
        //call WebService
        //process the answer
        //update the log (not always)
    end;
}