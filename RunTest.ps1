Clear-Host
Import-Module  "C:\Program Files\Microsoft Dynamics 365 Business Central\260\Service\Microsoft.Dynamics.Nav.Management.psm1"
Invoke-NAVCodeunit -ServerInstance BC260 -CodeunitID 50102 -CompanyName "CRONUS España S.A."