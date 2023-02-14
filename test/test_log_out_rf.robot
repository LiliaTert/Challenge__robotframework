*** Settings ***
#Documentation    Suite description
Library  SeleniumLibrary
Documentation    Suite description #automated tests for scout website


*** Variables ***
${LOGIN URL}        https://scouts-test.futbolkolektyw.pl/en
${BROWSER}      Chrome
${SIGNBUTTON}       xpath = //*[(text()='Sign in')]
${EMAILINPUT}       xpath = //*[@id="login"]
${PASSWORDINPUT}        xpath = //*[@id="password"]
${PAGELOGO}     xpath = //div[@title='Logo Scouts Panel']
${SIGNOUTBUTTON}    xpath = //span[text()='Sign out']

*** Test Cases ***
Login out the system
    Open Login page
    Type in email
    Type in password
    Click on the Submit button
    Assert Dashboard
    Click on the Sign out button
    Assert Login Page
    [Teardown]    Close Browser

*** Keywords ***
Open Login page
    Open Browser        ${LOGIN URL}        ${BROWSER}
    Title Should Be     Scouts panel - sign in
Type in email
    Input Text      ${EMAILINPUT}       user07@getnada.com
Type in password
    Input Text      ${PASSWORDINPUT}       Test-1234
Click on the Submit button
    Click Element       ${SIGNBUTTON}
Assert Dashboard
    Wait Until Element Is Visible       ${PAGELOGO}
    Title Should Be        Scouts panel
Click on the Sign out button
    Wait Until Element Is Visible       ${SIGNOUTBUTTON}
    Click Element       ${SIGNOUTBUTTON}
Assert Login Page
    Title Should Be        Scouts panel - sign in
    Capture Page Screenshot    alert.png
