*** Settings ***
Library     SeleniumLibrary
Variables   ../PageUIs/CommonPageUI.py
Variables   ../PageUIs/CompareListPageUI.py

*** Variables ***

*** Keywords ***
Verify that the product is displayed
    [Arguments]    ${PRODUCT_1}
    Wait Until Page Contains    ${PRODUCT_1}    5s
    Page Should Contain    ${PRODUCT_1}

Click clear list button
    Click Element   ${CLEAR_BUTTON}

Verify that the empty compare list message is displayed
    [Arguments]    ${MESSAGE}
    Wait Until Page Contains    ${MESSAGE}    5s
    Page Should Contain    ${MESSAGE}