*** Settings ***
Resource        ../../resources/login_page_object.resource
Suite Setup     Open Browser  browser=chrome  options=add_argument("--guest")
Suite Teardown  Close All Browsers
Test Template   Invalid login with non-empty credentials
Library         DataDriver  file=../../Data/test_data.csv

*** Variables ***
${URL}  https://opensource-demo.orangehrmlive.com/web/index.php/auth/login

*** Keywords ***
Invalid login with non-empty credentials
    [Arguments]    ${username}    ${passwd}  ${expected_err}
    login_page_object.Invalid login with non-empty credentials  ${username}  ${passwd}  ${URL}  ${expected_err}

# NOTE: To have this working, the args names had to be the same in the csv data file as well in the test case
#  and in the keyword args.
# Also, to use the keyword that already existed in the page object, I had to create a keyword with the test
#  template name and then use the one already defined in the page object 
*** Test Cases *** 
Test login fails with invalid credencials  ${username}  ${passwd}  ${URL}  ${expected_err}
