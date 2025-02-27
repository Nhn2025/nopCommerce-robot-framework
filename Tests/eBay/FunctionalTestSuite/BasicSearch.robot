*** Settings ***
Documentation   Basic Search Functionality
Resource  ../../../Resources/CommonFunctionality.robot
Resource  ../../../Resources/eBay_UserDefinedKeywords.robot

Test Setup  CommonFunctionality.Start TestCase eBay
Test Teardown   CommonFunctionality.Finish TestCase

*** Variables ***

*** Test Cases ***
Verify basic search functionality of eBay
    [Documentation]  This test case verifies the basic search
    [Tags]  Functional

    eBay_UserDefinedKeywords.Verify Search Results