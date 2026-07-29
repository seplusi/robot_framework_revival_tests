*** Settings ***


*** Variables ***
${VARIABLE_DEMO}  =  This is then GLOBAL variable

*** Test Cases ***
This is demo test 1
    ${variable_demo}  Set Variable  This is TESTCASE variable
    Log To Console  Test 1 variable is ${variable_demo}

This is demo test 2
    Log To Console  Test 2 variable is ${VARIABLE_DEMO}

This is demo test 3
    This is demo keyword

*** Keywords ***
This is demo keyword
    [Arguments]  ${variable_demo}=This is KEYWORD variable
    Log To Console  ${VARIABLE_DEMO}