
*** Settings ***

Documentation       Usuario ingresa credenciales inválidas.
Library             AppiumLibrary
Resource            ../../../resources/keywords.robot
Resource            ../../../resources/variables.robot

*** Test Cases ***

Usuario no valido

     # Conectar dispositivo
     Conectar dispositivo
     # Esperar 2 segundos
     Sleep                      2s
     # Ingresar credenciales inválidas
     Input text                 xpath=//android.widget.EditText[@content-desc="Ingresa tu email"]                       ${usuario-no-valido}
     Input text                 xpath=//android.widget.EditText[@content-desc="Contraseña"]                             ${contraseña-valida}
     # Hacer clic en el botón de inicio de sesión
     Click element              xpath=//android.widget.TextView[@text='Iniciar sesión']
     # Esperar hasta que la página contenga el mensaje de error
     Wait until page contains   Email o Contraseña incorrecto    10s
     # Capturar una captura de pantalla
     Capture Page Screenshot    ${TEST NAME}.png

Contraseña no valida

     # Limpiar campos de texto
     Clear text                 xpath=//android.widget.EditText[@content-desc="Ingresa tu email"]
     Clear text                 xpath=//android.widget.EditText[@content-desc="Contraseña"]
     # Ingresar credenciales inválidas
     Input text                 xpath=//android.widget.EditText[@content-desc="Ingresa tu email"]                       ${usuario-valido}
     Input text                 xpath=//android.widget.EditText[@content-desc="Contraseña"]                             ${contraseña-no-valida}
     # Hacer clic en el botón de inicio de sesión
     Click element              xpath=//android.widget.TextView[@text='Iniciar sesión']
     # Esperar hasta que la página contenga el mensaje de error
     Wait until page contains   Email o Contraseña incorrecto    10s
     # Capturar una captura de pantalla
     Capture Page Screenshot    ${TEST NAME}.png

Formato del correo no valido
     # Limpiar campos de texto
     Clear text                 xpath=//android.widget.EditText[@content-desc="Ingresa tu email"]
     Clear text                 xpath=//android.widget.EditText[@content-desc="Contraseña"]
     Input text                 xpath=//android.widget.EditText[@content-desc="Ingresa tu email"]                       ${formato-invalido}
     # Esperar hasta que la página contenga el mensaje
     Wait until page contains   El formato del email es incorrecto    10s
     # Capturar una captura de pantalla
     Capture Page Screenshot    ${TEST NAME}.png
     # Cerrar la aplicación
     Close Application