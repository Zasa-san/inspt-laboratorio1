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
	
	construirReloj(min_Accion, min_Pausa)
	
FinAlgoritmo

SubAlgoritmo construirReloj(min_Accion, min_Pausa)
	
	Definir min, SEG, LONG_NUM, ANCHO_NUM, LONGITUDTOTAL, i, j, k Como Entero
	Definir blancoLateral, dosPuntos, vecMin, vecSeg, reloj Como Caracter
	
	LONG_NUM=8
	ANCHO_NUM = 12
	ANCHO_ESPACIO = 10
	LONGITUDTOTAL=ANCHO_ESPACIO+ANCHO_NUM*2+ANCHO_NUM+ANCHO_NUM*2+ANCHO_ESPACIO
	
	Dimension blancoLateral[LONG_NUM,ANCHO_ESPACIO]
	Dimension dosPuntos[LONG_NUM,ANCHO_NUM]
	Dimension vecMin[LONG_NUM,ANCHO_NUM*2]
	Dimension vecSeg[LONG_NUM,ANCHO_NUM*2]
	Dimension reloj[LONG_NUM,LONGITUDTOTAL]
	
	blancoLateral[0,]="          "
	blancoLateral[1,]="          "
	blancoLateral[2,]="          "
	blancoLateral[3,]="          "
	blancoLateral[4,]="          "
	blancoLateral[5,]="          "
	blancoLateral[6,]="          "
	blancoLateral[7,]="          "
	
	dosPuntos[0,]="            "
	dosPuntos[1,]="            "
	dosPuntos[2,]="    d8b     "
	dosPuntos[3,]="    Y8P     "
	dosPuntos[4,]="            "
	dosPuntos[5,]="    d8b     "
	dosPuntos[6,]="    Y8P     "
	dosPuntos[7,]="            "
	
	
	
	Para k=0 Con Paso 1 hasta 5 Hacer
		Si (k mod 2) = 0 Entonces
			min = min_Accion
			SEG = 0
		SiNo
			min = min_Pausa
			SEG = 0
		FinSi
			
			Mientras min >= 0 Hacer
				
				Mientras seg >= 0 Hacer
					
					Limpiar Pantalla
					imprimirTituloPomodoro
					setNumero(min, vecMin, LONG_NUM, ANCHO_NUM)
					setNumero(seg, vecSeg, LONG_NUM, ANCHO_NUM)
					
					Para i=0 con paso 1 Hasta LONG_NUM-1 Hacer
						Para j=0 Con Paso 1 Hasta ANCHO_ESPACIO-1 Hacer
							reloj[i,j]=blancoLateral[i,j]
						FinPara
					FinPara
					
					Para i=0 con paso 1 Hasta LONG_NUM-1 Hacer
						Para j=0 Con Paso 1 Hasta (ANCHO_NUM-1)*2 Hacer
							reloj[i,j+ANCHO_ESPACIO]=vecMin[i,j]
						FinPara
					FinPara
					
					Para i=0 con paso 1 Hasta LONG_NUM-1 Hacer
						Para j=0 Con Paso 1 Hasta ANCHO_NUM-1 Hacer
							reloj[i,j+ANCHO_ESPACIO+(ANCHO_NUM*2)]=dosPuntos[i,j]
						FinPara
					FinPara
					
					Para i=0 con paso 1 Hasta LONG_NUM-1 Hacer
						Para j=0 Con Paso 1 Hasta (ANCHO_NUM-1)*2 Hacer
							reloj[i,j+ANCHO_ESPACIO+ANCHO_NUM*2+ANCHO_NUM]=vecSeg[i,j]
						FinPara
					FinPara
					
					Para i=0 con paso 1 Hasta LONG_NUM-1 Hacer
						Para j=0 Con Paso 1 Hasta ANCHO_ESPACIO-1 Hacer
							reloj[i,j+ANCHO_ESPACIO+ANCHO_NUM*2+ANCHO_NUM+ANCHO_NUM*2]=blancoLateral[i,j]
						FinPara
					FinPara
					
					Para i=0 con paso 1 Hasta LONG_NUM-1 Hacer
						Para j=0 Con Paso 1 Hasta LONGITUDTOTAL-1 Hacer
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

SubAlgoritmo setNumero (num Por Valor, vecNum Por Referencia, LONG_NUM Por Valor, ANCHO_NUM Por Valor)
	Definir num0, num1, num2, num3, num4, num5, num6, num7, num8, num9, dosPuntos Como Caracter
	Definir i, j, primerDigito, segundoDigito Como Entero
	
	Dimension num0[LONG_NUM,ANCHO_NUM]
	Dimension num1[LONG_NUM,ANCHO_NUM]
	Dimension num2[LONG_NUM,ANCHO_NUM]
	Dimension num3[LONG_NUM,ANCHO_NUM]
	Dimension num4[LONG_NUM,ANCHO_NUM]
	Dimension num5[LONG_NUM,ANCHO_NUM]
	Dimension num6[LONG_NUM,ANCHO_NUM]
	Dimension num7[LONG_NUM,ANCHO_NUM]
	Dimension num8[LONG_NUM,ANCHO_NUM]
	Dimension num9[LONG_NUM,ANCHO_NUM]
	
	num0[0,]="  .d8888b.  "
	num0[1,]=" d88P  Y88b "
	num0[2,]=" 888    888 "
	num0[3,]=" 888    888 "
	num0[4,]=" 888    888 "
	num0[5,]=" 888    888 "
	num0[6,]=" Y88b  d88P "
	num0[7,]="  °Y8888P°  "
	
	num1[0,]="   d888     "
	num1[1,]="  d8888     "
	num1[2,]="    888     "
	num1[3,]="    888     "
	num1[4,]="    888     "
	num1[5,]="    888     "
	num1[6,]="    888     "
	num1[7,]="  8888888   "
	
	num2[0,]="  .d8888b.  "
	num2[1,]=" d88P  Y88b "
	num2[2,]="        888 "
	num2[3,]="      .d88P "
	num2[4,]="  .od888P°  "
	num2[5,]=" d88P°      "
	num2[6,]=" 888°       "
	num2[7,]=" 888888888  "
	
	num3[0,]="  .d8888b.  "
	num3[1,]=" d88P  Y88b "
	num3[2,]="      .d88P "
	num3[3,]="     8888°  "
	num3[4,]="      °Y8b. "
	num3[5,]=" 888    888 "
	num3[6,]=" Y88b  d88P "
	num3[7,]="  °Y8888P°  "
	
	num4[0,]="     d8888  "
	num4[1,]="    d8P888  "
	num4[2,]="   d8P 888  "
	num4[3,]="  d8P  888  "
	num4[4,]=" d88   888  "
	num4[5,]=" 8888888888 "
	num4[6,]="       888  "
	num4[7,]="       888  "
	
	num5[0,]=" 888888888  "
	num5[1,]=" 888        "
	num5[2,]=" 888        "
	num5[3,]=" 8888888b.  "
	num5[4,]="      °Y88b "
	num5[5,]="        888 "
	num5[6,]=" Y88b  d88P "
	num5[7,]="  °Y8888P°  "
	
	num6[0,]="  .d8888b.  "
	num6[1,]=" d88P  Y88b "
	num6[2,]=" 888        "
	num6[3,]=" 888d888b.  "
	num6[4,]=" 888P °Y88b "
	num6[5,]=" 888    888 "
	num6[6,]=" Y88b  d88P "
	num6[7,]="  °Y8888P°  "
	
	num7[0,]=" 8888888888 "
	num7[1,]="       d88P "
	num7[2,]="      d88P  "
	num7[3,]="     d88P   "
	num7[4,]="    d88P    "
	num7[5,]="   d88P     "
	num7[6,]="  d88P      "
	num7[7,]=" d88P       "
	
	num8[0,]="  .d8888b.  "
	num8[1,]=" d88P  Y88b "
	num8[2,]=" Y88b. d88P "
	num8[3,]="  °Y88888°  "
	num8[4,]=" .d8P°°Y8b. "
	num8[5,]=" 888    888 "
	num8[6,]=" Y88b  d88P "
	num8[7,]="  °Y8888P°  "
	
	num9[0,]="  .d8888b.  "
	num9[1,]=" d88P  Y88b "
	num9[2,]=" 888    888 "
	num9[3,]=" Y88b. d88P "
	num9[4,]="  °Y888P888 "
	num9[5,]="        888 "
	num9[6,]=" Y88b  d88P "
	num9[7,]="  °Y8888P°  "
	
	primerDigito = trunc(num/10)
	segundoDigito = num % 10
	
	Para  i = 0 Con Paso 1 Hasta LONG_NUM-1 Hacer
		para j = 0 con paso 1 hasta ANCHO_NUM-1 Hacer
			segun (primerDigito) Hacer
				Caso 0: vecNum[i, j] = num0[i, j]
				Caso 1: vecNum[i, j] = num1[i, j]
				Caso 2: vecNum[i, j] = num2[i, j]
				Caso 3: vecNum[i, j] = num3[i, j]
				Caso 4: vecNum[i, j] = num4[i, j]
				Caso 5: vecNum[i, j] = num5[i, j]
				Caso 6: vecNum[i, j] = num6[i, j]
				Caso 7: vecNum[i, j] = num7[i, j]
				Caso 8: vecNum[i, j] = num8[i, j]
				Caso 9: vecNum[i, j] = num9[i, j]
			FinSegun
		FinPara
	FinPara
	Para  i = 0 Con Paso 1 Hasta LONG_NUM-1 Hacer
		para j = 0 con paso 1 hasta ANCHO_NUM-1 Hacer
			segun (segundoDigito) Hacer
				Caso 0: vecNum[i, j+ANCHO_NUM] = num0[i, j]
				Caso 1: vecNum[i, j+ANCHO_NUM] = num1[i, j]
				Caso 2: vecNum[i, j+ANCHO_NUM] = num2[i, j]
				Caso 3: vecNum[i, j+ANCHO_NUM] = num3[i, j]
				Caso 4: vecNum[i, j+ANCHO_NUM] = num4[i, j]
				Caso 5: vecNum[i, j+ANCHO_NUM] = num5[i, j]
				Caso 6: vecNum[i, j+ANCHO_NUM] = num6[i, j]
				Caso 7: vecNum[i, j+ANCHO_NUM] = num7[i, j]
				Caso 8: vecNum[i, j+ANCHO_NUM] = num8[i, j]
				Caso 9: vecNum[i, j+ANCHO_NUM] = num9[i, j]
			FinSegun
		FinPara
	FinPara
FinSubAlgoritmo

SubProceso imprimirTituloPomodoro
	
	Definir LONG_POMODORO_TIT, ANCHO_POMODORO_TIT, LONG_POMODORO_SUB, ANCHO_POMODORO_SUB, i, j Como Entero
	Definir TITULO_POMODORO, SUBTITULO_POMODORO Como Caracter
	
	LONG_POMODORO_TIT=10
	ANCHO_POMODORO_TIT=80
	Dimension TITULO_POMODORO[LONG_POMODORO_TIT,ANCHO_POMODORO_TIT]
	
	LONG_POMODORO_SUB=9
	ANCHO_POMODORO_SUB=80
	Dimension SUBTITULO_POMODORO[LONG_POMODORO_SUB,ANCHO_POMODORO_SUB]
	
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
	
	SUBTITULO_POMODORO[0,]="                                                                                "
	SUBTITULO_POMODORO[1,]="                     _______            _____                                   "
	SUBTITULO_POMODORO[2,]="                     ___    |______________(_)____________                      "
	SUBTITULO_POMODORO[3,]="                     __  /| |  ___/  ___/_  /_  __ \_  __ \                     "
	SUBTITULO_POMODORO[4,]="                     _  ___ / /__ / /__ _  / / /_/ /  / / /                     "
	SUBTITULO_POMODORO[5,]="                     /_/  |_\___/ \___/ /_/  \____//_/ /_/                      "
	SUBTITULO_POMODORO[6,]="                   __________________________________________                   "
	SUBTITULO_POMODORO[7,]="                                                                                "
	SUBTITULO_POMODORO[8,]="                                                                                "
	
	Para i=0 con paso 1 Hasta LONG_POMODORO_TIT-1 Hacer
		Para j=0 Con Paso 1 Hasta ANCHO_POMODORO_TIT-1 Hacer
			Escribir TITULO_POMODORO[i,j] Sin Saltar
		FinPara
		Escribir ""
	FinPara
	Para i=0 con paso 1 Hasta LONG_POMODORO_SUB-1 Hacer
		Para j=0 Con Paso 1 Hasta ANCHO_POMODORO_SUB-1 Hacer
			Escribir SUBTITULO_POMODORO[i,j] Sin Saltar
		FinPara
		Escribir ""
	FinPara
FinSubProceso
	