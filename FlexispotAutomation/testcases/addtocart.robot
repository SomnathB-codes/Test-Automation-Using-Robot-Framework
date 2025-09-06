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
@{PRODUCTS}    Samsung galaxy s6    Nexus 6    

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
#TC_1
Add Item from Phone Category to Cart
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

#TC_2
Add Item from Laptop Category to Cart
    [Documentation]    Precondition: User is logged in.
    Scroll Element Into View    xpath=//a[text()='Laptops']
    Click Element    xpath=//a[text()='Laptops']
    Wait Until Page Contains Element    xpath=//a[text()='MacBook air']    10s
    Scroll Element Into View    xpath=//a[text()='MacBook air']
    Click Link    xpath=//a[text()='MacBook air']
    Wait Until Page Contains Element    xpath=//a[text()='Add to cart']    10s
    Click Element    xpath=//a[text()='Add to cart']
    Alert Should Be Present    Product added.    
    Click Link    id=cartur
    Wait Until Page Contains    MacBook air    10s
    Page Should Contain         MacBook air

# TC_3
Add Item from Monitors Category to Cart
    [Documentation]    Precondition: User is logged in.
    Scroll Element Into View    xpath=//a[text()='Monitors']
    Click Element    xpath=//a[text()='Monitors']
    Wait Until Page Contains Element    xpath=//a[text()='Apple monitor 24']    10s
    Scroll Element Into View    xpath=//a[text()='Apple monitor 24']
    Click Link    xpath=//a[text()='Apple monitor 24']
    Wait Until Page Contains Element    xpath=//a[text()='Add to cart']    10s
    Click Element    xpath=//a[text()='Add to cart']
    Alert Should Be Present    Product added.    
    Click Link    id=cartur
    Wait Until Page Contains    Apple monitor 24    10s
    Page Should Contain         Apple monitor 24

# TC_4
Adding Multiple Items to Cart
    [Documentation]    Precondition: User is logged in.
    FOR    ${product}    IN    @{PRODUCTS}
        Wait Until Page Contains Element    xpath=//*[@id="tbodyid"]/div[1]/div/div/h4/a    10s
        Scroll Element Into View    xpath=//a[text()='Phones']
        Click Element               xpath=//a[text()='Phones']
        Wait Until Page Contains Element    xpath=//a[text()='${product}']    10s
        Scroll Element Into View    xpath=//a[text()='${product}']
        Click Element               xpath=//a[text()='${product}']
        Wait Until Page Contains Element    xpath=//a[text()='Add to cart']    10s
        Scroll Element Into View    xpath=//a[text()='Add to cart']
        Click Element               xpath=//a[text()='Add to cart']
        Alert Should Be Present     Product added.  
        Click Link    Home
    END
    Click Link    id=cartur
    FOR    ${product}    IN    @{PRODUCTS}
        Wait Until Page Contains    ${product}    10s
        Page Should Contain         ${product}
    END
