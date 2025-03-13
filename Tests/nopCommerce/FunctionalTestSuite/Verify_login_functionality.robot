*** Settings ***
Documentation   Login Functionality of NopCommerce
Resource  ../../../Resources/Commons/CommonPageObject.robot
Resource  ../../../Resources/PageObjects/HeaderPageObject.robot
Resource  ../../../Resources/PageObjects/LoginPageObject.robot
Resource  ../../../Resources/PageObjects/HomePageObject.robot
Resource  ../../../Resources/Data/LoginData.robot
Resource  ../../../Resources/Data/CommonData.robot

Test Setup  CommonPageObject.Start TestCase
Test Teardown   CommonPageObject.Finish TestCase

*** Variables ***

*** Test Cases ***
Verify Login with Empty Data
    [Documentation]     This test case verifies that the login fails when using empty data
    [Tags]  Functional
    HeaderPageObject.Click login link
    LoginPageObject.Click login button
    LoginPageObject.Verify error message     ${EMAIL_LOGIN_REQUIRED_TEXT}

Verify Login with Invalid Email
    [Documentation]    This test case verifies that the login fails when using an invalid email
    [Tags]  Functional
    HeaderPageObject.Click login link
    LoginPageObject.Input email and password    ${INVALID_EMAIL}       ${EMPTY}
    LoginPageObject.Click login button
    LoginPageObject.Verify error message      ${EMAIL_INVALID_TEXT}

Vefify Login with an already registered email and an invalid password
    [Documentation]     This test case verifies that login fails when using an already registered email and an invalid password
    [Tags]  Functional
    HeaderPageObject.Click login link
    LoginPageObject.Input email and password    ${EMAIL_LOGIN}      ${INVALID_PASSWORD_LOGIN}
    LoginPageObject.Click login button
    LoginPageObject.Verify multiple error messages    ${INVALID_LOGIN_TEXT_1}    ${INVALID_LOGIN_TEXT_2}

Verify Login with ungistered email
    [Documentation]     This test case verifies that login fails when using an unregistered email
    [Tags]  Functional

    ${VALID_EMAIL}    CommonPageObject.Generate random email

    HeaderPageObject.Click login link
    LoginPageObject.Input email and password    ${VALID_EMAIL}     ${EMPTY}
    LoginPageObject.Click login button
    LoginPageObject.Verify multiple error messages   ${INVALID_LOGIN_TEXT_1}   ${UNREGISTER_EMAIL_TEXT}

Vefify Login with an already registered email and empty password
    [Documentation]     This test case verifies that login fails when using an already registered email and empty password
    [Tags]  Functional
    HeaderPageObject.Click login link
    LoginPageObject.Input email and password    ${EMAIL_LOGIN}      ${EMPTY}
    LoginPageObject.Click login button
    LoginPageObject.Verify multiple error messages    ${INVALID_LOGIN_TEXT_1}    ${INVALID_LOGIN_TEXT_2}

Vefify Login with a valid email and password
    [Documentation]     This test case verifies that login is successful when using a valid email and password
    [Tags]  Functional
    HeaderPageObject.Click login link
    LoginPageObject.Input email and password    ${EMAIL_LOGIN}      ${VALID_PASSWORD_LOGIN}
    LoginPageObject.Click login button
    HomePageObject.Verify login page redirects to home page     ${LOG_OUT_TEXT}