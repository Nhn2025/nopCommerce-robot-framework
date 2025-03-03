*** Settings ***
Library     SeleniumLibrary
Variables   ../WebElements.py

*** Variables ***

*** Keywords ***
Input Search Text and Click Search
    [Arguments]     ${search_text}
    Input text  ${HomePageSearchTextBox}  ${search_text}
    Press keys  ${HomePageSearchButton}   [RETURN]

Click on Advanced Search Link
    Click element   ${HomePageAdvancedSearchLink}