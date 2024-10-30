# Prueba automatizada para la App del Portal de comercios para dispositivos Android.
# Tester: Miguel Angel Esquivel Rios
*** Settings ***

Documentation       Funcionalidad del bloqueo de la cuenta por intentos fallidos.
Library             AppiumLibrary
Resource            ../../../resources/keywords.robot
Resource            ../../../resources/variables.robot

*** Test Cases ***

Primer intento

     Conectar dispositivo
     Sleep                      2s
     Input text                 xpath=//android.widget.EditText[@content-desc="Ingresa tu email"]                       ${correo-de-prueba}
     Input text                 xpath=//android.widget.EditText[@content-desc="Contraseña"]                             ${contraseña-no-valida}
     Click element              xpath=//android.widget.TextView[@text='Iniciar sesión']
     Wait until page contains   Email o Contraseña incorrecto    10s
     Capture Page Screenshot    ${TEST NAME}.png

Segundo intento

     Clear text                 xpath=//android.widget.EditText[@content-desc="Ingresa tu email"]
     Clear text                 xpath=//android.widget.EditText[@content-desc="Contraseña"]
     Input text                 xpath=//android.widget.EditText[@content-desc="Ingresa tu email"]                       ${correo-de-prueba}
     Input text                 xpath=//android.widget.EditText[@content-desc="Contraseña"]                             ${contraseña-no-valida}
     Click element              xpath=//android.widget.TextView[@text='Iniciar sesión']
     Wait until page contains   Email o Contraseña incorrecto    10s
     Capture Page Screenshot    ${TEST NAME}.png

Tercer intento

     Clear text                 xpath=//android.widget.EditText[@content-desc="Ingresa tu email"]
     Clear text                 xpath=//android.widget.EditText[@content-desc="Contraseña"]
     Input text                 xpath=//android.widget.EditText[@content-desc="Ingresa tu email"]                       ${correo-de-prueba}
     Input text                 xpath=//android.widget.EditText[@content-desc="Contraseña"]                             ${contraseña-no-valida}
     Click element              xpath=//android.widget.TextView[@text='Iniciar sesión']
     Wait until page contains   Email o Contraseña incorrecto    10s
     Capture Page Screenshot    ${TEST NAME}.png

Cuarto intento

     Clear text                 xpath=//android.widget.EditText[@content-desc="Ingresa tu email"]
     Clear text                 xpath=//android.widget.EditText[@content-desc="Contraseña"]
     Input text                 xpath=//android.widget.EditText[@content-desc="Ingresa tu email"]                       ${correo-de-prueba}
     Input text                 xpath=//android.widget.EditText[@content-desc="Contraseña"]                             ${contraseña-no-valida}
     Click element              xpath=//android.widget.TextView[@text='Iniciar sesión']
     Wait until page contains   Credenciales inválidas, un nuevo intento fallido bloqueará la cuenta   10s
     Capture Page Screenshot    ${TEST NAME}.png

Quinto intento

     Clear text                 xpath=//android.widget.EditText[@content-desc="Ingresa tu email"]
     Clear text                 xpath=//android.widget.EditText[@content-desc="Contraseña"]
     Input text                 xpath=//android.widget.EditText[@content-desc="Ingresa tu email"]                       ${correo-de-prueba}
     Input text                 xpath=//android.widget.EditText[@content-desc="Contraseña"]                             ${contraseña-no-valida}
     Click element              xpath=//android.widget.TextView[@text='Iniciar sesión']
     Wait until page contains   Cuenta temporalmente bloqueada, contacta a soporte comercial   10s
     Capture Page Screenshot    ${TEST NAME}.png
     Close Application

