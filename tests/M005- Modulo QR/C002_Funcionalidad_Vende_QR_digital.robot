# Prueba automatizada para la App del Portal de comercios para dispositivos android.
# Tester : Miguel Angel Esquivel Rios

*** Settings ***

Documentation       Funcionalidad de la pagina de
Library             AppiumLibrary
Resource            ../../resources/keywords.robot
Resource            ../../resources/variables.robot

*** Test Cases ***

Verificación de redirección a QR Digital

     Click Element              xpath=//com.horcrux.svg.b
     Sleep                      2s
     Wait until page contains   Vendé con QR Digital    10s
     Click element              xpath=//android.widget.TextView[@text='Vendé con QR Digital']
     Wait until page contains   Vendé con QR Digital  10s
     Wait until page contains   QR Digital  10s
     Capture Page Screenshot    ${TEST NAME}.png


