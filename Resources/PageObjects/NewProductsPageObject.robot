*** Settings ***
Library     SeleniumLibrary
Variables   ../PageUIs/CommonPageUI.py
Variables   ../PageUIs/NewProductsPageUI.py

*** Variables ***

*** Keywords ***
Select a product
    Scroll Element Into View     ${PRODUCT_NAME_LINK}
    Wait Until Element Is Visible    ${PRODUCT_NAME_LINK}    5s
    Click Element   ${PRODUCT_NAME_LINK}