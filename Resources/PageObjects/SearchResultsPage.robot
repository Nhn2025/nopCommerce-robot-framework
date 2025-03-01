*** Settings ***
Library     SeleniumLibrary
Resource  ../CommonFunctionality.robot

*** Variables ***

*** Keywords ***
Verify Search Results
    [Arguments]     ${search_result}   ${search_text}
    Page Should Contain   ${search_result} ${search_text}