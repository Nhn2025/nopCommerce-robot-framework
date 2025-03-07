*** Settings ***
Library     SeleniumLibrary
Variables   ../PageUIs/NewCustomerPageUI.py

*** Variables ***

*** Keywords ***
Input information for new customer
    [Arguments]     ${name}     ${birthday}     ${address}      ${city}     ${state}    ${pin}      ${mobile}   ${email}
    Input text  ${CUSTOMER_NAME_TEXTBOX}    ${name}
    Input text  ${DATE_OF_BIRTHDAY_TEXTBOX}    ${birthday}
    Input text  ${ADDRESS_TEXTBOX}    ${address}
    Input text  ${CITY_TEXTBOX}    ${city}
    Input text  ${STATE_TEXTBOX}    ${state}
    Input text  ${PIN_TEXTBOX}    ${pin}
    Input text  ${MOBILE_TEXTBOX}    ${mobile}
    Input text  ${EMAIL_TEXTBOX}    ${email}
    Click Element  ${SUBMIT_BUTTON}