*** Settings ***
Library     SeleniumLibrary
Variables   ../PageUIs/LoginPageUI.py
Variables   ../PageUIs/CommonPageUI.py

*** Variables ***

*** Keywords ***
Click login button
    Click Element   ${LOGIN_BUTTON_LOCATOR}

Verify error message
    [Arguments]      ${EMAIL_LOGIN_REQUIRED_TEXT}
    ${ACTUAL_TEXT}=     Get text    ${EMAIL_ERROR_MESSAGE_LOCATOR}
    ${EXPECTED_TEXT}=   Evaluate    "${EMAIL_LOGIN_REQUIRED_TEXT}".strip()
    Should Be Equal As Strings   ${ACTUAL_TEXT}      ${EXPECTED_TEXT}

Input email and password
    [Arguments]     ${EMAIL}    ${PASSWORD}
    ${LOGIN_INFO}=  Create Dictionary
    ...     ${EMAIL} = ${EMAIL_TEXTBOX_LOCATOR}
    ...     ${PASSWORD} = ${PASSWORD_TEXTBOX_LOCATOR}

    FOR     ${DATA}   ${LOCATOR}    IN      &{LOGIN_INFO}
        Input text  ${LOCATOR}  ${DATA}
    END

Verify multiple error messages
    [Arguments]      ${INVALID_LOGIN_TEXT_1}    ${INVALID_LOGIN_TEXT_2}
    ${ACTUAL_TEXT}=     Get text    ${INVALID_LOGIN_MESSAGE_LOCATOR}
    Should Contain   ${ACTUAL_TEXT}      ${INVALID_LOGIN_TEXT_1}
    Should Contain   ${ACTUAL_TEXT}      ${INVALID_LOGIN_TEXT_2}