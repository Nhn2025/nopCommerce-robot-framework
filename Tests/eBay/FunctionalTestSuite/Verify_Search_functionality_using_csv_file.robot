*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    CSVLibrary
Resource  ../../../Resources/CommonFunctionality.robot
Resource  ../../../Resources/PageObjects/SearchResultsPage.robot
Resource  ../../../Resources/PageObjects/HeaderPage.robot

Test Setup  CommonFunctionality.Start TestCase
Test Teardown   CommonFunctionality.Finish TestCase

*** Variables ***
${DATA_FILE}    Resources/Data/test_data.csv
${SEARCH_RESULT_TEXT}   results for

*** Test Cases ***
Verify Search Functionality using CSV
    [Documentation]  This test case verifies the basic search using csv
    [Tags]  Functional

    @{data}=  read csv file to list     ${DATA_FILE}
    FOR    ${row}    IN    @{data}
        ${search_term}    Set Variable    ${row}[0]
        HeaderPage.Input Search Text and Click Search   ${search_term}
        SearchResultsPage.Verify Search Results     ${SEARCH_RESULT_TEXT}     ${search_term}
    END