*** Settings ***
Library     SeleniumLibrary
Resource  ../CommonFunctionality.robot

*** Variables ***
${search_result}   results for

*** Keywords ***
Verify Search Results
    Page Should Contain   ${search_result} ${search_texts}[1]

Select product condition