*** Settings ***
Library     SeleniumLibrary
Variables   ../PageUIs/CommonPageUI.py
Variables   ../PageUIs/SearchPageUI.py
Variables   ../PageUIs/WishlistPageUI.py
Resource  HeaderPageObject.robot
Resource  ../Commons/CommonPageObject.robot
Resource  LoginPageObject.robot

*** Variables ***

*** Keywords ***
Verify that the product is displayed
    [Arguments]    ${PRODUCT_1}
    Wait Until Page Contains    ${PRODUCT_1}    5s
    Page Should Contain    ${PRODUCT_1}

Click remove button
    Click Element   ${REMOVE_BUTTON}

Click add to cart button
    Click Element   ${ADD_TO_CART_CHECK_BOX}
    Click Element   ${ADD_TO_CART_BUTTON}

Verify that the product is not displayed
    [Arguments]    ${PRODUCT_1}
    Wait Until Page Does Not Contain Element     ${PRODUCT_1}    5s
    Page Should Not Contain Element    ${PRODUCT_1}

Verify that the wishlist is empty
    [Arguments]    ${MESSAGE}
    Wait Until Page Contains    ${MESSAGE}    5s
    Page Should Contain    ${MESSAGE}