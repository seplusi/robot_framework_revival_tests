*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Page is loaded after time
    [Arguments]    ${timeout}    @{locators}
    FOR    ${locator}    IN    @{locators}
        Log To Console    ${locator}
        Wait Until Element Is Visible    locator=${locator}    timeout=${timeout}
    END

Elements Should Not Be Visible
    [Arguments]    @{locators}
    FOR    ${locator}    IN    @{locators}
        Log To Console    ${locator}
        Element Should Not Be Visible    locator=${locator}
    END