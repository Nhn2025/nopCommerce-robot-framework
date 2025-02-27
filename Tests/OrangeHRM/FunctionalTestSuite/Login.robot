*** Settings ***
Documentation   Login Functionality
Suite Setup   Set Log Level  WARN
Resource  ../../../Resources/CommonFunctionality.robot
Resource  ../../../Resources/OrangeHRM_UserDefinedKeywords.robot

Test Setup  CommonFunctionality.Start TestCase OrangeHRM
Test Teardown   CommonFunctionality.Finish TestCase OrangeHRM

*** Variables ***

*** Test Cases ***
Verify login functionality of OrangeHRM
    [Documentation]  This test case verifies the login
    [Tags]  Functional

    OrangeHRM_UserDefinedKeywords.Verify Login Results