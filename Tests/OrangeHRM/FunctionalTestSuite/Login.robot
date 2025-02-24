*** Settings ***
Documentation   Login Functionality
Library         SeleniumLibrary

*** Variables ***

*** Test Cases ***
Verify login functionality of OrangeHRM
    [Documentation]  This test case verifies the login
    [Tags]  Functional

    Open Browser    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login   chrome
    Wait Until Element Is Visible    //input[@name='username']    timeout=10s
    Input text  //input[@name='username']    Admin
    Input text  //input[@name='password']    admin123   # Fixed the selector for password field
    Press keys  //button[contains(@class, 'orangehrm-login-button')]   [RETURN]
    Wait Until Page Contains    Dashboard    timeout=10s
    Close Browser

*** Keywords ***
