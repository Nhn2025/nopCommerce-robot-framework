*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${url}  https://demo.guru99.com/V1/
${browser}  chrome

*** Keywords ***
Start TestCase
    Open Browser  ${url}  ${browser}
    Maximize Browser Window

Finish TestCase
    Close Browser