*** Settings ***
Library     SeleniumLibrary
Resource  ../CommonFunctionality.robot

*** Variables ***
${search_result}   results for

*** Keywords ***
Verify Search Results
    ${selected_text}  CommonFunctionality.Get Selected Search Text     1
    Page Should Contain   ${search_result} ${selected_text}

Select product condition