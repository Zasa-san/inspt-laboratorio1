Algoritmo Pomodoro
	Definir min_Accion,min_Pausa, error Como Entero
	
	error = 0
	
	Escribir "Elija el tiempo de acción del Pomodoro en minutos(entre 1 y 59)"
	Repetir
		si error = 1 Entonces
			Escribir "Error, debes especificar un tiempo entre 1 y 59 minutos"
		FinSi
		error = 0
		Leer min_Accion
		si min_Accion <= 0 o min_Accion >= 60 Entonces
			error = 1
		FinSi
	Mientras Que error = 1
	
	Escribir "Elija el tiempo de pausa del Pomodoro en minutos(entre 1 y 59)"
	Repetir
		si error = 1 Entonces
			Escribir "Error, debes especificar un tiempo entre 1 y 59 minutos"
		FinSi
		error = 0
		Leer min_Pausa
		si min_Pausa <= 0 o min_Pausa >= 60 Entonces
			error = 1
		FinSi
	Mientras Que error = 1
	
	Limpiar Pantalla
	
	pom_Construir_Pantalla(min_Accion, min_Pausa)
	
FinAlgoritmo

SubAlgoritmo pom_Construir_Pantalla(min_Accion, min_Pausa)
	
	Definir min, SEG, LONG_NUM, ANCHO_NUM, LONGITUD_TOTAL, LONG_POMODORO_SUB, ANCHO_POMODORO, i, j, k Como Entero
	Definir BLANCO_LATERAL, DOS_PUNTOS, SUBTITULO_POMODORO_ACCION, SUBTITULO_POMODORO_PAUSA, vec_Min, vec_Seg, reloj Como Caracter
	
	
	LONG_NUM=8
	ANCHO_NUM = 12
	ANCHO_ESPACIO = 10
	LONG_POMODORO_SUB=9
	ANCHO_POMODORO=80
	LONGITUD_TOTAL=ANCHO_ESPACIO+ANCHO_NUM*2+ANCHO_NUM+ANCHO_NUM*2+ANCHO_ESPACIO
	
	Dimension BLANCO_LATERAL[LONG_NUM,ANCHO_ESPACIO]
	Dimension DOS_PUNTOS[LONG_NUM,ANCHO_NUM]
	Dimension vec_Min[LONG_NUM,ANCHO_NUM*2]
	Dimension vec_Seg[LONG_NUM,ANCHO_NUM*2]
	Dimension reloj[LONG_NUM,LONGITUD_TOTAL]
	Dimension SUBTITULO_POMODORO_ACCION[LONG_POMODORO_SUB,ANCHO_POMODORO]
	Dimension SUBTITULO_POMODORO_PAUSA[LONG_POMODORO_SUB,ANCHO_POMODORO]
	Dimension SUBTITULO_POMODORO[LONG_POMODORO_SUB,ANCHO_POMODORO]
	
	BLANCO_LATERAL[0,]="          "
	BLANCO_LATERAL[1,]="          "
	BLANCO_LATERAL[2,]="          "
	BLANCO_LATERAL[3,]="          "
	BLANCO_LATERAL[4,]="          "
	BLANCO_LATERAL[5,]="          "
	BLANCO_LATERAL[6,]="          "
	BLANCO_LATERAL[7,]="          "
	
	DOS_PUNTOS[0,]="            "
	DOS_PUNTOS[1,]="            "
	DOS_PUNTOS[2,]="    d8b     "
	DOS_PUNTOS[3,]="    Y8P     "
	DOS_PUNTOS[4,]="            "
	DOS_PUNTOS[5,]="    d8b     "
	DOS_PUNTOS[6,]="    Y8P     "
	DOS_PUNTOS[7,]="            "
	
	
	//FUENTE: SPEED
	SUBTITULO_POMODORO_ACCION[0,]="                                                                                "
	SUBTITULO_POMODORO_ACCION[1,]="                     _______            _____                                   "
	SUBTITULO_POMODORO_ACCION[2,]="                     ___    |______________(_)____________                      "
	SUBTITULO_POMODORO_ACCION[3,]="                     __  /| |  ___/  ___/_  /_  __ \_  __ \                     "
	SUBTITULO_POMODORO_ACCION[4,]="                     _  ___ / /__ / /__ _  / / /_/ /  / / /                     "
	SUBTITULO_POMODORO_ACCION[5,]="                     /_/  |_\___/ \___/ /_/  \____//_/ /_/                      "
	SUBTITULO_POMODORO_ACCION[6,]="                   __________________________________________                   "
	SUBTITULO_POMODORO_ACCION[7,]="                                                                                "
	SUBTITULO_POMODORO_ACCION[8,]="                                                                                "
	
	//FUENTE: SPEED
	SUBTITULO_POMODORO_PAUSA[0,]="                                                                                "
	SUBTITULO_POMODORO_PAUSA[1,]="                     ________                                                   "
	SUBTITULO_POMODORO_PAUSA[2,]="                     ___  __ \_____ ____  ______________ _                      "
	SUBTITULO_POMODORO_PAUSA[3,]="                     __  /_/ /  __ `/  / / /_  ___/  __ `/                      "
	SUBTITULO_POMODORO_PAUSA[4,]="                     _  ____// /_/ // /_/ /_(__  )/ /_/ /                       "
	SUBTITULO_POMODORO_PAUSA[5,]="                     /_/     \__,_/ \__,_/ /____/ \__,_/                        "
	SUBTITULO_POMODORO_PAUSA[6,]="                   __________________________________________                   "
	SUBTITULO_POMODORO_PAUSA[7,]="                                                                                "
	SUBTITULO_POMODORO_PAUSA[8,]="                                                                                "
	
	
	
	Para k=0 Con Paso 1 hasta 5 Hacer
		Si (k mod 2) = 0 Entonces
			min = min_Accion
			SEG = 0
			Para i=0 con paso 1 Hasta LONG_POMODORO_SUB-1 Hacer
				Para j=0 Con Paso 1 Hasta ANCHO_POMODORO-1 Hacer
					SUBTITULO_POMODORO[i,j]=SUBTITULO_POMODORO_ACCION[i,j]
				FinPara
			FinPara
		SiNo
			min = min_Pausa
			SEG = 0
			Para i=0 con paso 1 Hasta LONG_POMODORO_SUB-1 Hacer
				Para j=0 Con Paso 1 Hasta ANCHO_POMODORO-1 Hacer
					SUBTITULO_POMODORO[i,j]=SUBTITULO_POMODORO_PAUSA[i,j]
				FinPara
			FinPara
		FinSi
			
			Mientras min >= 0 Hacer
				
				Mientras seg >= 0 Hacer
					
					Limpiar Pantalla
					pom_Imprimir_Titulo(SUBTITULO_POMODORO, LONG_POMODORO_SUB, ANCHO_POMODORO)
					pom_Set_Numero(min, vec_Min, LONG_NUM, ANCHO_NUM)
					pom_Set_Numero(seg, vec_Seg, LONG_NUM, ANCHO_NUM)
					
					Para i=0 con paso 1 Hasta LONG_NUM-1 Hacer
						Para j=0 Con Paso 1 Hasta ANCHO_ESPACIO-1 Hacer
							reloj[i,j]=BLANCO_LATERAL[i,j]
						FinPara
					FinPara
					
					Para i=0 con paso 1 Hasta LONG_NUM-1 Hacer
						Para j=0 Con Paso 1 Hasta (ANCHO_NUM-1)*2 Hacer
							reloj[i,j+ANCHO_ESPACIO]=vec_Min[i,j]
						FinPara
					FinPara
					
					Para i=0 con paso 1 Hasta LONG_NUM-1 Hacer
						Para j=0 Con Paso 1 Hasta ANCHO_NUM-1 Hacer
							reloj[i,j+ANCHO_ESPACIO+(ANCHO_NUM*2)]=DOS_PUNTOS[i,j]
						FinPara
					FinPara
					
					Para i=0 con paso 1 Hasta LONG_NUM-1 Hacer
						Para j=0 Con Paso 1 Hasta (ANCHO_NUM-1)*2 Hacer
							reloj[i,j+ANCHO_ESPACIO+ANCHO_NUM*2+ANCHO_NUM]=vec_Seg[i,j]
						FinPara
					FinPara
					
					Para i=0 con paso 1 Hasta LONG_NUM-1 Hacer
						Para j=0 Con Paso 1 Hasta ANCHO_ESPACIO-1 Hacer
							reloj[i,j+ANCHO_ESPACIO+ANCHO_NUM*2+ANCHO_NUM+ANCHO_NUM*2]=BLANCO_LATERAL[i,j]
						FinPara
					FinPara
					
					Para i=0 con paso 1 Hasta LONG_NUM-1 Hacer
						Para j=0 Con Paso 1 Hasta LONGITUD_TOTAL-1 Hacer
							Escribir reloj[i,j] Sin Saltar
						FinPara
						Escribir ""
					FinPara
					
					Esperar 1 Segundos
					
					seg = seg - 1
					
				FinMientras
				
				seg = 59
				
				min = min - 1
				
			FinMientras
	FinPara
	
FinSubAlgoritmo


SubAlgoritmo pom_Set_Numero (num Por Valor, vec_Num Por Referencia, LONG_NUM Por Valor, ANCHO_NUM Por Valor)
	Definir NUM0, NUM1, NUM2, NUM3, NUM4, NUM5, NUM6, NUM7, NUM8, NUM9 Como Caracter
	Definir i, j, primer_Digito, segundo_Digito Como Entero
	
	Dimension NUM0[LONG_NUM,ANCHO_NUM]
	Dimension NUM1[LONG_NUM,ANCHO_NUM]
	Dimension NUM2[LONG_NUM,ANCHO_NUM]
	Dimension NUM3[LONG_NUM,ANCHO_NUM]
	Dimension NUM4[LONG_NUM,ANCHO_NUM]
	Dimension NUM5[LONG_NUM,ANCHO_NUM]
	Dimension NUM6[LONG_NUM,ANCHO_NUM]
	Dimension NUM7[LONG_NUM,ANCHO_NUM]
	Dimension NUM8[LONG_NUM,ANCHO_NUM]
	Dimension NUM9[LONG_NUM,ANCHO_NUM]
	
	NUM0[0,]="  .d8888b.  "
	NUM0[1,]=" d88P  Y88b "
	NUM0[2,]=" 888    888 "
	NUM0[3,]=" 888    888 "
	NUM0[4,]=" 888    888 "
	NUM0[5,]=" 888    888 "
	NUM0[6,]=" Y88b  d88P "
	NUM0[7,]="  °Y8888P°  "
	
	NUM1[0,]="   d888     "
	NUM1[1,]="  d8888     "
	NUM1[2,]="    888     "
	NUM1[3,]="    888     "
	NUM1[4,]="    888     "
	NUM1[5,]="    888     "
	NUM1[6,]="    888     "
	NUM1[7,]="  8888888   "
	
	NUM2[0,]="  .d8888b.  "
	NUM2[1,]=" d88P  Y88b "
	NUM2[2,]="        888 "
	NUM2[3,]="      .d88P "
	NUM2[4,]="  .od888P°  "
	NUM2[5,]=" d88P°      "
	NUM2[6,]=" 888°       "
	NUM2[7,]=" 888888888  "
	
	NUM3[0,]="  .d8888b.  "
	NUM3[1,]=" d88P  Y88b "
	NUM3[2,]="      .d88P "
	NUM3[3,]="     8888°  "
	NUM3[4,]="      °Y8b. "
	NUM3[5,]=" 888    888 "
	NUM3[6,]=" Y88b  d88P "
	NUM3[7,]="  °Y8888P°  "
	
	NUM4[0,]="     d8888  "
	NUM4[1,]="    d8P888  "
	NUM4[2,]="   d8P 888  "
	NUM4[3,]="  d8P  888  "
	NUM4[4,]=" d88   888  "
	NUM4[5,]=" 8888888888 "
	NUM4[6,]="       888  "
	NUM4[7,]="       888  "
	
	NUM5[0,]=" 888888888  "
	NUM5[1,]=" 888        "
	NUM5[2,]=" 888        "
	NUM5[3,]=" 8888888b.  "
	NUM5[4,]="      °Y88b "
	NUM5[5,]="        888 "
	NUM5[6,]=" Y88b  d88P "
	NUM5[7,]="  °Y8888P°  "
	
	NUM6[0,]="  .d8888b.  "
	NUM6[1,]=" d88P  Y88b "
	NUM6[2,]=" 888        "
	NUM6[3,]=" 888d888b.  "
	NUM6[4,]=" 888P °Y88b "
	NUM6[5,]=" 888    888 "
	NUM6[6,]=" Y88b  d88P "
	NUM6[7,]="  °Y8888P°  "
	
	NUM7[0,]=" 8888888888 "
	NUM7[1,]="       d88P "
	NUM7[2,]="      d88P  "
	NUM7[3,]="     d88P   "
	NUM7[4,]="    d88P    "
	NUM7[5,]="   d88P     "
	NUM7[6,]="  d88P      "
	NUM7[7,]=" d88P       "
	
	NUM8[0,]="  .d8888b.  "
	NUM8[1,]=" d88P  Y88b "
	NUM8[2,]=" Y88b. d88P "
	NUM8[3,]="  °Y88888°  "
	NUM8[4,]=" .d8P°°Y8b. "
	NUM8[5,]=" 888    888 "
	NUM8[6,]=" Y88b  d88P "
	NUM8[7,]="  °Y8888P°  "
	
	NUM9[0,]="  .d8888b.  "
	NUM9[1,]=" d88P  Y88b "
	NUM9[2,]=" 888    888 "
	NUM9[3,]=" Y88b. d88P "
	NUM9[4,]="  °Y888P888 "
	NUM9[5,]="        888 "
	NUM9[6,]=" Y88b  d88P "
	NUM9[7,]="  °Y8888P°  "
	
	primer_Digito = trunc(num/10)
	segundo_Digito = num % 10
	
	Para  i = 0 Con Paso 1 Hasta LONG_NUM-1 Hacer
		para j = 0 con paso 1 hasta ANCHO_NUM-1 Hacer
			segun (primer_Digito) Hacer
				Caso 0: vec_Num[i, j] = NUM0[i, j]
				Caso 1: vec_Num[i, j] = NUM1[i, j]
				Caso 2: vec_Num[i, j] = NUM2[i, j]
				Caso 3: vec_Num[i, j] = NUM3[i, j]
				Caso 4: vec_Num[i, j] = NUM4[i, j]
				Caso 5: vec_Num[i, j] = NUM5[i, j]
				Caso 6: vec_Num[i, j] = NUM6[i, j]
				Caso 7: vec_Num[i, j] = NUM7[i, j]
				Caso 8: vec_Num[i, j] = NUM8[i, j]
				Caso 9: vec_Num[i, j] = NUM9[i, j]
			FinSegun
		FinPara
	FinPara
	Para  i = 0 Con Paso 1 Hasta LONG_NUM-1 Hacer
		para j = 0 con paso 1 hasta ANCHO_NUM-1 Hacer
			segun (segundo_Digito) Hacer
				Caso 0: vec_Num[i, j+ANCHO_NUM] = NUM0[i, j]
				Caso 1: vec_Num[i, j+ANCHO_NUM] = NUM1[i, j]
				Caso 2: vec_Num[i, j+ANCHO_NUM] = NUM2[i, j]
				Caso 3: vec_Num[i, j+ANCHO_NUM] = NUM3[i, j]
				Caso 4: vec_Num[i, j+ANCHO_NUM] = NUM4[i, j]
				Caso 5: vec_Num[i, j+ANCHO_NUM] = NUM5[i, j]
				Caso 6: vec_Num[i, j+ANCHO_NUM] = NUM6[i, j]
				Caso 7: vec_Num[i, j+ANCHO_NUM] = NUM7[i, j]
				Caso 8: vec_Num[i, j+ANCHO_NUM] = NUM8[i, j]
				Caso 9: vec_Num[i, j+ANCHO_NUM] = NUM9[i, j]
			FinSegun
		FinPara
	FinPara
FinSubAlgoritmo


SubProceso pom_Imprimir_Titulo (SUBTITULO_POMODORO, LONG_POMODORO_SUB, ANCHO_POMODORO) 
	
	Definir LONG_POMODORO_TIT, i, j Como Entero
	Definir TITULO_POMODORO Como Caracter
	
	LONG_POMODORO_TIT=10
	Dimension TITULO_POMODORO[LONG_POMODORO_TIT,ANCHO_POMODORO]
	
	
	//TITULO_POMODORO[0,]="  _______  _______  __   __  _______  ______   _______  ______    _______  "
	//TITULO_POMODORO[1,]=" |       ||       ||  |_|  ||       ||      | |       ||    _ |  |       | "
	//TITULO_POMODORO[2,]=" |    _  ||   _   ||       ||   _   ||  _    ||   _   ||   | ||  |   _   | "
	//TITULO_POMODORO[3,]=" |   |_| ||  | |  ||       ||  | |  || | |   ||  | |  ||   |_||_ |  | |  | "
	//TITULO_POMODORO[4,]=" |    ___||  |_|  ||       ||  |_|  || |_|   ||  |_|  ||    __  ||  |_|  | "
	//TITULO_POMODORO[5,]=" |   |    |       || ||_|| ||       ||       ||       ||   |  | ||       | "
	//TITULO_POMODORO[6,]=" |___|    |_______||_|   |_||_______||______| |_______||___|  |_||_______| "
	
	//TITULO_POMODORO[0,]=" >>=====================================================<< "
	//TITULO_POMODORO[1,]=" ||                                  _                  || "
	//TITULO_POMODORO[2,]=" ||                                 | |                 || "
	//TITULO_POMODORO[3,]=" ||  _ __   ___  _ __ ___   ___   __| | ___  _ __ ___   || "
	//TITULO_POMODORO[4,]=" || | `_ \ / _ \| `_ ` _ \ / _ \ / _` |/ _ \| `__/ _ \  || "
	//TITULO_POMODORO[5,]=" || | |_) | (_) | | | | | | (_) | (_| | (_) | | | (_) | || "
	//TITULO_POMODORO[6,]=" || | .__/ \___/|_| |_| |_|\___/ \__,_|\___/|_|  \___/  || "
	//TITULO_POMODORO[7,]=" || | |                                                 || "
	//TITULO_POMODORO[8,]=" || |_|                                                 || "
	//TITULO_POMODORO[9,]=" >>=====================================================<< "
	
	//FUENTE: SPEED
	TITULO_POMODORO[0,]="                                                                                "
	TITULO_POMODORO[1,]=">>============================================================================<<"
	TITULO_POMODORO[2,]="||                                       _________                           ||"
	TITULO_POMODORO[3,]="||        _____________________ _______________  /__________________         ||"
	TITULO_POMODORO[4,]="||        ___  __ \  __ \_  __ `__ \  __ \  __  /_  __ \_  ___/  __ \        ||"
	TITULO_POMODORO[5,]="||        __  /_/ / /_/ /  / / / / / /_/ / /_/ / / /_/ /  /   / /_/ /        ||"
	TITULO_POMODORO[6,]="||        _  .___/\____//_/ /_/ /_/\____/\__,_/  \____//_/    \____/         ||"
	TITULO_POMODORO[7,]="||        /_/                                                                ||"
	TITULO_POMODORO[8,]=">>============================================================================<<"
	TITULO_POMODORO[9,]="                                                                                "
	
	//TITULO_POMODORO[0,]="                                                                                "
	//TITULO_POMODORO[1,]="                  >>=========================================<<                  "
	//TITULO_POMODORO[2,]="                  || ___  ____ _  _ ____ ___  ____ ____ ____ ||                  "
	//TITULO_POMODORO[3,]="                  || |__] |  | |\/| |  | |  \ |  | |__/ |  | ||                  "
	//TITULO_POMODORO[4,]="                  || |    |__| |  | |__| |__/ |__| |  \ |__| ||                  "
	//TITULO_POMODORO[5,]="                  >>=========================================<<                  "
	//TITULO_POMODORO[6,]="                                                                                "

	
	Para i=0 con paso 1 Hasta LONG_POMODORO_TIT-1 Hacer
		Para j=0 Con Paso 1 Hasta ANCHO_POMODORO-1 Hacer
			Escribir TITULO_POMODORO[i,j] Sin Saltar
		FinPara
		Escribir ""
	FinPara
	Para i=0 con paso 1 Hasta LONG_POMODORO_SUB-1 Hacer
		Para j=0 Con Paso 1 Hasta ANCHO_POMODORO-1 Hacer
			Escribir SUBTITULO_POMODORO[i,j] Sin Saltar
		FinPara
		Escribir ""
	FinPara
FinSubProceso
	