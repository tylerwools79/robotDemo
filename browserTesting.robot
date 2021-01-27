*** Settings ***
Library  SeleniumLibrary
Test Template  Open and Close browser
Force Tags  Selenium

*** Variables ***
${URL1}=  https://www.google.com/
${URL2}=  https://www.amazon.com/
${BROWSER1}=  firefox
${BROWSER2}=  chrome

*** Test Cases ***
Verify Google with Firefox
    ...  erl=${URL1}
    ...  bowser=${BROWSER1}
    [Tags]  google  firefox

Verify Google with Chrome
    ...  erl=${URL1}
    ...  bowser=${BROWSER2}
    [Tags]  google  chrome
Verify Amazon with Firefox
    ...  erl=${URL2}
    ...  bowser=${BROWSER1}
    [Tags]  amazon  firefox

Verify Amazon with Chrome
    ...  erl=${URL2}
    ...  bowser=${BROWSER2}
    [Tags]  amazon  chrome


*** Keywords ***
Open and Close browser
    [Arguments]   ${erl}=${space * 5}  #this space is an example of how you fill a string with 5 spaces
    ...   ${bowser}=${none}
    open browser  ${erl}  ${bowser}
    sleep  1
    close browser
