*** Settings ***
Documentation        Representação do componente de notificação

Library              Browser

*** Keywords ***
Open Notifications
    Click                      xpath=(//aside//button)[1]

Notification Should Be
    [Arguments]        ${text}

    ${element}                 Set Variable    xpath=//p[contains(text(), "${text}")]
    Wait For Elements State    ${element}
    ...                        visible
    ...                        timeout=2

    Get Text                   ${element}      equal          ${text}                        
