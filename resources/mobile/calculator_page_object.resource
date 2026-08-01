*** Settings ***
Library    AppiumLibrary
Resource   ../mobile/mobile_page_objects_common_keywords.robot

*** Variables ***
${btn_clear}  com.sec.android.app.popupcalculator:id/calc_keypad_btn_clear
${btn_parenthesis}  com.sec.android.app.popupcalculator:id/calc_keypad_btn_parenthesis
${btn_percentage}  com.sec.android.app.popupcalculator:id/calc_keypad_btn_percentage
${btn_09}  com.sec.android.app.popupcalculator:id/calc_keypad_btn_09
${btn_08}  com.sec.android.app.popupcalculator:id/calc_keypad_btn_08
${btn_07}  com.sec.android.app.popupcalculator:id/calc_keypad_btn_07
${btn_06}  com.sec.android.app.popupcalculator:id/calc_keypad_btn_06
${btn_05}  com.sec.android.app.popupcalculator:id/calc_keypad_btn_05
${btn_04}  com.sec.android.app.popupcalculator:id/calc_keypad_btn_04
${btn_03}  com.sec.android.app.popupcalculator:id/calc_keypad_btn_03
${btn_02}  com.sec.android.app.popupcalculator:id/calc_keypad_btn_02
${btn_01}  com.sec.android.app.popupcalculator:id/calc_keypad_btn_01
${btn_00}  com.sec.android.app.popupcalculator:id/calc_keypad_btn_00
${btn_equal}  com.sec.android.app.popupcalculator:id/calc_keypad_btn_equal
${btn_add}  com.sec.android.app.popupcalculator:id/calc_keypad_btn_add
${btn_sub}  com.sec.android.app.popupcalculator:id/calc_keypad_btn_sub
${btn_mul}  com.sec.android.app.popupcalculator:id/calc_keypad_btn_mul
${btn_div}  com.sec.android.app.popupcalculator:id/calc_keypad_btn_div
${calc_edt_formula}  com.sec.android.app.popupcalculator:id/calc_edt_formula
${calc_tv_result}  com.sec.android.app.popupcalculator:id/calc_tv_result

*** Keywords ***
Calculator page is loaded after some time
    ${timeout}=    Get Appium Timeout
    Calculator page is loaded after  timeout=${timeout}

Calculator page is loaded after
    [Arguments]    ${timeout}
    Log To Console    message=Page load timeout is ${timeout}
    Page is loaded after time    ${timeout}  ${btn_mul}
    ...    ${btn_div}  ${calc_edt_formula}  ${calc_tv_result}  

Perform android calculator addition
    [Arguments]  ${btn_num1}  ${btn_num2}  ${result}
    Calculator page is loaded after some time
    ${dynamic_value}=    Get Variable Value    \${btn_0${btn_num1}}
    Click Element  ${dynamic_value}
    Element Text Should Be  ${calc_edt_formula}  Calculator input field ${btn_num1}
    Click Element  ${btn_add}
    Element Text Should Be  ${calc_edt_formula}  Calculator input field ${btn_num1} Plus${SPACE} 
    Element Text Should Be  ${calc_tv_result}  ${EMPTY}
    ${dynamic_value}=    Get Variable Value    \${btn_0${btn_num2}}
    Click Element  ${dynamic_value}
    Element Text Should Be  ${calc_edt_formula}  Calculator input field ${btn_num1} Plus ${btn_num2}
    Element Text Should Be  ${calc_tv_result}  ${result}
    Click Element  ${btn_equal}
    Element Text Should Be  ${calc_tv_result}  ${EMPTY}
    Element Text Should Be  ${calc_edt_formula}  ${result} Calculation result


