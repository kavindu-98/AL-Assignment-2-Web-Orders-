pageextension 50139 "User Permission" extends "User Setup"
{
    layout
    {
        addlast(Control1)
        {
            field("Create web order permission"; Rec."Create web order permission")
            {
                ApplicationArea = all;
            }
            field("Import web order permission"; Rec."Import web order permission")
            {
                ApplicationArea = all;
            }
            field("Web order posting permission"; Rec."Web order posting permission")
            {
                ApplicationArea = all;
            }


        }
    }
}
