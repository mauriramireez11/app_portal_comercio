
*** Settings ***

Documentation       Funcionalidad de retroceso de pantalla.
Library             AppiumLibrary
Resource            ../../../resources/keywords.robot
Resource            ../../../resources/variables.robot

*** Test Cases ***

Funcionalidad de retroceso

     Conectar dispositivo
     Sleep                      2s
     Input text                 xpath=//android.widget.EditText[@content-desc="Ingresa tu email"]                       ${usuario-valido}
     Input text                 xpath=//android.widget.EditText[@content-desc="Contraseña"]                             ${contraseña-valida}
     Sleep                      1s
     Click element              xpath=//android.widget.TextView[@text="Iniciar sesión"]
     Wait until page contains   Ingreso con huella o reconocimiento facial   10s
     Click element              Xpath=//android.view.ViewGroup[@content-desc="Más tarde"]
     Wait until page contains   Resumen diario   10s
     Click Element At Coordinates    753    2101
     Wait until page contains   ¿En qué podemos ayudarle?  10s
     Click element              xpath=//android.widget.TextView[@text='Anulación']
     Wait until page contains   Describa el incidente  10s
     Click element              xpath=//com.horcrux.svg.b
     Wait until page contains   ¿En qué podemos ayudarle?  10s
     #Click Element              xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.widget.Button[8]/android.view.ViewGroup[1]
     Capture Page Screenshot    ${TEST NAME}.png
     Close Application
