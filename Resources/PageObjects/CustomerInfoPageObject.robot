*** Settings ***
Library     SeleniumLibrary
Variables   ../PageUIs/CommonPageUI.py
Variables   ../PageUIs/CustomerInfoPageUI.py

*** Variables ***

*** Keywords ***
Input customer information
    [Arguments]     ${FIRST_NAME}   ${LAST_NAME}    ${EMAIL}    ${COMPANY}

    Click Element   ${GENDER_RADIO_LOCATOR }

    ${LIST_DATA}=   Create Dictionary
    ...     ${FIRST_NAME_TEXTBOX_LOCATOR}=${FIRST_NAME}
    ...     ${LAST_NAME_TEXTBOX_LOCATOR}=${LAST_NAME}
    ...     ${EMAIL_TEXTBOX_LOCATOR}=${EMAIL}
    ...     ${COMPANY_TEXTBOX_LOCATOR}=${COMPANY}

    FOR     ${TEXTBOX_FIELD}    ${VALUE}    IN  &{LIST_DATA}
        Input text  ${TEXTBOX_FIELD}  ${VALUE}
    END

Verify updated information is successfully saved
    [Arguments]     ${GENDER}   ${FIRST_NAME}   ${LAST_NAME}    ${EMAIL}    ${COMPANY}

    ${ACTUAL_TEXT}    Get Text    ${GENDER_RADIO_LOCATOR}
    ${EXPECTED_TEXT}=   Evaluate    "${GENDER}".strip()
    Should Be Equal As Strings   ${ACTUAL_TEXT}      ${EXPECTED_TEXT}

    ${LIST_DATA}=     Create Dictionary
    ...     ${FIRST_NAME_TEXTBOX_LOCATOR}=${FIRST_NAME}
    ...     ${LAST_NAME_TEXTBOX_LOCATOR}=${LAST_NAME}
    ...     ${EMAIL_TEXTBOX_LOCATOR}=${EMAIL}
    ...     ${COMPANY_TEXTBOX_LOCATOR}=${COMPANY}

    FOR         ${LOCATOR}         ${EXPECTED_TEXT}    IN      &{LIST_DATA}
        ${ACTUAL_TEXT}    Get Element Attribute    ${LOCATOR}    value
        ${EXPECTED_TEXT}=   Evaluate    "${EXPECTED_TEXT}".strip()
        Should Be Equal As Strings   ${ACTUAL_TEXT}      ${EXPECTED_TEXT}
    END

Click save button
    Click element   ${SAVE_BUTTON_INFO}