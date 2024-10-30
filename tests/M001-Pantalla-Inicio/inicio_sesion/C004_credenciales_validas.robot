# Prueba automatizada para la App del Portal de comercios para dispositivos Android.
# Tester: Miguel Angel Esquivel Rios

*** Settings ***

Documentation       Funcionalidad del inicio sesión con credenciales válidas.
Library             AppiumLibrary
Resource            ../../../resources/keywords.robot
Resource            ../../../resources/variables.robot

*** Test Cases ***

Inicio de sesion
    Conectar dispositivo
    Sleep    2s
    Input text    xpath=//android.widget.EditText[@content-desc="Ingresa tu email"]    ${usuario-valido}
    Input text    xpath=//android.widget.EditText[@content-desc="Contraseña"]    ${contraseña-valida}
    Sleep    1s
    Click element    xpath=//android.widget.TextView[@text="Iniciar sesión"]
    # Aumentamos el tiempo de espera y agregamos más opciones de texto a buscar
    Wait until page contains element    xpath=//*[contains(@text, 'huella') or contains(@text, 'Resumen diario')]    20s
    ${biometric_present}=    Run Keyword And Return Status    Page Should Contain Element    xpath=//*[contains(@text, 'huella')]
    Run Keyword If    ${biometric_present}    Click element    xpath=//android.view.ViewGroup[@content-desc="Más tarde"]
    Wait until page contains    Resumen diario    15s
    Capture Page Screenshot    ${TEST NAME}.png
    Sleep    1s

Cerrar sesion
    Wait until page contains    Resumen diario    10s
    # Simplificamos el xpath para el botón de menú
    Click element    xpath=//android.widget.Button[contains(@content-desc, "Menú")]
    Sleep    2s
    # Reemplazamos las coordenadas por un selector más robusto
    Click element    xpath=//*[contains(@text, "Cerrar sesión")]
    Wait until page contains    ¡Bienvenido!    10s
    Capture Page Screenshot    ${TEST NAME}.png
    Close Application