*** Settings ***
Documentation   Register Functionality of NopCommerce
Resource  ../../../Resources/Commons/CommonFunctionality.robot
Resource  ../../../Resources/PageObjects/RegisterPageObject.robot
Resource  ../../../Resources/PageObjects/HeaderPageObject.robot

Test Setup  CommonFunctionality.Start TestCase
Test Teardown   CommonFunctionality.Finish TestCase

*** Variables ***

*** Test Cases ***
Verify Registration with Empty Data
    [Documentation]     This test case verifies that registration fails when all required fields are empty
    [Tags]  Functional

    HeaderPageObject.Click register link
    RegisterPageObject.Click register button
    RegisterPageObject.Verify error messages with empty data

Verify registration with wrong email format
    [Documentation]  This test case verifies that registration fails when an invalid email format is entered
    [Tags]  Functional

    HeaderPageObject.Click register link
    RegisterPageObject.Fill in all required fields with valid data except email
    RegisterPageObject.Enter an invalid email format
    RegisterPageObject.Click register button
    RegisterPageObject.Verify error message with wrong email format