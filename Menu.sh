#!/bin/bash
respuesta=$(dialog --title "Escoge una opcion del menu:" \
                  --stdout \
                  --menu "Opciones:" 0 0 0 \
                         1 "Ingresar libro" \
                         2 "Ingresar persona" \
                         3 "Ingresar prestamo" \
                         5 "Consultar persona" \
                         4 "Consultar libro" \
                         6 "Consultar prestamo" \
                         7 "Actuializar persona" \
                         8 "Actualizar libro" \
                         9 "Mostrar integrantes del grupo" \
                         10 "Salir")
if [[$respuesta -eq $1]]; 
then
    awk -F: '{print "Nombre: "$1"\nEdad: "$2"\nCargo: "$3}' empleados.txt
else
    echo $respuesta
fi