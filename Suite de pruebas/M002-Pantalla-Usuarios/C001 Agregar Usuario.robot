
*** Settings ***

Documentation       Funcionalidad del registro nuevo de usuario.
Library             AppiumLibrary
Resource            ../../resources/keywords.robot
Resource            ../../resources/variables.robot

*** Test Cases ***

Validacion celular del usuario

     # Ingreso a la pantalla de usuarios
     Conectar dispositivo
     Sleep                      2s
     Input text                 xpath=//android.widget.EditText[@content-desc="Ingresa tu email"]                       ${usuario-valido}
     Input text                 xpath=//android.widget.EditText[@content-desc="Contraseña"]                             ${contraseña-valida}
     Sleep                      1s
     Click element              xpath=//android.widget.TextView[@text="Iniciar sesión"]
     Wait until page contains   Ingreso con huella o reconocimiento facial   10s
     Click element              Xpath=//android.view.ViewGroup[@content-desc="Más tarde"]
     Wait until page contains   Resumen diario   10s
     Sleep                      1s
     #Click element              xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]
     Click Element At Coordinates    945    2121
     Wait until page contains   Resumen de usuarios   10s
     Sleep                      1s
     Capture Page Screenshot    CantidadDeUsuarios.png
     # Ingreso datos del usuario
     Sleep                      1s
     Click element              xpath=//android.widget.TextView[@text='Agregar nuevo usuario']
     Wait until page contains   Configuración   10s
     Click element              xpath=//android.widget.EditText[@content-desc="Nombre"]
     Input text                 xpath=//android.widget.EditText[@content-desc="Nombre"]             ${nombre}
     Click element              xpath=//android.widget.EditText[@content-desc="Apellido"]
     Input text                 xpath=//android.widget.EditText[@content-desc="Apellido"]           ${apelliedo}
     Click element              xpath=//android.widget.EditText[@content-desc="Teléfono celular"]
     Input text                 xpath=//android.widget.EditText[@content-desc="Teléfono celular"]   ${celularexistente}
     Sleep                      1s
     Click element              xpath=//android.widget.EditText[@content-desc="Email"]
     Input text                 xpath=//android.widget.EditText[@content-desc="Email"]              ${emailexistente}
     Sleep                      1s
     Go back
     Swipe                      301  1631  301  1984
     Sleep                      2s
     Click element              xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.widget.Button
     Sleep                      1s
     Click element              xpath=/hierarchy/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.RelativeLayout/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.NumberPicker[1]/android.widget.EditText
     # Selecciona el año
     Swipe                      749  1652  736  1833  #2008
     Swipe                      749  1652  736  1833  #2007
     Swipe                      749  1652  736  1833  #2006
     Swipe                      749  1652  736  1833  #2005

     # Selecciona el mes
     Swipe                      486  1984  491  1790  #febrero
     Swipe                      486  1984  491  1790  #marzo
     Swipe                      486  1984  491  1790  #abril
     # Selecciona el dia
     Swipe                      305  1639  297  1824  #14
     Swipe                      305  1639  297  1824  #13
     Sleep                      1s
     Click element              xpath=//android.widget.Button[@resource-id="android:id/button1"]
     # Selecciona el genero
     Click element              xpath=//android.widget.Spinner
     Sleep                      1s
     Click element              xpath=//android.widget.CheckedTextView[@resource-id="android:id/text1" and @text="Masculino"]
     Wait until page contains   Usuario  10s
     # Selecciona el rol
     Click element              xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.widget.Button[2]/android.widget.TextView
     Swipe                      34  1596  26  723  #1
     Swipe                      34  1596  26  723  #1
     Swipe                      34  1596  26  723  #1
     Swipe                      34  1596  26  723  #1
     Swipe                      34  1596  26  723  #1
     Swipe                      34  1596  26  723  #1
     Swipe                      34  1596  26  723  #1
     Swipe                      34  1596  26  723  #1
     Click element              xpath=//android.widget.TextView[@text='Guardar usuario']
     Wait until page contains   El celular ya está registrado   30s
     Capture Page Screenshot    ${TEST NAME}.png
     Sleep                      1s

Validacion correo del usuario

     Wait until page contains   Usuario   10s
     Sleep                      1s
     Click element              xpath=//android.widget.EditText[@content-desc="Teléfono celular"]
     Input text                 xpath=//android.widget.EditText[@content-desc="Teléfono celular"]   ${celularnuevo}
     Go Back
     Swipe                      34  1596  26  723  #1
     Swipe                      34  1596  26  723  #1
     Swipe                      34  1596  26  723  #1
     Swipe                      34  1596  26  723  #1
     Swipe                      34  1596  26  723  #1
     Swipe                      34  1596  26  723  #1
     Swipe                      34  1596  26  723  #1
     Swipe                      34  1596  26  723  #1
     Click element              xpath=//android.widget.TextView[@text='Guardar usuario']
     Sleep                      1s
     Wait until page contains   El email ya está registrado   30s
     Capture Page Screenshot    ${TEST NAME}.png
     Sleep                      1s

Registro exitoso de usuario

     Wait until page contains   Usuario   10s
     Click element              xpath=//android.widget.EditText[@content-desc="Email"]
     Input text                 xpath=//android.widget.EditText[@content-desc="Email"]              ${emailnuevo}
     Sleep                      1s
     Go Back
     Swipe                      34  1596  26  723  #1
     Swipe                      34  1596  26  723  #1
     Swipe                      34  1596  26  723  #1
     Swipe                      34  1596  26  723  #1
     Swipe                      34  1596  26  723  #1
     Swipe                      34  1596  26  723  #1
     Swipe                      34  1596  26  723  #1
     Swipe                      34  1596  26  723  #1
     Click element              xpath=//android.widget.TextView[@text='Guardar usuario']
     Sleep                      1s
     Wait until page contains   Se ha creado el usuario correctamente.   30s
     Capture Page Screenshot    ${TEST NAME}.png
     Sleep                      1s
     Capture Page Screenshot    CantidadUsuarioDespues.png
     Close Application