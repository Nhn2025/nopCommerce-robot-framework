*** Settings ***
Library     SeleniumLibrary
Variables   ../PageUIs/HeaderPageUI.py

*** Variables ***

*** Keywords ***
Click to register link
    Click Element   ${REGISTER_LINK}