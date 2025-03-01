*** Settings ***
Library     SeleniumLibrary
Resource  ../CommonFunctionality.robot

*** Variables ***

*** Keywords ***
Input Search Text and Click Search
    Input text  xpath://input[@id='gh-ac']     ${search_texts}[1]
    Press keys  //button[@id='gh-search-btn']   [RETURN]

Click on Advanced Search Link
    Click element   //*[@id='gh-as-a']