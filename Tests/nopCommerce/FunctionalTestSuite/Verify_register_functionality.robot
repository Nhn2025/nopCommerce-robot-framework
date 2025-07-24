*** Settings ***
Documentation   Register Functionality of NopCommerce
Resource  ../../../Resources/Commons/CommonPageObject.robot
Resource  ../../../Resources/PageObjects/RegisterPageObject.robot
Resource  ../../../Resources/PageObjects/HeaderPageObject.robot
Resource  ../../../Resources/Data/RegisterData.robot
Resource  ../../../Resources/Data/CommonData.robot

Test Setup  CommonPageObject.Start TestCase
Test Teardown   CommonPageObject.Finish TestCase

*** Variables ***

*** Test Cases ***
Verify that user cannot register with empty input fields
    [Documentation]     This test case verifies that registration fails when all required fields are empty
    [Tags]  Functional

    HeaderPageObject.Click register link
    RegisterPageObject.Click register button
    RegisterPageObject.Verify error messages with empty data    ${FIRST_NAME_REQUIRED_TEXT}    ${LAST_NAME_REQUIRED_TEXT}    ${EMAIL_REQUIRED_TEXT}    ${PASSWORD_REQUIRED_TEXT}

Verify that user cannot register with an invalid email format
    [Documentation]  This test case verifies that registration fails when an invalid email format is entered
    [Tags]  Functional

    HeaderPageObject.Click register link
    RegisterPageObject.Fill in all required fields     ${FIRST_NAME}   ${LAST_NAME}     ${INVALID_EMAIL}    ${PASSWORD}     ${CONFIRM_PASSWORD}
    RegisterPageObject.Click register button
    RegisterPageObject.Verify error message with invalid email    ${EMAIL_ERROR_MESSAGE_LOCATOR}   ${EMAIL_INVALID_TEXT}

Verify that user can successfully register with valid data
    [Documentation]  This test case verifies that registration is successful when multiple sets of valid data are entered
    [Tags]  Functional

    ${VALID_EMAIL}    CommonPageObject.Generate random email

    HeaderPageObject.Click register link
    RegisterPageObject.Fill in all required fields    ${FIRST_NAME}   ${LAST_NAME}      ${VALID_EMAIL}    ${PASSWORD}     ${CONFIRM_PASSWORD}
    RegisterPageObject.Click register button
    RegisterPageObject.Verify success message with valid data   ${SUCCESS_REGISTER_TEXT}

Verify that user cannot register with an email that is already registered
    [Documentation]  This test case verifies that registration fails when an existing email is entered
    [Tags]  Functional

    HeaderPageObject.Click register link
    RegisterPageObject.Fill in all required fields   ${FIRST_NAME}   ${LAST_NAME}   ${EXISTING_EMAIL}    ${PASSWORD}     ${CONFIRM_PASSWORD}
    RegisterPageObject.Click register button
    RegisterPageObject.Verify error message with invalid email  ${EXISTING_EMAIL_MESSAGE_LOCATOR}  ${EMAIL_EXISTING_TEXT}

Verify that user cannot register with a password shorter than 6 characters
    [Documentation]  This test case verifies that registration with a password shorter than 6 characters
    [Tags]  Functional

    ${VALID_EMAIL}    CommonPageObject.Generate random email

    HeaderPageObject.Click register link
    RegisterPageObject.Fill in all required fields   ${FIRST_NAME}   ${LAST_NAME}   ${VALID_EMAIL}    ${INVALID_PASSWORD}     ${INVALID_CONFIRM_PASSWORD}
    RegisterPageObject.Click register button
    RegisterPageObject.Verify error message with a password shorter than 6 characters     ${INVALID_PASSWORD_TEXT}

Verify that user cannot register when password and confirm password do not match
    [Documentation]  This test case verifies that registration fails when the password does not match the confirm password
    [Tags]  Functional

    ${VALID_EMAIL}    CommonPageObject.Generate random email

    HeaderPageObject.Click register link
    RegisterPageObject.Fill in all required fields   ${FIRST_NAME}   ${LAST_NAME}   ${VALID_EMAIL}    ${PASSWORD}     ${NOT_MATCH_CONFIRM_PASSWORD}
    RegisterPageObject.Click register button
    RegisterPageObject.Verify error message with a password does not match the confirm password     ${NOT_MATCH_CONFIRM_PASSWORD_TEXT}