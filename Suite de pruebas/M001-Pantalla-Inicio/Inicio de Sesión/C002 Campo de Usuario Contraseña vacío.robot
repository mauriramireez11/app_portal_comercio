# Prueba automatizada para la App del Portal de comercios para dispositivos Android.
# Tester: Miguel Angel Esquivel Rios

*** Settings ***

Documentation       Funcionalidad del boton de ingreso
Library             AppiumLibrary
Resource            ../../../resources/keywords.robot
Resource            ../../../resources/variables.robot

*** Test Cases ***

Usuario no ingresa datos

     Conectar dispositivo
     Sleep                      2s
     Capture Page Screenshot    ${TEST NAME}.png
     Close Application
