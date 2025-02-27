*** Settings ***
Library     SeleniumLibrary

*** Keywords ***
Start TestCase eBay
    Open Browser    https://www.ebay.com/   chrome
    Maximize Browser Window

Finish TestCase
    Close Browser

Start TestCase Google
    Open Browser    http://www.google.com   chrome

Start TestCase OrangeHRM
    Open Browser    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login   chrome

Finish TestCase OrangeHRM
    Wait Until Page Contains    Dashboard    timeout=10s
    Close Browser