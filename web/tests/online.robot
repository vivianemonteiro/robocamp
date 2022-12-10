*** Settings ***
Documentation    Verifica se a aplicação está online

Library          Browser

*** Variables ***
${url}        http://localhost:3000
  
*** Test Cases ***
Portal Admin deve estar online
    New Browser     headless=False    browser=chromium
    New Page        ${url}
    Get Text        h1    contains    Painel do Administrador
    Sleep           1
