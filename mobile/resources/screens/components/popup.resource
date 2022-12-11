*** Settings ***
Documentation        Componente que representa o pop up

Library              AppiumLibrary

*** Variables ***

${ok_button}        id=android:id/button1

*** Keywords ***

Confirm Pop Up
    Wait Until Element Is Visible         ${ok_button}        timeout=5
    Click Element                         ${ok_button}                    