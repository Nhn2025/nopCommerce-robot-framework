*** Settings ***
Documentation   Login Functionality
Suite Setup   Set Log Level  WARN
Resource  ../../../Resources/CommonFunctionality.robot
Resource  ../../../Resources/OrangeHRM_UserDefinedKeywords.robot

*** Variables ***

*** Test Cases ***
Verify login functionality of OrangeHRM
    [Documentation]  This test case verifies the login
    [Tags]  Functional

    Start TestCase OrangeHRM
    Verify Login Results
    Finish TestCase OrangeHRM