#!/bin/bash
respuesta=$(dialog --title "Escoge una opcion del menu:" \
                  --stdout \
                  --menu "Opciones:" 0 0 0 \
                         1 "Ingresar libro" \
                         2 "Ingresar persona" \
                         3 "Ingresar prestamo" \
                         4 "Consultar persona" \
                         5 "Consultar libro" \
                         6 "Consultar prestamo" \
                         7 "Actuializar persona" \
                         8 "Actualizar libro" \
                         9 "Mostrar integrantes del grupo" \
                         10 "Salir")
case $respuesta in 
    1) echo "ingresa tu nombre "
       read name
       echo "ingresa apellido"
       read apellido
       echo $name $apellido >> tbl_persona.txt
    ;;
    2) sh nper.sh;;
    3) echo "Seleccionaste la opcion 3";;
    4) sh vistapersonas.sh;;
    5) sh vistalibros.sh;;
    6) cat tbl_prestamo.txt;;
    7) sh editarP.sh;;
    8) sh editarL.sh;;
    9) sh integrantes.sh;;
    10) exit;;
esac
