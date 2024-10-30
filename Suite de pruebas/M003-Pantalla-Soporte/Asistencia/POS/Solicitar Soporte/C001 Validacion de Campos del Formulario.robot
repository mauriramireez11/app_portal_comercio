# Prueba automatizada para la App del PORTAL DE COMERCIOS
# Tester : Miguel Angel Esquivel Rios

*** Settings ***

Documentation       Pruebas individuales que se centren en la validación de datos de cada campo del formulario.
Library             AppiumLibrary
Resource            ../../../../../resources/keywords.robot
Resource            ../../../../../resources/variables.robot

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

Ingreso a la pantalla de soporte

     Click Element At Coordinates    753    2101
     Wait until page contains   ¿En qué podemos ayudarle?  10s
     Wait until page contains   Soporte   10s
     Click element              xpath=//android.widget.TextView[@text='Asistencia']

Selecciona asistencia POS

     Wait until page contains   Soporte   10s
     Click element              xpath=//android.widget.TextView[@text='POS']
     Click element              xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup
     Wait until page contains   Seleccione el tipo de soporte   10s
     Click element              xpath=//android.widget.TextView[@text='Solicitar Soporte']
     Click element              xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup
     Wait until page contains   Soporte   10s

Validación de campos requeridos

     Wait until page contains   Describa el incidente  10s
     Click element              xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.TextView
     Wait until page contains   Debes indicar un asunto  5s
     Wait until page contains   Debes seleccionar una sucursal   5s
     Wait until page contains   Debes indicar el horario de tu comercio  5s
     Capture Page Screenshot    ${TEST NAME}.png

Validación de ingreso de asunto

     Wait until page contains   Soporte   10s
     Click element              xpath=//android.widget.EditText[@content-desc="Asunto"]
     Input text                 xpath=//android.widget.EditText[@content-desc="Asunto"]                ${asuntoasistencia}
     Go Back
     Click element              xpath=//android.widget.TextView[@text='Enviar solicitud de soporte']
     Wait until page contains   Debes seleccionar una sucursal   5s
     Capture Page Screenshot    ${TEST NAME}.png

Validación de ingreso de sucursal

     Wait until page contains   Soporte   10s
     Sleep                      1s
     Click element              xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.widget.Button/android.view.ViewGroup[2]
     Sleep                      2s
     Click element              xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[3]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]
     Sleep                      2s
     Click element              xpath=//android.widget.TextView[@text='Enviar solicitud de soporte']
     Wait until page contains   Debes indicar el horario de tu comercio  5s
     Capture Page Screenshot    ${TEST NAME}.png

Validación de ingreso horario de atención

     Wait until page contains   Soporte   10s
     Click element              xpath=//android.widget.EditText[@content-desc="Horario de atención de tu comercio"]
     Input text                 xpath=//android.widget.EditText[@content-desc="Horario de atención de tu comercio"]     ${horarioasistencia}
     Click element              xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[3]/android.view.ViewGroup[2]/android.widget.TextView
     Sleep                      2s
     Click element              xpath=//android.widget.TextView[@text='Enviar solicitud de soporte']
     Wait until page contains   Debes indicar un teléfono  5s
     Capture Page Screenshot    ${TEST NAME}.png

Validación de ingreso telefono

     Wait until page contains   Soporte   10s
     Click element              xpath=//android.widget.EditText[@content-desc="Número de teléfono"]
     Input text                 xpath=//android.widget.EditText[@content-desc="Número de teléfono"]     ${telefonoasistencia}
     Click element              xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[3]/android.view.ViewGroup[2]/android.widget.TextView
     Sleep                      2s
     Click element              xpath=//android.widget.TextView[@text='Enviar solicitud de soporte']
     Wait until page contains   Debes indicar el número de serie de tu equipo  5s
     Capture Page Screenshot    ${TEST NAME}.png

Validación de ingreso modelo de POS

     Wait until page contains   Soporte   10s
     Sleep                      1s
     Click element              xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[5]/android.widget.Spinner/android.widget.TextView
     Sleep                      2s
     Click element              xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/androidx.appcompat.widget.LinearLayoutCompat/android.widget.FrameLayout/android.widget.ListView/android.widget.CheckedTextView[5]
     Sleep                      2s
     Click element              xpath=//android.widget.TextView[@text='Enviar solicitud de soporte']
     Wait until page contains   Debes indicar el número de serie de tu equipo  5s
     Capture Page Screenshot    ${TEST NAME}.png

Validación de ingreso numero de serie del equipo

     Wait until page contains   Soporte   10s
     Click element              xpath=//android.widget.EditText[@content-desc="Número de serie del equipo"]
     Input text                 xpath=//android.widget.EditText[@content-desc="Número de serie del equipo"]        ${serieasistencia}
     Sleep                      2s
     Go Back
     #Click Element At Coordinates    ${970}    ${2165}
     Wait until page contains   Debes agregar una descripción   10s
     Capture Page Screenshot    ${TEST NAME}.png

Validación de ingreso descripción

     Wait until page contains   Soporte   10s
     Click element              xpath=//android.widget.EditText[@content-desc="Descripción"]
     Input text                 xpath=//android.widget.EditText[@content-desc="Descripción"]       ${motivodeasistencia}
     Go Back
     Swipe                      26    1463    43   822
     #Click element              xpath=//android.widget.TextView[@text='Enviar solicitud de soporte']
     Wait until page contains   Debes adjuntar al menos un archivo  10s
     Capture Page Screenshot    ${TEST NAME}.png

Validación de ingreso archivo adjunto

     Wait until page contains   Soporte   10s
     Sleep                      1s
     Click element              xpath=//android.widget.TextView[@text='Buscar archivo']
     Sleep                      2s
     Click Element At Coordinates    ${760}    ${860}
     Wait until page contains   Archivo cargado con éxito   10s
     Capture Page Screenshot    ${TEST NAME}.png
     Close Application