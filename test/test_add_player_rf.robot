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
${ADDPLAYERLINK}    xpath = //span[text()='Add player']
${NAMEINPUT}    xpath = //*[@name='name']
${SURNAMEINPUT}    xpath = //input[@name='surname']
${AGEINPUT}    xpath = //input[@name='age']
${CLUBINPUT}    xpath = //input[@name='club']
${MAINPOSITIONINPUT}    xpath = //input[@name='mainPosition']
${CHOOSELEG}    xpath = //div[@id='mui-component-select-leg']
${RIGHTLEG}    xpath = //li[@data-value='right']
${SUBMITBUTTON}    xpath = //span[contains(text(),'Submit')]

*** Test Cases ***
Add a New Player
    Open Login page
    Type in email
    Type in password
    Click on the SignIn button
    Assert Dashboard
    Click on the Add player link
    Type In Name
    Type In Surname
    Type In Age
    Type In Club
    Type In Position
    Click on the Choose Leg button
    Click on the Leg button
    Click on the Submit button
    [Teardown]    Close Browser

*** Keywords ***
Open Login page
    Open Browser        ${LOGIN URL}        ${BROWSER}
    Title Should Be     Scouts panel - sign in
Type in email
    Input Text      ${EMAILINPUT}       user07@getnada.com
Type in password
    Input Text      ${PASSWORDINPUT}       Test-1234
Click on the SignIn button
    Click Element       ${SIGNBUTTON}
Assert Dashboard
    Wait Until Element Is Visible       ${PAGELOGO}
    Title Should Be        Scouts panel
Click on the Add player link
    Click Element        ${ADDPLAYERLINK}
Type In Name
    Input Text      ${NAMEINPUT}       Mateusz
Type In Surname
    Input Text      ${SURNAMEINPUT}       Młyński
Type In Age
    Input Text      ${AGEINPUT}       02012001
Type In Club
    Input Text      ${CLUBINPUT}       Wisła Kraków
Type In Position
    Input Text      ${MAINPOSITIONINPUT}       Winger
Click on the Choose Leg button
    Click Element       ${CHOOSELEG}
Click on the Leg button
    Click Element       ${RIGHTLEG}
Click on the Submit button
    Click Element       ${SUBMITBUTTON}
    Capture Page Screenshot    alert.png
