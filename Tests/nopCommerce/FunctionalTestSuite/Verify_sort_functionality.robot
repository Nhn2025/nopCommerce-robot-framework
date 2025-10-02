*** Settings ***
Documentation   Sort Functionality of NopCommerce
Resource  ../../../Resources/Commons/CommonPageObject.robot
Resource  ../../../Resources/Data/CommonData.robot
Resource  ../../../Resources/Data/LoginData.robot
Resource  ../../../Resources/Data/ProductsData.robot
Resource  ../../../Resources/PageObjects/NewProductsPageObject.robot
Resource  ../../../Resources/PageObjects/HeaderPageObject.robot
Resource  ../../../Resources/PageObjects/LoginPageObject.robot

Test Setup  CommonPageObject.Start TestCase
Test Teardown   CommonPageObject.Finish TestCase

*** Variables ***

*** Test Cases ***
Verify that the product list is sorted in ascending order (A–Z)
    [Documentation]     This test case verifies that product list is sorted in ascending order (A–Z)
    [Tags]  Functional

    LoginPageObject.Login with email and password    ${EMAIL_LOGIN}      ${VALID_PASSWORD_LOGIN}

    HeaderPageObject.Click new products link
    NewProductsPageObject.Select sort by name A to Z    ${SORT_OPTION}
    NewProductsPageObject.Verify product list is sorted in ascending order (A–Z)