*** Settings ***

*** Test Cases ***
Argument demo keyword test
    Argument demo Keyword  rcv  academy  alright
#Logging arg1 rcv
#Logginf arg2 academy
#Logging arg3 alright

Argument demo default keyword test
    Argument demo Keyword  rcv  academy
#Logging arg1 rcv
#Logginf arg2 academy
#Logging arg3 Blah

*** Keywords ***
Argument demo Keyword
    [Arguments]  ${arg1}  ${arg2}  ${arg3}=Blah
    Log To Console  Logging arg1 ${arg1}
    Log To Console  Logginf arg2 ${arg2}
    Log To Console  Logging arg3 ${arg3}
