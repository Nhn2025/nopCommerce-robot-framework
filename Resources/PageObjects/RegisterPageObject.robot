*** Settings ***
Library     SeleniumLibrary
Variables   ../PageUIs/RegisterPageUI.py
Resource    ../Data/RegisterData.robot

*** Variables ***

*** Keywords ***
Click register button
    Click Element  ${REGISTER_BUTTON}

Verify error messages with empty data
    [Arguments]     ${FIRST_NAME_REQUIRED_TEXT}   ${LAST_NAME_REQUIRED_TEXT}    ${EMAIL_REQUIRED_TEXT}      ${PASSWORD_REQUIRED_TEXT}
    ${EXPECTED_ERRORS}=     Create Dictionary
    ...     ${FIRST_NAME_ERROR_MESSAGE} = ${FIRST_NAME_REQUIRED_TEXT}
    ...     ${LAST_NAME_ERROR_MESSAGE} = ${LAST_NAME_REQUIRED_TEXT}
    ...     ${EMAIL_ERROR_MESSAGE} = ${EMAIL_REQUIRED_TEXT}
    ...     ${PASSWORD_ERROR_MESSAGE} = ${PASSWORD_REQUIRED_TEXT}

    FOR         ${LOCATOR}         ${EXPECTED_TEXT}    IN      &{EXPECTED_ERRORS}
        ${ACTUAL_TEXT}=     Get text    ${LOCATOR}
        ${EXPECTED_TEXT}=   Evaluate    "${EXPECTED_TEXT}".strip()
        Should Be Equal As Strings   ${ACTUAL_TEXT}      ${EXPECTED_TEXT}
    END

Fill in all required fields with valid data except email
    [Arguments]     ${FIRST_NAME}   ${LAST_NAME}    ${PASSWORD}     ${CONFIRM_PASSWORD}
    ${LIST_DATA}=   Create Dictionary
    ...     ${FIRST_NAME_TEXTBOX} = ${FIRST_NAME}
    ...     ${LAST_NAME_TEXTBOX} = ${LAST_NAME}
    ...     ${PASSWORD_TEXTBOX} = ${PASSWORD}
    ...     ${CONFIRM_PASSWORD_TEXTBOX} = ${CONFIRM_PASSWORD}

    FOR     ${TEXTBOX_FIELD}    ${VALUE}    IN  &{LIST_DATA}
        Input text  ${TEXTBOX_FIELD}  ${VALUE}
    END

Enter an email address
    [Arguments]  ${EMAIL_DATA}
    Input text  ${EMAIL_TEXTBOX}  ${EMAIL_DATA}

Verify error message with wrong email format
    [Arguments]  ${EMAIL_ERROR_MESSAGE}
    ${ACTUAL_TEXT}=     Get text    ${EMAIL_ERROR_MESSAGE}
    ${EXPECTED_TEXT}=   Evaluate    "${EMAIL_INVALID_TEXT}".strip()
    Should Be Equal As Strings   ${ACTUAL_TEXT}      ${EXPECTED_TEXT}

Verify success message with valid data
    [Arguments]  ${SUCCESS_REGISTER_MESSAGE}
    ${ACTUAL_TEXT}=     Get text    ${SUCCESS_REGISTER_TEXT}
    ${EXPECTED_TEXT}=   Evaluate    "${SUCCESS_REGISTER_MESSAGE}".strip()
    Should Be Equal As Strings   ${ACTUAL_TEXT}      ${EXPECTED_TEXT}