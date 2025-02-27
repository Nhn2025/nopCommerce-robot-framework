*** Settings ***
Documentation   Search Functionality
Resource  ../../../Resources/CommonFunctionality.robot

Test Setup  CommonFunctionality.Start TestCase Google
Test Teardown   CommonFunctionality.Finish TestCase

*** Variables ***

*** Test Cases ***
This is sample test case
    [Documentation]  Google test
    [Tags]  Functional

    Log  "Test is running"