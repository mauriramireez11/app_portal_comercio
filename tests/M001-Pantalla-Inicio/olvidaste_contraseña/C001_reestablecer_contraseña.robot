# Prueba automatizada para la App del Portal de comercios para dispositivos Android.
# Tester: Miguel Angel Esquivel Rios

*** Settings ***
Documentation       Confirmar que el usuario pueda solicitar un reseteo de contraseña y que el proceso se complete correctamente.
Library             AppiumLibrary
Resource            ../../../resources/keywords.robot
Resource            ../../../resources/variables.robot

*** Variables ***
${FORGOT_PASSWORD_LINK}      xpath=//android.widget.TextView[@text="¿Olvidaste tu contraseña?"]
${EMAIL_INPUT}              xpath=//android.widget.EditText[@text="Ingresa tu email"]
${SEND_RECOVERY_BUTTON}     xpath=//android.widget.TextView[@text="Enviar recuperación"]
${INVALID_EMAIL_ERROR}      El formato del email es incorrecto
${RECOVERY_TITLE}          Recuperar acceso
${SUCCESS_MESSAGE}         Revisa tu casilla de correo para continuar
${TIMEOUT}                 10s

*** Test Cases ***
Formato de correo no valido
    [Documentation]    Verifica que se muestre un mensaje de error cuando se ingresa un email con formato inválido
    
    # Iniciar la aplicación
    Conectar dispositivo
    
    # Navegar a la pantalla de recuperación
    Wait Until Element Is Visible    ${FORGOT_PASSWORD_LINK}    ${TIMEOUT}
    Click Element    ${FORGOT_PASSWORD_LINK}
    
    # Verificar que estamos en la pantalla correcta
    Wait Until Page Contains    ${RECOVERY_TITLE}    ${TIMEOUT}
    
    # Ingresar email con formato inválido
    Wait Until Element Is Visible    ${EMAIL_INPUT}    ${TIMEOUT}
    Input Text    ${EMAIL_INPUT}    ${formato-invalido}
    
    # Verificar mensaje de error
    Wait Until Page Contains    ${INVALID_EMAIL_ERROR}    ${TIMEOUT}
    Capture Page Screenshot    ${TEST NAME}.png

Reseteo exitoso
    [Documentation]    Verifica que se pueda solicitar un reseteo de contraseña con un email válido
    
    # Verificar que seguimos en la pantalla de recuperación
    Wait Until Page Contains    ${RECOVERY_TITLE}    ${TIMEOUT}
    
    # Limpiar el campo de email anterior e ingresar email válido
    ${previous_email_present}=    Run Keyword And Return Status    
    ...    Wait Until Element Is Visible    xpath=//android.widget.EditText[@text="miguelesquivel"]    5s
    Run Keyword If    ${previous_email_present}    Clear Text    xpath=//android.widget.EditText[@text="miguelesquivel"]
    
    # Ingresar email válido
    Wait Until Element Is Visible    ${EMAIL_INPUT}    ${TIMEOUT}
    Input Text    ${EMAIL_INPUT}    ${reseteo-de-correo}
    
    # Enviar solicitud de recuperación
    Wait Until Element Is Visible    ${SEND_RECOVERY_BUTTON}    ${TIMEOUT}
    Click Element    ${SEND_RECOVERY_BUTTON}
    
    # Verificar mensaje de confirmación
    Wait Until Page Contains    ${SUCCESS_MESSAGE}    ${TIMEOUT}
    Capture Page Screenshot    ${TEST NAME}.png
    [Teardown]    Close Application

*** Keywords ***
Verificar Pantalla Recuperacion
    [Documentation]    Verifica que estamos en la pantalla de recuperación de contraseña
    Wait Until Page Contains    ${RECOVERY_TITLE}    ${TIMEOUT}