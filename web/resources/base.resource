*** Settings ***
Documentation        Tudo começa aqui

Resource        components/navbar.resource
Resource        components/toast.resource
Resource        components/notification.resource
Resource        pages/login.resource
Resource        pages/enroll.resource
Resource        pages/help.resource

Resource        services/sessions.resource
Resource        services/students.resource

Resource        database.resource

Library         JSONLibrary

*** Keywords ***
Do Login
    [Arguments]                ${user}

    Go To Login Page
    Fill Credentials           ${user}[email]    ${user}[password]
    Submit Credentials
    User Should Be Loged In    ${user}[name]

Get Fixture
    [Arguments]      ${fixture_file}

    ${fixture}        Load JSON From File
    ...               ${EXECDIR}/resources/fixtures/${fixture_file}.json
    ...               encoding=UTF-8

    [return]          ${fixture}