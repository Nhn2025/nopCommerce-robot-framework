*** Settings ***
Library     SeleniumLibrary
Resource  ../CommonFunctionality.robot

*** Variables ***

*** Keywords ***
Input Search Text and Click Search
    [Arguments]     ${search_text}
    Input text  xpath://input[@id='gh-ac']  ${search_text}
    Press keys  //button[@id='gh-search-btn']   [RETURN]

Click on Advanced Search Link
    Click element   //*[@id='gh-as-a']