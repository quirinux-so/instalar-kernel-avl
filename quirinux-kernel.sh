#!/bin/bash
# quirinux-kernel.sh

# Programado por Charlie Martínez (Carlos Mariano Martínez Bourio).

# Sitio oficial: www.quirinux.org
# Contacto directo: cmartinez@quirinux.org
# https://github.com/quirinux-so

# Licencia GPL Versión 3 
# https://github.com/quirinux-so/quirinux-kernel/blob/master/LICENCE

# GENERAR EL MENÚ GRÁFICO CON ZENITY

opc=$(zenity --width=350 --height=220 --title=Quirinux --entry --text="        
              Instalación del Kernel AVL 5.4.28
              de baja latencia de Trulan Martin

              Introduce una opción: 

	             1) Instalar Kernel 
	             2) Salir 
"
)
case $opc in

"1") 

(
echo "# Agregando respositorios"; sleep 1s

# GENERAR EL ARCHIVO DE LISTA DE REPOSITORIOS DE AVL

sudo touch /etc/apt/sources.list.d/kernel-avlinux.list
echo "# AV Linux" >> /etc/apt/sources.list.d/kernel-avlinux.list
echo " " >> /etc/apt/sources.list.d/kernel-avlinux.list
echo "deb [ trusted=yes ] http://www.bandshed.net/kernels/apt/ buster main" >> /etc/apt/sources.list.d/kernel-avlinux.list

# INSTALAR EL KERNEL AVL

echo "# Actualizando fuentes"; sleep 1s
sudo apt-get update -y
echo "# Instalando el nuevo kernel"; sleep 1s

for paquetes_kernel in linux-image-5.4.28avl2-lowlatency linux-headers-5.4.28-rt19avl2; do sudo apt-get install -y $paquetes_kernel; done
sudo apt-get install -f
echo "# Kernel instalado"; sleep 1s
)|

zenity --progress --pulsate 
echo " Puedes reiniciar para aplicar los cambios."
title="Quirinux"
percentage=0
;;

"2")

	exit 0
;; 
esac 
	done
	
