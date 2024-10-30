
*** Settings ***

Documentation       Pruebas individuales que se centren en la validación de datos de cada campo del formulario.
Library             AppiumLibrary
Resource            ../../../../../resources/keywords.robot
Resource            ../../../../../resources/variables.robot

*** Test Cases ***

Pedido exitoso de cargador con adjunto

     Conectar dispositivo
     Sleep                      2s
     Input text                 xpath=//android.widget.EditText[@content-desc="Ingresa tu email"]                       ${usuario-valido}
     Input text                 xpath=//android.widget.EditText[@content-desc="Contraseña"]                             ${contraseña-valida}
     Sleep                      1s
     Click element              xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[3]
     Wait until page contains   Ingreso con huella o reconocimiento facial   10s
     Click element              Xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.widget.TextView
     Wait until page contains   Resumen diario   10s
     #Ingreso a la pantalla de soporte
     Click Element At Coordinates    753    2101
     Wait until page contains   ¿En qué podemos ayudarle?  10s
     Wait until page contains   Soporte   10s
     Click element              xpath=//android.widget.TextView[@text='Asistencia']
     #Selecciona asistencia POS
     Wait until page contains   Soporte   10s
     Click element              xpath=//android.widget.TextView[@text='POS']
     Click element              xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup
     Wait until page contains   Seleccione el tipo de soporte   10s
     Click element              xpath=//android.widget.TextView[@text='Solicitar Cargadores']
     Click element              xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup
     Wait until page contains   Soporte   10s
     #Validacion de campos requeridos
     Wait until page contains   Describa el incidente  10s
     #Validacion ingreso de asunto
     Wait until page contains   Soporte   10s
     Click element              xpath=//android.widget.EditText[@content-desc="Asunto"]
     Input text                 xpath=//android.widget.EditText[@content-desc="Asunto"]                ${asunto}
     Click Element              xpath=//android.widget.TextView[@text='Describa el incidente']
     Sleep                      2s
     #Validacion ingreso de sucursal
     Wait until page contains   Soporte   10s
     Sleep                      1s
     Click element              xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.widget.Button/android.view.ViewGroup[2]
     Sleep                      2s
     Click element              xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[3]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]
     Sleep                      2s
     Sleep                      3s
     #Click element              xpath=//android.widget.TextView[@text='Enviar solicitud de soporte']
     #Validacion ingreso de zona de envio
     Wait until page contains   Soporte   10s
     Click element              xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[3]/android.widget.Spinner/android.widget.TextView
     Sleep                      3s
     Click element              xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/androidx.appcompat.widget.LinearLayoutCompat/android.widget.FrameLayout/android.widget.ListView/android.widget.CheckedTextView[2]
     Sleep                      1s
     Click element              xpath=//android.widget.TextView[@text='Asunto']
     #Click element              xpath=//android.widget.TextView[@text='Enviar solicitud de soporte']
     #Validacion ingreso de direccion
     Wait until page contains   Soporte   10s
     Click element              xpath=//android.widget.EditText[@content-desc="Dirección"]
     Input text                 xpath=//android.widget.EditText[@content-desc="Dirección"]       ${direccion}
     Click element              xpath=//android.widget.TextView[@text='Asunto']
     Sleep                      1s
     Swipe                      39  1244  47  856
     #validacion ingreso de cantidad de bobinas
     Wait until page contains   Soporte   10s
     Click element              xpath=//android.widget.TextView[@text='Seleccione una opción']
     Sleep                      2s
     Click element              xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/androidx.appcompat.widget.LinearLayoutCompat/android.widget.FrameLayout/android.widget.ListView/android.widget.CheckedTextView[2]
     Click element              xpath=//android.widget.TextView[@text='Dirección']
     Sleep                      1s
     #validacion ingreso de horario de atencion
     Wait until page contains   Soporte   10s
     Click element              xpath=//android.widget.EditText[@content-desc="Horario de atención de tu comercio"]
     Input text                 xpath=//android.widget.EditText[@content-desc="Horario de atención de tu comercio"]     ${horario}
     Click element              xpath=//android.widget.TextView[@text='Dirección']
     Swipe                      39  1244  47  856
     Sleep                      2s
     #Validacion ingreso de telefono
     Wait until page contains   Soporte   10s
     Click element              xpath=//android.widget.EditText[@content-desc="Número de teléfono"]
     Input text                 xpath=//android.widget.EditText[@content-desc="Número de teléfono"]     ${telefono}
     Click element              xpath=//android.widget.TextView[@text='Cantidad']
     Swipe                      26  1484  43  951
     Sleep                      2s
     #Validacion ingreso de modelo de POS
     Wait until page contains   Soporte   10s
     Click element              xpath=//android.widget.TextView[@text='POS VERIFONE VX680']
     Sleep                      2s
     Click element              xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/androidx.appcompat.widget.LinearLayoutCompat/android.widget.FrameLayout/android.widget.ListView/android.widget.CheckedTextView[5]
     Sleep                      2s
     #Validacion ingreso de numero de serie del POS

     Wait until page contains   Soporte   10s
     Click element              xpath=//android.widget.EditText[@content-desc="Número de serie del equipo"]
     Input text                 xpath=//android.widget.EditText[@content-desc="Número de serie del equipo"]        ${serie}
     Sleep                      2s
     Click element              xpath=//android.widget.TextView[@text='Modelo de tu equipo']
     #Validacion ingreso de archivo adjunto
     Wait until page contains   Adjuntar archivos   10s
     Wait until page contains   Soporte   10s
     Swipe                      485  1602  288  938
     Click element              xpath=//android.widget.TextView[@text='Enviar solicitud de soporte']
     Wait until page contains   Solicitud enviada       70s
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
Captura el número de pedido y consulta

     Wait until page contains   Solicitud enviada       70s
     Click Element              xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.widget.TextView
     Sleep                      1s
     Click Element              xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[3]/android.view.ViewGroup/android.view.ViewGroup
     Click element              xpath=//android.widget.EditText[@content-desc="Número de Ticket"]
     Input text                 xpath=//android.widget.EditText[@content-desc="Número de Ticket"]   ${numero_rotativo}
     Go Back
     Click element              xpath=//android.widget.TextView[@text='Mostrar resultados']
     Wait until page contains   ${numero_rotativo}    10s
     Sleep                      2s
     Click element              xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.widget.Button[4]/android.view.ViewGroup[2]/android.widget.TextView
     Wait until page contains   Detalle de Ticket     10s
     Wait until page contains   ${asunto}             10s
     Wait until page contains   ${numero_rotativo}    10s
     Swipe                      39  1558  47  736
     Wait until page contains   ${horario}            10s
     Wait until page contains   ${telefono}           10s
     Wait until page contains   ${serie}              10s
     Capture Page Screenshot    ${TEST NAME}.png
     Close Application






