*** Settings ***
Documentation   Basic Search Functionality
Resource  ../../../Resources/CommonFunctionality.robot
Resource  ../../../Resources/eBay_UserDefinedKeywords.robot

*** Variables ***

*** Test Cases ***
Verify basic search functionality of eBay
    [Documentation]  This test case verifies the basic search
    [Tags]  Functional

    Start TestCase eBay
    Verify Search Results
    Finish TestCase