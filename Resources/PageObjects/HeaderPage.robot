*** Settings ***
Library     SeleniumLibrary

*** Variables ***

*** Keywords ***
Input Search Text and Click Search
    Input text  xpath://input[@id='gh-ac']    mobile
    Press keys  //button[@id='gh-search-btn']   [RETURN]

Click on Advanced Search Link
    Click element   //*[@id='gh-as-a']