# Este script está hecho en el entorno de Praat (v. 6.4.25)
# diciembre 21 del 2024
# Creado por Karina Cerda (Universidad de Talca) 
#       y 
# Domingo Román (Universidad de Santiago de Chile)
# La funcionalidad se crea para el proyecto Fondecyt...

# Utilidad: cambia los nombres de los archivos para uniformarlos en su longitud 
# y en su composición.


# Esta versión 02 considera que los número de los informantes estaban precedidos por "P". 


# A) Presenta tres mensajes en pausas al usuario

pauseScript: "Este script creará archivos de respaldo y ajustará los nombres"
pauseScript: "Le pedirá seleccionar la carpeta donde se encuentran los mp3 originales"
pauseScript: "Finalmente, le entregará un reporte de los nuevos nombres en la pantalla"


# B) Crea dos variables que serán parte del nombre definitivo de los audios
ss$ = "_SS"
ns$ = "_NS"




# C) Selecciona el directorio donde están los archivos

directorio$ = chooseDirectory$ ("Elija directorio con archivos")

# D) Crea la lista de audios
strings = Create Strings as file list... lista 'directorio$'/*.mp3


# E) crea un directorio para respaldo

respaldo$ = "respaldo"
createFolder: "'directorio$'/'respaldo$'"


# F) Obtiene número de audios originales

ene_archivos = Get number of strings


# G) Imprime encabezado para el reporte

writeInfoLine: "====="
appendInfoLine: "Nuevos nombres de los ", ene_archivos, " archivos"


# H) Iteración sobre cada audio original

for i to ene_archivos

	select strings

	audio$ = Get string... i

	audio = Read from file... 'directorio$'/'audio$'

	# Hace el respaldo de los audios originales

	Save as highest quality MP3 file: "'directorio$'/'respaldo$'/'audio$'"


	# Todos los cambios que se deben realizar

	nombre_audio_nuevo_2$ = replace$(audio$, "CONT", "CON", 1)

	nombre_audio_nuevo_2a$ = replace$(nombre_audio_nuevo_2$, "PEMI", "PEM", 1)

	nombre_audio_nuevo_3$ = replace$(nombre_audio_nuevo_2a$, "POST", "POS", 1)

	nombre_audio_nuevo_4$ = replace$(nombre_audio_nuevo_3$, "_P1_", "_01_", 1)

	nombre_audio_nuevo_5$ = replace$(nombre_audio_nuevo_4$, "_P2_", "_02_", 1)

	nombre_audio_nuevo_6$ = replace$(nombre_audio_nuevo_5$, "_P3_", "_03_", 1)

	nombre_audio_nuevo_7$ = replace$(nombre_audio_nuevo_6$, "_P4_", "_04_", 1)

	nombre_audio_nuevo_8$ = replace$(nombre_audio_nuevo_7$, "_P5_", "_05_", 1)

	nombre_audio_nuevo_9$ = replace$(nombre_audio_nuevo_8$, "_P6_", "_06_", 1)

	nombre_audio_nuevo_10$ = replace$(nombre_audio_nuevo_9$, "_P7_", "_07_", 1)

	nombre_audio_nuevo_11$ = replace$(nombre_audio_nuevo_10$, "_P8_", "_08_", 1)

	nombre_audio_nuevo_12$ = replace$(nombre_audio_nuevo_11$, "_P9_", "_09_", 1)

	nombre_audio_nuevo_13$ = replace$(nombre_audio_nuevo_12$, "_P10_", "_10_", 1)

	nombre_audio_nuevo_14$ = replace$(nombre_audio_nuevo_13$, "_P11_", "_11_", 1)

	nombre_audio_nuevo_15$ = replace$(nombre_audio_nuevo_14$, "_P12_", "_12_", 1)

	nombre_audio_nuevo_16$ = replace$(nombre_audio_nuevo_15$, "PB", "PGB", 1)


	numero$ = mid$(nombre_audio_nuevo_16$,9,2)

	if 
...    numero$ == "01" or numero$ == "03" or numero$ == "04" or numero$ == "09" 
... or numero$ == "10" or numero$ == "14" or numero$ == "15" or numero$ == "16" 
... or numero$ == "18" or numero$ == "19" or numero$ == "20" or numero$ == "21" 
... or numero$ == "26" or numero$ == "29" or numero$ == "30" or numero$ == "32"
... or numero$ == "35" or numero$ == "39" or numero$ == "40" or numero$ == "41"
... or numero$ == "42"

	nombre_audio_nuevo_16$ = replace$(nombre_audio_nuevo_16$, numero$, numero$ + ss$, 1)

	elsif
...    numero$ == "02" or numero$ == "05" or numero$ == "06" or numero$ == "07"
... or numero$ == "08" or numero$ == "11" or numero$ == "12" or numero$ == "13"
... or numero$ == "17" or numero$ == "22" or numero$ == "23" or numero$ == "24"
... or numero$ == "25" or numero$ == "27" or numero$ == "28" or numero$ == "31"
... or numero$ == "33" or numero$ == "34" or numero$ == "36" or numero$ == "37"
... or numero$ == "38"

	nombre_audio_nuevo_16$ = replace$(nombre_audio_nuevo_16$, numero$, numero$ + ns$, 1)

endif

	# Guarda en fomarto .mp3

	Save as highest quality MP3 file: "'directorio$'/'nombre_audio_nuevo_16$'"

	# Elimina del panel de objetos el audio original

	select audio
	Remove


	# Borra el archivo correspondiente al objeto original

	deleteFile("'directorio$'/'audio$'")

	# Escribe el nombre nuevo del archivo y la extensión en caracteres

	largo_nombre = length(nombre_audio_nuevo_16$)
	if largo_nombre == 43

		appendInfoLine: nombre_audio_nuevo_16$, tab$, "Longitud OK"

	else

		appendInfoLine: nombre_audio_nuevo_16$, tab$, "ATENCIÓN"

	endif


endfor

#) I borra la lista del panel de objetos

select strings
Remove
