*** Settings ***
Documentation        Suíte de testes de pedido de ajuda

Resource             ../resources/base.resource


Test Setup           Start App
Test Teardown        Finish App

*** Test Cases ***
Deve Poder Solicitar Ajuda
    
    ${admin}      Get Fixture    admin
    ${viviane}    Get Fixture    viviane
    

    Reset Student            ${viviane}[student][email]

    ${token}                 Get Service Token       ${admin}
    ${student_id}            POST New Student        ${token}        ${viviane}[student]
    
    POST New Enroll                 ${token}                ${student_id}
    Login With Student id           ${student_id}
    
    Confirm Pop Up
    Go To Help Order
    Submit Help Order               ${viviane}[help]

    Wait Until Page Contains        Recebemos a sua dúvida. Agora é só aguardar até 24 horas para receber o nosso feedback.

