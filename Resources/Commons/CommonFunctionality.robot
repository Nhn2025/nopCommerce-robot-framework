*** Settings ***
Library     SeleniumLibrary

*** Variables ***
#${url}  http://demo.nopcommerce/
${url}  https://demo.nopcommerce.com/
${browser}  chrome

*** Keywords ***
Start TestCase
    Open Browser  ${url}  ${browser}
    Maximize Browser Window

Finish TestCase
    Close Browser