
*** Settings ***

Documentation       Funcionalidad de busqueda de usuario.
Library             AppiumLibrary
Resource            ../../resources/keywords.robot
Resource            ../../resources/variables.robot

*** Test Cases ***

Busqueda de usuario no valido

     #Ingreso a la pantalla de usuarios
     Conectar dispositivo
     Sleep                      2s
     Input text                 xpath=//android.widget.EditText[@content-desc="Ingresa tu email"]                       ${usuario-valido}
     Input text                 xpath=//android.widget.EditText[@content-desc="Contraseña"]                             ${contraseña-valida}
     Sleep                      1s
     Click element              xpath=//android.widget.TextView[@text="Iniciar sesión"]
     Wait until page contains   Ingreso con huella o reconocimiento facial   10s
     Click element              Xpath=//android.view.ViewGroup[@content-desc="Más tarde"]
     Wait until page contains   Resumen diario   10s
     Click Element At Coordinates    934    2169
     Wait until page contains   Resumen de usuarios   10s
     #Busqueda del usuario
     Sleep                      1s
     #Click al buscador
     Click element              xpath=//android.widget.EditText[@content-desc="Buscar por email"]
     Input text                 xpath=//android.widget.EditText[@content-desc="Buscar por email"]      antonio@gmail.com
     sleep                      2s
     Go back
     Capture Page Screenshot    ${TEST NAME}.png
     Sleep                      1s

Busqueda de usuario valido

     #Click al buscador
     Wait until page contains   Resumen de usuarios   10s
     Click element              xpath=//android.widget.EditText[@content-desc="Buscar por email"]
     Sleep                      1s
     Clear text                 xpath=//android.widget.EditText[@content-desc="Buscar por email"]
     Input text                 xpath=//android.widget.EditText[@content-desc="Buscar por email"]      ${emailexistente}
     Go back
     Sleep                      2s
     Wait until page contains   Marcelo   10s
     Wait until page contains   ${emailexistente}    10s
     Capture Page Screenshot    ${TEST NAME}.png
     Sleep                      1s

Busqueda de usuario creado

     Wait until page contains   Resumen de usuarios   10s
     Click element              xpath=//android.widget.EditText[@content-desc="Buscar por email"]
     Sleep                      1s
     Clear text                 xpath=//android.widget.EditText[@content-desc="Buscar por email"]
     Input text                 xpath=//android.widget.EditText[@content-desc="Buscar por email"]      ${emailnuevo}
     Go back
     Wait until page contains   Marcelo   10s
     Wait until page contains   ${emailnuevo}   10s
     Capture Page Screenshot    ${TEST NAME}.png
     Sleep                      1s
     Close Application
