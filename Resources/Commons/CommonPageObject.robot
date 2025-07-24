*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    random
Library    OperatingSystem
Variables   ../PageUIs/CommonPageUI.py

*** Variables ***
${url}  http://demo.nhu.nopcommerce
${browser}  chrome

*** Keywords ***
Start TestCase
    Open Browser  ${url}  ${browser}
    Maximize Browser Window

Finish TestCase
    Close Browser

Generate random email
    ${RANDOM_NUMBER}    Evaluate    random.randint(1000, 9999)    modules=random
    ${VALID_EMAIL}    Set Variable    duongnhu${RANDOM_NUMBER}@gmail.com
    [Return]    ${VALID_EMAIL}

Log in with an existing account
    [Arguments]     ${EMAIL_LOGIN}      ${PASSWORD_LOGIN}
    Start TestCase
    LoginPageObject.Login with email and password   ${EMAIL_LOGIN}      ${PASSWORD_LOGIN}