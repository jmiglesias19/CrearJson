codeunit 50103 "RemoveNonVisibleChars"
{

    procedure GetExpectedJsonValue(): Text
    var
        JsonTxt: Text;

        //esto lo hago porque me obliga a poner la etiqueta label cuando hay texto dentro de los Text. lo que he hecho ha sido separar el contenido que voy a añadir al json para luego llamarlo
        //con los StrSubstNo
        InvoicesLbl: Label ' "Invoices" : [ ';
        SerialNumberLbl: Label '   "serial_number" : "00001" , ';
        DateLbl: Label '   "date":"%1"', Comment = 'La etiqueta contiene el marcador de posición %1.'; // La etiqueta contiene el marcador de posición %1
        JsonStartLbl: Label '{';
        JsonEndLbl: Label '}';
        // ArrayStartLbl: Label '[';
        ArrayEndLbl: Label ']';
        ObjectStartLbl: Label '  { ';
        ObjectEndLbl: Label '  } ';
    begin
        JsonTxt := StrSubstNo(JsonStartLbl);
        JsonTxt += StrSubstNo(InvoicesLbl);
        JsonTxt += StrSubstNo(ObjectStartLbl);
        JsonTxt += StrSubstNo(SerialNumberLbl);
        JsonTxt += StrSubstNo(DateLbl, Format(Today(), 0, 9));
        JsonTxt += StrSubstNo(ObjectEndLbl);
        JsonTxt += StrSubstNo(ArrayEndLbl);
        JsonTxt += StrSubstNo(JsonEndLbl);

        Message(RemoveNonVisibleCharsAndSpaces(JsonTxt));
    end;

    //procedimiento para borrar caracteres no visibles y espacios
    /* al procedimiento se le pasa un texto, que se guardara en la variable InString.
    luego se hace un bucle que va desde 1 hasta la longitud del texto que le hayamos pasado al procedimiento. en cada iteracion del bucle, en la variable "c" se guarda cada caracter
    y se le asigna un numero "n" (imagino que el propio lenguaje hace la conversion de tipo char al numero que seria ese caracter en ascii(correcto)). si el numero no esta entre 0 y 32
    no se hace nada con ese caracter, pero si el numero si se encuentra en dicho rango, se añade a la variable "Result" y cuando acaba el bucle la salida es lo que haya en la variable "Result" */
    procedure RemoveNonVisibleCharsAndSpaces(InString: Text): Text
    var
        i: Integer;
        // c: Char;
        // n: Integer;
        Result: Text;
    begin
        //Asciis to remove:
        // 9=Tab
        //10=LineFeed 
        //13=CarriageReturn
        //all other ascii values between 0 and 31
        //32=Space
        for i := 1 to StrLen(InString) do //begin //StrLen se refiere a la longitud del String (un length en Java)
            // c := InString[i];
            // n := c;
            if not (InString[i] in [0 .. 32]) then
                Result += InString[i];
        // end;
        exit(Result);
    end;
}