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
${EMAIL_INPUT}              class=android.widget.EditText
${SEND_RECOVERY_BUTTON}     android=new UiSelector().text("Enviar recuperaciòn")

# Selectores de respaldo usando xpath
${FORGOT_PASSWORD_XPATH}     xpath=//android.widget.TextView[@text="¿Olvidaste tu contraseña?"]
${EMAIL_INPUT_XPATH}        xpath=//android.widget.EditText
${SEND_RECOVERY_XPATH}      xpath=//android.widget.TextView[@text="Enviar recuperaciòn"]

# Textos y mensajes
${RECOVERY_TITLE}          Recuperar acceso
${INVALID_EMAIL_ERROR}      El formato del email es incorrecto
${SUCCESS_MESSAGE}         Revisa tu casilla de correo para continuar
${TIMEOUT}                 10s

*** Keywords ***
Click Element Safe
    [Arguments]    ${primary_locator}    ${backup_locator}
    Wait Until Keyword Succeeds    3x    2s    Run Keyword And Return Status
    ...    Run Keywords
    ...    Wait Until Element Is Visible    ${primary_locator}    5s
    ...    AND    Click Element    ${primary_locator}
    ...    ELSE    Run Keywords
    ...    Wait Until Element Is Visible    ${backup_locator}    5s
    ...    AND    Click Element    ${backup_locator}

Input Text Safe
    [Arguments]    ${primary_locator}    ${backup_locator}    ${text}
    Wait Until Keyword Succeeds    3x    2s    Run Keyword And Return Status
    ...    Run Keywords
    ...    Wait Until Element Is Visible    ${primary_locator}    5s
    ...    AND    Input Text    ${primary_locator}    ${text}
    ...    ELSE    Run Keywords
    ...    Wait Until Element Is Visible    ${backup_locator}    5s
    ...    AND    Input Text    ${backup_locator}    ${text}

*** Test Cases ***
Formato de correo no valido
    [Documentation]    Verifica que se muestre un mensaje de error cuando se ingresa un email con formato inválido
    
    # Iniciar la aplicación
    Conectar dispositivo
    
    # Navegar a la pantalla de recuperación
    Wait Until Element Is Visible    ${FORGOT_PASSWORD_BUTTON}    ${TIMEOUT}
    Click Element    ${FORGOT_PASSWORD_BUTTON}
    
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
    
    # Ingresar email válido (sobrescribirá cualquier texto existente)
    Wait Until Element Is Visible    ${EMAIL_INPUT}    ${TIMEOUT}
    Input Text    ${EMAIL_INPUT}    ${reseteo-de-correo}
    
    # Enviar solicitud de recuperación
    Wait Until Element Is Visible    ${SEND_RECOVERY_BUTTON}    ${TIMEOUT}
    Click Element    ${SEND_RECOVERY_BUTTON}
    
    # Verificar mensaje de confirmación
    Wait Until Page Contains    ${SUCCESS_MESSAGE}    ${TIMEOUT}
    Capture Page Screenshot    ${TEST NAME}.png
    [Teardown]    Close Application