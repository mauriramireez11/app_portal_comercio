
*** Settings ***

Documentation       Envio de soporte con archivo adjunto.
Library             AppiumLibrary
Resource            ../../../../resources/keywords.robot
Resource            ../../../../resources/variables.robot

*** Test Cases ***

Pedido exito de facturacion con adjunto

     # Ingreso a la aplicación
     Conectar dispositivo
     Sleep                      2s
     Input text                 xpath=//android.widget.EditText[@content-desc="Ingresa tu email"]                       ${usuario-valido}
     Input text                 xpath=//android.widget.EditText[@content-desc="Contraseña"]                             ${contraseña-valida}
     Sleep                      1s
     Click element              xpath=//android.widget.TextView[@text='Iniciar sesión']
     Wait until page contains   Ingreso con huella o reconocimiento facial   10s
     Click element              Xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.widget.TextView
     Wait until page contains   Resumen diario   10s
     # Ingreso a la pantalla de Soporte
     Click Element At Coordinates    753    2101
     Wait until page contains   ¿En qué podemos ayudarle?  10s
     Wait until page contains   Soporte   10s
     Click element              xpath=//android.widget.TextView[@text='Asistencia']
     # Selecciona tipo de soporte
     Wait until page contains   Seleccione el tipo de soporte  10s
     Sleep                      2s
     # selecciona facturacion
     Click element              xpath=//android.widget.TextView[@text='Facturación']
     # presiona el boton siguiente
     Click element              xpath=//android.widget.TextView[@text='Siguiente']
     Sleep                      1s
     # selecciona Reclamar facturacion
     Click element              xpath=//android.widget.TextView[@text='Reclamar facturación']
     # presiona el boton siguiente
     Click element              xpath=//android.widget.TextView[@text='Siguiente']
     # Carga de datos para el soporte
     Wait until page contains   Describa el incidente  10s
     # Validación ingreso de asunto
     Wait until page contains   Soporte   10s
     Click element              xpath=//android.widget.EditText[@content-desc="Asunto"]
     Input text                 xpath=//android.widget.EditText[@content-desc="Asunto"]                ${asuntoanulacion}
     Go Back
     # Validacion ingreso de sucursal
     Wait until page contains   Soporte   10s
     Click element              xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.widget.Button/android.view.ViewGroup[2]
     Sleep                      1s
     Click element              xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[3]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]
     Sleep                      1s
     # Validación ingreso de descripcion
     Wait until page contains   Soporte   10s
     Click element              xpath=//android.widget.EditText[@content-desc="Descripción"]
     Input text                 xpath=//android.widget.EditText[@content-desc="Descripción"]               ${asuntoanulacion}
     Go Back
     # Validación ingreso de archivo adjunto
     Wait until page contains   Soporte   10s
     Sleep                      1s
     Click element              xpath=//android.widget.TextView[@text='Buscar archivo']
     Sleep                      2s
     Click Element At Coordinates    ${760}    ${860}
     Wait until page contains   Archivo cargado con éxito   10s
     Sleep                      1s
     Click element              xpath=//android.widget.TextView[@text='Enviar solicitud de soporte']
     Wait until page contains   Solicitud enviada    30s
     Capture Page Screenshot    ${TEST NAME}.png

     # Identifica y captura el número rotativo
     @{text_views}=    Get WebElements    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.TextView[3]
     FOR    ${text_view}    IN    @{text_views}
      ${text}=    Get Text    ${text_view}
           IF    "${text}" != ""
        Log    Valor rotativo encontrado: ${text}
        # Puedes hacer más verificaciones o procesamiento aquí
        Set Global Variable    ${numero_rotativo}    ${text}
        Exit For Loop
          END
     END

Captura el número de pedido y consulta I

     Wait until page contains   Solicitud enviada       70s
     Click Element              xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.widget.TextView
     Sleep                      1s
     Click Element              xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[3]/android.view.ViewGroup/android.view.ViewGroup
     Click element              xpath=//android.widget.EditText[@content-desc="Número de Ticket"]
     Input text                 xpath=//android.widget.EditText[@content-desc="Número de Ticket"]   ${numero_rotativo}
     Go Back
     Click element              xpath=//android.widget.TextView[@text='Mostrar resultados']
     Wait until page contains   Soporte  10s
     Wait until page contains   ${numero_rotativo}    10s
     Sleep                      2s
     Click element              xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.widget.Button[4]/android.view.ViewGroup[1]/android.view.ViewGroup
     Wait until page contains   Detalle de Ticket     10s
     Wait until page contains   ${asuntoanulacion}   10s
     Wait until page contains   ${asuntoanulacion}    10s
     Swipe                      39  1558  47  736
     Capture Page Screenshot    ${TEST NAME}.png
     Close Application