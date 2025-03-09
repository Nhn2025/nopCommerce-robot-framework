*** Settings ***
Documentation   Register Functionality of NopCommerce
Resource  ../../../Resources/Commons/CommonFunctionality.robot
Resource  ../../../Resources/PageObjects/RegisterPageObject.robot
Resource  ../../../Resources/PageObjects/HeaderPageObject.robot
Resource  ../../../Resources/Data/RegisterData.robot

Test Setup  CommonFunctionality.Start TestCase
Test Teardown   CommonFunctionality.Finish TestCase

*** Variables ***

*** Test Cases ***
Verify Registration with Empty Data
    [Documentation]     This test case verifies that registration fails when all required fields are empty
    [Tags]  Functional

    HeaderPageObject.Click register link
    RegisterPageObject.Click register button
    RegisterPageObject.Verify error messages with empty data    ${FIRST_NAME_REQUIRED_TEXT}    ${LAST_NAME_REQUIRED_TEXT}    ${EMAIL_REQUIRED_TEXT}    ${PASSWORD_REQUIRED_TEXT}

Verify registration with wrong email format
    [Documentation]  This test case verifies that registration fails when an invalid email format is entered
    [Tags]  Functional

    HeaderPageObject.Click register link
    RegisterPageObject.Fill in all required fields     ${FIRST_NAME}   ${LAST_NAME}     ${INVALID_EMAIL}    ${PASSWORD}     ${CONFIRM_PASSWORD}
    RegisterPageObject.Click register button
    RegisterPageObject.Verify error message with invalid email    ${EMAIL_ERROR_MESSAGE_LOCATOR}   ${EMAIL_INVALID_TEXT}

Verify registration with valid data
    [Documentation]  This test case verifies that registration is successful when multiple sets of valid data are entered
    [Tags]  Functional

    ${VALID_EMAIL}    CommonFunctionality.Generate random email

    HeaderPageObject.Click register link
    RegisterPageObject.Fill in all required fields    ${FIRST_NAME}   ${LAST_NAME}      ${VALID_EMAIL}    ${PASSWORD}     ${CONFIRM_PASSWORD}
    RegisterPageObject.Click register button
    RegisterPageObject.Verify success message with valid data   ${SUCCESS_REGISTER_TEXT}

Verify registration with existing email
    [Documentation]  This test case verifies that registration fails when an existing email is entered
    [Tags]  Functional

    HeaderPageObject.Click register link
    RegisterPageObject.Fill in all required fields   ${FIRST_NAME}   ${LAST_NAME}   ${EXISTING_EMAIL}    ${PASSWORD}     ${CONFIRM_PASSWORD}
    RegisterPageObject.Click register button
    RegisterPageObject.Verify error message with invalid email  ${EXISTING_EMAIL_MESSAGE_LOCATOR}  ${EMAIL_EXISTING_TEXT}

Verify registration with a password shorter than 6 characters
    [Documentation]  This test case verifies that registration with a password shorter than 6 characters
    [Tags]  Functional

    ${VALID_EMAIL}    CommonFunctionality.Generate random email

    HeaderPageObject.Click register link
    RegisterPageObject.Fill in all required fields   ${FIRST_NAME}   ${LAST_NAME}   ${VALID_EMAIL}    ${INVALID_PASSWORD}     ${INVALID_CONFIRM_PASSWORD}
    RegisterPageObject.Click register button
    RegisterPageObject.Verify error message with a password shorter than 6 characters     ${INVALID_PASSWORD_TEXT}

Verify registration when password does not match the confirm password
    [Documentation]  This test case verifies that registration fails when the password does not match the confirm password
    [Tags]  Functional

    ${VALID_EMAIL}    CommonFunctionality.Generate random email

    HeaderPageObject.Click register link
    RegisterPageObject.Fill in all required fields   ${FIRST_NAME}   ${LAST_NAME}   ${VALID_EMAIL}    ${PASSWORD}     ${NOT_MATCH_CONFIRM_PASSWORD}
    RegisterPageObject.Click register button
    RegisterPageObject.Verify error message with a password does not match the confirm password     ${NOT_MATCH_CONFIRM_PASSWORD_TEXT}