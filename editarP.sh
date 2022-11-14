respuesta=$(dialog --title "Modificar Persona"                  \
                   --separate-widget $"\n"               \
                   --form  "Introduce el valor a modificar y el nuevo"         \
                   0 0 0                                 \
                   "Actualizar:"   1 1 "$nombre"   1 10 20 0 \
                   "Nuevo:" 2 1 "$nombre2" 2 10 20 0 \
                   3>&1 1>&2 2>&3 3>&-)
nombre=$(echo "$respuesta" | sed -n 1p)
nombre2=$(echo "$respuesta" | sed -n 2p)
sed -i 's/'"$nombre"'/'"$nombre2"'/g' tbl_persona.txt
sh vistapersonas.sh
