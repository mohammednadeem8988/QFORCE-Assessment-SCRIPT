*** Keywords ***
Login To Salesforce
    Open Browser    ${SF_URL}    chrome
    Login    ${SF_USERNAME}    ${SF_PASSWORD}

Create Lead With Random Data
    ${firstName}=    FakerLibrary.First Name
    ${lastName}=     FakerLibrary.Last Name
    ${company}=      FakerLibrary.Company

    Go To Object Home    Lead
    Click New
    Set Input Value    First Name    ${firstName}
    Set Input Value    Last Name     ${lastName}
    Set Input Value    Company       ${company}
    Select Value From Picklist    Lead Source    Web
    Click Save

Handle Duplicate Lead If Present
    ${duplicate}=    Run Keyword And Return Status
    ...    Page Should Contain    Possible Duplicates
    IF    ${duplicate}
        Click Button    Save
    END

Validate Lead Details
    Validate Field Value    Lead Status    Open
    ${loggedUser}=    Get Logged In User
    Validate Field Value    Owner    ${loggedUser}

Clean Teardown
    Logout
    Close Browser
