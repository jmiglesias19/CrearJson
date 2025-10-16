codeunit 50101 "Example Integration Management"
{
    procedure GetSalesInvoicesAsJson(): Text //cuando se pone los ":" y un tipo de dato es porque el procedimiento obligatoriamente va a devolver un valor de dicho tipo
    var
        TempSalesInvoiceBuffer: Record "Sales Invoice Buffer" temporary;
        ExecutionDate: Date;
        JsonResult: Text;
    begin
        ExecutionDate := GetExecutionDay();
        //buscar las facturas y escribir en la tabla buffer
        //escribir el json de los registros que haya en buffer
        JsonResult := TempSalesInvoiceBuffer.WriteAllRecToJson();
        exit(JsonResult);
    end;

    //procedimiento que devuelve la fecha de hoy
    local procedure GetExecutionDay(): Date //cuando se pone los ":" y un tipo de dato es porque el procedimiento obligatoriamente va a devolver un valor de dicho tipo
    begin
        exit(Today());
    end;
}