*** Settings ***
Documentation   Search/ Search Advanced Functionality of NopCommerce
Resource  ../../../Resources/Commons/CommonPageObject.robot
Resource  ../../../Resources/Data/CommonData.robot
Resource  ../../../Resources/Data/LoginData.robot
Resource  ../../../Resources/Data/ProductsData.robot
Resource  ../../../Resources/PageObjects/SearchPageObject.robot

Test Setup  CommonPageObject.Log in with an existing account   ${EMAIL_LOGIN}      ${VALID_PASSWORD_LOGIN}
Test Teardown   CommonPageObject.Finish TestCase

*** Variables ***

*** Test Cases ***
Verify that user can not search with empty data
    [Documentation]    This test case verifies that user can not search with empty data
    [Tags]    Functional
    HeaderPageObject.Click search link
    Search Page Object.Verify error empty message   ${EMPTY_KEYWORD_MESSAGE}

Verify that user can not search with invalid data
    [Documentation]     This test case verifies that user can not search with invalid data
    [Tags]  Functional
    HeaderPageObject.Enter keyword in search field   ${INVALID_KEYWORD}
    HeaderPageObject.Click search link
    SearchPageObject.Verify error invalid message       ${NOT_FOUND_KEYWORD_MESSAGE}

Verify that the user can search using partial keyword
    [Documentation]     This test case verifies that user can search using partial keyword
    [Tags]  Functional
    HeaderPageObject.Enter keyword in search field   ${PARTIAL_KEYWORD}
    HeaderPageObject.Click search link
    SearchPageObject.Verify that the product is displayed       ${PARTIAL_PRODUCT_1}      ${PARTIAL_PRODUCT_2}

Verify that the user can search using exact keywords
    [Documentation]     This test case verifies that user can search using exact keywords
    [Tags]  Functional
    HeaderPageObject.Enter keyword in search field   ${EXACT_KEYWORD}
    HeaderPageObject.Click search link
    SearchPageObject.Verify that the product is displayed       ${EXACT_KEYWORD}        ${EMPTY}

Verify that user can not search with parent categories
    [Documentation]     This test case verifies that user can not search with parent categories
    [Tags]  Functional
    HeaderPageObject.Enter keyword in search field   ${EXACT_KEYWORD}
    HeaderPageObject.Click search link
    SearchPageObject.Click advanced search checkbox
    SearchPageObject.Select parent category     ${PARENT_CATEGORY}
    SearchPageObject.Click search button
    SearchPageObject.Verify error invalid message       ${NOT_FOUND_KEYWORD_MESSAGE}

Verify that user can search with sub categories
    [Documentation]     This test case verifies that user can search with sub categories
    [Tags]  Functional
    HeaderPageObject.Enter keyword in search field   ${EXACT_KEYWORD}
    HeaderPageObject.Click search link
    SearchPageObject.Click advanced search checkbox
    SearchPageObject.Select parent category    ${PARENT_CATEGORY}
    SearchPageObject.Click search sub categories checkbox
    SearchPageObject.Click search button
    SearchPageObject.Verify that the product is displayed       ${EXACT_KEYWORD}        ${EMPTY}

Verify that user can search with correct manufacturer
    [Documentation]     This test case verifies that user can search with correct manufacturer
    [Tags]  Functional
    HeaderPageObject.Enter keyword in search field   ${EXACT_KEYWORD}
    HeaderPageObject.Click search link
    SearchPageObject.Click advanced search checkbox
    SearchPageObject.Select parent category     ${PARENT_CATEGORY}
    SearchPageObject.Click search sub categories checkbox
    SearchPageObject.Select search manufacturer     ${MANUFACTURER_NAME}
    SearchPageObject.Click search button
    SearchPageObject.Verify that the product is displayed       ${EXACT_KEYWORD}        ${EMPTY}

Verify that user can not search with incorrect manufacturer
    [Documentation]     This test case verifies that user can not search with incorrect manufacturer
    [Tags]  Functional
    HeaderPageObject.Enter keyword in search field   ${EXACT_KEYWORD}
    HeaderPageObject.Click search link
    SearchPageObject.Click advanced search checkbox
    SearchPageObject.Select parent category     ${PARENT_CATEGORY}
    SearchPageObject.Click search sub categories checkbox
    SearchPageObject.Select search manufacturer     ${INVALID_MANUFACTURER_NAME}
    SearchPageObject.Click search button
    SearchPageObject.Verify error invalid message       ${NOT_FOUND_KEYWORD_MESSAGE}