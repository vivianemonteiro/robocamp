
**** Settings ***
Documentation        Keywords que representam a página de help

Library              Browser
Resource             ../../resources/base.resource


*** Keywords ***
Enviar uma Dúvida
    [Arguments]        ${student}
    ${admin}                             Get Fixture                  admin
    ${student_active}                    Get Fixture                  ${student}

    Reset Student              ${student_active}[student][email]

    ${token}                   Get Service Token            ${admin}
    ${student_id}              POST New Student             ${token}        ${student_active}[student]
    
    POST Question              ${student_id}                ${student_active}[question]
    
    Do Login                   ${admin}
    Open Notifications
    Notification Should Be     ${student_active}[question]

Responder uma Dúvida
    [Arguments]       ${student_data}         
    
    ${help_form}        Get Fixture    ${student_data}
    ${locator}          Set Variable   css=textarea[name=answer]
    
    Click                         xpath=//p[contains(text(), "${help_form}[question]")]
    Wait For Elements State       ${locator}
    Click                         ${locator}
    Fill Text                     ${locator}      ${help_form}[answer]
    Click                         xpath=//button[text()="Enviar resposta"]
    Verify Toaster                Resposta enviada com sucesso   
    
