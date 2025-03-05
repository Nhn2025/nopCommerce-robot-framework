*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${url}  https://www.ebay.com/
${browser}  chrome

*** Keywords ***
Start TestCase
    ${options}    Evaluate    ['--headless', '--no-sandbox', '--disable-dev-shm-usage', '--user-data-dir=/tmp/chrome-profile']
    Open Browser  ${url}  ${browser}  options=${options}

    Maximize Browser Window
    Sleep   4s

Finish TestCase
    Close Browser