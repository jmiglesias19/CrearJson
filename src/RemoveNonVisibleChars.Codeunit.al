codeunit 50103 "RemoveNonVisibleChars"
{
    procedure RemoveNonVisibleCharsAndSpaces(InString: Text): Text
    var
        i: Integer;
        ThisChar: Char;
        ThisInt: Integer;
        Result: Text;
    begin
        //Asciis to remove:
        // 9=Tab
        //10=LineFeed 
        //13=CarriageReturn
        //all other ascii values between 0 and 31
        //32=Space
        for i := 1 to StrLen(InString) do begin
            ThisChar := InString[i];
            ThisInt := ThisChar;
            if not (ThisInt in [0 .. 32]) then
                Result += InString[i];
        end;
        exit(Result);
    end;
}