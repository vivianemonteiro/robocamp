*** Settings ***
Documentation        Suíte de testes de recebimento de pedido de ajuda

Resource             ../resources/base.resource

Test Teardown   Take Screenshot


*** Test Cases ***
Deve Receber uma Notificação de Pedido de Ajuda 

    Enviar uma Dúvida          joao
    

#Desafio Final - Prazo: 20/12
Deve Poder Responder o Pedido de Ajuda
    
    Enviar uma Dúvida         felicia
    Responder uma Dúvida      felicia
     

   