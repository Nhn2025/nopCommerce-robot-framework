*** Settings ***
Library     SeleniumLibrary

*** Keywords ***
Verify Search Results
    Page Should Contain    results for mobile

Select product condition