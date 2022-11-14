nombre=$(dialog --title "Escribe el ID:Nombre Completo" \
                   --stdout \
                   --inputbox "ID:Nombre" 0 0)
echo $nombre $apellido >> tbl_persona.txt
sh vistapersonas.sh
