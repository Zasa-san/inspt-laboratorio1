//SubAlgoritmo que inicia el módulo pomodoro
Algoritmo Pomodoro
	Definir min_Accion,min_Pausa, error, opc, opc2 Como Entero
	
	error = 0
	
	pom_Pantalla_Inicio
	Limpiar Pantalla
	Repetir
		Escribir "Elija el tiempo de acción del Pomodoro en minutos(entre 1 y 59)"
		min_Accion = pom_Establecer_Min
		
		Escribir "Elija el tiempo de pausa del Pomodoro en minutos(entre 1 y 59)"
		min_Pausa = pom_Establecer_Min
		
		
		Limpiar Pantalla
		
		pom_Construir_Pantalla(min_Accion, min_Pausa)
		opc = pom_continuacion()
		Si opc = 1 Entonces
			Repetir
				Escribir "¿Quisiera cambiar los valores de pausa y accion? (1- Si 0- No)"
				Leer opc2
			Mientras Que opc2<0 o opc2>1
			Limpiar Pantalla
			Si opc2 <> 1 Entonces
				pom_Construir_Pantalla(min_Accion, min_Pausa)
			FinSi
		FinSi
		
	Mientras Que opc <> 0
	
FinAlgoritmo


//Se solicita al usuario minutos de pausa o accion
Funcion min <- pom_Establecer_Min
	Definir min, error Como Entero
	
	error = 0
	
	Repetir
		si error = 1 Entonces
			Escribir "Error, debes especificar un tiempo entre 1 y 59 minutos"
		FinSi
		error = 0
		Leer min
		si min < 0 o min >= 60 Entonces
			error = 1
		FinSi
	Mientras Que error = 1
FinFuncion

//Se construye la pantalla completa del modulo
SubAlgoritmo pom_Construir_Pantalla(min_Accion Por Valor, min_Pausa Por Valor)
	
	Definir min, SEG, LONG_NUM, ANCHO_NUM, LONGITUD_TOTAL, LONG_POMODORO_SUB, ANCHO_POMODORO, TOTAL_VUELTAS, i, j, k, opc, vueltas_Pausa, vueltas_Accion Como Entero
	Definir BLANCO_LATERAL, DOS_PUNTOS, SUBTITULO_POMODORO_ACCION, SUBTITULO_POMODORO_PAUSA, vec_Min, vec_Seg, reloj, hora_Inicio, hora_Cierre Como Caracter
	
	
	LONG_NUM = 8
	ANCHO_NUM = 12
	ANCHO_ESPACIO = 10
	LONG_POMODORO_SUB = 8
	ANCHO_POMODORO = 80
	LONGITUD_TOTAL = ANCHO_ESPACIO+ANCHO_NUM*2+ANCHO_NUM+ANCHO_NUM*2+ANCHO_ESPACIO
	TOTAL_VUELTAS = 6
	
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
	
	//FUENTE: COLOSSAL. Tomado de https://patorjk.com/
	DOS_PUNTOS[0,]="            "
	DOS_PUNTOS[1,]="            "
	DOS_PUNTOS[2,]="    d8b     "
	DOS_PUNTOS[3,]="    Y8P     "
	DOS_PUNTOS[4,]="            "
	DOS_PUNTOS[5,]="    d8b     "
	DOS_PUNTOS[6,]="    Y8P     "
	DOS_PUNTOS[7,]="            "
	
	
	//FUENTE: SPEED. Tomado de https://patorjk.com/
	SUBTITULO_POMODORO_ACCION[0,]="                                                                                "
	SUBTITULO_POMODORO_ACCION[1,]="                     _______            _____                                   "
	SUBTITULO_POMODORO_ACCION[2,]="                     ___    |______________(_)____________                      "
	SUBTITULO_POMODORO_ACCION[3,]="                     __  /| |  ___/  ___/_  /_  __ \_  __ \                     "
	SUBTITULO_POMODORO_ACCION[4,]="                     _  ___ / /__ / /__ _  / / /_/ /  / / /                     "
	SUBTITULO_POMODORO_ACCION[5,]="                     /_/  |_\___/ \___/ /_/  \____//_/ /_/                      "
	SUBTITULO_POMODORO_ACCION[6,]="                   __________________________________________                   "
	SUBTITULO_POMODORO_ACCION[7,]="                                                                                "
	
	//FUENTE: SPEED. Tomado de https://patorjk.com/
	SUBTITULO_POMODORO_PAUSA[0,]="                                                                                "
	SUBTITULO_POMODORO_PAUSA[1,]="                     ________                                                   "
	SUBTITULO_POMODORO_PAUSA[2,]="                     ___  __ \_____ ____  ______________ _                      "
	SUBTITULO_POMODORO_PAUSA[3,]="                     __  /_/ /  __ `/  / / /_  ___/  __ `/                      "
	SUBTITULO_POMODORO_PAUSA[4,]="                     _  ____// /_/ // /_/ /_(__  )/ /_/ /                       "
	SUBTITULO_POMODORO_PAUSA[5,]="                     /_/     \__,_/ \__,_/ /____/ \__,_/                        "
	SUBTITULO_POMODORO_PAUSA[6,]="                   __________________________________________                   "
	SUBTITULO_POMODORO_PAUSA[7,]="                                                                                "
	
	vueltas_Pausa = 3
	vueltas_Accion = 3
	
	//Se calcula la hora de inicio del esta ronda
	pom_Calcular_Hora_Inicio(hora_Inicio)
	
	//Se construye la pantalla que se muestra al usuario
	Para k = 0 Con Paso 1 hasta TOTAL_VUELTAS-1 Hacer
		//Al arrancar el modulo pomodoro con el submodulo accion, las vueltas pares serán las de acción y las impares las de pausa
		Si (k mod 2) = 0 Entonces
			min = min_Accion
			SEG = 0
			//Se calcula la hora de cierre calculando las vueltas restantes y el tiempo en que esta activa la pantalla de pausa
			CalculaHoraCierre(min_Accion, min_Pausa, vueltas_Pausa, vueltas_Accion, hora_Cierre)
			vueltas_Pausa = vueltas_Pausa - 1
			//Se establece el subtitulo del submodulo accion
			Para i = 0 con paso 1 Hasta LONG_POMODORO_SUB-1 Hacer
				Para j = 0 Con Paso 1 Hasta ANCHO_POMODORO-1 Hacer
					SUBTITULO_POMODORO[i,j] = SUBTITULO_POMODORO_ACCION[i,j]
				FinPara
			FinPara
		SiNo
			min = min_Pausa
			SEG = 0
			//Se calcula la hora de cierre calculando las vueltas restantes y el tiempo en que esta activa la pantalla de pausa
			CalculaHoraCierre(min_Accion, min_Pausa, vueltas_Pausa, vueltas_Accion, hora_Cierre)
			vueltas_accion = vueltas_accion - 1
			//Se establece el subtitulo del submodulo pausa
			Para i = 0 con paso 1 Hasta LONG_POMODORO_SUB-1 Hacer
				Para j = 0 Con Paso 1 Hasta ANCHO_POMODORO-1 Hacer
					SUBTITULO_POMODORO[i,j] = SUBTITULO_POMODORO_PAUSA[i,j]
				FinPara
			FinPara
		FinSi
		
		//Se construye la pantalla completa
		Mientras min >= 0 Hacer
			
			Mientras seg >= 0 Hacer
				
				Limpiar Pantalla
				Escribir "------------------- Hora de inicio ", hora_Inicio, " -- Hora de fin ", hora_Cierre, " ------------------"
				pom_Imprimir_Titulo(SUBTITULO_POMODORO, LONG_POMODORO_SUB, ANCHO_POMODORO)
				//Se setean los minutos y segundos que se mostrarán por pantalla
				pom_Set_Numero(min, vec_Min, LONG_NUM, ANCHO_NUM)
				pom_Set_Numero(seg, vec_Seg, LONG_NUM, ANCHO_NUM)
				
				//Se arma el reloj completo
				Para i = 0 con paso 1 Hasta LONG_NUM-1 Hacer
					Para j = 0 Con Paso 1 Hasta ANCHO_ESPACIO-1 Hacer
						reloj[i,j] = BLANCO_LATERAL[i,j]
					FinPara
				FinPara
				
				Para i = 0 con paso 1 Hasta LONG_NUM-1 Hacer
					Para j = 0 Con Paso 1 Hasta (ANCHO_NUM-1)*2 Hacer
						reloj[i,j+ANCHO_ESPACIO] = vec_Min[i,j]
					FinPara
				FinPara
				
				Para i = 0 con paso 1 Hasta LONG_NUM-1 Hacer
					Para j = 0 Con Paso 1 Hasta ANCHO_NUM-1 Hacer
						reloj[i,j+ANCHO_ESPACIO+(ANCHO_NUM*2)] = DOS_PUNTOS[i,j]
					FinPara
				FinPara
				
				Para i = 0 con paso 1 Hasta LONG_NUM-1 Hacer
					Para j = 0 Con Paso 1 Hasta (ANCHO_NUM-1)*2 Hacer
						reloj[i,j+ANCHO_ESPACIO+ANCHO_NUM*2+ANCHO_NUM] = vec_Seg[i,j]
					FinPara
				FinPara
				
				Para i = 0 con paso 1 Hasta LONG_NUM-1 Hacer
					Para j = 0 Con Paso 1 Hasta ANCHO_ESPACIO-1 Hacer
						reloj[i,j+ANCHO_ESPACIO+ANCHO_NUM*2+ANCHO_NUM+ANCHO_NUM*2] = BLANCO_LATERAL[i,j]
					FinPara
				FinPara
				
				Para i = 0 con paso 1 Hasta LONG_NUM-1 Hacer
					Para j = 0 Con Paso 1 Hasta LONGITUD_TOTAL-1 Hacer
						Escribir reloj[i,j] Sin Saltar
					FinPara
					Escribir ""
				FinPara
				
				Esperar 740 Milisegundos
				
				seg = seg - 1
				
			FinMientras
			
			seg = 59
			
			min = min - 1
			
		FinMientras
		
		Si k <> TOTAL_VUELTAS-1 Entonces
			Limpiar Pantalla
			pom_Pantalla_Pausa					
		FinSi
	FinPara
	
FinSubAlgoritmo


//Se construyen los digitos de los minutos o segundos
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
	
	//FUENTE: COLOSSAL. Tomado de https://patorjk.com/
	NUM0[0,]="  .d8888b.  "
	NUM0[1,]=" d88P  Y88b "
	NUM0[2,]=" 888    888 "
	NUM0[3,]=" 888    888 "
	NUM0[4,]=" 888    888 "
	NUM0[5,]=" 888    888 "
	NUM0[6,]=" Y88b  d88P "
	NUM0[7,]="  °Y8888P°  "
	
	//FUENTE: COLOSSAL. Tomado de https://patorjk.com/
	NUM1[0,]="   d888     "
	NUM1[1,]="  d8888     "
	NUM1[2,]="    888     "
	NUM1[3,]="    888     "
	NUM1[4,]="    888     "
	NUM1[5,]="    888     "
	NUM1[6,]="    888     "
	NUM1[7,]="  8888888   "
	
	//FUENTE: COLOSSAL. Tomado de https://patorjk.com/
	NUM2[0,]="  .d8888b.  "
	NUM2[1,]=" d88P  Y88b "
	NUM2[2,]="        888 "
	NUM2[3,]="      .d88P "
	NUM2[4,]="  .od888P°  "
	NUM2[5,]=" d88P°      "
	NUM2[6,]=" 888°       "
	NUM2[7,]=" 888888888  "
	
	//FUENTE: COLOSSAL. Tomado de https://patorjk.com/
	NUM3[0,]="  .d8888b.  "
	NUM3[1,]=" d88P  Y88b "
	NUM3[2,]="      .d88P "
	NUM3[3,]="     8888°  "
	NUM3[4,]="      °Y8b. "
	NUM3[5,]=" 888    888 "
	NUM3[6,]=" Y88b  d88P "
	NUM3[7,]="  °Y8888P°  "
	
	//FUENTE: COLOSSAL. Tomado de https://patorjk.com/
	NUM4[0,]="     d8888  "
	NUM4[1,]="    d8P888  "
	NUM4[2,]="   d8P 888  "
	NUM4[3,]="  d8P  888  "
	NUM4[4,]=" d88   888  "
	NUM4[5,]=" 8888888888 "
	NUM4[6,]="       888  "
	NUM4[7,]="       888  "
	
	//FUENTE: COLOSSAL. Tomado de https://patorjk.com/
	NUM5[0,]=" 888888888  "
	NUM5[1,]=" 888        "
	NUM5[2,]=" 888        "
	NUM5[3,]=" 8888888b.  "
	NUM5[4,]="      °Y88b "
	NUM5[5,]="        888 "
	NUM5[6,]=" Y88b  d88P "
	NUM5[7,]="  °Y8888P°  "
	
	//FUENTE: COLOSSAL. Tomado de https://patorjk.com/
	NUM6[0,]="  .d8888b.  "
	NUM6[1,]=" d88P  Y88b "
	NUM6[2,]=" 888        "
	NUM6[3,]=" 888d888b.  "
	NUM6[4,]=" 888P °Y88b "
	NUM6[5,]=" 888    888 "
	NUM6[6,]=" Y88b  d88P "
	NUM6[7,]="  °Y8888P°  "
	
	//FUENTE: COLOSSAL. Tomado de https://patorjk.com/
	NUM7[0,]=" 8888888888 "
	NUM7[1,]="       d88P "
	NUM7[2,]="      d88P  "
	NUM7[3,]="     d88P   "
	NUM7[4,]="    d88P    "
	NUM7[5,]="   d88P     "
	NUM7[6,]="  d88P      "
	NUM7[7,]=" d88P       "
	
	//FUENTE: COLOSSAL. Tomado de https://patorjk.com/
	NUM8[0,]="  .d8888b.  "
	NUM8[1,]=" d88P  Y88b "
	NUM8[2,]=" Y88b. d88P "
	NUM8[3,]="  °Y88888°  "
	NUM8[4,]=" .d8P°°Y8b. "
	NUM8[5,]=" 888    888 "
	NUM8[6,]=" Y88b  d88P "
	NUM8[7,]="  °Y8888P°  "
	
	//FUENTE: COLOSSAL. Tomado de https://patorjk.com/
	NUM9[0,]="  .d8888b.  "
	NUM9[1,]=" d88P  Y88b "
	NUM9[2,]=" 888    888 "
	NUM9[3,]=" Y88b. d88P "
	NUM9[4,]="  °Y888P888 "
	NUM9[5,]="        888 "
	NUM9[6,]=" Y88b  d88P "
	NUM9[7,]="  °Y8888P°  "
	
	//Se copian los digitos de los minutos o segundos para construir el reloj
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


//Se construye el titulo y el subtitulo de la pantalla
SubProceso pom_Imprimir_Titulo (SUBTITULO_POMODORO Por Referencia, LONG_POMODORO_SUB Por Valor, ANCHO_POMODORO Por Valor) 
	Definir LONG_POMODORO_TIT, i, j Como Entero
	Definir TITULO_POMODORO Como Caracter
	
	LONG_POMODORO_TIT = 10
	Dimension TITULO_POMODORO[LONG_POMODORO_TIT,ANCHO_POMODORO]
	
	//FUENTE: SPEED. Tomado de https://patorjk.com/
	TITULO_POMODORO[0,]="                                                                                "
	TITULO_POMODORO[1,]=">>============================================================================<<"
	TITULO_POMODORO[2,]="||                                        _________                           ||"
	TITULO_POMODORO[3,]="||         _____________________ _______________  /__________________         ||"
	TITULO_POMODORO[4,]="||         ___  __ \  __ \_  __ `__ \  __ \  __  /_  __ \_  ___/  __ \        ||"
	TITULO_POMODORO[5,]="||         __  /_/ / /_/ /  / / / / / /_/ / /_/ / / /_/ /  /   / /_/ /        ||"
	TITULO_POMODORO[6,]="||         _  .___/\____//_/ /_/ /_/\____/\__,_/  \____//_/    \____/         ||"
	TITULO_POMODORO[7,]="||         /_/                                                                ||"
	TITULO_POMODORO[8,]=">>============================================================================<<"
	TITULO_POMODORO[9,]="                                                                                "	
	
	//Se imprime el titulo
	Para i = 0 con paso 1 Hasta LONG_POMODORO_TIT-1 Hacer
		Para j = 0 Con Paso 1 Hasta ANCHO_POMODORO-1 Hacer
			Escribir TITULO_POMODORO[i,j] Sin Saltar
		FinPara
		Escribir ""
	FinPara
	
	//Se imprime el subtitulo
	Para i = 0 con paso 1 Hasta LONG_POMODORO_SUB-1 Hacer
		Para j = 0 Con Paso 1 Hasta ANCHO_POMODORO-1 Hacer
			Escribir SUBTITULO_POMODORO[i,j] Sin Saltar
		FinPara
		Escribir ""
	FinPara
FinSubProceso


//Se calcula hora de inicio
SubProceso pom_Calcular_Hora_Inicio(hora_Inicio Por Referencia)
    Definir hora_Actual, horas, minutos Como Entero
	
    hora_Actual = HoraActual()
	
    horas = Trunc(hora_Actual / 10000)
    minutos = Trunc((hora_Actual % 10000) / 100)
	
	//Se pasa la hora a caracteres
	Si horas >= 0 y horas <= 9 Entonces
		hora_Inicio = Concatenar("0", ConvertirATexto(horas))
		hora_Inicio = Concatenar(hora_Inicio, ":")
	SiNo
		hora_Inicio = Concatenar(ConvertirATexto(horas),":")
	FinSi
	
	Si minutos >= 0 y minutos <= 9 Entonces
		hora_Inicio = Concatenar(hora_Inicio, "0")
		hora_Inicio = Concatenar(hora_Inicio, ConvertirATexto(minutos))
	SiNo
		hora_Inicio = Concatenar(hora_Inicio,ConvertirATexto(minutos)) 
	FinSi
FinSubProceso


//Se calcula hora de cierre
SubProceso CalculaHoraCierre(min_Accion Por Valor, min_Pausa Por Valor, vueltas_Pausa Por Valor, vueltas_Accion Por Valor, hora_Cierre Por Referencia)
	
	Definir hora_Actual, horas_Actuales, minutos_Actuales, minutos_A_Sumar, nueva_Hora, nuevo_Minuto, minutos_Totales Como Entero
	
    hora_Actual = HoraActual()
	
    horas_Actuales = Trunc(hora_Actual / 10000)
    minutos_Actuales = Trunc((hora_Actual % 10000) / 100)
	
    minutos_A_Sumar = (min_Accion * vueltas_Accion) + (min_Pausa * vueltas_Pausa)
	
    minutos_Totales = minutos_Actuales + minutos_A_Sumar
    nueva_Hora = horas_Actuales + Trunc(minutos_Totales / 60)
    nuevo_Minuto = minutos_Totales % 60
	
	nueva_Hora = nueva_Hora % 24
	
	//Se pasa la hora a caracteres
	Si nueva_Hora >= 0 y nueva_Hora <= 9 Entonces
		hora_Cierre = Concatenar("0", ConvertirATexto(nueva_Hora))
		hora_Cierre = Concatenar(hora_Cierre, ":")
	SiNo
		hora_Cierre = Concatenar(ConvertirATexto(nueva_Hora),":")
	FinSi
	
	Si nuevo_Minuto >= 0 y nuevo_Minuto <= 9 Entonces
		hora_Cierre = Concatenar(hora_Cierre, "0")
		hora_Cierre = Concatenar(hora_Cierre, ConvertirATexto(nuevo_Minuto))
	SiNo
		hora_Cierre = Concatenar(hora_Cierre,ConvertirATexto(nuevo_Minuto)) 
	FinSi
	
FinSubProceso


//Pantalla de apertura del módulo
SubProceso pom_Pantalla_Inicio
	esperar 1 segundos
	pom_Pantalla_Inicio_1
	esperar 500 Milisegundos
	Borrar Pantalla
	pom_Pantalla_Inicio_2
	esperar 500 Milisegundos
	Borrar Pantalla
	pom_Pantalla_Inicio_3
	esperar 500 Milisegundos
	Borrar Pantalla
	pom_Pantalla_Inicio_4
	esperar 500 Milisegundos
	Borrar Pantalla
	pom_Pantalla_Inicio_3
	esperar 500 Milisegundos
	Borrar Pantalla
	pom_Pantalla_Inicio_2
	esperar 500 Milisegundos
	Borrar Pantalla
	pom_Pantalla_Inicio_1
	esperar 500 Milisegundos
	
	Escribir 'PRESIONE UNA TECLA PARA COMENZAR...' Sin Saltar
	Esperar Tecla
FinSubProceso


SubProceso pom_Pantalla_Inicio_1
	//FUENTE: SPEED. Tomado de https://patorjk.com/
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir ">>============================================================================<<"
	Escribir "||                                        _________                           ||"
	Escribir "||         _____________________ _______________  /__________________         ||"
	Escribir "||         ___  __ \  __ \_  __ `__ \  __ \  __  /_  __ \_  ___/  __ \        ||"
	Escribir "||         __  /_/ / /_/ /  / / / / / /_/ / /_/ / / /_/ /  /   / /_/ /        ||"
	Escribir "||         _  .___/\____//_/ /_/ /_/\____/\__,_/  \____//_/    \____/         ||"
	Escribir "||         /_/                                                                ||"
	Escribir ">>============================================================================<<"
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
FinSubProceso


SubProceso pom_Pantalla_Inicio_2
	//FUENTE: SPEED. Tomado de https://patorjk.com/
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir ">>============================================================================<<"
	Escribir "||                                        _________                           ||"
	Escribir "||         _____________________ _______________  /__________________         ||"
	Escribir "||         ___  __ \  __ \_  __ `__ \  __ \  __  /_  __ \_  ___/  __ \        ||"
	Escribir "||         __  /_/ / /_/ /  / / / / / /_/ / /_/ / / /_/ /  /   / /_/ /        ||"
	Escribir "||         _  .___/\____//_/ /_/ /_/\____/\__,_/  \____//_/    \____/         ||"
	Escribir "||         /_/                                                                ||"
	Escribir ">>============================================================================<<"
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
FinSubProceso


SubProceso pom_Pantalla_Inicio_3
	//FUENTE: SPEED. Tomado de https://patorjk.com/
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir ">>============================================================================<<"
	Escribir "||                                        _________                           ||"
	Escribir "||         _____________________ _______________  /__________________         ||"
	Escribir "||         ___  __ \  __ \_  __ `__ \  __ \  __  /_  __ \_  ___/  __ \        ||"
	Escribir "||         __  /_/ / /_/ /  / / / / / /_/ / /_/ / / /_/ /  /   / /_/ /        ||"
	Escribir "||         _  .___/\____//_/ /_/ /_/\____/\__,_/  \____//_/    \____/         ||"
	Escribir "||         /_/                                                                ||"
	Escribir ">>============================================================================<<"
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
FinSubProceso


SubProceso pom_Pantalla_Inicio_4
	//FUENTE: SPEED. Tomado de https://patorjk.com/
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir ">>============================================================================<<"
	Escribir "||                                        _________                           ||"
	Escribir "||         _____________________ _______________  /__________________         ||"
	Escribir "||         ___  __ \  __ \_  __ `__ \  __ \  __  /_  __ \_  ___/  __ \        ||"
	Escribir "||         __  /_/ / /_/ /  / / / / / /_/ / /_/ / / /_/ /  /   / /_/ /        ||"
	Escribir "||         _  .___/\____//_/ /_/ /_/\____/\__,_/  \____//_/    \____/         ||"
	Escribir "||         /_/                                                                ||"
	Escribir ">>============================================================================<<"
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
FinSubProceso


//Pantalla de pausa del módulo entre submodulos
SubProceso pom_Pantalla_Pausa
	Definir opc Como Entero
	//FUENTE: SPEED. Tomado de https://patorjk.com/
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir ">>============================================================================<<"
	Escribir "||    ___ _________                   _____                        _____      ||"
	Escribir "||    ___(_)_  ___/___________ ____  ____(_)______ _________________ __ \     ||"
	Escribir "||    __  /_____ \_  _ \_  __ `/  / / /_  /__  __ `__ \  __ \_  ___/_/ _/     ||"
	Escribir "||    / _/_____/ //  __/  /_/ // /_/ /_  / _  / / / / / /_/ /(__  )_/_/       ||"
	Escribir "||    \___//____/ \___/_\__, / \__,_/ /_/  /_/ /_/ /_/\____//____/ (_)        ||"
	Escribir "||                     /____/                                                 ||"
	Escribir ">>============================================================================<<"
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir 'PRESIONE UNA TECLA PARA CONTINUAR..' Sin Saltar
	Esperar Tecla
FinSubProceso


//Pantalla para que el usuario elija si quiere dar otra ronda
Funcion opc <- pom_continuacion
	Definir opc Como Entero
	
	Repetir
		Limpiar Pantalla
		//FUENTE: SPEED. Tomado de https://patorjk.com/
		Escribir "                                                                                "
		Escribir "                                                                                "
		Escribir "                                                                                "
		Escribir "                                                                                "
		Escribir "                                                                                "
		Escribir "                                                                                "
		Escribir "                                                                                "
		Escribir "                                                                                "
		Escribir "                                                                                "
		Escribir "                                                                                "
		Escribir "            _   ____  __                                     __     ___         "
		Escribir "           (_) / __ \/ /__________ _   _________  ____  ____/ /___ /__ \        "
		Escribir "         _/ / / / / / __/ ___/ __ `/  / ___/ __ \/ __ \/ __  / __ `// _/        "
		Escribir "        / _/_/ /_/ / /_/ /  / /_/ /  / /  / /_/ / / / / /_/ / /_/ //_/          "
		Escribir "        \___/\____/\__/_/   \__,_/  /_/   \____/_/ /_/\__,_/\__,_/(_)           "
		Escribir "                                                                                "
		Escribir "                                                                                "
		Escribir "                                                                                "
		Escribir "                                                                                "
		Escribir "                                                                                "
		Escribir "                                                                                "
		Escribir "                                                                                "
		Escribir "1- Si 0- No: " Sin Saltar
		Leer opc
	Mientras Que opc<0 o opc>1
Fin Funcion