*** Settings ***
Documentation   Basic Search Functionality
Library     SeleniumLibrary

*** Variables ***

*** Test Cases ***
Verify basic search functionality of eBay
    [Documentation]  This test case verifies the basic search
    [Tags]  Functional

    Start TestCase
    Verify Search Results
    Finish TestCase

*** Keywords ***
Start TestCase
    Open Browser    https://www.ebay.com/   chrome
    Maximize Browser Window

Verify Search Results
    Input text  xpath://input[@id='gh-ac']    mobile
    Press keys  //button[@id='gh-search-btn']   [RETURN]
    Page Should Contain    results for mobile

Finish TestCase
    Close Browser