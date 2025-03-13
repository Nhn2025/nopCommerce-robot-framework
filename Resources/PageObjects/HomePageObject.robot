*** Settings ***
Library     SeleniumLibrary
Variables   ../PageUIs/HomePageUI.py
Variables   ../PageUIs/CommonPageUI.py

*** Variables ***

*** Keywords ***
Verify login page redirects to home page
    [Arguments]  ${LOG_OUT_TEXT}
    Page Should Contain   ${LOG_OUT_TEXT}