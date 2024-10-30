
*** Settings ***

Documentation       Funcionalidad de campos requeridos en el formulario.
Library             AppiumLibrary
Resource            ../../../resources/keywords.robot
Resource            ../../../resources/variables.robot

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

Validacion Resumen del dia - Abierto

     Click Element At Coordinates    753    2101
     Wait until page contains   ¿En qué podemos ayudarle?  10s
     Wait until page contains   Soporte   10s
     Click Element              xpath=//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/com.horcrux.svg.SvgView
     Wait Until Page Contains   Filtrar Resultados   10s
     Click element              xpath=//android.widget.TextView[@resource-id="android:id/text1"]
     Sleep                      1s
     Click element              xpath=//android.widget.CheckedTextView[@resource-id="android:id/text1" and @text="Abierto"]
     Click Element              xpath=//android.widget.Button[@content-desc="Resumen del día"]/android.view.ViewGroup
     Click Element              xpath=//android.widget.TextView[@text="Mostrar resultados"]
     Wait Until Page Contains   Resumen del día   10s
     Sleep                      2s
     Capture Page Screenshot    ${TEST NAME}.png

Validacion Esta semana - Abierto
     Wait until page contains   ¿En qué podemos ayudarle?  10s
     Wait until page contains   Soporte   10s
     Click Element              xpath=//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/com.horcrux.svg.SvgView
     Wait Until Page Contains   Filtrar Resultados   10s
     Click element              xpath=//android.widget.TextView[@resource-id="android:id/text1"]
     Sleep                      1s
     Click element              xpath=//android.widget.CheckedTextView[@resource-id="android:id/text1" and @text="Abierto"]
     Click Element              xpath=//android.widget.Button[@content-desc="Esta semana"]/android.view.ViewGroup
     Click Element              xpath=//android.widget.TextView[@text="Mostrar resultados"]
     Wait Until Page Contains   Esta semana  10s
     Sleep                      2s
     Capture Page Screenshot    ${TEST NAME}.png

Validacion Este mes - Abierto
     Wait until page contains   ¿En qué podemos ayudarle?  10s
     Wait until page contains   Soporte   10s
     Click Element              xpath=//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/com.horcrux.svg.SvgView
     Wait Until Page Contains   Filtrar Resultados   10s
     Click element              xpath=//android.widget.TextView[@resource-id="android:id/text1"]
     Sleep                      1s
     Click element              xpath=//android.widget.CheckedTextView[@resource-id="android:id/text1" and @text="Abierto"]
     Click Element              xpath=//android.widget.Button[@content-desc="Este mes"]/android.view.ViewGroup
     Click Element              xpath=//android.widget.TextView[@text="Mostrar resultados"]
     Wait Until Page Contains   Este mes  10s
     Sleep                      2s
     Capture Page Screenshot    ${TEST NAME}.png

 Validacion Mes anterior - Abierto
     Wait until page contains   ¿En qué podemos ayudarle?  10s
     Wait until page contains   Soporte   10s
     Click Element              xpath=//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/com.horcrux.svg.SvgView
     Wait Until Page Contains   Filtrar Resultados   10s
     Click element              xpath=//android.widget.TextView[@resource-id="android:id/text1"]
     Sleep                      1s
     Click element              xpath=//android.widget.CheckedTextView[@resource-id="android:id/text1" and @text="Abierto"]
     Click Element              xpath=//android.widget.Button[@content-desc="Mes anterior"]/android.view.ViewGroup
     Click Element              xpath=//android.widget.TextView[@text="Mostrar resultados"]
     Wait Until Page Contains   Mes anterior  10s
     Sleep                      2s
     Capture Page Screenshot    ${TEST NAME}.png

     Close Application