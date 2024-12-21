Este script está hecho en el entorno de Praat (v. 6.4.25)

diciembre 21 del 2024

Creado por Karina Cerda (Universidad de Talca) 

y 
 
 Domingo Román (Universidad de Santiago de Chile)

 La distribución se hace de acuerdo con la licencia GNU cuyo texto se puede leer en: https://www.gnu.org/licenses/gpl-3.0.txt
 
 La funcionalidad se crea para el proyecto Fondecyt...

 Utilidad: cambia los nombres de los archivos para uniformarlos en su longitud y en su composición.

 El script hace lo siguiente:

 A) Presenta 3 pausas al usuario con mensajes que explican qué sucederá
 
 B) Crea dos variables de caracteres que se usarán más adelante.
 
 C) crea la variable directorio$ que contiene el nombre y ruta del directorio con los archivos
 
 D) Crea un objeto con la lista de audios .mp3 que están en directorio$
 
 E) Crea una carpeta de respaldo donde serán copiados los archivos originales que están en directorio$
 
 F) Obtiene número de audios originales que están en directorio$
 
 G) Imprime en la ventana de info el encabezado para el reporte
 
 H) Comando for que realiza las siguientes operaciones:
 
 H1) lee los audios originales y los respalda en el directorio de respaldo
 
 H2) remplaza las secuencias de caracteres del nombre que se deben modificar
 
 H3) agrega las variables señaladas en B)
 
 H4) guarda el audio en formato .mp3 con el nuevo nombre
 
 H5) borra el audio original del directorio directorio$ pues está respaldado en la carpeta de respaldo
 
 H6) elimina el audio del panel de objetos
 
 H7) imprime en la ventana de info el nuevo nombre del audio 
 
y un mensaje de "OK" respecto de la extensión o uno de "ATENCIÓN" 
     
en caso de problemas con el nombre del nuevo archivo

I) borra del panel de objetos la lista de los audios

