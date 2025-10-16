page 50100 "Prueba Json"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Test JSON Generator';

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'Run Process';
                label(Info)
                {
                    ApplicationArea = All;
                    Caption = 'Click the action in the menu to generate the sales invoice JSON.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Generate and Show JSON")
            {
                ApplicationArea = All;
                Caption = 'Generate and Show JSON';
                Image = Web;
                Promoted = true;
                PromotedCategory = Process;

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