*** Settings ***
Library     SeleniumLibrary

*** Variables ***
@{search_texts}     books   travel  gifts   robot

*** Keywords ***
Start TestCase
    Open Browser    https://www.ebay.com/   chrome
    Maximize Browser Window

Finish TestCase
    Close Browser

Get Selected Search Text
    [Arguments]    ${index}
    @{search_list}    Create List    @{search_texts}
    ${selected_text}  Set Variable    ${search_list}[${index}]
    RETURN    ${selected_text}