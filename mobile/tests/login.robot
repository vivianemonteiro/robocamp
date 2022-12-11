*** Settings ***
Documentation        Suíte de testes de login

Resource             ../resources/base.resource

Test Setup           Start App
Test Teardown        Finish App

*** Variables ***
${error_401}         Acesso não autorizado! Entre em contato com a equipe de atendimento.
  


*** Test Cases ***
Deve Logar com Sucesso
    
    ${falcao}    Get Fixture    falcao
    
    Login With Student id       ${falcao}[student][id]
    Wait Until Page Contains    Olá, ${falcao}[student][name]!

Código de Aluno Incorreto
    
    Login With Student id       9999
    Wait Until Page Contains    ${error_401}
Código de Aluno Negativo
    
    Login With Student id       -1
    Wait Until Page Contains    ${error_401}

Código de Aluno Alfanumérico
    
    Login With Student id       abc123
    Wait Until Page Contains    ${error_401}