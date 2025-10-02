*** Settings ***
Library     SeleniumLibrary
Variables   ../PageUIs/CommonPageUI.py
Variables   ../PageUIs/ProductsDetailPageUI.py

*** Variables ***

*** Keywords ***
Add a review
    [Arguments]      ${REVIEW_TITLE}    ${REVIEW_TEXT}

    Scroll Element Into View    ${REVIEW_TITLE_TEXTBOX_LOCATOR}

     ${LIST_DATA}=   Create Dictionary
    ...     ${REVIEW_TITLE_TEXTBOX_LOCATOR}=${REVIEW_TITLE}
    ...     ${REVIEW_TEXT_TEXTBOX_LOCATOR}=${REVIEW_TEXT}

    FOR     ${TEXTBOX_FIELD}    ${VALUE}    IN  &{LIST_DATA}
        Input text  ${TEXTBOX_FIELD}  ${VALUE}
    END

    Click Element  ${RATING_RADIO_CHECKBOX_LOCATOR}

Click submit review button
    Click Element  ${SUBMIT_REVIEW_BUTTON_LOCATOR}

Verify a review is added
    [Arguments]      ${ADD_REVIEW_SUCCESS_TEXT}     ${REVIEW_TITLE}    ${REVIEW_TEXT}
    Wait Until Page Contains    ${ADD_REVIEW_SUCCESS_TEXT}     timeout=10s
    Page Should Contain         ${REVIEW_TITLE}
    Page Should Contain         ${REVIEW_TEXT}

Click add to wishlist button
    Scroll Element Into View    ${ADD_TO_WISHLIST_BUTTON}
    Click Element   ${ADD_TO_WISHLIST_BUTTON}

Verify add to wishlist message is displayed
    [Arguments]      ${ADD_WISHLIST_SUCCESS_TEXT}
    Wait Until Page Contains    ${ADD_WISHLIST_SUCCESS_TEXT}     timeout=10s
    Click Element   ${CLOSE_BUTTON}

Click add to compare list button
    Scroll Element Into View    ${ADD_TO_COMPARE_BUTTON}
    Click Element   ${ADD_TO_COMPARE_BUTTON}

Verify add to compare message is displayed
    [Arguments]      ${ADD_COMPARE_SUCCESS_TEXT}
    Wait Until Page Contains    ${ADD_COMPARE_SUCCESS_TEXT}     timeout=10s

Click compare list link
    Click Element   ${ADD_TO_COMPARE_LINK}