
*** Settings ***

Documentation       Funcionalidad de campos requeridos en el formulario.
Library             AppiumLibrary
Resource            ../../../resources/keywords.robot
Resource            ../../../resources/variables.robot

*** Test Cases ***

Ingreso a la aplicación

     Conectar dispositivo
     Sleep                      2s
     Input text                 xpath=//android.widget.EditText[@content-desc="Ingresa tu email"]                       ${usuario-valido}
     Input text                 xpath=//android.widget.EditText[@content-desc="Contraseña"]                             ${contraseña-valida}
     Sleep                      1s
     Click element              xpath=//android.widget.TextView[@text="Iniciar sesión"]
     Wait until page contains   Ingreso con huella o reconocimiento facial   10s
     Click element              Xpath=//android.view.ViewGroup[@content-desc="Más tarde"]
     Wait until page contains   Resumen diario   10s

Ingreso a la pantalla de pedido de anulación

     Click Element At Coordinates    753    2101
     Wait until page contains   ¿En qué podemos ayudarle?  10s
     Wait until page contains   Soporte   10s
     Click element              xpath=//android.widget.TextView[@text='Anulación']

Validación de campos requeridos

     Wait until page contains   Describa el incidente  10s
     Click element              xpath=//android.widget.TextView[@text='Enviar solicitud de soporte']
     Wait until page contains   Debes indicar un asunto  5s
     Wait until page contains   Debe indicar el número de transacción   5s
     Wait until page contains   Debe indicar el motivo de la anulación  5s
     Capture Page Screenshot    ${TEST NAME}.png

Validación ingreso de asunto

     Wait until page contains   Soporte   10s
     Click element              xpath=//android.widget.EditText[@content-desc="Asunto"]
     Input text                 xpath=//android.widget.EditText[@content-desc="Asunto"]                ${asuntoanulacion}
     Go back
     Click element              xpath=//android.widget.TextView[@text='Enviar solicitud de soporte']
     Wait until page contains   Debe indicar el número de transacción  5s
     Capture Page Screenshot    ${TEST NAME}.png

Validación ingreso de nro. transaccion letra

     Wait until page contains   Soporte   10s
     Click element              xpath=//android.widget.EditText[@content-desc="Nro. Transacción"]
     Input text                 xpath=//android.widget.EditText[@content-desc="Nro. Transacción"]      ${boletadeanulacionletra}
     Go back
     Click element              xpath=//android.widget.TextView[@text='Enviar solicitud de soporte']
     Wait until page contains   Este campo solo acepta números  5s
     Capture Page Screenshot    ${TEST NAME}.png

Validación ingreso de nro. transacción numero

     Wait until page contains   Soporte   10s
     Click element              xpath=//android.widget.EditText[@content-desc="Nro. Transacción"]
     Input text                 xpath=//android.widget.EditText[@content-desc="Nro. Transacción"]      ${boletadeanulacion}
     Go back
     Click element              xpath=//android.widget.TextView[@text='Enviar solicitud de soporte']
     Click Element At Coordinates    ${970}    ${2165}
     Wait until page contains   Debe indicar el motivo de la anulación  5s
     Capture Page Screenshot    ${TEST NAME}.png

Validación ingreso de motivo de anulación

     Wait until page contains   Soporte   10s
     Click element              xpath=//android.widget.EditText[@content-desc="Motivo del pedido de anulación"]
     Input text                 xpath=//android.widget.EditText[@content-desc="Motivo del pedido de anulación"]       ${motivodeanulacion}
     Click element              xpath=//android.widget.TextView[@text='Asunto']
     #Wait until page contains   Debes adjuntar al menos un archivo  10s
     Capture Page Screenshot    ${TEST NAME}.png

Validación ingreso de archivo adjunto

     Wait until page contains   Soporte   10s
     Sleep                      2s
     Click element              xpath=//android.widget.TextView[@text='Buscar archivo']
     Sleep                      2s
     Click Element At Coordinates    ${760}    ${860}
     Wait until page contains   Archivo cargado con éxito   10s
     Capture Page Screenshot    ${TEST NAME}.png
     Close Application