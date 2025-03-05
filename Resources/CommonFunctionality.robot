*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${url}  https://www.ebay.com/
${browser}  chrome

*** Keywords ***
Start TestCase
    Open Browser    ${url}  ${browser}
    ...    options=add_argument("--headless")
    ...    options=add_argument("--no-sandbox")
    ...    options=add_argument("--disable-dev-shm-usage")
    ...    options=add_argument("--user-data-dir=/tmp/chrome-profile")

    Maximize Browser Window
    Sleep   4s

Finish TestCase
    Close Browser