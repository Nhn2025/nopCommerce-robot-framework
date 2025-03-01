*** Settings ***
Library     SeleniumLibrary

*** Variables ***
#${search_text}      mobile
#@{search_texts}     books   travel  gifts   robot
&{search_texts}     abc=books   def=travel
${env}  demo
&{url}  demo=https://www.ebay.com/  uat=https://www.note.com/

*** Keywords ***
Start TestCase
    Open Browser    ${url.${env}}    chrome
    Maximize Browser Window

Finish TestCase
    Close Browser