*** Settings ***
Documentation   Payment Functionality
Resource  ../../../Resources/CommonFunctionality.robot
Resource  ../../../Resources/PageObjects/SideBarPageObject.robot
Resource  ../../../Resources/PageObjects/LoginPageObject.robot
Resource  ../../../Resources/PageObjects/NewCustomerPageObject.robot
Resource  ../../../Resources/Data/Login/LoginData.robot
Resource  ../../../Resources/Data/Customer/CustomerData.robot

Test Setup  CommonFunctionality.Start TestCase
Test Teardown   CommonFunctionality.Finish TestCase

*** Variables ***

*** Test Cases ***
Verify basic create new customer functionality of Guru99
    [Documentation]  This test case verifies the creation of a new customer account and ensures that it is successfully created
    [Tags]  Functional

    LoginPageObject.Input username, password and click login button     ${ACCOUNT_USERNAME}   ${ACCOUNT_PASSWORD}
    SideBarPageObject.Click new customer link
    NewCustomerPageObject.Input information for new customer    ${CUSTOMER_NAME}   ${DATE_OF_BIRTHDAY}    ${ADDRESS}  ${CITY}    ${STATE}    ${PIN}  ${MOBILE}  ${EMAIL}

