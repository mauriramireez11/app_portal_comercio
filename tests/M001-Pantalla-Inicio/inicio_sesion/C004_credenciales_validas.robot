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
    
    # Esperar a que los campos de entrada estén presentes antes de intentar escribir
    Wait Until Element Is Visible    xpath=//android.widget.EditText[@content-desc="Ingresa tu email"]    10s
    Input text    xpath=//android.widget.EditText[@content-desc="Ingresa tu email"]    ${usuario-valido}
    
    Wait Until Element Is Visible    xpath=//android.widget.EditText[@content-desc="Contraseña"]    10s
    Input text    xpath=//android.widget.EditText[@content-desc="Contraseña"]    ${contraseña-valida}
    
    # Esperar a que el botón sea clickeable
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="Iniciar sesión"]    10s
    Click element    xpath=//android.widget.TextView[@text="Iniciar sesión"]
    
    # La lógica de la huella está bien implementada
    Wait until page contains element    xpath=//*[contains(@text, 'huella') or contains(@text, 'Resumen diario')]    25s
    ${biometric_present}=    Run Keyword And Return Status    Page Should Contain Element    xpath=//*[contains(@text, 'huella')]
    
    Run Keyword If    ${biometric_present}    Run Keywords
    ...    Wait Until Element Is Visible    xpath=//android.view.ViewGroup[@content-desc="Más tarde"]    10s    AND
    ...    Click element    xpath=//android.view.ViewGroup[@content-desc="Más tarde"]
    
    # Verificación final
    Wait until page contains    Resumen diario    25s
    Capture Page Screenshot    ${TEST NAME}.png                        # Espera 1 segundo

Cerrar sesion
    # Verificar que estamos en la pantalla correcta antes de empezar
    Wait Until Page Contains    Resumen diario    10s
    
    # Esperar y hacer click en el botón de menú
    Wait Until Element Is Visible    xpath=//android.widget.Button[contains(@content-desc, "Menú")]    10s
    Click Element    xpath=//android.widget.Button[contains(@content-desc, "Menú")]
    
    # Esperar y hacer click en Cerrar sesión
    Wait Until Element Is Visible    xpath=//*[contains(@text, "Cerrar sesión")]    10s
    Click Element    xpath=//*[contains(@text, "Cerrar sesión")]
    
    # Verificar que el cierre de sesión fue exitoso
    Wait Until Page Contains    ¡Bienvenido!    10s
    Capture Page Screenshot    ${TEST NAME}.png
    
    # Cerrar la aplicación
    Close Application