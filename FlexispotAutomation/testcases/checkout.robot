*** Settings ***
Library    SeleniumLibrary
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
    Input Text    id=loginusername    ${VALID_USER}
    Input Text    id=loginpassword    ${VALID_PASS}
    Click Button    xpath=//button[text()='Log in']
    Wait Until Page Contains    Welcome Flexispot10

*** Test Cases ***
# TC_12
Checkout Fails If Necessary Details Are Not Entered
    [Documentation]    Precondition: Logged in & Products already added to cart.
    Click Link    id=cartur
    Wait Until Element Is Visible    xpath=//button[text()='Place Order']    10s
    Click Button    xpath=//button[text()='Place Order']
    Click Button    xpath=//button[text()='Purchase']
    Alert Should Be Present    Please fill out Name and Creditcard.    
    Log To Console    Order couldn't be placed

#TC_13
Checkout From Cart Successfully
    [Documentation]    Precondition: Logged in & Products already added to cart.
    Click Link    id=cartur
    Wait Until Element Is Visible    xpath=//button[text()='Place Order']    10s
    Click Button    xpath=//button[text()='Place Order']
    Wait Until Element Is Visible    id=name    10s
    Input Text    id=name       Harry Tashiki
    Input Text    id=country    South Korea
    Input Text    id=city       Seoul
    Input Text    id=card       276895478990
    Input Text    id=month      12
    Input Text    id=year       2025
    Click Button    xpath=//button[text()='Purchase']
    Wait Until Page Contains    Thank you for your purchase!    10s
    Log To Console    Order placed successfully
    Click Button    xpath=//button[text()='OK']

#TC_14
Checkout After Adding A Product In Cart
    [Documentation]    Precondition: User is logged in.
    Scroll Element Into View    xpath=//a[text()='Phones']
    Click Element    xpath=//a[text()='Phones']
    Wait Until Page Contains Element    xpath=//a[text()='Samsung galaxy s6']    10s
    Scroll Element Into View    xpath=//a[text()='Samsung galaxy s6']
    Click Link    xpath=//a[text()='Samsung galaxy s6']
    Wait Until Page Contains Element    xpath=//a[text()='Add to cart']    10s
    Click Element    xpath=//a[text()='Add to cart']
    Alert Should Be Present    Product added. 
    Click Link    id=cartur
    Wait Until Page Contains    Samsung galaxy s6    10s
    Page Should Contain         Samsung galaxy s6
    Wait Until Element Is Visible    xpath=//button[text()='Place Order']    10s
    Click Button    xpath=//button[text()='Place Order']
    Wait Until Element Is Visible    id=name    10s
    Input Text    id=name       Harry Tashiki
    Input Text    id=country    South Korea
    Input Text    id=city       Seoul
    Input Text    id=card       276895478990
    Input Text    id=month      12
    Input Text    id=year       2025
    Click Button    xpath=//button[text()='Purchase']
    Wait Until Page Contains    Thank you for your purchase!    10s
    Log To Console    Order placed successfully
    Click Button    xpath=//button[text()='OK']
