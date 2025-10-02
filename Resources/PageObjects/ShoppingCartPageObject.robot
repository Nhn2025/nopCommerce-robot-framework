*** Settings ***
Library     SeleniumLibrary
Variables   ../PageUIs/CommonPageUI.py
Variables   ../PageUIs/ShoppingCartPageUI.py

*** Variables ***

*** Keywords ***
Verify that the product is displayed
    [Arguments]    ${PRODUCT_1}
    Wait Until Page Contains    ${PRODUCT_1}    10s
    Page Should Contain    ${PRODUCT_1}
    Click Element   ${REMOVE_BUTTON}
