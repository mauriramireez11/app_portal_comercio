
*** Settings ***

Documentation       Prueba de Envío de Mensaje en WhatsApp.
Library             AppiumLibrary
Resource            ../../../resources/keywords.robot
Resource            ../../../resources/variables.robot

*** Test Cases ***

Prueba de Envío de Mensaje
     
     [Documentation]            Este test verifica que se pueda enviar un mensaje en WhatsApp.
     Conectar dispositivo
     Sleep                      2s
     Wait until page contains   Chatear con un asesor  10s
     Click element              xpath=//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup
     Wait until page contains   Hola, tengo problemas para iniciar sesión, ¿pueden ayudarme?   10s
     Capture Page Screenshot    ${TEST NAME}.png
     Go Back
     Go Back
     Close Application
     [Teardown]  Run Keyword If Test Failed  Close Application