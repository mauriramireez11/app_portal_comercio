# Prueba automatizada para la App del PORTAL DE COMERCIOS
# Tester : Miguel Angel Esquivel Rios

*** Settings ***

Documentation       Funcionalidad de editar usuario.
Library             AppiumLibrary
Resource            ../../resources/keywords.robot
Resource            ../../resources/variables.robot

*** Test Cases ***

Busqueda de usuario no valida

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
     #Busqueda del usuario
     Sleep                      1s
     Click element              xpath=//android.widget.EditText[@content-desc="Buscar por email"]
     Input text                 xpath=//android.widget.EditText[@content-desc="Buscar por email"]      ${emailnuevo}
     Sleep                      1s
     Go back
     Wait until page contains   Alberto Lopez   10s
     Wait until page contains   ${emailnuevo}   10s
     Click element              xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.widget.ScrollView/android.view.ViewGroup/android.widget.Button/android.view.ViewGroup[1]/android.view.ViewGroup
     Wait until page contains   Mi cuenta       10s
     # Selecciona editar
     Wait until page contains   ${nombre}       10s
     Wait until page contains   ${apelliedo}    10s
     Wait until page contains   ${emailnuevo}   10s
     Swipe                      34  1596  26  723  #1
     Wait until page contains   SuperAdmin      10s
     Sleep                      1s
     Click element              xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.widget.LinearLayout/android.view.ViewGroup/android.view.ViewGroup[3]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup
     Sleep                      1s
     # Superadmin
     Click element              xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.widget.Button[1]/android.widget.TextView
     Swipe                      34  1596  26  723  #1
     Swipe                      34  1596  26  723  #1
     Swipe                      34  1596  26  723  #1
     Sleep                      1s
     Swipe                      34  1596  26  723  #1
     Swipe                      34  1596  26  723  #1
     Swipe                      34  1596  26  723  #1
     Swipe                      34  1596  26  723  #1
     Click element              xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.widget.Button[4]/android.widget.TextView
     Sleep                      1s
     Click element              xpath=//android.widget.TextView[@text='Guardar usuario']
     Wait until page contains   Modificación exitosa de los Roles.      10s
     Sleep                      1s
     Wait until page contains   Usuario transferencias     10s
     #Wait until page contains   SuperAdmin      10s
     Click element              xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.widget.LinearLayout/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.Button/android.view.ViewGroup
     Sleep                      1s
     Click element              xpath=//android.widget.EditText[@content-desc="Buscar por email"]
     Input text                 xpath=//android.widget.EditText[@content-desc="Buscar por email"]      ${emailnuevo}
     Go back
     Sleep                      1s
     Wait until page contains   Alberto Lopez   10s
     Wait until page contains   ${emailnuevo}   10s
     Click element              xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.widget.ScrollView/android.view.ViewGroup/android.widget.Button/android.view.ViewGroup[1]/android.view.ViewGroup
     Wait until page contains   Mi cuenta       10s
     # Selecciona editar
     Wait until page contains   ${nombre}       10s
     Wait until page contains   ${apelliedo}    10s
     Wait until page contains   ${emailnuevo}   10s
     Swipe                      34  1596  26  723  #1
     Wait until page contains   Usuario transferencias     10s
     Close Application

