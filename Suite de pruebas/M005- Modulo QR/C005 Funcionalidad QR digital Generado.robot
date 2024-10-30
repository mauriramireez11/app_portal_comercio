# Prueba automatizada para la App del Portal de comercios para dispositivos android.
# Tester : Miguel Angel Esquivel Rios

*** Settings ***

Documentation       Funcionalidad de la pagina de
Library             AppiumLibrary
Resource            ../../resources/keywords.robot
Resource            ../../resources/variables.robot

*** Test Cases ***

QR digital generado - Correcto
     Click Element              xpath=//com.horcrux.svg.b
     Sleep                      2s
     Wait until page contains   Vendé con QR Estático  10s
     Click element              xpath=//android.widget.TextView[@text='Vendé con QR Digital']
     Wait until page contains   Vendé con QR Digital  10s
     Wait until page contains   QR Digital  10s
     Click element              xpath=//android.widget.EditText[@content-desc="Monto"]
     Input text                 xpath=//android.widget.EditText[@content-desc="Monto"]      2000
     Go Back
     Click element              xpath=//android.widget.EditText[@content-desc="Descripción (opcional)"]
     Input text                 xpath=//android.widget.EditText[@content-desc="Descripción (opcional)"]     Tres empanadas de carne
     Go Back
     Click element              xpath=//android.widget.TextView[@text='Generar QR Digital']
     Wait until page contains   Escaneá el QR y completa el pago   10s
     Wait until page contains   Detalle de la venta    10s
     Wait until page contains   2.000     10s
     Wait until page contains   Tres empanadas de carne   10s
     Sleep                      2s
     Capture Page Screenshot    VerificacionQRDigitalGenerado.png
     Click Element              xpath=//android.view.ViewGroup[@resource-id="Compartir QR Digital"]
     Sleep                      2s
     Capture Page Screenshot    VerificacionOpcionesQRDigital.png
     #Click Element              xpath=(//android.widget.ImageView[@resource-id="com.android.intentresolver:id/icon"])[1]
     Sleep                      1s
     Go Back
     Sleep                      1s
     #Go Back
     #Sleep                      1s
     #Go Back
     #Sleep                      1s
     #Wait until page contains   QR Digital compartido!  10s
     Click Element              xpath=//android.view.ViewGroup[@resource-id="Salir"]
     Wait Until Page Contains   Antes de salir, asegúrate de enviar el QR generado a tus clientes, ya que no podrás acceder a este nuevamente   10s
     Capture Page Screenshot    ${TEST NAME}.png
     Close Application


