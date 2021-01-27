*** Settings ***
Library  myCustomLib.py
Suite Setup  Startup  ${init}
Suite Teardown  Set Suite Variable  ${Suite_Var}  ${empty}

*** Variables ***
@{nums}  ${1}  ${2}  ${3}  ${4}  ${5}
${side1}=  ${10}
${Suite_Var}=  ${empty}
${init}=  25
*** Test Cases ***
Greet
    ${msg}=  helloWorld
    log to console  ${msg}
Maths
    ${ans}=  squareNum  ${side1}
    ${res}=  isEqual  ${ans}  ${100}
    log to console  ${res}
    ${ans}=  sqrt  ${Suite_Var}
    log to console  ${Suite_Var}
    Set Suite Variable  ${Suite_Var}  ${ans}
    log to console  ${Suite_Var}
    ${ans}=  halveNum  ${side1}
    ${res}=  isEqual  ${ans}  ${Suite_Var}
For Loop
    FOR  ${num}  IN  @{nums}
    log to console  ${num}
    ${ans}=  doubleNum  ${num}
    log to console  ${ans}
    END
*** Keywords ***
Startup
    [Arguments]  ${init_val}
    Set Suite Variable  ${Suite_Var}  ${init_val}
