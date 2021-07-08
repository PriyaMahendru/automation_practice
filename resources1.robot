*** Settings ***
Library    SeleniumLibrary
Library    ../ExternalKeywords/UserKeywords.py


*** Variables ***

*** Keywords ***
Start Browser and Maximize
    [Documentation]    Test file
    open browser    http://www.thetestingworld.com/testings    chrome
    MAXIMIZE BROWSER WINDOW

Close Broswer window
    ${Title}=    get title
    log    ${Title}
    Close Broswer window

Before Each Test Suite
    LOG    Before Each Test Suite

After Each Test Suite
    Log     After Each Test Suite

Create folder at runtime
    [Arguments]    ${foldername}
    create_folder    ${foldername}

Concatenate Username and Password
    [Arguments]    ${username}    ${password}
    ${resultval}=    concatenate two values    ${username}    ${password}
    log    ${resultval}
