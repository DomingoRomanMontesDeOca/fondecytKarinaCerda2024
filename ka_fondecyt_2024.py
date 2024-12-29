import os


# es posible que esta variable sea inútil
nombres = []  #creamos una variable listado vacia para guardar los nombres

ejemplo =  "2022_V1_P1_F_PB_EXP_POST_ORACIONES_1.mp3"

os.chdir("//Users/inicio/desktop/notocarCopia")


for item in os.listdir("//Users/inicio/desktop/notocarCopia"):
    nombres.append(item)
    largo_nombre = len(nombres)
    sexo = item[10:13]
    previo_letraP = item[0:7]
    letraP = item[8:11]
    carrera = item[13:17]
    grupo = item[16:23]
    grupo_experimental = "EXP"
    grupo_control = "CON"
    extension = ".mp3"

    condicion_experimental = item[20:26]
    condicion_pre = "PRE"
    condicion_post = "POS"


    if "F" in sexo:
        sexo = "F"
    elif "M" in sexo:
        sexo = "M"
    else:
        sexo = "00000"
        print("Problema con " + item + "en la variable sexo")

    numero_oracion = item[-6:-4]

    numero_1 = "_1"
    numero_2 = "_2"
    numero_3 = "_3"
    numero_4 = "_4"
    numero_5 = "_5"
    numero_6 = "_6"
    numero_7 = "_7"
    numero_8 = "_8"
    numero_9 = "_9"



    # del final

    if letraP == "P1_":
        letraP = "P01"
    if letraP == "P2_":
        letraP = "P02"
    if letraP == "P3_":
        letraP = "P03"
    if letraP == "P4_":
        letraP = "P04"
    if letraP == "P5_":
        letraP = "P05"
    if letraP == "P6_":
        letraP = "P06"
    if letraP == "P7_":
        letraP = "P07"
    if letraP == "P8_":
        letraP = "P08"
    if letraP == "P9_":
        letraP = "P09"

    if carrera == "PEMI" or carrera == "_PEMI":
        carrera = "PEM"
    if carrera == "PEP_" or carrera == "_PEP":
        carrera = "PEP"
    if carrera == "PBQ_" or carrera == "_PBQ":
        carrera = "PBQ"
    if carrera == "PB_E" or carrera == "PB_C" or carrera == "_PB_E" or carrera == "_PB_C":
        carrera = "PGB"
    if carrera == "PMF_" or carrera == "_PMF":
        carrera = "PMF"

# Grupo Control o experimental

    if grupo_experimental in grupo:
        grupo_estudio = grupo_experimental

    elif grupo_control in grupo:
        grupo_estudio = grupo_control


    if condicion_pre in condicion_experimental:
        condicion = condicion_pre

    if condicion_post in condicion_experimental:
        condicion = condicion_post






    if "_1" in numero_oracion:
        numero_o= "01"
    elif "_2" in numero_oracion:
        numero_o = "02"
    elif "_3" in numero_oracion:
        numero_o = "03"
    elif "_4" in numero_oracion:
        numero_o = "04"
    elif "_5" in numero_oracion:
        numero_o = "05"
    elif "_6" in numero_oracion:
        numero_o = "06"
    elif "_7" in numero_oracion:
        numero_o = "07"
    elif "_8" in numero_oracion:
        numero_o = "08"
    elif "_9" in numero_oracion:
        numero_o = "09"
    else:
        numero_o = numero_oracion

    if numero_o == "01" or numero_o == "03" or numero_o == "04" or numero_o == "09" or numero_o == "10" \
            or numero_o == "14" or numero_o == "15" or numero_o == "16" or numero_o == "18" \
            or numero_o == "19" or numero_o == "20" or numero_o == "21" or numero_o == "26" \
            or numero_o == "29" or numero_o == "30" or numero_o == "32" or numero_o == "35" \
            or numero_o == "39" or numero_o == "40" or numero_o == "41" or numero_o == "42":

        condicion_ns_ss = "SS"

    elif numero_o == "02" or numero_o == "05" or numero_o == "06" or numero_o == "07" or numero_o == "08" \
            or numero_o == "11" or numero_o == "12" or numero_o == "13" or numero_o == "17" \
            or numero_o == "22" or numero_o == "23" or numero_o == "24" or numero_o == "25" \
            or numero_o == "27" or numero_o == "28" or numero_o == "31" or numero_o == "33" \
            or numero_o == "34" or numero_o == "36" or numero_o == "37" or numero_o == "38":

        condicion_ns_ss = "NS"

    nuevo_nombre = (previo_letraP + "_" + letraP + "_" + sexo + "_" + carrera + "_" + grupo_estudio + "_" + condicion + "_" + numero_o + "_" + condicion_ns_ss + extension)

    nnombre_1 =  nuevo_nombre.replace("__", "_")

    nnombre_2 = nnombre_1.replace("..", ".")

    # eliminar doble guión
    # eliminar doble punto

    largo_nombre_2 = len(nnombre_2)

    if largo_nombre_2 != 35:
        print(item, largo_nombre_2)

#    print("El archivo cambia a  " + nnombre_2, largo_nombre_2)
 #   print(os.getcwdb())


    os.rename(item, nnombre_2)

#print(nombres)
