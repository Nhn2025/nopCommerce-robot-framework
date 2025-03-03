*** Settings ***
Library     SeleniumLibrary

*** Variables ***

*** Keywords ***
Verify Search Results
    [Arguments]     ${search_result}   ${search_text}
    Page Should Contain   ${search_result} ${search_text}