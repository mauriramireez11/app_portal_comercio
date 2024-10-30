# Prueba automatizada para la App del Portal de comercios para dispositivos android.
# Tester : Miguel Angel Esquivel Rios

*** Settings ***

Documentation       Funcionalidad de la pagina de
Library             AppiumLibrary
Resource            ../../../resources/keywords.robot
Resource            ../../../resources/variables.robot

*** Test Cases ***

Ingreso a la pantalla de inicio

     Conectar dispositivo
     Sleep                      2s
     Input text                 xpath=//android.widget.EditText[@content-desc="Ingresa tu email"]                       ${usuario-valido}
     Input text                 xpath=//android.widget.EditText[@content-desc="Contraseña"]                             ${contraseña-valida}
     Sleep                      1s
     Click element              xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[3]
     Wait until page contains   Ingreso con huella o reconocimiento facial   10s
     Click element              Xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.widget.TextView
     Wait until page contains   Resumen diario   10s

Funcionalidad apartado Ventas QR digital

     Sleep                      1s
     Wait until page contains   Resumen diario    10s
     Wait until page contains   Ver movimientos   10s
     Swipe                      34  1682  43  1033
     Swipe                      43  1433  43  1226
     Sleep                      1s
     Wait until page contains   Vende con QR Estático  10s
     Click element              xpath=//android.widget.TextView[@text='Vende con QR Digital']
     Wait until page contains   Vendé con QR Digital  10s
     Wait until page contains   QR Digital  10s
     Click element              xpath=//android.widget.EditText[@content-desc="Monto"]
     Input text                 xpath=//android.widget.EditText[@content-desc="Monto"]      2000
     Go Back
     Click element              xpath=//android.widget.EditText[@content-desc="Descripción (opcional)"]
     Input text                 xpath=//android.widget.EditText[@content-desc="Descripción (opcional)"]     Tres empanadas de carne
     Go Back
     Click element              xpath=//android.widget.TextView[@text='Generar QR Digital']
     Wait until page contains   Escanea el QR y completa el pago   10s
     Wait until page contains   Detalle de la venta    10s
     Wait until page contains   2.000     10s
     Wait until page contains   Tres empanadas de carne   10s
     Capture Page Screenshot    ${TEST NAME}.png
     
     Close Application


