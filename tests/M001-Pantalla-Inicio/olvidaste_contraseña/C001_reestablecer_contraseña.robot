# Prueba automatizada para la App del Portal de comercios para dispositivos Android.
# Tester: Miguel Angel Esquivel Rios

*** Settings ***
Documentation       Confirmar que el usuario pueda solicitar un reseteo de contraseña y que el proceso se complete correctamente.
Library             AppiumLibrary
Resource            ../../../resources/keywords.robot
Resource            ../../../resources/variables.robot

*** Variables ***
# Selectores principales usando UiSelector
${FORGOT_PASSWORD_BUTTON}    android=new UiSelector().text("¿Olvidaste tu contraseña?")
${EMAIL_INPUT}              android=new UiSelector().text("Ingresa tu email")
${SEND_RECOVERY_BUTTON}     android=new UiSelector().text("Enviar recuperación")
${RECOVERY_TITLE_BUTTON}    android=new UiSelector().text("Recuperar acceso")

# Selectores de respaldo usando xpath
${FORGOT_PASSWORD_XPATH}     xpath=//android.widget.TextView[@text="¿Olvidaste tu contraseña?"]
${EMAIL_INPUT_XPATH}        xpath=//android.widget.EditText[@text="Ingresa tu email"]
${SEND_RECOVERY_XPATH}      xpath=//android.widget.TextView[@text="Enviar recuperación"]
${RECOVERY_TITLE_XPATH}     xpath=//android.widget.TextView[@text="Recuperar acceso"]

# Mensajes y timeouts
${INVALID_EMAIL_ERROR}      El formato del email es incorrecto
${RECOVERY_TITLE}          Recuperar acceso
${SUCCESS_MESSAGE}         Revisa tu casilla de correo para continuar
${TIMEOUT}                 10s

*** Keywords ***
Click Element Safe
    [Arguments]    ${primary_locator}    ${backup_locator}
    Wait Until Keyword Succeeds    3x    2s
    ...    Run Keywords
    ...    Wait Until Element Is Visible    ${primary_locator}    5s    AND
    ...    Click Element    ${primary_locator}
    ...    ELSE
    ...    Run Keywords
    ...    Wait Until Element Is Visible    ${backup_locator}    5s    AND
    ...    Click Element    ${backup_locator}

Input Text Safe
    [Arguments]    ${primary_locator}    ${backup_locator}    ${text}
    Wait Until Keyword Succeeds    3x    2s
    ...    Run Keywords
    ...    Wait Until Element Is Visible    ${primary_locator}    5s    AND
    ...    Input Text    ${primary_locator}    ${text}
    ...    ELSE
    ...    Run Keywords
    ...    Wait Until Element Is Visible    ${backup_locator}    5s    AND
    ...    Input Text    ${backup_locator}    ${text}

*** Test Cases ***
Formato de correo no valido
    [Documentation]    Verifica que se muestre un mensaje de error cuando se ingresa un email con formato inválido
    
    # Iniciar la aplicación
    Conectar dispositivo
    
    # Navegar a la pantalla de recuperación
    Click Element Safe    ${FORGOT_PASSWORD_BUTTON}    ${FORGOT_PASSWORD_XPATH}
    
    # Verificar que estamos en la pantalla correcta
    Wait Until Page Contains    ${RECOVERY_TITLE}    ${TIMEOUT}
    
    # Ingresar email con formato inválido
    Input Text Safe    ${EMAIL_INPUT}    ${EMAIL_INPUT_XPATH}    ${formato-invalido}
    
    # Verificar mensaje de error
    Wait Until Page Contains    ${INVALID_EMAIL_ERROR}    ${TIMEOUT}
    Capture Page Screenshot    ${TEST NAME}.png

Reseteo exitoso
    [Documentation]    Verifica que se pueda solicitar un reseteo de contraseña con un email válido
    
    # Verificar que seguimos en la pantalla de recuperación
    Wait Until Page Contains    ${RECOVERY_TITLE}    ${TIMEOUT}
    
    # Ingresar email válido (sobrescribirá cualquier texto existente)
    Input Text Safe    ${EMAIL_INPUT}    ${EMAIL_INPUT_XPATH}    ${reseteo-de-correo}
    
    # Enviar solicitud de recuperación
    Click Element Safe    ${SEND_RECOVERY_BUTTON}    ${SEND_RECOVERY_XPATH}
    
    # Verificar mensaje de confirmación
    Wait Until Page Contains    ${SUCCESS_MESSAGE}    ${TIMEOUT}
    Capture Page Screenshot    ${TEST NAME}.png
    [Teardown]    Close Application
