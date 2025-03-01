*** Settings ***
Library     SeleniumLibrary
Resource  ../CommonFunctionality.robot

*** Variables ***

*** Keywords ***
Input Search Text and Click Search
    ${selected_text}  CommonFunctionality.Get Selected Search Text     1
    Input text  xpath://input[@id='gh-ac']    ${selected_text}
    Press keys  //button[@id='gh-search-btn']   [RETURN]

Click on Advanced Search Link
    Click element   //*[@id='gh-as-a']