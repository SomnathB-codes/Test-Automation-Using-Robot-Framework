*** Settings ***
Library     SeleniumLibrary
Test Setup    Open Browser And Login
Test Teardown    Close Browser

*** Variables ***
${LOGIN_URL}       https://www.demoblaze.com/index.html
${BROWSER}         chrome
${VALID_USER}      Flexispot10
${VALID_PASS}      Demoproject10
${INVALID_USER}    wronguser
${INVALID_PASS}    wrongpass

*** Keywords ***
Open Browser And Login
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    0.2s
    Click Element    id=login2
    Wait Until Element Is Visible    id=loginusername    10s
    Input Text       id=loginusername    ${VALID_USER}
    Input Text       id=loginpassword    ${VALID_PASS}
    Click Button     xpath=//div[@id="logInModal"]//button[text()="Log in"]
    Wait Until Page Contains    Welcome ${VALID_USER}    10s

*** Test Cases ***
#TC_5
Send Message Via Contact Form
    [Documentation]    Precondition: User is logged in.
    Click Element    xpath=//a[text()='Contact']
    Wait Until Element Is Visible    id=recipient-email    10s
    Input Text    id=recipient-email    flexispot@gmail.com
    Input Text    id=recipient-name     Harry Tashiki
    Input Text    id=message-text       Hello, this is a test message!
    Click Button    xpath=//button[text()='Send message']
    Alert Should Be Present     Thanks for the message!!
