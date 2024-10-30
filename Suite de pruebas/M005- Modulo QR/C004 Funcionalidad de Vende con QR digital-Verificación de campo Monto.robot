# Prueba automatizada para la App del Portal de comercios para dispositivos android.
# Tester : Miguel Angel Esquivel Rios

*** Settings ***

Documentation       Funcionalidad de la pagina de
Library             AppiumLibrary
Resource            ../../resources/keywords.robot
Resource            ../../resources/variables.robot

*** Test Cases ***

QR digital-Verificación de campo Monto - Nulo
     #Click Element              xpath=//android.widget.Button/com.horcrux.svg.SvgView/com.horcrux.svg.l/com.horcrux.svg.u
     #Sleep                      2s
     Wait until page contains   Vendé con QR Estático  10s
     Click element              xpath=//android.widget.TextView[@text='Vendé con QR Digital']
     Wait until page contains   Vendé con QR Digital  10s
     Wait until page contains   QR Digital  10s
     Click element              xpath=//android.widget.EditText[@content-desc="Monto"]
     Input text                 xpath=//android.widget.EditText[@content-desc="Monto"]      0
     Go Back
     Click element              xpath=//android.widget.EditText[@content-desc="Descripción (opcional)"]
     Input text                 xpath=//android.widget.EditText[@content-desc="Descripción (opcional)"]     Tres empanadas de carne
     Go Back
     Click element              xpath=//android.widget.TextView[@text='Generar QR Digital']
     Wait until page contains   Escaneá el QR y completa el pago   10s
     Wait until page contains   Detalle de la venta    10s
     Wait until page contains   0     10s
     Wait until page contains   Tres empanadas de carne   10s
     Click Element              xpath=//android.widget.TextView[@text="Compartir QR Digital"]
     Wait Until Page Contains   Algo salió mal, inténtalo nuevamente   10s
     Capture Page Screenshot    ${TEST NAME}.png
     Click Element              xpath=//android.view.ViewGroup[@resource-id="Salir"]
     Wait Until Page Contains Element    xpath=//android.widget.TextView[@text="¿Estás seguro deseas salir?"]
     Click Element              xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[3]
     [Teardown]  Run Keyword If Test Failed  Retroceso

QR digital-Verificación de campo Monto - Negativo

     Sleep                      3s
     Wait until page contains   Vendé con QR Estático  10s
     Click element              xpath=//android.widget.TextView[@text='Vendé con QR Digital']
     Wait until page contains   Vendé con QR Digital  10s
     Wait until page contains   QR Digital  10s
     Click element              xpath=//android.widget.EditText[@content-desc="Monto"]
     Input text                 xpath=//android.widget.EditText[@content-desc="Monto"]      -2000
     Go Back
     Click element              xpath=//android.widget.EditText[@content-desc="Descripción (opcional)"]
     Input text                 xpath=//android.widget.EditText[@content-desc="Descripción (opcional)"]     Tres empanadas de carne
     Go Back
     Click element              xpath=//android.widget.TextView[@text='Generar QR Digital']
     Wait Until Page Contains Element    xpath=//android.widget.TextView[@resource-id="toastText1"]   10s
     Sleep                      1s
     Capture Page Screenshot    ${TEST NAME}.png

QR digital-Verificación de campo Monto - Alfanumerico
     Go Back
     Sleep                      3s
     Wait until page contains   Vendé con QR Estático  10s
     Click element              xpath=//android.widget.TextView[@text='Vendé con QR Digital']
     Wait until page contains   Vendé con QR Digital  10s
     Wait until page contains   QR Digital  10s
     Click element              xpath=//android.widget.EditText[@content-desc="Monto"]
     Input text                 xpath=//android.widget.EditText[@content-desc="Monto"]      alfanumerico0
     Go Back
     Click element              xpath=//android.widget.EditText[@content-desc="Descripción (opcional)"]
     Input text                 xpath=//android.widget.EditText[@content-desc="Descripción (opcional)"]     Tres empanadas de carne
     Go Back
     Click element              xpath=//android.widget.TextView[@text='Generar QR Digital']
     Wait Until Page Contains Element    xpath=//android.widget.TextView[@resource-id="toastText1"]   10s
     Capture Page Screenshot    ${TEST NAME}.png



