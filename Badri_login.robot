*** Test Cases ***
Valid login
    [Tags]    login
    [Setup]    initial setup    http://10.1.71.103
#    [Template]    compare_ui_modpoll2
#    Water [ppm]    2012    4130
#    Carbon Monoxide [ppm]    2007    4120
#    Hydrogen [ppm]    2011    4116
#    Acetylene [ppm]    2006    4128
#    [Teardown]    Tear Down Procedure

#test_run
#    import library    OperatingSystem
#    ${expval}    Run    modpoll -1 -t 3 -r 2012 -0 -c 1 10.1.71.42
#    Log    ${expval}
#    ${escaped}=    Regexp Escape    [2012]
#    Log    ${escaped}
#    ${match}    ${group1}    Should Match Regexp    ${expval}    ${escaped}:(.*)
#    Log    ${group1}
#    ${new_group1}=    Convert To Number    ${group1}
#    Log    ${new_group1}
#    ${new_group1}=    Evaluate    ${new_group1}/10
#    Comment    Should Be Equal    ${new_group1}    compare_ui_modpoll
#    Log    ${new_group1}
#    Log Many    ${new_group1}    ${new_group1}

Valid login-bkp
    Import Library    SeleniumLibrary
    Import Library    OperatingSystem
    Open Browser    http://10.1.70.253    Chrome
    Wait Until Element Is Visible    css:*[value="Login"]
    Input Text    username    admin
    Input Text    password    admin
    Click Button    css:*[value="Login"]
    Wait Until Element Is Visible    css:span[data-i18n="web-ui:dashboards.title"]    timeout=10
    Click Element    css:span[data-i18n="web-ui:dashboards.title"]
    Wait Until Page Contains Element    css:span[data-i18n="web-ui:dashboards.title"]
    #Click Element    xpath://span[text()='DGA Status Table']
    #Wait Until Element Is Visible    xpath://div[text()='Hydrogen [ppm]']/../following-sibling::td    timeout=10
    #Sleep    10 seconds
    #${retval}    Get Text    xpath://div[text()='Water [ppm]']/../following-sibling::td
    #Comment    compare_ui_modpoll    Get Text    xpath://div[text()='Hydrogen [ppm]']/../following-sibling::td
    #${retval}    Convert To Number    compare_ui_modpoll
    #Log    compare_ui_modpoll
    #${expval}    Run    modpoll -1 -t 3 -r 2012 -0 -c 1 10.1.71.42
    #${escaped}=    Regexp Escape    [2012]
    #Log    ${escaped}
    #${match}    ${group1}    Should Match Regexp    ${expval}    ${escaped}:(.*)
    #${new_group1}=    Convert To Number    ${group1}
    #${new_group1}=    Evaluate    ${new_group1}/10
    #Log    ${new_group1}
    #Should Be Equal    ${new_group1}    compare_ui_modpoll
#    [Teardown]    Close Browser

*** Keywords ***
#compare_ui_modpoll2
#    [Arguments]    ${gas}    ${register}    ${minitrans_register}
#    ${retval}    Get Text    xpath://div[text()='${gas}']/../following-sibling::td
#    ${retval}    Convert To Number    ${retval}
#    Log    ${retval}
#    ${expval}    Run    modpoll -1 -t 3 -r ${register} -0 -c 1 10.1.71.103
#    ${escaped}=    Regexp Escape    [${register}]
#    Log    ${escaped}
#    ${match}    ${group1}    Should Match Regexp    ${expval}    ${escaped}:(.*)
#    ${new_group1}=    Convert To Number    ${group1}
#    ${new_group1}=    Evaluate    ${new_group1}/10
#    Log    ${new_group1}
#    Should Be Equal As Numbers    ${new_group1}    ${retval}
#    ${tcm_as_slave_results}=    Set Variable    ${new_group1}
#    ${tcm_as_slave_results}=    Convert To Number    ${tcm_as_slave_results}
#    Log    "==============Getting results from MiniTrans now====================="
#    ${expval}    Run    modpoll -1 -f -t 3:float -r ${minitrans_register} -1 -c 1 10.1.71.2
#    ${escaped}=    Regexp Escape    [${minitrans_register}]
#    Log    ${escaped}
#    ${match}    ${group1}    Should Match Regexp    ${expval}    ${escaped}:(.*)
#    ${new_group1}=    Convert To Number    ${group1}    1
#    Log    ${new_group1}
#    Should Be Equal As Numbers    ${new_group1}    ${retval}
#    ${minitrans_results}=    Set Variable    ${new_group1}
#    ${minitrans_results}    Convert To Number    ${minitrans_results}
#    Log results    ${tcm_as_slave_results}    ${minitrans_results}    ${retval}

initial setup
    [Arguments]    ${ip}
    Import Library    SeleniumLibrary
    Import Library    OperatingSystem
    Open Browser    ${ip}    Chrome
    Wait Until Element Is Visible    css:*[value="Login"]
    Input Text    username    admin
    Input Text    password    admin
    Click Button    css:*[value="Login"]
    Wait Until Element Is Visible    css:span[data-i18n="web-ui:dashboards.title"]    timeout=10
    Click Element    css:span[data-i18n="web-ui:dashboards.title"]
    Wait Until Page Contains Element    css:span[data-i18n="web-ui:dashboards.title"]
    Click Element    xpath://span[text()='DGA Status Table']
    Wait Until Element Is Visible    xpath://div[text()='Hydrogen [ppm]']/../following-sibling::td    timeout=10
    Sleep    10 seconds

Log results
    [Arguments]    ${tcm_results}    ${minitrans_results}    ${ui}
    Log Many    ${tcm_results}    ${minitrans_results}    ${ui}

Tear Down Procedure
    Close Browser
#