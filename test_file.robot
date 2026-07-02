*** Settings ***
Library          SeleniumLibrary
Library          RequestsLibrary
Library          AppiumLibrary
#Test Setup       Open Browser    ${URL}    ${BROWSER}
Test Teardown    Close All Browsers
Resource         resources/variables.robot

*** Variables ***
${URL}          https://opensource-demo.orangehrmlive.com/
${BROWSER}      Chrome
${NHTSA_URL}    https://api.nhtsa.gov
${ANDROID_AUTOMATION_NAME}    UIAutomator2
${ANDROID_PLATFORM_NAME}      Android
${ANDROID_PLATFORM_VERSION}   16

*** Keywords ***
Wait To Load Login Page
    SeleniumLibrary.Wait Until Element Is Visible    locator=${username_input_txtbox}
    SeleniumLibrary.Wait Until Element Is Visible    locator=${passwd_input_txtbox}

Type Username
    [Arguments]    ${text}
    SeleniumLibrary.Input Text    locator=${username_input_txtbox}    text=${text}

Type Password
    [Arguments]    ${text}
    SeleniumLibrary.Input Text    locator=${passwd_input_txtbox}    text=${text}

*** Keywords ***
Open chrome appium driver
    AppiumLibrary.Open Application    http://127.0.0.1:4723/wd/hub  automationName=${ANDROID_AUTOMATION_NAME}
    ...    platformName=${ANDROID_PLATFORM_NAME}  platformVersion=${ANDROID_PLATFORM_VERSION}
    ...    appPackage=com.sec.android.app.popupcalculator  appActivity=com.sec.android.app.popupcalculator.Calculator
    ...    deviceName=RZCX10WSYZF  autoAcceptAlerts=true  autoDismissAlerts=true  noReset=false
    ...    W3C=true

*** Test Cases ***
Login test
    [Tags]    Smoke
    Open Browser    browser=${BROWSER}    url=${URL}
    Wait To Load Login Page
    SeleniumLibrary.Element Text Should Be    locator=css:div[class="oxd-form-row"]:nth-of-type(1) label    expected=Username
    SeleniumLibrary.Element Text Should Be    locator=css:div[class="oxd-form-row"]:nth-of-type(2) label    expected=Password
    SeleniumLibrary.Input Text    locator=css:input[name='username']    text=Admin
    SeleniumLibrary.Input Text    locator=css:input[name='password']    text=admin123
    SeleniumLibrary.Wait Until Element Is Visible    locator=css:button[class*=login-button]
    Click Button    locator=css:button[class*=login-button]
    Wait Until Element Is Not Visible    locator=css:button[class*=login-button]
    Title Should Be    title=OrangeHRM

Failed Login test
    Open Browser    browser=${BROWSER}    url=${URL}
    Wait To Load Login Page
    Type Username    Adm
    Type Password    admin123
    SeleniumLibrary.Wait Until Element Is Visible    locator=css:button[class*=login-button]
    Click Button    locator=css:button[class*=login-button]
    SeleniumLibrary.Wait Until Element Is Visible    locator=css:div[class*="oxd-alert-content--error"] p
    SeleniumLibrary.Element Text Should Be    locator=css:div[class*="oxd-alert-content--error"] p    expected=Invalid credentials

Test with requests1
    ${response}    GET    ${NHTSA_URL}/SafetyRatings/modelyear/2013/make/Acura/model/rdx    params={'format': 'json'}
    Should Be Equal As Integers    ${response.status_code}    200
    Log To Console    ${response.text}

Test with requests2
    ${response}    GET    url=${NHTSA_URL}/recalls/recallsByVehicle?make=acura&model=rdx&modelYear=2012    params={'format': 'json'}
    Should Be Equal As Integers    ${response.status_code}    200
    ${json_text}=    Evaluate    json.loads('''${response.text}''')    json
    Log To Console    ${response.text}
