*** Settings ***
Library     SeleniumLibrary
Variables   ../PageUIs/LoginPageUI.py
Variables   ../PageUIs/CommonPageUI.py
Resource  ../Commons/CommonPageObject.robot
Resource  HomePageObject.robot

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
    ...     ${EMAIL_TEXTBOX_LOCATOR}=${EMAIL}
    ...     ${PASSWORD_TEXTBOX_LOCATOR}=${PASSWORD}

    FOR    ${LOCATOR}    ${DATA}     IN      &{LOGIN_INFO}
        Input text  ${LOCATOR}      ${DATA}
    END

Verify multiple error messages
    [Arguments]      ${INVALID_LOGIN_TEXT_1}    ${INVALID_LOGIN_TEXT_2}
    ${ACTUAL_TEXT}=     Get text    ${INVALID_LOGIN_MESSAGE_LOCATOR}
    Should Contain   ${ACTUAL_TEXT}      ${INVALID_LOGIN_TEXT_1}
    Should Contain   ${ACTUAL_TEXT}      ${INVALID_LOGIN_TEXT_2}

Verify successful login with valid data
    [Arguments]     ${EMAIL_LOGIN}      ${VALID_PASSWORD_LOGIN}     ${LOG_OUT_TEXT}
    HeaderPageObject.Click login link
    Input email and password    ${EMAIL_LOGIN}      ${VALID_PASSWORD_LOGIN}

    Click login button
    HomePageObject.Verify login page redirects to home page     ${LOG_OUT_TEXT}

Verify login fail with wrong password
    [Arguments]     ${EMAIL_LOGIN}      ${INVALID_PASSWORD_LOGIN}   ${INVALID_LOGIN_TEXT_1}
    ...     ${INVALID_LOGIN_TEXT_2}

    HeaderPageObject.Click login link
    Input email and password    ${EMAIL_LOGIN}      ${INVALID_PASSWORD_LOGIN}
    Click login button
    Verify multiple error messages    ${INVALID_LOGIN_TEXT_1}    ${INVALID_LOGIN_TEXT_2}
