*** Settings ***
Library     SeleniumLibrary

*** Variables ***
#${search_text}      mobile
@{search_texts}     books   travel  gifts   robot

*** Keywords ***
Start TestCase
    Open Browser    https://www.ebay.com/   chrome
    Maximize Browser Window

Finish TestCase
    Close Browser