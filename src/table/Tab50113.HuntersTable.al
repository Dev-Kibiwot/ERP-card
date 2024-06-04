table 50113 "Hunters Table"
{
    Caption = 'Hunters Table';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "No."; Text[30])
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
        field(4; Surname; Text[30])
        {
            Caption = 'Surname';

            trigger OnValidate()
            begin
                "Full Name" := "First Name" + ' ' + "Second Name" + ' ' + Surname;
            end;
        }
        field(5; "Full Name"; Text[100])
        {
            Caption = 'Full Name';
            Editable = false;
        }   
        field(6; Gender; Option)
        {
            Caption = 'Gender';
            OptionMembers = Male,Female;
        }        
    field(7; "Phone Number"; Text[10])
    {
    Caption = 'Phone Number';
    ExtendedDatatype = PhoneNo;    
     trigger OnValidate()
     var
        myInt: Integer;
     begin
        ValidatePhoneNumber("Phone Number");
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
    procedure ValidatePhoneNumber(txt: Text)
var
    Matches: Record Matches;
    Regex: Codeunit Regex;
    Pattern, Value: Text;
    myInt: Integer;
begin
    // Updated pattern to match exactly 10 digits
    Pattern := '^[0-9]{10}$'; 

    // Check if the input matches the pattern
    if Regex.IsMatch(txt, Pattern) then begin
        // The phone number is valid
    end else begin
        // The phone number is invalid
        Error('Mobile Phone No. should be exactly 10 digits and should not contain letters.');
    end;
end;

}
