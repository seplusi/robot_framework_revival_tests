*** Settings ***
Library    AppiumLibrary

*** Keywords ***
Page is loaded after time
    [Arguments]    ${timeout}    @{locators}
    FOR    ${locator}    IN    @{locators}
        Log To Console    ${locator}
        Wait Until Element Is Visible    locator=${locator}    timeout=${timeout}
    END
