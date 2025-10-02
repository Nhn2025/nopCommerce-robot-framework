*** Settings ***
Library     SeleniumLibrary
Variables   ../PageUIs/CommonPageUI.py
Variables   ../PageUIs/SearchPageUI.py
Variables   ../PageUIs/RecentlyProductPageUI.py

*** Variables ***

*** Keywords ***
Verify recently viewed product is displayed
    [Arguments]    ${expected_first}

    @{els}=    Get WebElements    ${PRODUCT_LIST}

    @{titles}=    Create List
    FOR    ${el}    IN    @{els}
        ${t}=    Get Text    ${el}
        Append To List    ${titles}    ${t}
    END

    ${first}=    Get From List    ${titles}    0
    Should Be Equal As Strings    ${first}    ${expected_first}