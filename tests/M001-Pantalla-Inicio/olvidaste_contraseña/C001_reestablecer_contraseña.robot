# Prueba automatizada para la App del Portal de comercios para dispositivos Android.
# Tester: Miguel Angel Esquivel Rios

*** Settings ***
Documentation       Confirmar que el usuario pueda solicitar un reseteo de contraseña y que el proceso se complete correctamente.
Library             AppiumLibrary
Resource            ../../../resources/keywords.robot
Resource            ../../../resources/variables.robot

*** Test Cases ***
Formato de correo no valido
    # Iniciar la aplicación
    Conectar dispositivo
    
    # Navegar a la pantalla de recuperación
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="¿Olvidaste tu contraseña?"]    10s
    Click Element    xpath=//android.widget.TextView[@text="¿Olvidaste tu contraseña?"]
    
    # Verificar que estamos en la pantalla correcta
    Wait Until Page Contains    Recuperar acceso    10s
    
    # Ingresar email con formato inválido
    Wait Until Element Is Visible    xpath=//android.widget.EditText[@text="Ingresa tu email"]    10s
    Input Text    xpath=//android.widget.EditText[@text="Ingresa tu email"]    ${formato-invalido}
    
    # Verificar mensaje de error
    Wait Until Page Contains    El formato del email es incorrecto    10s
    Capture Page Screenshot    ${TEST NAME}.png

Reseteo exitoso
    # Verificar que seguimos en la pantalla de recuperación
    Wait Until Page Contains    Recuperar acceso    10s
    
    # Limpiar el campo de email anterior
    Wait Until Element Is Visible    xpath=//android.widget.EditText[@text="miguelesquivel"]    10s
    Clear Text    xpath=//android.widget.EditText[@text="miguelesquivel"]
    
    # Ingresar email válido
    Wait Until Element Is Visible    xpath=//android.widget.EditText[@text="Ingresa tu email"]    10s
    Input Text    xpath=//android.widget.EditText[@text="Ingresa tu email"]    ${reseteo-de-correo}
    
    # Enviar solicitud de recuperación
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="Enviar recuperación"]    10s
    Click Element    xpath=//android.widget.TextView[@text="Enviar recuperación"]
    
    # Verificar mensaje de confirmación
    Wait Until Page Contains    Revisa tu casilla de correo para continuar    10s
    Capture Page Screenshot    ${TEST NAME}.png
    Close Application