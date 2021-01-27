*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${URL1}=  https://www.demoblaze.com/
${URL2}=  https://www.google.com/
${BROWSER}=  firefox


*** Test Cases ***
Register for new account
    #This test case is the demo shown in the udemy course
    open browser  ${URL1}  ${BROWSER}
    #slee
    click element  id:signin2
    wait until element contains  xpath://*[@id="signInModalLabel"]  Sign up
    input text  id:sign-username  randomchars
    input text  id:sign-password  securePassword
    sleep  1
    click button  Sign up
    alert should be present  This user already exist.
    close browser
Auto Search
    open browser  ${URL2}  ${BROWSER}
    input text  name:q  test
    sleep  1
    click element  name:btnK
    sleep  1
    close browser

