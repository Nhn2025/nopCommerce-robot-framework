*** Settings ***
Library     SeleniumLibrary
Variables   ../PageUIs/CommonPageUI.py
Variables   ../PageUIs/SearchPageUI.py
Resource  HeaderPageObject.robot
Resource  ../Commons/CommonPageObject.robot
Resource  LoginPageObject.robot

*** Variables ***

*** Keywords ***
Start test cases
    [Arguments]     ${EMAIL_LOGIN}      ${PASSWORD_LOGIN}
    CommonPageObject.Start TestCase
    LoginPageObject.Login with email and password   ${EMAIL_LOGIN}      ${PASSWORD_LOGIN}
    HeaderPageObject.Click search link

Click search button
    Click Element   ${SEARCH_BUTTON_LOCATOR}

Verify error message
    [Arguments]     ${SEARCH_MESSAGE}
    Scroll Element Into View    ${NO_RESULT_MESSAGE_LOCATOR}
    Page Should Contain     ${SEARCH_MESSAGE}

Enter keyword in search field
    [Arguments]     ${INVALID_KEYWORD}
    Input text      ${SEARCH_TEXTBOX_LOCATOR}    ${INVALID_KEYWORD}

Verify that the product is displayed
    [Arguments]     ${PRODUCT_1}     ${PRODUCT_2}
    Scroll Element Into View    ${PRODUCT_TITLE_LOCATOR}
    Page Should Contain     ${PRODUCT_1}        ${PRODUCT_2}


