*** Settings ***
Documentation     A test suite with a single test for valid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot
Library  Selenium2Library
Library  OperatingSystem

*** Test Cases ***
Valid Login
    Open Browser To Login Page
    Input Username    admin
    Input Password    admin
    Submit Credentials
    Welcome Page Should Be Open
    [Teardown]    Close Browser

