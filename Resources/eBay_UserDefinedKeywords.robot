*** Settings ***
Library     SeleniumLibrary

*** Keywords ***
Verify Search Results
    Input text  xpath://input[@id='gh-ac']    mobile
    Press keys  //button[@id='gh-search-btn']   [RETURN]
    Page Should Contain    results for mobile