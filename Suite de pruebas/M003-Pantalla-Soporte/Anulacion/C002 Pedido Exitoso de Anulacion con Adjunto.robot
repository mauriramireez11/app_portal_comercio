
*** Settings ***

Documentation       Pruebas individuales que se centren en la validación de datos de cada campo del formulario.
Library             AppiumLibrary
Resource            ../../../resources/keywords.robot
Resource            ../../../resources/variables.robot

*** Test Cases ***

Pedido exitoso de anulacion con adjunto

     # Ingreso a la aplicación
     Conectar dispositivo
     Sleep                      2s
     Input text                 xpath=//android.widget.EditText[@content-desc="Ingresa tu email"]                       ${usuario-valido}
     Input text                 xpath=//android.widget.EditText[@content-desc="Contraseña"]                             ${contraseña-valida}
     Sleep                      1s
     Click element              xpath=//android.widget.TextView[@text="Iniciar sesión"]
     Wait until page contains   Ingreso con huella o reconocimiento facial   10s
     Click element              Xpath=//android.view.ViewGroup[@content-desc="Más tarde"]
     Wait until page contains   Resumen diario   10s
     # Ingreso a la pantalla de pedido de anulación
     Click Element At Coordinates    753    2101
     Wait until page contains   ¿En qué podemos ayudarle?  10s
     Wait until page contains   Soporte   10s
     Click element              xpath=//android.widget.TextView[@text='Anulación']
     # Validación ingreso de asunto
     Wait until page contains   Soporte   10s
     Click element              xpath=//android.widget.EditText[@content-desc="Asunto"]
     Input text                 xpath=//android.widget.EditText[@content-desc="Asunto"]                ${asuntoanulacion}
     # VALIDACION INGRESO DE NRO. TRANSACCION NUMERO
     Wait until page contains   Soporte   10s
     Click element              xpath=//android.widget.EditText[@content-desc="Nro. Transacción"]
     Input text                 xpath=//android.widget.EditText[@content-desc="Nro. Transacción"]      ${boletadeanulacion}
     Go Back
     Click element              xpath=//android.widget.TextView[@text="Enviar solicitud de soporte"]
     Click Element At Coordinates    ${970}    ${2165}
     # VALIDACION INGRESO DE MOTIVO DE ANULACION
     Wait until page contains   Soporte   10s
     Click element              xpath=//android.widget.EditText[@content-desc="Motivo del pedido de anulación"]
     Input text                 xpath=//android.widget.EditText[@content-desc="Motivo del pedido de anulación"]       ${motivodeanulacion}
     Click element              xpath=//android.widget.TextView[@text='Asunto']
     # VALIDACION INGRESO DE ARCHIVO ADJUNTO
     Wait until page contains   Soporte   10s
     Click element              xpath=//android.widget.TextView[@text='Buscar archivo']
     Sleep                      2s
     Click Element At Coordinates    ${760}    ${860}
     Wait until page contains   Archivo cargado con éxito   10s
     Click element              xpath=//android.widget.TextView[@text='Enviar solicitud de soporte']
     Wait until page contains   Solicitud enviada    30s
     Capture Page Screenshot    ${TEST NAME}.png
     Click element              xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.Button/android.widget.TextView
     Sleep                      1s
     Close Application
