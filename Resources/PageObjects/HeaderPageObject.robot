*** Settings ***
Library     SeleniumLibrary
Variables   ../PageUIs/HeaderPageUI.py

*** Variables ***

*** Keywords ***
Click register link
    Click Element   ${REGISTER_LINK}

Click login link
    Click Element   ${LOGIN_LINK}

Click my account link
    Click Element   ${MY_ACCOUNT_LINK}

Click log out link
    Scroll Element Into View         ${LOG_OUT_LINK}
    Click Element   ${LOG_OUT_LINK}

Click new products link
    Mouse Over      ${NEW_PRODUCTS_LINK}
    Click Element   ${PRODUCT_LINK}

Click search link
    Wait Until Element Is Visible   ${SEARCH_LINK}    timeout=10s
    Scroll Element Into View        ${SEARCH_LINK}
    Click Element                   ${SEARCH_LINK}

Enter keyword in search field
    [Arguments]     ${INVALID_KEYWORD}
    Input text      ${SEARCH_TEXTBOX_LOCATOR}    ${INVALID_KEYWORD}