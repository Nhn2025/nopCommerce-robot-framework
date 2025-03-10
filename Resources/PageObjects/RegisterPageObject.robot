*** Settings ***
Library     SeleniumLibrary
Variables   ../PageUIs/RegisterPageUI.py
Variables   ../PageUIs/CommonPageUI.py
Resource    ../Data/RegisterData.robot

*** Variables ***

*** Keywords ***
Click register button
    Click Element  ${REGISTER_BUTTON_LOCATOR}

Verify error messages with empty data
    [Arguments]     ${FIRST_NAME_REQUIRED_TEXT}   ${LAST_NAME_REQUIRED_TEXT}    ${EMAIL_REQUIRED_TEXT}      ${PASSWORD_REQUIRED_TEXT}
    ${EXPECTED_ERRORS}=     Create Dictionary
    ...     ${FIRST_NAME_ERROR_MESSAGE_LOCATOR} = ${FIRST_NAME_REQUIRED_TEXT}
    ...     ${LAST_NAME_ERROR_MESSAGE_LOCATOR} = ${LAST_NAME_REQUIRED_TEXT}
    ...     ${EMAIL_ERROR_MESSAGE_LOCATOR} = ${EMAIL_REQUIRED_TEXT}
    ...     ${PASSWORD_ERROR_MESSAGE_LOCATOR} = ${PASSWORD_REQUIRED_TEXT}

    FOR         ${LOCATOR}         ${EXPECTED_TEXT}    IN      &{EXPECTED_ERRORS}
        ${ACTUAL_TEXT}=     Get text    ${LOCATOR}
        ${EXPECTED_TEXT}=   Evaluate    "${EXPECTED_TEXT}".strip()
        Should Be Equal As Strings   ${ACTUAL_TEXT}      ${EXPECTED_TEXT}
    END

Fill in all required fields
    [Arguments]     ${FIRST_NAME}   ${LAST_NAME}    ${EMAIL_DATA}   ${PASSWORD}     ${CONFIRM_PASSWORD}
    ${LIST_DATA}=   Create Dictionary
    ...     ${FIRST_NAME_TEXTBOX_LOCATOR} = ${FIRST_NAME}
    ...     ${LAST_NAME_TEXTBOX_LOCATOR} = ${LAST_NAME}
    ...     ${EMAIL_TEXTBOX_LOCATOR} = ${EMAIL_DATA}
    ...     ${PASSWORD_TEXTBOX_LOCATOR} = ${PASSWORD}
    ...     ${CONFIRM_PASSWORD_TEXTBOX_LOCATOR} = ${CONFIRM_PASSWORD}

    FOR     ${TEXTBOX_FIELD}    ${VALUE}    IN  &{LIST_DATA}
        Input text  ${TEXTBOX_FIELD}  ${VALUE}
    END

Verify error message with invalid email
    [Arguments]  ${EMAIL_ERROR_MESSAGE_LOCATOR}     ${EMAIL_INVALID_TEXT}
    ${ACTUAL_TEXT}=     Get text    ${EMAIL_ERROR_MESSAGE_LOCATOR}
    ${EXPECTED_TEXT}=   Evaluate    "${EMAIL_INVALID_TEXT}".strip()
    Should Be Equal As Strings   ${ACTUAL_TEXT}      ${EXPECTED_TEXT}

Verify success message with valid data
    [Arguments]  ${SUCCESS_REGISTER_MESSAGE}
    ${ACTUAL_TEXT}=     Get text    ${SUCCESS_REGISTER_TEXT_LOCATOR}
    ${EXPECTED_TEXT}=   Evaluate    "${SUCCESS_REGISTER_MESSAGE}".strip()
    Should Be Equal As Strings   ${ACTUAL_TEXT}      ${EXPECTED_TEXT}

Verify error message with a password shorter than 6 characters
    [Arguments]     ${INVALID_PASSWORD_TEXT}
    ${ACTUAL_TEXT}=     Get text    ${PASSWORD_INVALID_MESSAGE_LOCATOR}
    ${EXPECTED_TEXT}=   Evaluate    "${INVALID_PASSWORD_TEXT}".strip()
    Should Be Equal As Strings   ${ACTUAL_TEXT}      ${EXPECTED_TEXT}

Verify error message with a password does not match the confirm password
    [Arguments]     ${NOT_MATCH_CONFIRM_PASSWORD_TEXT}
    ${ACTUAL_TEXT}=     Get text    ${PASSWORD_ERROR_MESSAGE_LOCATOR}
    ${EXPECTED_TEXT}=   Evaluate    "${NOT_MATCH_CONFIRM_PASSWORD_TEXT}".strip()
    Should Be Equal As Strings   ${ACTUAL_TEXT}      ${EXPECTED_TEXT}