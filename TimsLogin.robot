*** Settings ***
Documentation    Suite description
Library  Selenium2Library

*** Test Cases ***
Valid Login
    [Tags]    login
    Open Browser    http://192.168.7.2  Chrome
    Wait Until Element Is Visible   css:*[value="Login"]
    Input Text  username    admin
    Input Text  password    admin
    Click Button    css:*[value="Login"]

Password Reminder
    Click Button  css:*[value="Remind me later"]

*** Keywords ***
Provided precondition
    Setup system under test
