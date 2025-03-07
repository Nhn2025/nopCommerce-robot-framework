*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${url}  http://demo.nopcommerce
${browser}  chrome

*** Keywords ***
Start TestCase
    Open Browser  ${url}  ${browser}
    Maximize Browser Window

Finish TestCase
    Close Browser