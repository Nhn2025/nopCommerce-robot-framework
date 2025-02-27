*** Settings ***
Documentation   Basic Search Functionality
Resource  ../../../Resources/CommonFunctionality.robot
Resource  ../../../Resources/PageObjects/SearchResultsPage.robot
Resource  ../../../Resources/PageObjects/HeaderPage.robot

Test Setup  CommonFunctionality.Start TestCase
Test Teardown   CommonFunctionality.Finish TestCase

*** Variables ***

*** Test Cases ***
Verify basic search functionality of eBay
    [Documentation]  This test case verifies the basic search
    [Tags]  Functional

    HeaderPage.Input Search Text and Click Search
    SearchResultsPage.Verify Search Results