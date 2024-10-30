
*** Settings ***

Library             AppiumLibrary
Resource            ../../../../resources/keywords.robot
Resource            ../../../../resources/variables.robot

*** Test Cases ***

Ingreso a la aplicación

     Conectar dispositivo
     Sleep                      2s
     Input text                 xpath=//android.widget.EditText[@content-desc="Ingresa tu email"]                       ${usuario-valido}
     Input text                 xpath=//android.widget.EditText[@content-desc="Contraseña"]                             ${contraseña-valida}
     Sleep                      1s
     Click element              xpath=//android.widget.TextView[@text='Iniciar sesión']
     Wait until page contains   Ingreso con huella o reconocimiento facial   10s
     Click element              Xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.widget.TextView
     Wait until page contains   Resumen diario   10s

Ingreso a la pantalla de Soporte
     
     Click Element At Coordinates    753    2101
     Wait until page contains   ¿En qué podemos ayudarle?  10s
     Wait until page contains   Soporte   10s
     Click element              xpath=//android.widget.TextView[@text='Asistencia']

Selecciona tipo de soporte

     Wait until page contains   Seleccione el tipo de soporte  10s
     Sleep                      2s
     # selecciona facturacion
     Click element              xpath=//android.widget.TextView[@text='miniPOS']
     # presiona el boton siguiente
     Click element              xpath=//android.widget.TextView[@text='Siguiente']
     Sleep                      1s
     # selecciona Reclamar facturacion
     Click element              xpath=//android.widget.TextView[@text='Reclamo general']
     # presiona el boton siguiente
     Click element              xpath=//android.widget.TextView[@text='Siguiente']

Validación de campos requeridos

     Wait until page contains   Describa el incidente  10s
     Click element              xpath=//android.widget.TextView[@text='Enviar solicitud de soporte']
     Wait until page contains   Debes indicar un asunto  5s
     Wait until page contains   Debes seleccionar una sucursal   5s
     Wait until page contains   Debes agregar una descripción  5s
     Capture Page Screenshot    ${TEST NAME}.png

Validación ingreso de asunto

     Wait until page contains   Soporte   10s
     Click element              xpath=//android.widget.EditText[@content-desc="Asunto"]
     Input text                 xpath=//android.widget.EditText[@content-desc="Asunto"]                ${asuntoanulacion}
     Sleep                      1s
     Go Back
     Click element              xpath=//android.widget.TextView[@text='Enviar solicitud de soporte']
     Wait until page contains   Debes seleccionar una sucursal  5s
     Capture Page Screenshot    ${TEST NAME}.png

Validacion ingreso de sucursal

     Wait until page contains   Soporte   10s
     Click element              xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.widget.Button/android.view.ViewGroup[2]
     Sleep                      1s
     Click element              xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[3]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]
     Sleep                      1s
     Click element              xpath=//android.widget.TextView[@text='Enviar solicitud de soporte']
     Sleep                      3s
     Capture Page Screenshot    ${TEST NAME}.png

Validación ingreso de descripcion

     Wait until page contains   Soporte   10s
     Click element              xpath=//android.widget.EditText[@content-desc="Descripción"]
     Input text                 xpath=//android.widget.EditText[@content-desc="Descripción"]               ${asuntoanulacion}
     Click Element At Coordinates     ${228}    ${908}
     Wait until page contains   Debes adjuntar al menos un archivo  10s
     Capture Page Screenshot    ${TEST NAME}.png

Validación ingreso de archivo adjunto

     Wait until page contains   Soporte   10s
     Sleep                      1s
     Click element              xpath=//android.widget.TextView[@text='Buscar archivo']
     Sleep                      2s
     Click Element At Coordinates    ${760}    ${860}
     Wait until page contains   Archivo cargado con éxito   10s
     Capture Page Screenshot    ${TEST NAME}.png
     Close Application