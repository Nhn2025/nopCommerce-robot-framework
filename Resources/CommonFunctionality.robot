*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${url}  https://www.ebay.com/
${browser}  chrome

*** Keywords ***
Start TestCase
    Open Browser  ${url}  ${browser}

    Maximize Browser Window
    Sleep   4s

Finish TestCase
    Close Browser

Load Cookies
    [Arguments]  ${cookie_file}
    ${cookies}    Get File   ${cookie_file}
    ${cookies}    Convert String To JSON    ${cookies}
    FOR    ${cookie}    IN    @{cookies}
        Add Cookie    ${cookie}
    END
    Refresh Page