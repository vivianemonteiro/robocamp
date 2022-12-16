*** Settings ***
Documentation            Consumindo a rota students da API REST

Library                  RequestsLibrary

*** Variables ***
#criei essa variável pois a url é a mesma para ambos os testes, então assim fica mais fácil dar manutenção no código.
${base_url}              http://localhost:3333/students

*** Keywords ***
POST New Student
    [Arguments]        ${token}                 ${student}

    ${headers}         Create Dictionary        Authorization=${token}
    
    ${response}        POST                     ${base_url}
    ...                                         json=${student}
    ...                                         headers=${headers}
    ...                                         expected_status=201

    [return]          ${response.json()}[id]

POST Question
    [Arguments]    ${student_id}        ${question}

    ${payload}     Create Dictionary    question=${question}
    
    POST           ${base_url}/${student_id}/help-orders
    ...            json=${payload}
    ...            expected_status=201
