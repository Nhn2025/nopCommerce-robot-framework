*** Settings ***
Library     SeleniumLibrary
Variables   ../WebElements.py

*** Variables ***

*** Keywords ***
Input Search Text and Click Search
    [Arguments]     ${search_text}
    Input text  ${HomePageLocators.SEARCH_TEXT_BOX}  ${search_text}
    Press keys  ${HomePageLocators.SEARCH_BUTTON}   [RETURN]

Click on Advanced Search Link
    Click element   ${HomePageLocators.ADVANCED_SEARCH_LINK}