*** Settings ***
Library     SeleniumLibrary

*** Keywords ***
Verify Login Results
    Wait Until Element Is Visible    //input[@name='username']    timeout=10s
    Input text  //input[@name='username']    Admin
    Input text  //input[@name='password']    admin123   # Fixed the selector for password field
    Press keys  //button[contains(@class, 'orangehrm-login-button')]   [RETURN]