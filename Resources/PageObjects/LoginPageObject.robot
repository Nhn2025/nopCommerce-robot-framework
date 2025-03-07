*** Settings ***
Library     SeleniumLibrary
Variables   ../PageUIs/LoginPageUI.py

*** Variables ***

*** Keywords ***
Input username, password and click login button
    [Arguments]     ${username}     ${password}
    Input text  ${USERNAME_TEXT_BOX}    ${username}
    Input text  ${PASSWORD_TEXT_BOX}    ${password}
    Press keys  ${LOGIN_BUTTON}   [RETURN]