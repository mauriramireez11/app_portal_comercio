# Prueba automatizada para la App del Portal de comercios para dispositivos android.
# Tester : Miguel Angel Esquivel Rios

*** Settings ***

Documentation       Funcionalidad de la pagina de
Library             AppiumLibrary
Resource            ../../resources/keywords.robot
Resource            ../../resources/variables.robot

*** Test Cases ***

Verificación de visualización de QR Estático
     Click Element              xpath=//com.horcrux.svg.b
     Sleep                      2s
     Wait until page contains   Vendé con QR Estático  10s
     Click element              xpath=//android.widget.TextView[@text="Vendé con QR Estático"]
     Wait until page contains   Vendé con QR estático  10s
     Wait until page contains   Descargar o compartir  10s
     Click element              xpath=//android.widget.TextView[@text="Descargar o compartir"]
     Sleep                      3s
     Capture Page Screenshot    VerificacionOpciones.png
     #Click Element              xpath=(//android.widget.ImageView[@resource-id="com.android.intentresolver:id/icon"])[1]
     #Sleep                      2s
     #Capture Page Screenshot    ${TEST NAME}.png
     Go Back
     Sleep                      1s
     Go Back
     Sleep                      1s
     #Go Back
     #Sleep                      1s
     #Wait until page contains   QR compartido con éxito  10s



