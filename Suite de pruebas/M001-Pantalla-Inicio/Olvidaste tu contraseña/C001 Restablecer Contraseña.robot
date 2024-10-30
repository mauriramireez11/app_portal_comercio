# Prueba automatizada para la App del Portal de comercios para dispositivos Android.
# Tester: Miguel Angel Esquivel Rios

*** Settings ***

Documentation       Confirmar que el usuario pueda solicitar un reseteo de contraseña y que el proceso se complete correctamente.
Library             AppiumLibrary
Resource            ../../../resources/keywords.robot
Resource            ../../../resources/variables.robot

*** Test Cases ***

Formato de correo no valido

     Conectar dispositivo
     Wait until page contains   ¿Olvidaste tu contraseña?   10s
     Click element              xpath=//android.widget.TextView[@text="¿Olvidaste tu contraseña?"]
     Wait until page contains   Recuperar acceso  10s
     Input text                 xpath=//android.widget.EditText[@text="Ingresa tu email"]       ${formato-invalido}
     Wait until page contains   El formato del email es incorrecto   10s
     Capture Page Screenshot    ${TEST NAME}.png

Reseteo exitoso

     Wait until page contains   Recuperar acceso  10s
     Clear text                 xpath=//android.widget.EditText[@text="miguelesquivel"]
     Input text                 xpath=//android.widget.EditText[@text="Ingresa tu email"]       ${reseteo-de-correo}
     Sleep                      2s
     Click element              xpath=//android.widget.TextView[@text="Enviar recuperación"]
     Wait until page contains   Revisa tu casilla de correo para continuar   10s
     Capture Page Screenshot    ${TEST NAME}.png
     Close Application

