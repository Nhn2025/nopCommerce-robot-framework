*** Settings ***
Library     SeleniumLibrary
Variables   ../PageUIs/HomePageUI.py
Variables   ../PageUIs/CommonPageUI.py

*** Variables ***

*** Keywords ***
Verify login page redirects to home page
    [Arguments]  ${MY_ACCOUNT_TEXT}
    Page Should Contain   ${MY_ACCOUNT_TEXT}