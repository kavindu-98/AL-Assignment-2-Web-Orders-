pageextension 50143 CompanyInfoExt extends "Company Information"
{
    layout
    {
        addlast(General)
        {
            field("Company Website"; Rec."Company Website")
            {
                ApplicationArea = all;
            }

            field("Company Registration No. "; Rec."Company Registration No. ")
            {
                ApplicationArea = all;
            }
        }
    }

}