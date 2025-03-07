*** Settings ***
Library     SeleniumLibrary
Variables   ../PageUIs/RegisterPageUI.py

*** Variables ***

*** Keywords ***
Click to register button
    Click Element  ${REGISTER_BUTTON}

Verify error messages
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