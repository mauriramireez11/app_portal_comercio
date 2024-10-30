
*** Settings ***

Documentation       Funcionalidad de eliminar usuario.
Library             AppiumLibrary
Resource            ../../resources/keywords.robot
Resource            ../../resources/variables.robot

*** Test Cases ***

Funcionalidad de retroceso al crear usuario

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
     #Click element              xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]
     Click Element At Coordinates    934    2169
     Wait until page contains   Resumen de usuarios   10s
     Click element              xpath=//android.widget.TextView[@text='Agregar nuevo usuario']
     Wait until page contains   Configuración         10s
     Click element              xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.widget.LinearLayout/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.Button/android.view.ViewGroup
     Sleep                      2s

Funcionalidad de retroceso al editar usuario

     Click element              xpath=//android.widget.EditText[@content-desc="Buscar por email"]
     Input text                 xpath=//android.widget.EditText[@content-desc="Buscar por email"]      ${emailexistente}
     Go back
     Sleep                      1s
     Wait until page contains   Marcelo      10s
     Wait until page contains   ${emailexistente}    10s
     Click Element              xpath=//android.widget.TextView[@text='Agregar nuevo usuario']
     Click element              xpath=//com.horcrux.svg.b
     Wait until page contains   Resumen de usuarios            10s
     #Click element              xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.widget.LinearLayout/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.Button/android.view.ViewGroup
     Sleep                      1s