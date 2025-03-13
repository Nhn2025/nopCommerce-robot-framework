*** Settings ***
Library     SeleniumLibrary
Variables   ../PageUIs/RegisterPageUI.py
Variables   ../PageUIs/MyAccountPageUI.py

*** Variables ***

*** Keywords ***
Click customer info link
    Click Element  ${CUSTOMER_INFO_LINK}

Click address link
    Click Element  ${ADDRESS_LINK}

Click change password link
    Click Element  ${CHANGE_PASSWORD_LINK}