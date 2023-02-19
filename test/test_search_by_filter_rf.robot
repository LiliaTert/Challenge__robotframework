*** Settings ***
#Documentation    Suite description
Library  SeleniumLibrary
Documentation    Suite description #automated tests for scout website


*** Variables ***
${LOGIN URL}        https://scouts.futbolkolektyw.pl/en/
${BROWSER}      Chrome
${SIGNBUTTON}       xpath = //*[(text()='Sign in')]
${EMAILINPUT}       xpath = //*[@id='login']
${PASSWORDINPUT}        xpath = //*[@id='password']
${PAGELOGO}     xpath = //div[@title='Logo Scouts Panel']
${PLAYERLINK}        xpath = //*[text()='Players']
${FILTERLINK}       xpath = //*[@aria-label='Filter Table']/span[@class='MuiIconButton-label']
${SURNAMEINPUT}        xpath = //div[@data-testid='filtertextfield-surname']/div/input
${CLOSEBUTTON}        xpath = //button[@aria-label='Close']

*** Test Cases ***
Search player by filter
    Open Login page
    Type in email
    Type in password
    Click on the Submit button
    Click on the Player link
    Click on the Filter icon
    Click on the Close button
    Type in surname
    Assert Dashboard
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
    Wait Until Element Is Visible       ${PAGELOGO}
Click on the Player link
    Click Element       ${PLAYERLINK}
    Wait Until Element Is Visible       ${FILTERLINK}
Click on the Filter icon
    Click Element        ${FILTERLINK}
Type in surname
    Input Text      ${SURNAMEINPUT}       Młyński
Click on the Close button
    Click Element       ${CLOSEBUTTON}
Assert Dashboard
    Capture Page Screenshot    alert.png




