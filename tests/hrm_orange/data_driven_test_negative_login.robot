*** Settings ***
Resource        ../../resources/login_page_object.resource
Suite Setup     Open Browser  browser=chrome  options=add_argument("--guest")
Suite Teardown  Close All Browsers
Test Template   Invalid login with non-empty credentials

*** Variables ***
${URL}  https://opensource-demo.orangehrmlive.com/web/index.php/auth/login

*** Test Cases ***                USERNAME    PASSWORD  URL     ERROR
Test login with invalid username  blah        admin123  ${URL}  Invalid credentials
Test login with invalid password  Admim       blah      ${URL}  Invalid credentials
Test login with both invalid      blah        blah      ${URL}  Invalid credentials
Test login with disabled user     seplusi2    12QWaszx  ${URL}  Account disabled



