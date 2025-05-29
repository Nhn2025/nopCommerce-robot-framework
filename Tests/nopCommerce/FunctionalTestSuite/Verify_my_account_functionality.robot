*** Settings ***
Documentation   Login Functionality of NopCommerce
Resource  ../../../Resources/Commons/CommonPageObject.robot
Resource  ../../../Resources/PageObjects/HeaderPageObject.robot
Resource  ../../../Resources/PageObjects/LoginPageObject.robot
Resource  ../../../Resources/PageObjects/RegisterPageObject.robot
Resource  ../../../Resources/PageObjects/HomePageObject.robot
Resource  ../../../Resources/PageObjects/MyAcountSideBarPageObject.robot
Resource  ../../../Resources/PageObjects/CustomerInfoPageObject.robot
Resource  ../../../Resources/PageObjects/AddressesPageObject.robot
Resource  ../../../Resources/PageObjects/ChangePasswordPageObject.robot
Resource  ../../../Resources/Data/LoginData.robot
Resource  ../../../Resources/Data/MyAccountData.robot
Resource  ../../../Resources/Data/CommonData.robot

Test Teardown   CommonPageObject.Finish TestCase

*** Variables ***

*** Test Cases ***
Verify that user can update their information
    [Documentation]     This test case verifies that update infomation of customer
    [Tags]  Functional

    RegisterPageObject.Register     ${FIRST_NAME}   ${LAST_NAME}    ${PASSWORD}     ${CONFIRM_PASSWORD}     ${SUCCESS_REGISTER_TEXT}

    ${VALID_EMAIL}    CommonPageObject.Generate random email

    HeaderPageObject.Click my account link
    MyAcountSideBarPageObject.Click customer info link
    CustomerInfoPageObject.Input customer information   ${FIRST_NAME_UPDATE}   ${LAST_NAME_UPDATE}    ${VALID_EMAIL}    ${COMPANY_UPDATE}
    CustomerInfoPageObject.Click save button
    CustomerInfoPageObject.Verify updated information is successfully saved     ${GENDER_UPDATE}   ${FIRST_NAME_UPDATE}   ${LAST_NAME_UPDATE}    ${VALID_EMAIL}    ${COMPANY_UPDATE}

Verify that user can add a new address
    [Documentation]     This test case verifies that a customer address is added successfully
    [Tags]  Functional

    RegisterPageObject.Register     ${FIRST_NAME}   ${LAST_NAME}    ${PASSWORD}     ${CONFIRM_PASSWORD}     ${SUCCESS_REGISTER_TEXT}

    ${VALID_EMAIL}    CommonPageObject.Generate random email

    HeaderPageObject.Click my account link
    MyAcountSideBarPageObject.Click address link
    AddressesPageObject.Click add new button
    AddressesPageObject.Input address information   ${FIRST_NAME_ADDRESS}   ${LAST_NAME_ADDRESS}    ${VALID_EMAIL}
    ...     ${COMPANY_ADDRESS}  ${COUNTRY_ADDRESS}      ${PROVINCE_ADDRESS}
    ...     ${CITY_ADDRESS}   ${ADDRESS_1}     ${ADDRESS_2}     ${ZIP_ADDRESS}     ${PHONE_ADDRESS}     ${FAX_NAME_ADDRESS}
    AddressesPageObject.Click save button
    AddressesPageObject.Verify updated address information is successfully saved    ${FIRST_NAME_ADDRESS}   ${LAST_NAME_ADDRESS}    ${VALID_EMAIL}
    ...     ${COMPANY_ADDRESS}  ${COUNTRY_ADDRESS}      ${PROVINCE_ADDRESS}
    ...     ${CITY_ADDRESS}   ${ADDRESS_1}     ${ADDRESS_2}     ${ZIP_ADDRESS}     ${PHONE_ADDRESS}     ${FAX_NAME_ADDRESS}

Verify that user can change password
    [Documentation]     This test case verifies that password is changed successfully
    [Tags]  Functional

    ${EMAIL_LOGIN}     RegisterPageObject.Register     ${FIRST_NAME}   ${LAST_NAME}    ${PASSWORD}     ${CONFIRM_PASSWORD}     ${SUCCESS_REGISTER_TEXT}

    HeaderPageObject.Click my account link
    MyAcountSideBarPageObject.Click change password link
    ChangePasswordPageObject.Input password infomation   ${PASSWORD}    ${NEW_PASSWORD}     ${NEW_PASSWORD}
    ChangePasswordPageObject.Click change password button
    ChangePasswordPageObject.Click close button
    HeaderPageObject.Click log out link

    LoginPageObject.Verify successful login with valid data      ${EMAIL_LOGIN}      ${NEW_PASSWORD}     ${LOG_OUT_TEXT}
    HeaderPageObject.Click log out link
    LoginPageObject.Verify login fail with wrong password       ${EMAIL_LOGIN}      ${PASSWORD}   ${INVALID_LOGIN_TEXT_1}
    ...     ${INVALID_LOGIN_TEXT_2}