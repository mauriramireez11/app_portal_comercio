*** Settings ***

Library    AppiumLibrary

*** Keywords ***

Conectar dispositivo

    #Open Application      http://127.0.0.1:4723/wd/hub  platformName=Android    platformVersion=14    deviceName=a23   appPackage=com.bancard.portaldecomercios.staging    appActivity=com.bancard.portaldecomercios.MainActivity
    #Open Application      http://127.0.0.1:4723/wd/hub  platformName=Android    platformVersion=14    deviceName=a23   appPackage=com.bancard.portaldecomercios.dev    appActivity=com.bancard.portaldecomercios.MainActivity
    Open Application    http://127.0.0.1:4723   platformName=Android    platformVersion=14    deviceName=a23    automationName=UiAutomator2    appPackage=com.bancard.portaldecomercios    appActivity=com.bancard.portaldecomercios.MainActivity

Cerrar aplicación móvil

    Close Application


Retroceso
    Go Back
    Go Back
    Go Back