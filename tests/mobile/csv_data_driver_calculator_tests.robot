*** Settings ***
Library        AppiumLibrary
Test Teardown  AppiumLibrary.Close All Applications
Test Setup     Open chrome appium driver
Resource       ../../resources/mobile/calculator_page_object.resource
Test Template  Perform android calculator plus
Library         DataDriver  file=../../Data/mobile_test_data.csv

*** Variables ***
${ANDROID_AUTOMATION_NAME}    UIAutomator2
${ANDROID_PLATFORM_NAME}      Android
${ANDROID_PLATFORM_VERSION}   16

*** Keywords ***
Open chrome appium driver
    AppiumLibrary.Open Application    http://127.0.0.1:4723/wd/hub  automationName=${ANDROID_AUTOMATION_NAME}
    ...    platformName=${ANDROID_PLATFORM_NAME}  appPackage=com.sec.android.app.popupcalculator  appActivity=com.sec.android.app.popupcalculator.Calculator
    ...    deviceName=RZCX10WSYZF

*** Test Cases ***
Perform android calculator plus  ${btn_num1}  ${btn_num2}  ${result}

*** Keywords ***
Perform android calculator plus
    [Arguments]  ${btn_num1}  ${btn_num2}  ${result}
    calculator_page_object.Perform android calculator addition  
    ...    ${btn_num1}  ${btn_num2}  ${result} 