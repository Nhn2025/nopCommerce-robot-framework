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
    RegisterPageObject.Fill in all required fields with valid data except email     ${FIRST_NAME}   ${LAST_NAME}    ${PASSWORD}     ${CONFIRM_PASSWORD}
    RegisterPageObject.Enter an email address   ${INVALID_EMAIL}
    RegisterPageObject.Click register button
    RegisterPageObject.Verify error message with wrong email format     ${EMAIL_ERROR_MESSAGE}

Verify registration with valid data
    [Documentation]  This test case verifies that registration is successful when multiple sets of valid data are entered
    [Tags]  Functional

    ${VALID_EMAIL}    CommonFunctionality.Generate random email
    Set Suite Variable    ${VALID_EMAIL}    ${VALID_EMAIL}

    HeaderPageObject.Click register link
    RegisterPageObject.Fill in all required fields with valid data except email     ${FIRST_NAME}   ${LAST_NAME}    ${PASSWORD}     ${CONFIRM_PASSWORD}
    RegisterPageObject.Enter an email address   ${VALID_EMAIL}
    RegisterPageObject.Click register button
    RegisterPageObject.Verify success message with valid data   ${SUCCESS_REGISTER_MESSAGE}