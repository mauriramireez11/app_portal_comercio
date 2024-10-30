# Prueba automatizada para la App del PORTAL DE COMERCIOS para android V. 1.0.0
# Tester : Miguel Angel Esquivel Rios

*** Settings ***

Documentation       Funcionalidad del retroceso de pagina.
Library             AppiumLibrary
Resource            ../../../resources/keywords.robot
Resource            ../../../resources/variables.robot

*** Test Cases ***

Retroceso con flechita

     Conectar dispositivo
     Wait until page contains   ¿Olvidaste tu contraseña?   10s
     Click element              xpath=//android.widget.TextView[@text="¿Olvidaste tu contraseña?"]
     Wait until page contains   Recuperar acceso  10s
     Click element              xpath=//com.horcrux.svg.b
     Capture Page Screenshot    ${TEST NAME}.png
     Wait until page contains   ¡Bienvenido!      10s

Retroceso con inicio de sesion

     Wait until page contains   ¡Bienvenido!      10s
     Wait until page contains   ¿Olvidaste tu contraseña?   10s
     Click element              xpath=//android.widget.TextView[@text="¿Olvidaste tu contraseña?"]
     Wait until page contains   Recuperar acceso  10s
     Click element              xpath=//android.widget.TextView[@text="Iniciar sesión"]
     Capture Page Screenshot    ${TEST NAME}.png
     Wait until page contains   ¡Bienvenido!      10s
     Close Application

