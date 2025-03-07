*** Settings ***
Library     SeleniumLibrary
Variables   ../PageUIs/SideBarPageUI.py

*** Variables ***

*** Keywords ***
Click new customer link
     Click Element  ${NEW_CUSTOMER_LINK}