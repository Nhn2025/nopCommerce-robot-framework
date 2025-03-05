*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${url}  https://www.ebay.com/
${browser}  chrome

*** Keywords ***
Start TestCase
    Open Browser  ${url}  ${browser}  options=add_argument("--headless"), add_argument("--no-sandbox"), add_argument("--disable-dev-shm-usage"), add_argument("--user-data-dir=/tmp/chrome-profile")

    Maximize Browser Window
    Sleep   4s

Finish TestCase
    Close Browser