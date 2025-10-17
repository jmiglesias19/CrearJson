codeunit 50101 "Example Integration Management"
{

    Permissions = tabledata "Sales Invoice Buffer" = r,
                  tabledata "Sales Invoice Header" = r;

    procedure GetSalesInvoicesAsJson(): Text //cuando se pone los ":" y un tipo de dato es porque el procedimiento obligatoriamente va a devolver un valor de dicho tipo
    var
        TempSalesInvoiceBuffer: Record "Sales Invoice Buffer" temporary;
        ExecutionDate: Date;
        JsonResult: Text;
    begin
        ExecutionDate := GetExecutionDate();
        //buscar las facturas y escribir en la tabla buffer
        WriteSalesInvoicesToBuffer(ExecutionDate, TempSalesInvoiceBuffer);
        //escribir el json de los registros que haya en buffer
        JsonResult := TempSalesInvoiceBuffer.WriteAllRecToJson();
        exit(JsonResult);
    end;

    //procedimiento que devuelve la fecha de hoy
    local procedure GetExecutionDate(): Date //cuando se pone los ":" y un tipo de dato es porque el procedimiento obligatoriamente va a devolver un valor de dicho tipo
    begin
        exit(Today())
        // exit(DMY2Date(29, 1, 2027));
    end;

    local procedure WriteSalesInvoicesToBuffer(ExecutionDate: Date; var TempSalesInvoiceBuffer: Record "Sales Invoice Buffer" temporary)
    var
        SalesInvoiceHeader: Record "Sales Invoice Header";
    //esta tia habia creado esta variable, pero ya tenia la variable TempSalesInvoiceBuffer que hacia referencia a la misma tabla, por lo tanto he decidido usarla
    begin
        SalesInvoiceHeader.SetRange("Posting Date", ExecutionDate);
        if not SalesInvoiceHeader.IsEmpty() and SalesInvoiceHeader.FindSet() then
            repeat
                //Datos de cabecera
                WriteHeaderDataToBuffer(SalesInvoiceHeader, TempSalesInvoiceBuffer);
            //desglose de IVA
            //Datos de linea
            until SalesInvoiceHeader.Next() = 0;
    end;

    local procedure WriteHeaderDataToBuffer(SalesInvoiceHeader: Record "Sales Invoice Header"; var TempSalesInvoiceBuffer: Record "Sales Invoice Buffer" temporary)
    begin
        TempSalesInvoiceBuffer.Init();
        TempSalesInvoiceBuffer."Entry No." += 1;
        TempSalesInvoiceBuffer."Line Type" := TempSalesInvoiceBuffer."Line Type"::Header;
        TempSalesInvoiceBuffer."Document No." := SalesInvoiceHeader."No.";
        TempSalesInvoiceBuffer."Posting Date" := SalesInvoiceHeader."Posting Date";
        TempSalesInvoiceBuffer.Insert(false);
    end;
}