*** Settings ***
Documentation   Wishlist/ Compare/ Recent View Functionality of NopCommerce
Resource  ../../../Resources/Commons/CommonPageObject.robot
Resource  ../../../Resources/Data/CommonData.robot
Resource  ../../../Resources/Data/LoginData.robot
Resource  ../../../Resources/Data/ProductsData.robot
Resource  ../../../Resources/PageObjects/NewProductsPageObject.robot
Resource  ../../../Resources/PageObjects/ProductsDetailPageObject.robot
Resource  ../../../Resources/PageObjects/HeaderPageObject.robot
Resource  ../../../Resources/PageObjects/LoginPageObject.robot
Resource  ../../../Resources/PageObjects/WishlistPageObject.robot
Resource  ../../../Resources/PageObjects/ShoppingCartPageObject.robot
Resource  ../../../Resources/PageObjects/CompareListPageObject.robot
Resource  ../../../Resources/PageObjects/RecentlyProductPageObject.robot

Test Setup  CommonPageObject.Start TestCase
Test Teardown   CommonPageObject.Finish TestCase

*** Variables ***

*** Test Cases ***
Verify that user can add a product to wishlist successfully
    [Documentation]     This test case verifies that user can add a product to wishlist successfully
    [Tags]  Functional

    LoginPageObject.Login with email and password    ${EMAIL_LOGIN}      ${VALID_PASSWORD_LOGIN}

    HeaderPageObject.Click new products link
    NewProductsPageObject.Select a product
    ProductsDetailPageObject.Click add to wishlist button
    ProductsDetailPageObject.Verify add to wishlist message is displayed     ${ADD_WISHLIST_SUCCESS_TEXT}
    HeaderPageObject.Click wishlist link
    WishlistPageObject.Verify that the product is displayed     ${WISHLIST_PRODUCT_NAME}
    WishlistPageObject.Click remove button

Verify that user can add a product to cart from wishlist page
    [Documentation]     This test case verifies that user can add a product to cart from wishlist page
    [Tags]  Functional

    LoginPageObject.Login with email and password    ${EMAIL_LOGIN}      ${VALID_PASSWORD_LOGIN}

    HeaderPageObject.Click new products link
    NewProductsPageObject.Select a product
    ProductsDetailPageObject.Click add to wishlist button
    ProductsDetailPageObject.Verify add to wishlist message is displayed     ${ADD_WISHLIST_SUCCESS_TEXT}
    HeaderPageObject.Click wishlist link
    WishlistPageObject.Click add to cart button
    ShoppingCartPageObject.Verify that the product is displayed     ${WISHLIST_PRODUCT_NAME}
    HeaderPageObject.Click wishlist link
    WishlistPageObject.Verify that the product is not displayed     ${WISHLIST_PRODUCT_NAME}

Verify that user can remove a product in wishlist page successfully
    [Documentation]     This test case verifies that user can remove a product in wishlist page successfully
    [Tags]  Functional

    LoginPageObject.Login with email and password    ${EMAIL_LOGIN}      ${VALID_PASSWORD_LOGIN}

    HeaderPageObject.Click new products link
    NewProductsPageObject.Select a product
    ProductsDetailPageObject.Click add to wishlist button
    ProductsDetailPageObject.Verify add to wishlist message is displayed     ${ADD_WISHLIST_SUCCESS_TEXT}
    HeaderPageObject.Click wishlist link
    WishlistPageObject.Verify that the product is displayed     ${WISHLIST_PRODUCT_NAME}
    WishlistPageObject.Click remove button
    WishlistPageObject.Verify that the wishlist is empty    ${EMPTY_WISHLIST_MESSAGE}

Verify that user can add product to compare successfully
    [Documentation]     This test case verifies that user can add product to compare successfully
    [Tags]  Functional

    LoginPageObject.Login with email and password    ${EMAIL_LOGIN}      ${VALID_PASSWORD_LOGIN}

    HeaderPageObject.Click new products link
    NewProductsPageObject.Select a product
    ProductsDetailPageObject.Click add to compare list button
    ProductsDetailPageObject.Verify add to compare message is displayed     ${ADD_COMPARE_SUCCESS_TEXT}
    ProductsDetailPageObject.Click compare list link
    CompareListPageObject.Verify that the product is displayed     ${WISHLIST_PRODUCT_NAME}
    CompareListPageObject.Click clear list button
    CompareListPageObject.Verify that the empty compare list message is displayed   ${EMPTY_COMPARE_MESSAGE}

Verify that the recently viewed product is displayed correctly
    [Documentation]     This test case verifies that recently viewed product is displayed correctly
    [Tags]  Functional

    LoginPageObject.Login with email and password    ${EMAIL_LOGIN}      ${VALID_PASSWORD_LOGIN}

    HeaderPageObject.Click new products link
    NewProductsPageObject.Select a product
    HeaderPageObject.Click recently viewed product link
    RecentlyProductPageObject.Verify recently viewed product is displayed       ${WISHLIST_PRODUCT_NAME}