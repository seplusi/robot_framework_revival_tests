*** Settings ***
Test Template   Invalid login with non-empty credentials
Library         DataDriver  delimiter=;  file=test_data1.csv

*** Variables ***
${URL}  https://opensource-demo.orangehrmlive.com/web/index.php/auth/login

*** Keywords ***
Invalid login with non-empty credentials
    [Arguments]  ${data}
    Log To Console  ${data}

*** Test Cases *** 
Test login fails with invalid credencials  ${data}
