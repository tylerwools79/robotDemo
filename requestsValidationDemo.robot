*** Settings ***
Library  RequestsLibrary
Suite Setup  Get Films  ${BASE_URL}
Suite Teardown  Set Suite Variable  ${Suite_Var}  ${empty}

*** Variables ***
${BASE_URL}=  https://ghibliapi.herokuapp.com
${Suite_Var}=  ${empty}

*** Test Cases ***
Validate Response Text with Contains
    Should contain  ${Suite_Var.text}  Ponyo
Validate Response Text with Match
    Should match  ${Suite_Var.text}  *Ponyo*
    Should match  ${Suite_Var.text}  *Ponyo*Ponyo*  #this shows that "Ponyo" appears more than once in the response text
Validate Status Code
    Should be equal  ${Suite_Var.status_code}  ${200}
    Should not be equal  ${Suite_Var.status_code}  ${300}
Validate Not Status Code
    Run Keyword And Ignore Error  Run Failed Status Code
*** Keywords ***
Run Failed Status Code
     Should be equal  ${Suite_Var.status_code}  ${300}
Get Films
    [Arguments]  ${BASE_URL}
    create session  get films   ${BASE_URL}
    ${response}=  get on session  get films  /films
    log to console  ${response.content}
    log to console  ${response.status_code}
    Set Suite Variable  ${Suite_Var}  ${response}