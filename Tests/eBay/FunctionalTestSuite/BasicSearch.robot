*** Settings ***
Documentation   Basic Search Functionality
Library     SeleniumLibrary

*** Variables ***

*** Test Cases ***
Verify basic search functionality of eBay
    [Documentation]  This test case verifies the basic search
    [Tags]  Functional

    Open Browser    https://www.ebay.com/   chrome
    Input text  //input[@id='gh-ac']    mobile
    Press keys  //button[@id='gh-search-btn']   [RETURN]
    Page Should Contain    results for mobile
    Close Browser

*** Keywords ***
