namespace Permisos;

permissionset 50100 Permisos
{
    Assignable = true;
    Caption = 'Permissions', MaxLength = 30;
    Permissions = codeunit "WebService Methods" = X,
                  codeunit "Example Integration Management" = X,
                  codeunit "Manual Test" = X;
}