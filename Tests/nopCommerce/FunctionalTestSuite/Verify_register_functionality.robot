*** Settings ***
Documentation   Register Functionality of NopCommerce
Resource  ../../../Resources/Commons/CommonFunctionality.robot
Resource  ../../../Resources/PageObjects/RegisterPageObject.robot
Resource  ../../../Resources/PageObjects/HeaderPageObject.robot

Test Setup  CommonFunctionality.Start TestCase
Test Teardown   CommonFunctionality.Finish TestCase

*** Variables ***

*** Test Cases ***
Verify register with empty data
    [Documentation]  This test case verifies registration with empty data
    [Tags]  Functional

    HeaderPageObject.Click to register link
    RegisterPageObject.Click to register button
    RegisterPageObject.Verify error messages