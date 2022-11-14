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

    1) respuesta=$(dialog --title "atareao.es"                  \
                   --separate-widget $"\n"               \
                   --form  "Introduce tus datos"         \
                   0 0 0                                 \
                   "Nombre:"   1 1 "$nombre"   1 10 20 0 \
                   "Editorial:" 2 1 "$editorial" 2 10 20 0 \
                   "cantidad:"    3 1 "$cantidad"     3 10 20 0 \
                   3>&1 1>&2 2>&3 3>&-)
id=$(awk 'END {print NR}' tbl_libro.txt)
nombre=$(echo "$respuesta" | sed -n 1p)
editorial=$(echo "$respuesta" | sed -n 2p)
cantidad=$(echo "$respuesta" | sed -n 3p)
echo $id  $nombre $editorial $cantidad >> tbl_libro.txt ;;
    2) respuesta=$(dialog --title "atareao.es"                  \
                   --separate-widget $"\n"               \
                   --form  "Introduce tus datos"         \
                   0 0 0                                 \
                   "Nombre:"   1 1 "$nombre"   1 10 20 0 \
                   "Apellido:" 2 1 "$apellido" 2 10 20 0 \
                    3>&1 1>&2 2>&3 3>&-)
id=$(awk 'END {print NR}' tbl_persona.txt)
nombre=$(echo "$respuesta" | sed -n 1p)
apellido=$(echo "$respuesta" | sed -n 2p)
echo $id $nombre $apellido $cantidad>> tbl_persona.txt ;;
    3) respuesta=$(dialog --title "atareao.es"                  \
                   --separate-widget $"\n"               \
                   --form  "Introduce tus datos"         \
                   0 0 0                                 \
                   "Nombre:"   1 1 "$idlibro"   1 10 20 0 \
                   "Apellido:" 2 1 "$idpersona" 2 10 20 0 \
                   3>&1 1>&2 2>&3 3>&-)
id=$(awk 'END {print NR}' tbl_prestamo.txt)
idlibro=$(echo "$respuesta" | sed -n 1p)
idpersona=$(echo "$respuesta" | sed -n 2p)
echo $id $idlibro $idpersona>> tbl_prestamo.txt ;;
    4) dialog --title 'persona' --textbox tbl_persona.txt 0 0 ;;
    5) dialog --title 'libro' --textbox tbl_libro.txt 0 0 ;;
    6) dialog --title 'prestamo' --textbox tbl_prestamo.txt 0 0 ;;
    7) sh editarP.sh;;
    8) sh editarL.sh;;
    9) dialog --title 'integrantes' --textbox integrantes.txt 0 0 ;;
    10) exit;;
esac
