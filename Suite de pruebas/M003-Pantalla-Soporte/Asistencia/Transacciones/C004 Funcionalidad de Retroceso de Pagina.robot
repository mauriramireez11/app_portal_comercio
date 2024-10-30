
*** Settings ***

Documentation       Funcionalidad del retroceso de pagina.
Library             AppiumLibrary
Resource            ../../../../resources/keywords.robot
Resource            ../../../../resources/variables.robot

*** Test Cases ***

Funcionalidad del botón de retroceso

     #Ingreso a la aplicación
     Conectar dispositivo
     Sleep                      2s
     Input text                 xpath=//android.widget.EditText[@content-desc="Ingresa tu email"]                       ${usuario-valido}
     Input text                 xpath=//android.widget.EditText[@content-desc="Contraseña"]                             ${contraseña-valida}
     Sleep                      1s
     Click element              xpath=//android.widget.TextView[@text='Iniciar sesión']
     Wait until page contains   Ingreso con huella o reconocimiento facial   10s
     Click element              Xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.widget.TextView
     Wait until page contains   Resumen diario   10s
     #Ingreso a la pantalla de pedido de Asistencia
     Click Element At Coordinates    753    2101
     Wait until page contains   ¿En qué podemos ayudarle?  10s
     Wait until page contains   Soporte   10s
     Click element              xpath=//android.widget.TextView[@text='Asistencia']
     #Selecciona tipo de soporte
     Wait until page contains   Seleccione el tipo de soporte  10s
     # Selecciona facturacion
     Click element              xpath=//android.widget.TextView[@text='Transacciones']
     # Presiona el boton siguiente
     Click element              xpath=//android.widget.TextView[@text='Siguiente']
     # Selecciona Reclamar facturacion
     Sleep                      1s
     Click element              xpath=//android.widget.TextView[@text='Solicitar Anulación']
     # Presiona el boton siguiente
     Click element              xpath=//android.widget.TextView[@text='Siguiente']
     Wait until page contains   Describa el incidente  10s
     Sleep                      1s
     Click element              xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.widget.LinearLayout/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.Button/android.view.ViewGroup
     Click element              xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.widget.LinearLayout/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.Button/android.view.ViewGroup
     Click element              xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.widget.LinearLayout/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.Button/android.view.ViewGroup
     Wait until page contains   ¿En qué podemos ayudarle?   10s
     Capture Page Screenshot    ${TEST NAME}.png
     Close Application