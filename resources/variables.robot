*** Settings ***

Library    AppiumLibrary

*** Variables ***
#Usuario Produccion OJO
#${usuario-valido}=              marcelo.caceres@bancard.com.py
#${contraseña-valida}=           Bancard2024**
#Usuario Testing
${usuario-valido}=              miguel.esquivel@bancard.com.py
${contraseña-valida}=           Hola123456
${usuario-no-valido}=           miguel@gmail.com
${contraseña-no-valida}=        Hola12345
${formato-invalido}=            miguelesquivel
${correo-de-prueba}=            migueesquivelrios@gmail.com     # Inicio de sesion C003

#${reseteo-de-correo}=           nestor.ortigoza@bancard.com.py
${reseteo-de-correo}=           evely2.pineda@bancard.com.py
#Reseteo de correo Prod
#${reseteo-de-correo}=           marcelo.caceres@bancard.com.py

# Caso de uso para pedido de bobinas

${asunto}=                     Quiero bobinas para mi POS
${direccion}=                  Toba 1212 casi Moroti
${horario}=                    De Lunes a Viernes de 8am a 17pm
${telefono}=                   0984388144
${serie}=                      9220123364

# Caso de uso para pedido de anulacion

${asuntoanulacion}=            Quiero anular esta transaccion.
${boletadeanulacionletra}=     Anulacion
${boletadeanulacion}=          999999999999
${motivodeanulacion}=          El usuario va devolver la mercaderia.

# Caso de uso para pedido de asistencia tecnica

${asuntoasistencia}=           POS roto.
${horarioasistencia}=          De Lunes a Viernes de 8am a 17pm
${telefonoasistencia}=         0984388144
${serieasistencia}=            9220123364
${motivodeasistencia}=         Se rompio la pantalla.
${direccion}=                  Toba 1212 casi moroti

# Caso de uso para el modulo de usuarios

${nombre}=                     Alberto
${apelliedo}=                  Lopez
${celularexistente}=           0984388144
${celularnuevo}=               0981871533
${celularnuevo2}=              0981871533
${emailexistente}=             miguel.esquivel@bancard.com.py
#Produccion OJO
#${emailexistente}=             marcelo.caceres@bancard.com.py
#${emailnuevo}=                 marcelo.caceres@bancard.com.py
${emailnuevo}=                 miguel.esquivel+5@bancard.com.py
