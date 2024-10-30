# Prueba automatizada para la App del Portal de comercios para dispositivos android.
# Tester : Miguel Angel Esquivel Rios

*** Settings ***

Documentation       Funcionalidad de la pagina de
Library             AppiumLibrary
Resource            ../../resources/keywords.robot
Resource            ../../resources/variables.robot

*** Test Cases ***

Ingreso a la pantalla de inicio

     Conectar dispositivo
     Sleep                      2s
     Input text                 xpath=//android.widget.EditText[@content-desc="Ingresa tu email"]                       ${usuario-valido}
     Input text                 xpath=//android.widget.EditText[@content-desc="Contraseña"]                             ${contraseña-valida}
     Sleep                      1s
     Click element              xpath=//android.widget.TextView[@text="Iniciar sesión"]
     Wait until page contains   Ingreso con huella o reconocimiento facial   10s
     Click element              Xpath=//android.view.ViewGroup[@content-desc="Más tarde"]
     Wait until page contains   Resumen diario   10s
     #Click Element              xpath=//android.widget.Button[@content-desc="Elegí tu sucursal, Todas las sucursales"]
     Sleep                      2s
     #Click Element At Coordinates    490    1366
     Sleep                      2s
Verificación de redirección a QR Estático

     Sleep                      1s
     Wait until page contains   Resumen diario    10s
     Wait until page contains   Ver movimientos   10s
     Swipe By Percent           50    65    0    0  900
     Sleep                      3s
     Wait until page contains   Vendé con QR Estático  10s
     Click element              xpath=//android.widget.TextView[@text="Vendé con QR Estático"]
     Wait until page contains   Vendé con QR estático  10s
     Wait until page contains   Descargar o compartir  10s
     Capture Page Screenshot    ${TEST NAME}.png


