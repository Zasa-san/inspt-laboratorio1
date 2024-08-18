Algoritmo MAIN
	//ESPACIO GLOBAL
	//VAIRABLES GLOBALES DE CONFIGURACION
	Definir AGENDA_MAX Como Entero
	AGENDA_MAX = 1000
	
	//VARIABLES GLOBALES PARA MODULOS
	Definir con_agenda Como Caracter
	Dimensionar con_agenda[AGENDA_MAX,5]
	
	//ALGORITMOS DEL MODULO CONTACTO
	con_poblarContactos(con_agenda)
	con_ContactosMain(con_agenda, AGENDA_MAX)	
FinAlgoritmo

//ALGORITMOS Y FUNCIONES ESPEC�FICAS DEL M�DULO
SubAlgoritmo con_ContactosMain(agenda, AGENDA_MAX)
	Definir seleccion, indiceApellidos Como Entero
	
	con_ordenarPorApellido(agenda, AGENDA_MAX)
	
	Escribir "*Agenda de contactos*"
	
	//Mostrar menu principal del m�dulo
	seleccion = con_MenuPrincipal
	
	Segun seleccion Hacer
		1:
			con_VerPorApellido(agenda)
		2:
			Escribir "Buscar por nombre o apellido"
		De Otro Modo:
			Escribir "Saliendo..."
	Fin Segun
	
FinSubAlgoritmo

SubAlgoritmo con_ordenarPorApellido(agenda, AGENDA_MAX)
	Definir iterador, ordenador Como Entero
	Definir vectorAux Como Caracter
	Dimension vectorAux[5]
	iterador = 0
	
	Mientras iterador <  AGENDA_MAX Hacer
		ordenador = iterador + 1
		Mientras ordenador <  AGENDA_MAX Hacer
			Si agenda[ordenador, 1] = "" Entonces
				ordenador = AGENDA_MAX
			SiNo
				Si agenda[iterador, 1] > agenda[ordenador, 1] Entonces
					vectorAux[0] = agenda[iterador, 0]
					vectorAux[1] = agenda[iterador, 1]
					vectorAux[2] = agenda[iterador, 2]
					vectorAux[3] = agenda[iterador, 3]
					vectorAux[4] = agenda[iterador, 4]
					
					agenda[iterador, 0] = agenda[ordenador, 0]
					agenda[iterador, 1] = agenda[ordenador, 1]
					agenda[iterador, 2] = agenda[ordenador, 2]
					agenda[iterador, 3] = agenda[ordenador, 3]
					agenda[iterador, 4] = agenda[ordenador, 4]
					
					agenda[ordenador, 0] = vectorAux[0]
					agenda[ordenador, 1] = vectorAux[1]
					agenda[ordenador, 2] = vectorAux[2]
					agenda[ordenador, 3] = vectorAux[3]
					agenda[ordenador, 4] = vectorAux[4]
				FinSi
				ordenador = ordenador + 1
			FinSi		
		FinMientras		
		Si agenda[iterador, 1] = "" Entonces
			iterador = AGENDA_MAX
		SiNo
			iterador = iterador + 1
		FinSi	
	Fin Mientras	
FinSubAlgoritmo

Funcion seleccion = con_MenuPrincipal
	Definir opcion_elegida, invalido Como Entero
	invalido = 0
	Repetir
		Si opcion_elegida < 0 O opcion_elegida > 3 Entonces
			Escribir "**Debe elegir una opci�n v�lida**"
		FinSi
		Escribir "Opciones de navegaci�n:"
		Escribir "1 - Ver por apellido"
		Escribir "2 - Buscar por nombre o apellido"
		Escribir "0 - Para salir de la agenda"
		Leer opcion_elegida		
		Si opcion_elegida < 0 O opcion_elegida > 2 Entonces
			invalido = 1
		SiNo
			invalido = 0
			seleccion = opcion_elegida
		FinSi
		Limpiar Pantalla
	Mientras Que invalido = 1
	Limpiar Pantalla
FinFuncion

Funcion con_mostrarAlfabeto
	Escribir " 1 - a    2 - b    3 - c    4 - d    5 - e"
	Escribir " 6 - f    7 - g    8 - h    9 - i   10 - j"
	Escribir "11 - k   12 - l   13 - m   14 - n   15 - �"
	Escribir "16 - o   17 - p   18 - q   19 - r   20 - s"
	Escribir "21 - t   22 - u   23 - v   24 - w   25 - x"
	Escribir "26 - y   27 - z"		
FinFuncion

SubAlgoritmo con_VerPorApellido(agenda)
	Definir indiceAlfabeto, invalido, iterador Como Entero		
	invalido = 0	
	Escribir "Vista por apellido"	
	Repetir
		Si invalido = 1 Entonces
			Escribir "**Debe elegir un �ndice v�lido**"
		FinSi
		Escribir "Eliga la letra para ver todos los contactos agendados"
		Escribir "Para salir, escriba 0"
		con_mostrarAlfabeto()				
		Leer indiceAlfabeto			
		Si indiceAlfabeto < 0 O indiceAlfabeto > 27 Entonces
			invalido = 1			
		SiNo
			invalido = 0
		FinSi
		Limpiar Pantalla
	Mientras Que invalido = 1
	
	//*************************************
	//TEMPORAL PARA MOSTRAR AGENDA ORDENADA
	iterador = 0
	Mientras agenda[iterador, 1] <> "" Hacer
		Escribir agenda[iterador, 1], " ", agenda[iterador, 0]
		iterador = iterador + 1
	FinMientras
	//BORRAR PARA CONTINUAR Y QUITAR ITERADOR DE LAS DEFINICIONES
	//*************************************
FinSubAlgoritmo

Funcion con_poblarContactos(matriz)
	// Inicializar contactos
    matriz[0, 0] <- "Ana"
    matriz[0, 1] <- "Garc�a"
    matriz[0, 2] <- "1154782236"
    matriz[0, 3] <- "ana.garcia@example.com"
    matriz[0, 4] <- "Calle Falsa 456, Buenos Aires"
    
    matriz[1, 0] <- "Luis"
    matriz[1, 1] <- "Mart�nez"
    matriz[1, 2] <- ""
    matriz[1, 3] <- ""
    matriz[1, 4] <- "Av. Santa Fe 1234, Buenos Aires"
	
    matriz[2, 0] <- "Sof�a"
    matriz[2, 1] <- "Rodr�guez"
    matriz[2, 2] <- "1154782238"
    matriz[2, 3] <- ""
    matriz[2, 4] <- "Calle C�rdoba 789, Buenos Aires"
    
    matriz[3, 0] <- "Mart�n"
    matriz[3, 1] <- "Silva"
    matriz[3, 2] <- "1154782239"
    matriz[3, 3] <- "martin.silva@example.com"
    matriz[3, 4] <- ""
	
    matriz[4, 0] <- "Julia"
    matriz[4, 1] <- "P�rez"
    matriz[4, 2] <- "1154782240"
    matriz[4, 3] <- ""
    matriz[4, 4] <- "Calle Avellaneda 234, Buenos Aires"
	
    matriz[5, 0] <- "Ricardo"
    matriz[5, 1] <- "Fern�ndez"
    matriz[5, 2] <- "1154782241"
    matriz[5, 3] <- ""
    matriz[5, 4] <- "Calle Moreno 678, Buenos Aires"
	
    matriz[6, 0] <- "Carla"
    matriz[6, 1] <- "Vega"
    matriz[6, 2] <- ""
    matriz[6, 3] <- ""
    matriz[6, 4] <- "Av. C�rdoba 890, Buenos Aires"
    
    matriz[7, 0] <- "Pedro"
    matriz[7, 1] <- "G�mez"
    matriz[7, 2] <- "1154782243"
    matriz[7, 3] <- "pedro.gomez@example.com"
    matriz[7, 4] <- "Calle San Juan 300, Buenos Aires"
    
    matriz[8, 0] <- "Natalia"
    matriz[8, 1] <- "Vargas"
    matriz[8, 2] <- "1154782244"
    matriz[8, 3] <- ""
    matriz[8, 4] <- "Av. San Mart�n 1500, Buenos Aires"
	
    matriz[9, 0] <- "Tom�s"
    matriz[9, 1] <- "Morales"
    matriz[9, 2] <- ""
    matriz[9, 3] <- ""
    matriz[9, 4] <- ""
    
    matriz[10, 0] <- "M�nica"
    matriz[10, 1] <- "Fern�ndez"
    matriz[10, 2] <- "1154782246"
    matriz[10, 3] <- ""
    matriz[10, 4] <- "Calle Sarmiento 250, Buenos Aires"
	
    matriz[11, 0] <- "Gustavo"
    matriz[11, 1] <- "Mart�nez"
    matriz[11, 2] <- "1154782247"
    matriz[11, 3] <- ""
    matriz[11, 4] <- "Av. 9 de Julio 700, Buenos Aires"
	
    matriz[12, 0] <- "Valeria"
    matriz[12, 1] <- "Castro"
    matriz[12, 2] <- "1154782248"
    matriz[12, 3] <- ""
    matriz[12, 4] <- "Calle Tucum�n 600, Buenos Aires"
	
    matriz[13, 0] <- "Juan"
    matriz[13, 1] <- "Salazar"
    matriz[13, 2] <- "1154782249"
    matriz[13, 3] <- ""
    matriz[13, 4] <- "Av. Rivadavia 1000, Buenos Aires"
	
    matriz[14, 0] <- "Sandra"
    matriz[14, 1] <- "Bravo"
    matriz[14, 2] <- "1154782250"
    matriz[14, 3] <- ""
    matriz[14, 4] <- "Calle Chile 800, Buenos Aires"
	
    matriz[15, 0] <- "Emilio"
    matriz[15, 1] <- "Guti�rrez"
    matriz[15, 2] <- "1154782251"
    matriz[15, 3] <- ""
    matriz[15, 4] <- "Av. Santa Fe 900, Buenos Aires"
	
    matriz[16, 0] <- "Florencia"
    matriz[16, 1] <- "Sosa"
    matriz[16, 2] <- "1154782252"
    matriz[16, 3] <- ""
    matriz[16, 4] <- "Calle Montevideo 500, Buenos Aires"
	
    matriz[17, 0] <- "�lvaro"
    matriz[17, 1] <- "Jim�nez"
    matriz[17, 2] <- "1154782253"
    matriz[17, 3] <- ""
    matriz[17, 4] <- "Av. Belgrano 1200, Buenos Aires"
    
    matriz[18, 0] <- "Carmen"
    matriz[18, 1] <- "Rivas"
    matriz[18, 2] <- "1154782254"
    matriz[18, 3] <- ""
    matriz[18, 4] <- "Calle Paran� 300, Buenos Aires"
	
    matriz[19, 0] <- "Jorge"
    matriz[19, 1] <- "Gonz�lez"
    matriz[19, 2] <- "1154782255"
    matriz[19, 3] <- ""
    matriz[19, 4] <- "Calle Lavalle 1200, Buenos Aires"
	
    matriz[20, 0] <- "Silvia"
    matriz[20, 1] <- "Cruz"
    matriz[20, 2] <- "1154782256"
    matriz[20, 3] <- ""
    matriz[20, 4] <- "Av. Corrientes 1500, Buenos Aires"
    
    matriz[21, 0] <- "Ricardo"
    matriz[21, 1] <- "Vega"
    matriz[21, 2] <- "1154782257"
    matriz[21, 3] <- ""
    matriz[21, 4] <- "Calle San Mart�n 2000, Buenos Aires"
	
    matriz[22, 0] <- "Gabriela"
    matriz[22, 1] <- "Ram�rez"
    matriz[22, 2] <- "1154782258"
    matriz[22, 3] <- "gabriela.ramirez@example.com"
    matriz[22, 4] <- ""
	
    matriz[23, 0] <- "Tom�s"
    matriz[23, 1] <- "Fern�ndez"
    matriz[23, 2] <- "1154782259"
    matriz[23, 3] <- ""
    matriz[23, 4] <- "Calle Olavarr�a 123, Buenos Aires"
    
    matriz[24, 0] <- "Renata"
    matriz[24, 1] <- "Gonz�lez"
    matriz[24, 2] <- "1154782260"
    matriz[24, 3] <- "renata.gonzalez@example.com"
    matriz[24, 4] <- "Av. Libertador 200, Buenos Aires"
FinFuncion
