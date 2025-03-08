*** Settings ***
Library     SeleniumLibrary
Variables   ../PageUIs/RegisterPageUI.py
Resource    ../Data/RegisterData.robot

*** Variables ***

*** Keywords ***
Click register button
    Click Element  ${REGISTER_BUTTON}

Verify error messages with empty data
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
    ${LIST_DATA}=   Create Dictionary
    ...     ${FIRST_NAME_TEXTBOX} = ${FIRST_NAME}
    ...     ${LAST_NAME_TEXTBOX} = ${LAST_NAME}
    ...     ${PASSWORD_TEXTBOX} = ${PASSWORD}
    ...     ${CONFIRM_PASSWORD_TEXTBOX} = ${CONFIRM_PASSWORD}

    FOR     ${TEXTBOX_FIELD}    ${VALUE}    IN  &{LIST_DATA}
        Input text  ${TEXTBOX_FIELD}  ${VALUE}
    END

Enter an invalid email format
    Input text  ${EMAIL_TEXTBOX}  ${INVALID_EMAIL}

Verify error message with wrong email format
    ${ACTUAL_TEXT}=     Get text    ${EMAIL_ERROR_MESSAGE}
    ${EXPECTED_TEXT}=   Evaluate    "${EMAIL_INVALID_TEXT}".strip()
    Should Be Equal As Strings   ${ACTUAL_TEXT}      ${EXPECTED_TEXT}