*** Settings ***
Library     SeleniumLibrary
Test Setup  Open browser to Login Page
Test Teardown  Close browser
*** Variables ***
${LOGIN_URL}       https://www.demoblaze.com/index.html
${BROWSER}         chrome
${VALID_USER}      Flexispot10
${VALID_PASS}      Demoproject10
${INVALID_USER}    wronguser
${INVALID_PASS}    wrongpass

*** Keywords ***
Open browser to Login Page
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    0.2s
    
*** Test Cases ***
# TC_6
Login Successful With Valid Username & Valid Password
    Click Element    id=login2
    Input Text    id=loginusername    ${VALID_USER}
    Input Text    id=loginpassword    ${VALID_PASS}
    Click Button    xpath=//button[text()='Log in']
    Wait Until Page Contains    Welcome Flexispot10
    Page Should Contain          Welcome Flexispot10
    Sleep    1s

#TC_7
Login Unsuccessful With Valid Username & Invalid Password
    Click Element    id=login2
    Input Text    id=loginusername    ${VALID_USER}
    Input Text    id=loginpassword    ${INVALID_PASS}
    Click Button    xpath=//button[text()='Log in']
    Alert Should Be Present    Wrong password.
    Sleep    1s

#TC_8
Login Unsuccessful With Invalid Username & Valid Password
    Click Element    id=login2
    Input Text    id=loginusername    ${INVALID_USER}
    Input Text    id=loginpassword    ${VALID_PASS}
    Click Button    xpath=//button[text()='Log in']
    Alert Should Be Present   Wrong password.
    Sleep    1s

#TC_9
Login Unsuccessful With Invalid Username & Invalid Password
    Click Element    id=login2
    Input Text    id=loginusername    ${INVALID_USER}
    Input Text    id=loginpassword    ${INVALID_PASS}
    Click Button    xpath=//button[text()='Log in']
    Alert Should Be Present    Wrong password.
    Sleep    1s

#TC_10
Login Unsuccessful With Empty Fields 
    Click Element    id=login2
    Click Button    xpath=//button[text()='Log in']
    Alert Should Be Present    Please fill out Username and Password.
    Sleep    1s

#TC_11
Logout Successful After Log In
    Click Element    id=login2
    Input Text    id=loginusername    ${VALID_USER}
    Input Text    id=loginpassword    ${VALID_PASS}
    Click Button    xpath=//button[text()='Log in']
    Wait Until Page Contains    Welcome Flexispot10
    Click Element    id=logout2
    Wait Until Element Is Visible    id=login2    
    Sleep    1s

