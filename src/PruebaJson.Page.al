//pagina que he creado para probar a ver el json con los detalles de una factura, pero no he conseguido hacerlo asi que esto no vale para nada pero bueno

page 50100 "Prueba Json"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Test JSON Generator';

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'Run Process';
                label(Info)
                {
                    Caption = 'Click the action in the menu to generate the sales invoice JSON.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Generate and Show JSON")
            {
                ApplicationArea = All;
                Caption = 'Generate and Show JSON';
                Image = Web;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                ToolTip = 'Use this to generate a JSON.';

                trigger OnAction()
                var
                    IntegrationMgmt: Codeunit "Example Integration Management";
                    JsonResult: Text;
                begin
                    // Llama al procedimiento principal de tu codeunit
                    JsonResult := IntegrationMgmt.GetSalesInvoicesAsJson();

                    // Muestra el resultado en una ventana de mensaje
                    Message(JsonResult);
                end;
            }
        }
    }
}