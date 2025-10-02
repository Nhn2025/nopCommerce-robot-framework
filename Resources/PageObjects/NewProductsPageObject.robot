*** Settings ***
Library    SeleniumLibrary
Library    Collections
Variables   ../PageUIs/CommonPageUI.py
Variables   ../PageUIs/NewProductsPageUI.py

*** Variables ***

*** Keywords ***
Select a product
    ${cands}=    Get WebElements     ${PRODUCT_NAME_LINK}
    ${found}=    Set Variable    ${None}
    FOR    ${el}    IN    @{cands}
        ${vis}=    Run Keyword And Return Status    Element Should Be Visible    ${el}
        IF    ${vis}
            ${found}=    Set Variable    ${el}
            Exit For Loop
        END
    END
    Run Keyword If    '${found}'=='${None}'    Fail    Not found: ${PRODUCT_NAME}

    Scroll Element Into View    ${found}
    Sleep    200ms
    ${ok}=    Run Keyword And Return Status    Click Element    ${found}
    IF    not ${ok}
        # Fallback 1: JS click
        Execute Javascript    arguments[0].click();    ${found}
    END

Select sort by name A to Z
    [Arguments]      ${SORT_OPTION}
    Select From List By Label    ${SORT_DROPDOWN}   ${SORT_OPTION}

Verify product list is sorted in ascending order (A–Z)
    ${ELEMENTS}=    Get WebElements    ${PRODUCT_TITLE}
    @{TITLES}=      Create List  Evaluate    [el.text for el in $ELEMENTS]
    ${EXPECTED}=  Copy List    ${TITLES}
    Sort List     ${EXPECTED}
    Lists Should Be Equal    ${TITLES}    ${EXPECTED}
