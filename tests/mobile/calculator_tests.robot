*** Settings ***
Library    AppiumLibrary
Test Teardown  AppiumLibrary.Close All Applications
Test Setup  Open chrome appium driver
Resource       ../../resources/mobile/calculator_page_object.resource

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
Test 1 + 1
    Perform android calculator addition  btn_num1=1  btn_num2=1  result=2

Test 2 + 1
    Perform android calculator addition  btn_num1=2  btn_num2=1  result=3

Test 9 + 9
    Perform android calculator addition  btn_num1=9  btn_num2=9  result=18
