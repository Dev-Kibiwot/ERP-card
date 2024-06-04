table 50117 attachee
{
    Caption = 'attachee';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "No."; Integer)
        {
            Caption = 'No.';
        }
        field(2; "First Name"; Text[30])
        {
            Caption = 'First Name';
        }
        field(3; "Second Name"; Text[30])
        {
            Caption = 'Second Name';
        }
        field(4; Gender; Option)
        {
            Caption = 'Gender';
            OptionMembers = Male,Female;
        }
        field(5; "Phone Number"; Text[10])
        {
            Caption = 'Phone Number';
            ExtendedDatatype = PhoneNo;

            trigger OnValidate()
var
    i: Integer;
    Char: Char;
begin
    for i := 1 to StrLen("Phone Number") do begin
        Char := "Phone Number"[i];
        if not (Char in ['0'..'9']) then
            FieldError("Phone Number", 'Phone number can only contain numbers.');
    end;
end;
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
}
