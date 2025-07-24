*** Settings ***
Library     SeleniumLibrary
Variables   ../PageUIs/CommonPageUI.py
Variables   ../PageUIs/SearchPageUI.py
Resource  HeaderPageObject.robot
Resource  ../Commons/CommonPageObject.robot
Resource  LoginPageObject.robot

*** Variables ***

*** Keywords ***
Click search button
    Wait Until Element Is Visible    ${SEARCH_BUTTON_LOCATOR}    10s
    Click Element   ${SEARCH_BUTTON_LOCATOR}

Verify error empty message
    [Arguments]    ${EMPTY_KEYWORD_MESSAGE}
    Alert Should Be Present     ${EMPTY_KEYWORD_MESSAGE}

Verify error invalid message
    [Arguments]     ${SEARCH_MESSAGE}
    Wait Until Element Is Visible    ${NO_RESULT_MESSAGE_LOCATOR}    10s
    Scroll Element Into View    ${NO_RESULT_MESSAGE_LOCATOR}
    Element Should Be Visible    ${NO_RESULT_MESSAGE_LOCATOR}
    Page Should Contain     ${SEARCH_MESSAGE}

Verify that the product is displayed
    [Arguments]    ${PRODUCT_1}    ${PRODUCT_2}
    Wait Until Page Contains    ${PRODUCT_1}    5s
    Page Should Contain    ${PRODUCT_1}

    Run Keyword If    '${PRODUCT_2}' != ''  Page Should Contain    ${PRODUCT_2}

    ${count}=    Get Element Count    ${PRODUCT_ITEM}
    ${expected}=    Set Variable If    '${PRODUCT_2}' != ''    2    1
    Should Be Equal As Integers    ${count}    ${expected}

Click advanced search checkbox
    Click element   ${ADVANCED_SEARCH_CHECKBOX}

Select parent category
    [Arguments]    ${PARENT_CATEGORY}
    Select From List By Label   ${CATEGORY_DROPDOWN}    ${PARENT_CATEGORY}

Click search sub categories checkbox
    Click element   ${SUB_CATEGORY_CHECKBOX}

Select search manufacturer
    [Arguments]    ${MANUFACTURER_NAME}
    Select From List By Label   ${MANUFACTURER_DROPDOWN}    ${MANUFACTURER_NAME}