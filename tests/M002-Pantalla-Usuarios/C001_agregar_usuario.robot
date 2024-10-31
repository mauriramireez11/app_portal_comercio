*** Settings ***
# Define la configuración básica del archivo de prueba
Documentation       Funcionalidad del registro nuevo de usuario.
Library             AppiumLibrary    # Biblioteca para automatización móvil
Resource            ../../resources/keywords.robot    # Importa keywords comunes
Resource            ../../resources/variables.robot   # Importa variables comunes

*** Variables ***
# Selectores para la pantalla de login
${EMAIL_INPUT}              xpath=//android.widget.EditText[@content-desc="Ingresa tu email"]    # Campo de email
${PASSWORD_INPUT}           xpath=//android.widget.EditText[@content-desc="Contraseña"]          # Campo de contraseña
${LOGIN_BUTTON}            xpath=//android.widget.TextView[@text="Iniciar sesión"]              # Botón de login
${BIOMETRIC_SKIP}          xpath=//android.view.ViewGroup[@content-desc="Más tarde"]            # Botón para saltar biometría

# Selectores para el formulario de usuario
${ADD_USER_BUTTON}         xpath=//android.widget.TextView[@text='Agregar nuevo usuario']       # Botón agregar usuario
${NAME_INPUT}              xpath=//android.widget.EditText[@content-desc="Nombre"]              # Campo nombre
${LASTNAME_INPUT}          xpath=//android.widget.EditText[@content-desc="Apellido"]            # Campo apellido
${PHONE_INPUT}             xpath=//android.widget.EditText[@content-desc="Teléfono celular"]    # Campo teléfono
${EMAIL_USER_INPUT}        xpath=//android.widget.EditText[@content-desc="Email"]               # Campo email
${DATE_BUTTON}             xpath=//android.widget.Button                                        # Botón fecha
${GENDER_SPINNER}          xpath=//android.widget.Spinner                                       # Selector género
${GENDER_MALE}             xpath=//android.widget.CheckedTextView[@text="Masculino"]            # Opción masculino
${SAVE_USER_BUTTON}        xpath=//android.widget.TextView[@text='Guardar usuario']             # Botón guardar

# Coordenadas para selección de fecha
${DATE_YEAR_COORDS}        749  1652  736  1833    # Coordenadas para swipe del año
${DATE_MONTH_COORDS}       486  1984  491  1790    # Coordenadas para swipe del mes
${DATE_DAY_COORDS}         305  1639  297  1824    # Coordenadas para swipe del día

# Configuración de tiempos de espera
${TIMEOUT}                 10s    # Timeout estándar
${LONG_TIMEOUT}           30s    # Timeout largo para operaciones que requieren más tiempo

# Selectores de navegación
${USERS_SECTION_X}    360    # Mitad del ancho (720/2)
${USERS_SECTION_Y}    954    # Punto medio del alto ((1510-399)/2 + 399)
${USERS_BUTTON}       xpath=//android.widget.TextView[@text="Usuarios" and @bounds="[0,399][720,1510]"]

*** Keywords ***
Login To App
    [Documentation]    Realiza el proceso de login en la aplicación
    Conectar dispositivo                           # Inicia la conexión con el dispositivo
    Sleep    2s                                    # Espera a que la app esté lista
    Input Text    ${EMAIL_INPUT}    ${usuario-valido}      # Ingresa el email
    Input Text    ${PASSWORD_INPUT}    ${contraseña-valida}    # Ingresa la contraseña
    Click Element    ${LOGIN_BUTTON}               # Click en iniciar sesión
    
    # Maneja la pantalla de biometría solo si aparece
    ${biometric_present}=    Run Keyword And Return Status    
    ...    Wait Until Page Contains    Ingreso con huella o reconocimiento facial    5s
    Run Keyword If    ${biometric_present}    Click Element    ${BIOMETRIC_SKIP}
    
    Wait Until Page Contains    Resumen diario    ${TIMEOUT}    # Verifica que llegó al dashboard

Navigate To Users
    [Documentation]    Navega a la sección de usuarios usando múltiples estrategias
    # Intenta primero usando el selector xpath con bounds
    ${element_visible}=    Run Keyword And Return Status
    ...    Wait Until Element Is Visible    ${USERS_BUTTON}    5s
    
    # Si el elemento es visible, haz clic en él
    Run Keyword If    ${element_visible}    Click Element    ${USERS_BUTTON}
    ...    ELSE    Click Element At Coordinates    ${USERS_SECTION_X}    ${USERS_SECTION_Y}
    
    # Verifica que llegamos a la pantalla correcta
    Wait Until Page Contains    Resumen de usuarios    ${TIMEOUT}
    Capture Page Screenshot    CantidadDeUsuarios.png

Fill User Form
    [Arguments]    ${name}    ${lastname}    ${phone}    ${email}    # Recibe los datos del usuario
    Click Element    ${ADD_USER_BUTTON}                  # Inicia el formulario
    Wait Until Page Contains    Configuración    ${TIMEOUT}    # Espera a que cargue
    
    # Llena los campos del formulario
    Input Text    ${NAME_INPUT}    ${name}              # Nombre
    Input Text    ${LASTNAME_INPUT}    ${lastname}      # Apellido
    Input Text    ${PHONE_INPUT}    ${phone}           # Teléfono
    Input Text    ${EMAIL_USER_INPUT}    ${email}      # Email
    
    Go Back                                            # Cierra el teclado
    Swipe    301    1631    301    1984               # Scroll para ver más campos
    Sleep    2s                                       # Espera a que termine el scroll

Select Birth Date
    [Documentation]    Selecciona la fecha de nacimiento
    Click Element    ${DATE_BUTTON}                    # Abre el selector de fecha
    FOR    ${i}    IN RANGE    4                      # Hace 4 swipes para el año
        Swipe    ${DATE_YEAR_COORDS}
    END
    FOR    ${i}    IN RANGE    3                      # Hace 3 swipes para el mes
        Swipe    ${DATE_MONTH_COORDS}
    END
    FOR    ${i}    IN RANGE    2                      # Hace 2 swipes para el día
        Swipe    ${DATE_DAY_COORDS}
    END
    Click Element    xpath=//android.widget.Button[@resource-id="android:id/button1"]    # Confirma la fecha

Select Gender And Role
    Click Element    ${GENDER_SPINNER}                 # Abre el selector de género
    Sleep    1s                                       # Espera a que se abra
    Click Element    ${GENDER_MALE}                   # Selecciona masculino
    Wait Until Page Contains    Usuario    ${TIMEOUT}  # Verifica que se guardó
    
    # Selección del rol
    Click Element    xpath=//android.widget.Button[2]/android.widget.TextView    # Abre selector de rol
    FOR    ${i}    IN RANGE    8                      # Hace 8 swipes para seleccionar el rol
        Swipe    34    1596    26    723
    END

Save User And Verify Message
    [Arguments]    ${expected_message}                # Recibe el mensaje esperado
    Click Element    ${SAVE_USER_BUTTON}              # Guarda el usuario
    Wait Until Page Contains    ${expected_message}    ${LONG_TIMEOUT}    # Verifica el mensaje
    Capture Page Screenshot    ${TEST NAME}.png       # Captura el resultado
    Sleep    1s                                      # Espera antes de continuar

*** Test Cases ***
Validacion celular del usuario
    # Prueba el caso de celular duplicado
    Login To App                                      # Inicia sesión
    Navigate To Users                                 # Va a la pantalla de usuarios
    Fill User Form    ${nombre}    ${apelliedo}    ${celularexistente}    ${emailexistente}    # Llena el formulario
    Select Birth Date                                # Selecciona la fecha
    Select Gender And Role                           # Selecciona género y rol
    Save User And Verify Message    El celular ya está registrado    # Verifica el error

Validacion correo del usuario
    # Prueba el caso de email duplicado
    Wait Until Page Contains    Usuario    ${TIMEOUT}  # Espera a que la pantalla esté lista
    Input Text    ${PHONE_INPUT}    ${celularnuevo}   # Cambia el teléfono
    Go Back                                           # Cierra el teclado
    Select Gender And Role                            # Reselecciona género y rol
    Save User And Verify Message    El email ya está registrado    # Verifica el error

Registro exitoso de usuario
    # Prueba el registro exitoso
    Wait Until Page Contains    Usuario    ${TIMEOUT}  # Espera a que la pantalla esté lista
    Input Text    ${EMAIL_USER_INPUT}    ${emailnuevo}    # Cambia el email
    Go Back                                           # Cierra el teclado
    Select Gender And Role                            # Reselecciona género y rol
    Save User And Verify Message    Se ha creado el usuario correctamente.    # Verifica éxito
    Capture Page Screenshot    CantidadUsuarioDespues.png    # Captura el estado final
    [Teardown]    Close Application                   # Cierra la aplicación