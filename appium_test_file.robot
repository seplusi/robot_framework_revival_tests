*** Settings ***
Library    AppiumLibrary

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
Test calculator android app
    Open chrome appium driver
    Wait Until Element Is Visible    locator=id:com.sec.android.app.popupcalculator:id/calc_keypad_btn_clear
