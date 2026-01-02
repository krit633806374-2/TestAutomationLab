*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${URL}    http://localhost:7272/Lab4/Registration.html


*** Keywords ***
Open Registration Page
    Open Browser    ${URL}    chrome
    Title Should Be    Registration

Input Registration Info
    [Arguments]    ${fname}    ${lname}    ${org}    ${email}    ${phone}
    Input Text    id=firstname     ${fname}
    Input Text    id=lastname      ${lname}
    Input Text    id=organization  ${org}
    Input Text    id=email         ${email}
    Input Text    id=phone         ${phone}


*** Test Cases ***
Open Registration Page Test
    Open Registration Page
    Sleep    2s
    Close Browser


UAT-Lab04-001 Register Success
    Open Registration Page
    Input Registration Info
    ...    Somyod
    ...    Sodsai
    ...    CS KKU
    ...    somyod@kkumail.com
    ...    091-001-1234
    Click Button    id=registerButton

    Title Should Be    Success
    Page Should Contain    Thank you for registering with us.
    Page Should Contain    We will send a confirmation to your email soon.
    Close Browser

UAT-Lab04-002 Empty First Name
    Open Registration Page
    Input Text    id=lastname      Sodyod
    Input Text    id=organization  CS KKU
    Input Text    id=email         somyod@kkumail.com
    Input Text    id=phone         091-001-1234
    Click Button    id=registerButton

    Page Should Contain    *Please enter your first name!!
    Close Browser

UAT-Lab04-002 Empty Last Name
    Open Registration Page
    Input Text    id=firstname     Somyod
    Input Text    id=organization  CS KKU
    Input Text    id=email         somyod@kkumail.com
    Input Text    id=phone         091-001-1234
    Click Button    id=registerButton

    Page Should Contain    *Please enter your last name!!
    Close Browser

UAT-Lab04-002 Register Without Organization
    Open Registration Page
    Input Registration Info
    ...    Somyod
    ...    Sodsai
    ...    ${EMPTY}
    ...    somyod@kkumail.com
    ...    091-001-1234
    Click Button    id=registerButton

    Title Should Be    Success
    Page Should Contain    Thank you for registering with us.
    Close Browser

UAT-Lab04-002 Empty Email
    Open Registration Page
    Input Text    id=firstname     Somyod
    Input Text    id=lastname      Sodsai
    Input Text    id=organization  CS KKU
    Input Text    id=phone         091-001-1234
    Click Button    id=registerButton

    Page Should Contain    *Please enter your email!!
    Close Browser

UAT-Lab04-002 Empty Phone Number
    Open Registration Page
    Input Text    id=firstname     Somyod
    Input Text    id=lastname      Sodsai
    Input Text    id=organization  CS KKU
    Input Text    id=email         somyod@kkumail.com
    Click Button    id=registerButton

    Page Should Contain    *Please enter your phone number!!
    Close Browser

UAT-Lab04-002 Invalid Phone Number
    Open Registration Page
    Input Registration Info
    ...    Somyod
    ...    Sodsai
    ...    CS KKU
    ...    somyod@kkumail.com
    ...    1234567890
    Click Button    id=registerButton

    Page Should Contain    Please enter a valid phone number!!
    Close Browser
