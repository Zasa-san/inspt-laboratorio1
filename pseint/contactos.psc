Algoritmo MAIN
	//ESPACIO GLOBAL
	//VAIRABLES GLOBALES DE CONFIGURACION
	Definir AGENDA_MAX Como Entero
	AGENDA_MAX = 1000
	
	//VARIABLES GLOBALES PARA MODULOS
	Definir con_agenda, con_indicePorApellido Como Caracter
	Dimensionar con_agenda[AGENDA_MAX,5]
	
	//ALGORITMOS DEL MODULO CONTACTO
	con_poblarContactos(con_agenda)
	con_ContactosMain(con_agenda, AGENDA_MAX)
	Escribir "Se ha regresado al main..."
FinAlgoritmo

//ALGORITMOS Y FUNCIONES ESPECÍFICAS DEL MÓDULO
SubAlgoritmo con_ContactosMain(agenda, AGENDA_MAX)
	Definir seleccion, indiceApellidos, cantidadDeContactos Como Entero
	Dimensionar indiceApellidos[27,2]
	
	con_inicializarIndice(indiceApellidos)
	con_ordenarPorApellido(agenda, indiceApellidos, AGENDA_MAX)
	cantidadDeContactos = con_longitudArreglo(agenda, AGENDA_MAX)
	Repetir
		Escribir "*Agenda de contactos*"
		Escribir "Actualmente tiene ", cantidadDeContactos, "/", AGENDA_MAX ," contactos guardados"
		Escribir " "
		seleccion = con_MenuPrincipal	
		Segun seleccion Hacer
			1:
				con_VerPorApellido(agenda, indiceApellidos)
			2:
				Escribir "Buscar por nombre o apellido (no hecho aún)"
			3:
				con_AgregarContacto(agenda, cantidadDeContactos, AGENDA_MAX)
				con_ordenarPorApellido(agenda, indiceApellidos, AGENDA_MAX)
				cantidadDeContactos = con_longitudArreglo(agenda, AGENDA_MAX)
			De Otro Modo:
				Escribir "Saliendo..."
		Fin Segun
		Limpiar Pantalla
	Mientras Que seleccion <> 0	
FinSubAlgoritmo

SubAlgoritmo con_AgregarContacto(agenda, indice, AGENDA_MAX)
	Definir textoIngresado, elementos Como Caracter
	Definir guardar, iterador, maxIndice Como Entero
	iterador = 0
	guardar = 0
	maxIndice = 4
	
	Dimensionar elementos[maxIndice + 1]	
	elementos[0] = "Nombre"
	elementos[1] = "Apellido"
	elementos[2] = "Telefono"
	elementos[3] = "Email"
	elementos[4] = "Dirección"
	
	Mientras iterador < maxIndice Hacer
		Limpiar Pantalla
		Escribir "Creación de nuevo contacto"
		Escribir "0 - Salir sin guardar"
		Escribir "1 - Guardar"
		Escribir " "
		Si indice >= AGENDA_MAX Entonces
			iterador = maxIndice
			Escribir "Ha alcanzado el máximo de contactos posibles, no se pueden agregar nuevos contactos"
			Esperar Tecla
		SiNo
			con_MostrarContacto(agenda, indice)
			Escribir elementos[iterador], ": " Sin Saltar
			Leer textoIngresado
			Si textoIngresado = "0" Entonces
				iterador = maxIndice
				agenda[indice, 0] = ""
				agenda[indice, 1] = ""
				agenda[indice, 2] = ""
				agenda[indice, 3] = ""
				agenda[indice, 4] = ""
			SiNo
				Si iterador < 2 Y textoIngresado = "1"  Entonces					
					Limpiar Pantalla
					Escribir "Tanto el nombre como el apellido deben completarse antes de guardar..."
					Esperar Tecla					
				SiNo
					Si textoIngresado = "1" Entonces
						guardar = 1
						iterador = maxIndice
					SiNo
						agenda[indice, iterador] = textoIngresado
						iterador = iterador + 1
					FinSi
				FinSi				
			FinSi
		FinSi	
		
		Si iterador = maxIndice Y guardar = 1 Entonces
			Limpiar Pantalla
			Escribir "El contacto a guardar es: "
			Escribir "0 - Salir sin guardar"
			Escribir "1 - Confirmar guardado"
			con_MostrarContacto(agenda, indice)
			Escribir "Elija la opción " Sin Saltar
			Leer guardar			
			Si guardar <> 1 Entonces
				agenda[indice, 0] = ""
				agenda[indice, 1] = ""
				agenda[indice, 2] = ""
				agenda[indice, 3] = ""
				agenda[indice, 4] = ""
			FinSi		
		FinSi
	Fin Mientras
FinSubAlgoritmo

SubAlgoritmo con_VerPorApellido(agenda, indice)
	Definir indiceAlfabeto, iterador, invalido Como Entero		
	Definir letraElegida Como Caracter
	invalido = 0
	
	Escribir "Vista por apellido"	
	Repetir
		Si invalido = 0 Entonces
			Escribir "Eliga la letra para ver todos los contactos agendados"
			Escribir "Para salir, escriba 0"		
			Leer letraElegida
		FinSi
		Si letraElegida <> "0" Entonces			
			indiceAlfabeto = con_obtenerIndice(letraElegida)
			Si indiceAlfabeto = -1 Entonces
				Limpiar Pantalla
				invalido = 1
				Escribir "**No se ha podido reconocer la letra ingresada**"
				Escribir "Ingrese nuevamente una letra, o 0 para salir"
				Leer letraElegida
			SiNo
				invalido = 0
				Si indice[indiceAlfabeto, 1] <> -1 Entonces
					Para iterador = 0 Hasta indice[indiceAlfabeto, 1] - 1 Con Paso 1 Hacer
						Escribir iterador+1, ") ", agenda[indice[indiceAlfabeto, 0] + iterador, 1], " ", agenda[indice[indiceAlfabeto, 0] + iterador, 0]
					Fin Para
				SiNo
					Escribir "No hay contactos con apellidos que inicien en *", letraElegida, "*"
				FinSi
				Esperar Tecla				
			FinSi
		SiNo
			invalido = 0
		FinSi
	Mientras Que invalido = 1
FinSubAlgoritmo

SubAlgoritmo con_ordenarPorApellido(agenda, indice, AGENDA_MAX)
	Definir i, j, letraAnterior, letraSiguiente Como Entero
	Definir vectorAux Como Caracter
	Dimension vectorAux[5]
	
	i = 0	
	Mientras i <  AGENDA_MAX Hacer
		j = i + 1
		Mientras j <  AGENDA_MAX Hacer
			Si agenda[j, 1] = "" Entonces
				j = AGENDA_MAX
			SiNo
				Si agenda[i, 1] > agenda[j, 1] Entonces
					vectorAux[0] = agenda[i, 0]
					vectorAux[1] = agenda[i, 1]
					vectorAux[2] = agenda[i, 2]
					vectorAux[3] = agenda[i, 3]
					vectorAux[4] = agenda[i, 4]
					
					agenda[i, 0] = agenda[j, 0]
					agenda[i, 1] = agenda[j, 1]
					agenda[i, 2] = agenda[j, 2]
					agenda[i, 3] = agenda[j, 3]
					agenda[i, 4] = agenda[j, 4]
					
					agenda[j, 0] = vectorAux[0]
					agenda[j, 1] = vectorAux[1]
					agenda[j, 2] = vectorAux[2]
					agenda[j, 3] = vectorAux[3]
					agenda[j, 4] = vectorAux[4]
				FinSi
				j = j + 1
			FinSi		
		FinMientras
		Si agenda[i, 1] = "" Entonces
			i = AGENDA_MAX
		SiNo
			i = i + 1			
		FinSi			
	Fin Mientras
	
	i = 0
	letraAnterior = con_obtenerIndice(Subcadena(agenda[0, 1], 0 , 0))
	indice[letraAnterior, 0] = 0
	indice[letraAnterior, 1] = 1
	Mientras i <  AGENDA_MAX Hacer
		Si agenda[i, 1] = "" Entonces
			i = AGENDA_MAX
		SiNo
			letraAnterior = con_obtenerIndice(Subcadena(agenda[i, 1], 0, 0))
			letraSiguiente = con_obtenerIndice(Subcadena(agenda[i + 1, 1], 0, 0))
			Si letraSiguiente <> -1 Entonces				
				Si letraAnterior = letraSiguiente Entonces			
					indice[letraAnterior, 1] = indice[letraAnterior, 1] + 1
				SiNo				
					indice[letraSiguiente, 0] = i + 1
					indice[letraSiguiente, 1] = 1
				FinSi			
			FinSi
			i = i + 1
		FinSi
	FinMientras	
FinSubAlgoritmo

Funcion indice = con_obtenerIndice(letra)
	Segun letra Hacer
		'a' O 'A' O 'á' O 'Á':
			indice = 0
		'b' O 'B':
			indice = 1
		'c' O 'C':
			indice = 2
		'd' O 'D':
			indice = 3
		'e' O 'E' O 'é' O 'É':
			indice = 4
		'f' O 'F':
			indice = 5
		'g' O 'G':
			indice = 6
		'h' O 'H':
			indice = 7
		'i' O 'I' O 'í' O 'Í':
			indice = 8
		'j' O 'J':
			indice = 9
		'k' O 'K':
			indice = 10
		'l' O 'L':
			indice = 11
		'm' O 'M':
			indice = 12
		'n' O 'N':
			indice = 13
		'ñ' O 'Ñ':
			indice = 14
		'o' O 'O' O 'ó' O 'Ó':
			indice = 15
		'p' O 'P':
			indice = 16
		'q' O 'Q':
			indice = 17
		'r' O 'R':
			indice = 18
		's' O 'S':
			indice = 19
		't' O 'T':
			indice = 20
		'u' O 'U' O 'ú' O 'Ú':
			indice = 21
		'v' O 'V':
			indice = 22
		'w' O 'W':
			indice = 23
		'x' O 'X':
			indice = 24
		'y' O 'Y':
			indice = 25
		'z' O 'Z':
			indice = 26
		De Otro Modo:
			indice = -1
	Fin Segun
FinFuncion

SubAlgoritmo con_MostrarContacto(agenda, indice)
	Escribir "Nombre: ", agenda[indice, 0]
	Escribir "Apellido: ", agenda[indice, 1]
	Escribir "Telefono: ", agenda[indice, 2]
	Escribir "Email: ", agenda[indice, 3]
	Escribir "Dirección: ", agenda[indice, 4]
FinSubAlgoritmo

Funcion seleccion = con_MenuPrincipal
	Definir opcion_elegida, invalido Como Entero
	invalido = 0
	Repetir
		Si opcion_elegida < 0 O opcion_elegida > 2 Entonces
			Escribir "**Debe elegir una opción válida**"
		FinSi
		Escribir "Opciones de navegación:"
		Escribir "1 - Ver por apellido"
		Escribir "2 - Buscar por nombre o apellido"
		Escribir "3 - Agregar nuevo contacto"
		Escribir "0 - Para salir de la agenda"
		Leer opcion_elegida		
		Si opcion_elegida < 0 O opcion_elegida > 3 Entonces
			invalido = 1
		SiNo
			invalido = 0
			seleccion = opcion_elegida
		FinSi
		Limpiar Pantalla
	Mientras Que invalido = 1
	Limpiar Pantalla
FinFuncion

SubAlgoritmo con_inicializarIndice(indice)
	Definir iterador Como Entero
	Para iterador = 0 Hasta 26 Con Paso 1
		indice[iterador, 1] = -1
	FinPara
FinSubAlgoritmo

Funcion longitudArreglo <- con_longitudArreglo(arreglo, max)
	Definir contador, salir Como Entero
	contador = 0
	salir = 0
	Mientras salir = 0 Y contador < max Hacer
		Si arreglo[contador, 0] = "" Entonces
			salir = 1
		SiNo
			contador = contador + 1	
		FinSi
	FinMientras
	longitudArreglo = contador
FinFuncion

SubAlgoritmo con_poblarContactos(matriz)
	// Inicializar contactos
    matriz[0, 0] <- "Ana"
    matriz[0, 1] <- "García"
    matriz[0, 2] <- "1154782236"
    matriz[0, 3] <- "ana.garcia@example.com"
    matriz[0, 4] <- "Calle Falsa 456, Buenos Aires"
    
    matriz[1, 0] <- "Luis"
    matriz[1, 1] <- "Martínez"
    matriz[1, 2] <- ""
    matriz[1, 3] <- ""
    matriz[1, 4] <- "Av. Santa Fe 1234, Buenos Aires"
	
    matriz[2, 0] <- "Sofía"
    matriz[2, 1] <- "Rodríguez"
    matriz[2, 2] <- "1154782238"
    matriz[2, 3] <- ""
    matriz[2, 4] <- "Calle Córdoba 789, Buenos Aires"
    
    matriz[3, 0] <- "Martín"
    matriz[3, 1] <- "Silva"
    matriz[3, 2] <- "1154782239"
    matriz[3, 3] <- "martin.silva@example.com"
    matriz[3, 4] <- ""
	
    matriz[4, 0] <- "Julia"
    matriz[4, 1] <- "Pérez"
    matriz[4, 2] <- "1154782240"
    matriz[4, 3] <- ""
    matriz[4, 4] <- "Calle Avellaneda 234, Buenos Aires"
	
    matriz[5, 0] <- "Ricardo"
    matriz[5, 1] <- "Fernández"
    matriz[5, 2] <- "1154782241"
    matriz[5, 3] <- ""
    matriz[5, 4] <- "Calle Moreno 678, Buenos Aires"
	
    matriz[6, 0] <- "Carla"
    matriz[6, 1] <- "Vega"
    matriz[6, 2] <- ""
    matriz[6, 3] <- ""
    matriz[6, 4] <- "Av. Córdoba 890, Buenos Aires"
    
    matriz[7, 0] <- "Pedro"
    matriz[7, 1] <- "Gómez"
    matriz[7, 2] <- "1154782243"
    matriz[7, 3] <- "pedro.gomez@example.com"
    matriz[7, 4] <- "Calle San Juan 300, Buenos Aires"
    
    matriz[8, 0] <- "Natalia"
    matriz[8, 1] <- "Vargas"
    matriz[8, 2] <- "1154782244"
    matriz[8, 3] <- ""
    matriz[8, 4] <- "Av. San Martín 1500, Buenos Aires"
	
    matriz[9, 0] <- "Tomás"
    matriz[9, 1] <- "Morales"
    matriz[9, 2] <- ""
    matriz[9, 3] <- ""
    matriz[9, 4] <- ""
    
    matriz[10, 0] <- "Mónica"
    matriz[10, 1] <- "Fernández"
    matriz[10, 2] <- "1154782246"
    matriz[10, 3] <- ""
    matriz[10, 4] <- "Calle Sarmiento 250, Buenos Aires"
	
    matriz[11, 0] <- "Gustavo"
    matriz[11, 1] <- "Martínez"
    matriz[11, 2] <- "1154782247"
    matriz[11, 3] <- ""
    matriz[11, 4] <- "Av. 9 de Julio 700, Buenos Aires"
	
    matriz[12, 0] <- "Valeria"
    matriz[12, 1] <- "Castro"
    matriz[12, 2] <- "1154782248"
    matriz[12, 3] <- ""
    matriz[12, 4] <- "Calle Tucumán 600, Buenos Aires"
	
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
    matriz[15, 1] <- "Gutiérrez"
    matriz[15, 2] <- "1154782251"
    matriz[15, 3] <- ""
    matriz[15, 4] <- "Av. Santa Fe 900, Buenos Aires"
	
    matriz[16, 0] <- "Florencia"
    matriz[16, 1] <- "Sosa"
    matriz[16, 2] <- "1154782252"
    matriz[16, 3] <- ""
    matriz[16, 4] <- "Calle Montevideo 500, Buenos Aires"
	
    matriz[17, 0] <- "Álvaro"
    matriz[17, 1] <- "Jiménez"
    matriz[17, 2] <- "1154782253"
    matriz[17, 3] <- ""
    matriz[17, 4] <- "Av. Belgrano 1200, Buenos Aires"
    
    matriz[18, 0] <- "Carmen"
    matriz[18, 1] <- "Rivas"
    matriz[18, 2] <- "1154782254"
    matriz[18, 3] <- ""
    matriz[18, 4] <- "Calle Paraná 300, Buenos Aires"
	
    matriz[19, 0] <- "Jorge"
    matriz[19, 1] <- "González"
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
    matriz[21, 4] <- "Calle San Martín 2000, Buenos Aires"
	
    matriz[22, 0] <- "Gabriela"
    matriz[22, 1] <- "Ramírez"
    matriz[22, 2] <- "1154782258"
    matriz[22, 3] <- "gabriela.ramirez@example.com"
    matriz[22, 4] <- ""
	
    matriz[23, 0] <- "Tomás"
    matriz[23, 1] <- "Fernández"
    matriz[23, 2] <- "1154782259"
    matriz[23, 3] <- ""
    matriz[23, 4] <- "Calle Olavarría 123, Buenos Aires"
    
    matriz[24, 0] <- "Renata"
    matriz[24, 1] <- "González"
    matriz[24, 2] <- "1154782260"
    matriz[24, 3] <- "renata.gonzalez@example.com"
    matriz[24, 4] <- "Av. Libertador 200, Buenos Aires"
FinSubAlgoritmo

