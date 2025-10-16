table 50100 "Sales Invoice Buffer"
{
    DataClassification = ToBeClassified;
    Caption = 'Sales Invoice Buffer';

    fields
    {
        field(1; "Entry No."; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Entry No.';
        }
        field(2; "Line Type"; Enum "Buffer Line Type")
        {
            DataClassification = CustomerContent;
            Caption = 'Line Type';
        }
        field(10; "Document No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'serial_number', Locked = true;
        }
        field(20; "Posting Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'date', Locked = true;
        }
        field(30; "Name"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'name', Locked = true;
        }
        field(40; "Address"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'address', Locked = true;
        }
        field(50; "Post Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'cp', Locked = true;
        }
        field(60; Amount; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'amount', Locked = true;
        }
        field(70; "Amount Incl. VAT"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'amountInclVat', Locked = true;
        }
        field(100; "VAT %"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'tax_percentage', Locked = true;
        }
        field(110; "VAT Base Amount"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'tax_base', Locked = true;
        }
        field(120; "VAT Amount"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'tax_amount', Locked = true;
        }
        field(200; "Description"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'description', Locked = true;
        }
        field(210; "Quantity"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'quantity', Locked = true;
        }
        field(220; "Unit price"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'unit_price', Locked = true;
        }
    }

    keys
    {
        key(Key1; "Posting Date")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Entry No.", "Document No.", Name, Description)
        {
        }
        fieldgroup(Brick; "Document No.", Name, Amount)
        {
        }
    }

    procedure WriteAllRecToJson(): Text
    begin
        Clear(Json);
        if IsEmpty() then begin
            Json.WriteStartObject('');
            Json.WriteEndObject();
            exit(Json.GetJSonAsText());

        end;
        Json.WriteStartObject('');
        Json.WriteProperty(InvoicesLbl);
        Json.WriteStartArray('');
        //facturas
        FindSet();
        repeat
            WriteThisRecToJson();
        until Next() = 0;

        Json.WriteEndArray();
        Json.WriteEndObject();
    end;

    local procedure WriteThisRecToJson()
    begin
        Json.WriteStartObject('');
        WriteStringProperty(true, FieldCaption("Document No."), "Document No.");
        Json.WriteEndObject();
    end;

    local procedure WriteStringProperty(WriteAlways: Boolean; VariableName: Text; Variable: Variant)
    begin
        if not WriteAlways then
            if Format(Variable, 0, 9) = '' then
                exit;
        Json.WriteStringProperty(VariableName, Variable);
    end;

    var
        Json: Codeunit "Json Text Reader/Writer";
        InvoicesLbl: Label 'Invoices';
}