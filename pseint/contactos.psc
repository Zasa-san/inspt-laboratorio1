Algoritmo MAIN
	//ESPACIO GLOBAL
	//VAIRABLES GLOBALES DE CONFIGURACION
	Definir AGENDA_MAX, ID Como Entero
	AGENDA_MAX = 1000
	
	//VARIABLES GLOBALES PARA MODULOS
	Definir con_agenda, con_indicePorApellido Como Caracter
	Dimensionar con_agenda[AGENDA_MAX,6]
	
	//ALGORITMOS DEL MODULO CONTACTO
	con_poblarContactos(con_agenda, ID)
	con_ContactosMain(con_agenda, AGENDA_MAX, ID)
	Escribir "Se ha regresado al main..."
FinAlgoritmo

//ALGORITMOS Y FUNCIONES ESPEC�FICAS DEL M�DULO
SubAlgoritmo con_ContactosMain(agenda, AGENDA_MAX, ID Por Referencia)
	Definir seleccion, indiceApellidos, cantidadDeContactos, reordenarContacto Como Entero
	Dimensionar indiceApellidos[27,2]
	
	con_ordenarPorApellido(agenda, indiceApellidos, AGENDA_MAX)
	cantidadDeContactos = con_longitudArreglo(agenda, AGENDA_MAX)
	Repetir
		reordenarContacto = 0
		con_bienvenida()
		Escribir "*Agenda de contactos*"
		Escribir "Actualmente tiene ", cantidadDeContactos, "/", AGENDA_MAX ," contactos guardados"
		Escribir " "
		seleccion = con_MenuPrincipal	
		Segun seleccion Hacer
			1:
				reordenarContactos = con_verPorApellido(agenda, indiceApellidos, AGENDA_MAX, ID)
			2:
				reordenarContactos = con_buscarPorNombre(agenda, AGENDA_MAX, ID)
			3:
				reordenarContactos = con_agregarOCambiarContacto(agenda, cantidadDeContactos, AGENDA_MAX, ID)
			4:
				reordenarContactos = con_listarTodos(agenda, cantidadDeContactos, AGENDA_MAX, ID)
			De Otro Modo:
				Escribir "Saliendo..."
				Esperar Tecla
		Fin Segun
		
	    Si reordenarContactos = 1 Entonces
			con_ordenarPorApellido(agenda, indiceApellidos, AGENDA_MAX)
			cantidadDeContactos = con_longitudArreglo(agenda, AGENDA_MAX)
		FinSi
		
		Limpiar Pantalla
	Mientras Que seleccion <> 0	
FinSubAlgoritmo

Funcion reordenarContactos <- con_agregarOCambiarContacto(agenda, indice, AGENDA_MAX, ID Por Referencia)
	Definir textoIngresado, elementos, contactoOriginal Como Caracter
	Definir guardar, iterador, maxIndice Como Entero
	iterador = 1
	guardar = 0
	maxIndice = 6
	reordenarContactos = 0
	
	Dimensionar elementos[maxIndice]
	elementos[0] = "ID" //No se usa
	elementos[1] = "Nombre"
	elementos[2] = "Apellido"
	elementos[3] = "Telefono"
	elementos[4] = "Email"
	elementos[5] = "Direcci�n"
	
	Dimensionar contactoOriginal[6]
	contactoOriginal[0] = agenda[indice, 0]
	contactoOriginal[1] = agenda[indice, 1]
	contactoOriginal[2] = agenda[indice, 2]
	contactoOriginal[3] = agenda[indice, 3]
	contactoOriginal[4] = agenda[indice, 4]
	contactoOriginal[5] = agenda[indice, 5]
	
	Mientras iterador < maxIndice Hacer
		con_tituloAgregarOCambiar()
		
		Si iterador = 3 Entonces
			Escribir "Para el telofono ingrese solo numeros"
			Escribir "o presione ENTER par adejar vacio"
		SiNo
			Escribir "0 - Salir sin guardar"
			Escribir "1 - Guardar"			
		FinSi
		Escribir " "
		
		Si contactoOriginal[0] = "" Y indice >= AGENDA_MAX Entonces
			iterador = maxIndice
			Escribir "Ha alcanzado el m�ximo de contactos posibles, no se pueden agregar nuevos contactos"
			Esperar Tecla
		SiNo
			con_MostrarContacto(agenda, indice)
			Escribir elementos[iterador], ": " Sin Saltar
			Leer textoIngresado
			Si textoIngresado = "0" Entonces
				iterador = maxIndice
				agenda[indice, 0] = contactoOriginal[0]
				agenda[indice, 1] = contactoOriginal[1]
				agenda[indice, 2] = contactoOriginal[2]
				agenda[indice, 3] = contactoOriginal[3]
				agenda[indice, 4] = contactoOriginal[4]
				agenda[indice, 5] = contactoOriginal[5]
				guardar = 0
			SiNo
				Si textoIngresado = "" Y iterador < 3 Entonces					
					Limpiar Pantalla
					Escribir "El nombre y apellido deben completarse antes de guardar..."
					Esperar Tecla					
				SiNo
					Si textoIngresado = "1" Y iterador <> 3 Entonces						
						iterador = maxIndice
					SiNo
						agenda[indice, iterador] = textoIngresado
						iterador = iterador + 1
					FinSi
					guardar = 1
				FinSi				
			FinSi
		FinSi
		
		Si iterador = maxIndice Y guardar = 1 Entonces			
			Limpiar Pantalla
			con_hacerLinea()
			Escribir "El contacto a guardar es: "
			con_hacerLinea()
			Escribir "0 - Salir sin guardar"
			Escribir "1 - Confirmar guardado"
			con_MostrarContacto(agenda, indice)
			Escribir "Elija la opci�n " Sin Saltar
			Leer guardar
			Si guardar = 1 Entonces
				reordenarContactos = 1
				Si agenda[indice, 0] == "" Entonces
					agenda[indice, 0] = ConvertirATexto(ID)
					ID = ID + 1
				FinSi
			SiNo
				agenda[indice, 0] = contactoOriginal[0]
				agenda[indice, 1] = contactoOriginal[1]
				agenda[indice, 2] = contactoOriginal[2]
				agenda[indice, 3] = contactoOriginal[3]
				agenda[indice, 4] = contactoOriginal[4]
				agenda[indice, 5] = contactoOriginal[5]	
			FinSi
		FinSi
	Fin Mientras
FinFuncion

Funcion reordenarContactos = con_buscarPorNombre(agenda, AGENDA_MAX, ID Por Referencia)
	Definir iteradorI, resultados, contactoElegido, opcionElegida Como Entero
	Definir ingreso, subcadenaIngreso, subcadenaNombre, subcadenaApellido Como Caracter
	
	MAX_RESULTADOS = 10
	Dimensionar resultados[MAX_RESULTADOS,2] //indice de la agenda, peso de la igualdad
	Dimensionar resultadosSwap[2]
	reordenarContactos = 0
	
	con_tituloBuscarPorNombre
	Escribir "Escriba el nombre y/o apellido a buscar"
	Escribir "Para salir, escriba 0"
	Leer ingreso
	
	Si ingreso <> "0" Entonces
		con_generarResultados(agenda, resultados, ingreso, AGENDA_MAX, MAX_RESULTADOS)
		Limpiar Pantalla
		con_tituloBuscarPorNombre
		Si resultados[0,1] = 0 Entonces
			Escribir "No se han encontrado resultados para la busqueda"
		SiNo
			Repetir
				Limpiar Pantalla
				con_tituloBuscarPorNombre
				Escribir "Use las teclas num�ricas para elegir un contacto"
				Escribir "Para salir, escriba 0"
				Para iteradorI = 0 Hasta MAX_RESULTADOS - 1 Con Paso 1 Hacer
					Si resultados[iteradorI, 1] > 0 Entonces			
						Escribir iteradorI + 1, ") ", agenda[resultados[iteradorI, 0], 1], " ", agenda[resultados[iteradorI, 0], 2]			
					FinSi
				Fin Para
				Leer contactoElegido
			Mientras Que contactoElegido > 10 O contactoElegido < 0		
		FinSi		
	FinSi
	
	Si contactoElegido <> 0 Entonces
		Limpiar Pantalla
		con_hacerLinea()
		con_MostrarContacto(agenda, resultados[contactoElegido - 1, 0])
		con_hacerLinea()
		Escribir "1 - Editar este contacto"
		Escribir "2 - Borrar este contacto"
		Escribir "0 - Salir"
		Leer opcionElegida
		Segun opcionElegida Hacer
			1: 
				reordenarContactos = con_agregarOCambiarContacto(agenda, resultados[contactoElegido - 1, 0], AGENDA_MAX, ID)									
			2: 
				reordenarContactos = con_eliminarContacto(agenda, resultados[contactoElegido - 1, 0], AGENDA_MAX)		
		Fin Segun
	FinSi
FinFuncion

Funcion reordenarContactos <- con_verPorApellido(agenda, indice, AGENDA_MAX, ID Por Referencia)
	Definir indiceAlfabeto, iterador, invalido, contactoElegido, opcionElegida, indiceDeContacto Como Entero		
	Definir letraElegida Como Caracter
	invalido = 0
	reordenarContactos = 0
	
	con_tituloVerPorApellido()
	
	Repetir
		indiceAlfabeto = 0
		letraElegida = "0"
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
				Si indice[indiceAlfabeto, 1] = -1 Entonces
					con_tituloVerPorApellido()
					Escribir "No hay contactos con apellidos que inicien en *", letraElegida, "*"
					Esperar Tecla
				SiNo
					con_tituloVerPorApellido()
					Para iterador = 0 Hasta indice[indiceAlfabeto, 1] - 1 Con Paso 1 Hacer						
						Escribir iterador+1, ") ", agenda[indice[indiceAlfabeto, 0] + iterador, 2], " ", agenda[indice[indiceAlfabeto, 0] + iterador, 1]						
					Fin Para
					Escribir "Use las teclas num�ricas para elegir un contacto"
					Escribir "o 0 para salir"
					Leer contactoElegido
					Si contactoElegido > 0 Entonces					
						Mientras contactoElegido > iterador + 1
							Limpiar Pantalla
							Escribir "*El n�mero elegido no corresponde a ning�n contacto listado*"
							Escribir "Elija un n�mero de la siguiente lista"
							Escribir "Para salir, escriba 0"
							Para iterador = 0 Hasta indice[indiceAlfabeto, 1] - 1 Con Paso 1 Hacer
								Escribir iterador+1, ") ", agenda[indice[indiceAlfabeto, 0] + iterador, 2], " ", agenda[indice[indiceAlfabeto, 0] + iterador, 1]						
							Fin Para
							Leer contactoElegido
						FinMientras
						Si contactoElegido > 0 Entonces
							indiceDeContacto = indice[indiceAlfabeto, 0] + contactoElegido - 1
							Limpiar Pantalla
							con_hacerLinea()
							con_MostrarContacto(agenda, indiceDeContacto)
							con_hacerLinea()
							Escribir "1 - Editar este contacto"
							Escribir "2 - Borrar este contacto"
							Escribir "0 - Volver"
							Leer contactoElegido
							Segun contactoElegido Hacer
								1: 
									reordenarContactos = con_agregarOCambiarContacto(agenda, indiceDeContacto, AGENDA_MAX, ID)									
								2: 
									reordenarContactos = con_eliminarContacto(agenda, indiceDeContacto, AGENDA_MAX)		
							Fin Segun
						FinSi
					FinSi
				FinSi	
			FinSi
		SiNo
			invalido = 0
		FinSi
	Mientras Que invalido = 1
FinFuncion

Funcion reordenarContactos <- con_listarTodos(agenda, cantidadDeContactos, AGENDA_MAX, ID Por Referencia)
	Definir iterador, pagina, maxPagina, opcionElegida, tope Como Entero
	
	reordenarContactos = 0
	pagina = 0
	maxPagina = 10	
	
	Repetir	
		tope = (pagina * 10 + maxPagina)
		
		Si tope > cantidadDeContactos Entonces
			tope = cantidadDeContactos
		FinSi
		
		con_tituloListarTodos
		
		Si opcionElegida < 0 O opcionElegida > 3 Entonces
			Escribir "Debe elegir una opci�n v�lida"
			con_hacerLinea
		FinSi
		
		Escribir "Pagina " pagina + 1
		Escribir "0 - Salir"
		Escribir "1 - P�gina anterior"
		Escribir "2 - P�gina siguiente"
		Escribir "3 - Elegir contacto de esta p�gina"
		
		con_hacerLinea
		
		Para iterador <- pagina * 10 Hasta tope - 1 Con Paso 1 Hacer
			Escribir iterador + 1, ") ",  agenda[iterador, 2], " ", agenda[iterador, 1], " - (ID:", agenda[iterador, 0], ")"
		Fin Para
		
		Leer opcionElegida
		
		Segun opcionElegida Hacer
			0:
				pagina = cantidadDeContactos
			1:
				Si pagina > 1 Entonces
					pagina = pagina - 1
				SiNo
					pagina = 0
				FinSi				
			2:
				Si tope < cantidadDeContactos Entonces
					pagina = pagina + 1				
				FinSi
			3:
				reordenarContactos = con_elegirEnPagina(agenda, tope, pagina, AGENDA_MAX, ID)
		Fin Segun
		
	Mientras Que opcionElegida <> 0 Y reordenarContactos <> 1
FinFuncion

Funcion reordenarContactos <- con_elegirEnPagina(agenda, tope, pagina, AGENDA_MAX, ID Por Referencia)
	Definir iterador, opcionElegida, indiceContacto, listadoMin Como Entero
	
	reordenarContactos = 0
	listadoMin = pagina * 10 + 1
	
	con_tituloListarTodos
	
	Escribir "Use las teclas num�ricas para elegir un contacto"
	Escribir "o 0 para salir"
	
	Para iterador <- pagina * 10 Hasta tope - 1 Con Paso 1 Hacer
		Escribir iterador + 1, ") ",  agenda[iterador, 2], " ", agenda[iterador, 1]
	Fin Para
	
	Leer opcionElegida	

	Si opcionElegida > 0 Entonces					
		
		Mientras opcionElegida > tope O opcionElegida < listadoMin
			Limpiar Pantalla
			con_tituloListarTodos
			Escribir "*El n�mero elegido no corresponde a ning�n contacto listado*"
			Escribir "Elija un n�mero de la siguiente lista"
			Escribir "Para salir, escriba 0"
			Para iterador <- pagina * 10 Hasta tope - 1 Con Paso 1 Hacer
				Escribir iterador + 1, ") ",  agenda[iterador, 2], " ", agenda[iterador, 1]
			Fin Para
			Leer opcionElegida
		FinMientras
		
		Si opcionElegida > 0 Entonces
			indiceContacto = opcionElegida - 1
			Limpiar Pantalla
			con_hacerLinea()
			con_MostrarContacto(agenda, indiceContacto)
			con_hacerLinea()
			Escribir "1 - Editar este contacto"
			Escribir "2 - Borrar este contacto"
			Escribir "0 - Volver"
			Leer opcionElegida
			Segun opcionElegida Hacer
				1: 
					reordenarContactos = con_agregarOCambiarContacto(agenda, indiceContacto, AGENDA_MAX, ID)									
				2: 
					reordenarContactos = con_eliminarContacto(agenda, indiceContacto, AGENDA_MAX)		
			Fin Segun
		FinSi
	FinSi	
FinFuncion

Funcion reordenarContactos = con_eliminarContacto(agenda, indice, AGENDA_MAX)
	Definir confirmacion, iterador Como Entero
	
	Repetir
		con_tituloBorrarContacto()
		con_MostrarContacto(agenda, indice)
		con_hacerLinea()
		Si  confirmacion < 0 O confirmacion > 1 Entonces
			Escribir "Debe elegir una opci�n v�lida"
			Esperar Tecla
		FinSi
		Escribir "�Desea borrar este contacto?"
		Escribir "1 - Borrar"
		Escribir "0 - Salir sin borrar"
		Leer confirmacion		
	Mientras que confirmacion < 0 O confirmacion > 1
	
	Si confirmacion = 1 Entonces
		cantidadDeContactos = con_longitudArreglo(agenda, AGENDA_MAX)		
		reordenarContactos = 1
		Para iterador = indice Hasta cantidadDeContactos - 1 Con Paso 1 Hacer
			agenda[iterador, 0] = agenda[iterador + 1, 0]
			agenda[iterador, 1] = agenda[iterador + 1, 1]
			agenda[iterador, 2] = agenda[iterador + 1, 2]
			agenda[iterador, 3] = agenda[iterador + 1, 3]
			agenda[iterador, 4] = agenda[iterador + 1, 4]
			agenda[iterador, 5] = agenda[iterador + 1, 5]
		Fin Para
		agenda[cantidadDeContactos, 0] = ""
		agenda[cantidadDeContactos, 1] = ""
		agenda[cantidadDeContactos, 2] = ""
		agenda[cantidadDeContactos, 3] = ""
		agenda[cantidadDeContactos, 4] = ""
		agenda[cantidadDeContactos, 5] = ""
	SiNo
		reordenarContactos = 0
	FinSi
FinFuncion

SubAlgoritmo con_ordenarPorApellido(agenda, indice, AGENDA_MAX)
	Definir i, j, letraAnterior, letraSiguiente Como Entero
	Definir vectorAux Como Caracter
	Dimension vectorAux[6]
	
	i = 0	
	Mientras i <  AGENDA_MAX Hacer
		j = i + 1
		Mientras j <  AGENDA_MAX Hacer
			Si agenda[j, 0] = "" Entonces
				j = AGENDA_MAX
			SiNo
				Si Mayusculas(agenda[i, 2]) > Mayusculas(agenda[j, 2]) Entonces
					vectorAux[0] = agenda[i, 0]
					vectorAux[1] = agenda[i, 1]
					vectorAux[2] = agenda[i, 2]
					vectorAux[3] = agenda[i, 3]
					vectorAux[4] = agenda[i, 4]
					vectorAux[5] = agenda[i, 5]
					
					agenda[i, 0] = agenda[j, 0]
					agenda[i, 1] = agenda[j, 1]
					agenda[i, 2] = agenda[j, 2]
					agenda[i, 3] = agenda[j, 3]
					agenda[i, 4] = agenda[j, 4]
					agenda[i, 5] = agenda[j, 5]
					
					agenda[j, 0] = vectorAux[0]
					agenda[j, 1] = vectorAux[1]
					agenda[j, 2] = vectorAux[2]
					agenda[j, 3] = vectorAux[3]
					agenda[j, 4] = vectorAux[4]
					agenda[j, 5] = vectorAux[5]
				FinSi
				j = j + 1
			FinSi		
		FinMientras
		Si agenda[i, 0] = "" Entonces
			i = AGENDA_MAX
		SiNo
			i = i + 1			
		FinSi			
	Fin Mientras
	
	con_inicializarIndice(indice)
	i = 0
	letraAnterior = con_obtenerIndice(Subcadena(agenda[0, 2], 0 , 0))
	indice[letraAnterior, 0] = 0
	indice[letraAnterior, 1] = 1
	Mientras i <  AGENDA_MAX Hacer
		Si agenda[i, 0] = "" Entonces
			i = AGENDA_MAX
		SiNo
			letraAnterior = con_obtenerIndice(Subcadena(agenda[i, 2], 0, 0))
			letraSiguiente = con_obtenerIndice(Subcadena(agenda[i + 1, 2], 0, 0))
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

SubAlgoritmo con_generarResultados(agenda, resultados, ingreso, AGENDA_MAX, MAX_RESULTADOS)
	Definir iteradorI, iteradorJ, iteradorK, longitudIngreso, longitudNombre, longitudApellido, ponderado, resultadosSwap Como Entero
	Definir subcadenaIngreso, subcadenaNombre, subcadenaApellido Como Caracter
	
	Dimensionar resultadosSwap[2]
	reordenarContactos = 0
	iteradorJ = 0
	
	Para iteradorI = 0 Hasta AGENDA_MAX Con Paso 1 Hacer
		ponderado = 0
		iteradorJ = 0
		Si agenda[iteradorI, 1] = "" Entonces
			iteradorI = AGENDA_MAX
		SiNo
			longitudIngreso = Longitud(ingreso)
			longitudNombre = Longitud(agenda[iteradorI,1])
			longitudApellido = Longitud(agenda[iteradorI,2])
			
			Mientras iteradorJ < longitudIngreso Y iteradorJ < longitudNombre Y iteradorJ < longitudApellido Hacer
				subcadenaNombre = Mayusculas(Subcadena(agenda[iteradorI,1], 0, iteradorJ))
				subcadenaApellido = Mayusculas(Subcadena(agenda[iteradorI,2], 0, iteradorJ))
				subcadenaIngreso = Mayusculas(Subcadena(ingreso, 0, iteradorJ))
				Si subcadenaNombre = subcadenaIngreso O subcadenaApellido = subcadenaIngreso Entonces
					ponderado = ponderado + 1
				SiNo
					//Forzar salida si los textos dejan de ser igaules
					iteradorJ = 1
					longitudIngreso = 0						
				FinSi
				iteradorJ = iteradorJ + 1
			Fin Mientras
			
			Si ponderado > 0 Entonces	
				Para iteradorJ = 0 Hasta MAX_RESULTADOS - 1 Con Paso 1 Hacer						
					Si ponderado > resultados[iteradorJ, 1] Entonces
						resultados[iteradorJ, 0] = iteradorI
						resultados[iteradorJ, 1] = ponderado
						iteradorJ = MAX_RESULTADOS
					FinSi						
				Fin Para
			FinSi
		FinSi
	Fin Para
FinSubAlgoritmo

Funcion indice = con_obtenerIndice(letra)
	Segun letra Hacer
		'a' O 'A' O '�' O '�':
			indice = 0
		'b' O 'B':
			indice = 1
		'c' O 'C':
			indice = 2
		'd' O 'D':
			indice = 3
		'e' O 'E' O '�' O '�':
			indice = 4
		'f' O 'F':
			indice = 5
		'g' O 'G':
			indice = 6
		'h' O 'H':
			indice = 7
		'i' O 'I' O '�' O '�':
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
		'�' O '�':
			indice = 14
		'o' O 'O' O '�' O '�':
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
		'u' O 'U' O '�' O '�':
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

Funcion con_hacerLinea
	Escribir "---------------------------"
FinFuncion

Funcion con_bienvenida
	Escribir "----------------------------------------------------------------------------"
	Escribir "   ______   ____     _   __  ______    ___    ______  ______   ____    _____"
	Escribir "  / ____/  / __ \   / | / / /_  __/   /   |  / ____/ /_  __/  / __ \  / ___/"
	Escribir " / /      / / / /  /  |/ /   / /     / /| | / /       / /    / / / /  \__ \ "
	Escribir "/ /___   / /_/ /  / /|  /   / /     / ___ |/ /___    / /    / /_/ /  ___/ / "
	Escribir "\____/   \____/  /_/ |_/   /_/     /_/  |_|\____/   /_/     \____/  /____/  "
	Escribir "----------------------------------------------------------------------------"
FinFuncion

SubAlgoritmo con_MostrarContacto(agenda, indice)
	Escribir "Nombre: ", agenda[indice, 1]
	Escribir "Apellido: ", agenda[indice, 2]
	Escribir "Telefono: ", agenda[indice, 3]
	Escribir "Email: ", agenda[indice, 4]
	Escribir "Direcci�n: ", agenda[indice, 5]
FinSubAlgoritmo

Funcion con_tituloAgregarOCambiar
	Limpiar Pantalla
	con_hacerLinea()
	Escribir "Creaci�n de nuevo contacto"
	con_hacerLinea()
FinFuncion

Funcion con_tituloVerPorApellido
	Limpiar Pantalla
	con_hacerLinea()
	Escribir "Vista por apellido"	
	con_hacerLinea()
FinFuncion

Funcion con_tituloBorrarContacto
	Limpiar Pantalla
	con_hacerLinea()
	Escribir "Borrar el contacto"
	con_hacerLinea()
FinFuncion

Funcion con_tituloListarTodos
	Limpiar Pantalla
	con_hacerLinea()
	Escribir "Listado completo"
	con_hacerLinea()
FinFuncion

Funcion con_tituloBuscarPorNombre
	Limpiar Pantalla
	con_hacerLinea()
	Escribir "Busqueda por nombre"
	con_hacerLinea()
FinFuncion

Funcion seleccion = con_MenuPrincipal
	Definir opcion_elegida, invalido Como Entero
	invalido = 0
	Repetir
		Si opcion_elegida < 0 O opcion_elegida > 2 Entonces
			con_bienvenida()
			Escribir " "
			Escribir "**Debe elegir una opci�n v�lida**"
		FinSi
		Escribir "Opciones de navegaci�n:"
		Escribir "1 - Ver por apellido"
		Escribir "2 - Buscar por nombre o apellido"
		Escribir "3 - Agregar nuevo contacto"
		Escribir "4 - Ver listado completo"
		Escribir "0 - Para salir de la agenda"
		Leer opcion_elegida		
		Si opcion_elegida < 0 O opcion_elegida > 4 Entonces
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

SubAlgoritmo con_poblarContactos(matriz, ID Por Referencia)
	ID = 26
	
	// Inicializar contactos
	matriz[0, 0] <- "0"
	matriz[0, 1] <- "Ana"
	matriz[0, 2] <- "Garc�a"
	matriz[0, 3] <- "1154782236"
	matriz[0, 4] <- "ana.garcia@example.com"
	matriz[0, 5] <- "Calle Falsa 456, Buenos Aires"
	
	matriz[1, 0] <- "1"
	matriz[1, 1] <- "Luis"
	matriz[1, 2] <- "Mart�nez"
	matriz[1, 3] <- ""
	matriz[1, 4] <- ""
	matriz[1, 5] <- "Av. Santa Fe 1234, Buenos Aires"
	
	matriz[2, 0] <- "2"
	matriz[2, 1] <- "Sof�a"
	matriz[2, 2] <- "Rodr�guez"
	matriz[2, 3] <- "1154782238"
	matriz[2, 4] <- ""
	matriz[2, 5] <- "Calle C�rdoba 789, Buenos Aires"
	
	matriz[3, 0] <- "3"
	matriz[3, 1] <- "Mart�n"
	matriz[3, 2] <- "Silva"
	matriz[3, 3] <- "1154782239"
	matriz[3, 4] <- "martin.silva@example.com"
	matriz[3, 5] <- ""
	
	matriz[4, 0] <- "4"
	matriz[4, 1] <- "Julia"
	matriz[4, 2] <- "P�rez"
	matriz[4, 3] <- "1154782240"
	matriz[4, 4] <- ""
	matriz[4, 5] <- "Calle Avellaneda 234, Buenos Aires"
	
	matriz[5, 0] <- "5"
	matriz[5, 1] <- "Ricardo"
	matriz[5, 2] <- "Fern�ndez"
	matriz[5, 3] <- "1154782241"
	matriz[5, 4] <- ""
	matriz[5, 5] <- "Calle Moreno 678, Buenos Aires"
	
	matriz[6, 0] <- "6"
	matriz[6, 1] <- "Carla"
	matriz[6, 2] <- "Vega"
	matriz[6, 3] <- ""
	matriz[6, 4] <- ""
	matriz[6, 5] <- "Av. C�rdoba 890, Buenos Aires"
	
	matriz[7, 0] <- "7"
	matriz[7, 1] <- "Pedro"
	matriz[7, 2] <- "G�mez"
	matriz[7, 3] <- "1154782243"
	matriz[7, 4] <- "pedro.gomez@example.com"
	matriz[7, 5] <- "Calle San Juan 300, Buenos Aires"
	
	matriz[8, 0] <- "8"
	matriz[8, 1] <- "Natalia"
	matriz[8, 2] <- "Vargas"
	matriz[8, 3] <- "1154782244"
	matriz[8, 4] <- ""
	matriz[8, 5] <- "Av. San Mart�n 1500, Buenos Aires"
	
	matriz[9, 0] <- "9"
	matriz[9, 1] <- "Tom�s"
	matriz[9, 2] <- "Morales"
	matriz[9, 3] <- ""
	matriz[9, 4] <- ""
	matriz[9, 5] <- ""
	
	matriz[10, 0] <- "10"
	matriz[10, 1] <- "M�nica"
	matriz[10, 2] <- "Fern�ndez"
	matriz[10, 3] <- "1154782246"
	matriz[10, 4] <- ""
	matriz[10, 5] <- "Calle Sarmiento 250, Buenos Aires"
	
	matriz[11, 0] <- "11"
	matriz[11, 1] <- "Gustavo"
	matriz[11, 2] <- "Mart�nez"
	matriz[11, 3] <- "1154782247"
	matriz[11, 4] <- ""
	matriz[11, 5] <- "Av. 9 de Julio 700, Buenos Aires"
	
	matriz[12, 0] <- "12"
	matriz[12, 1] <- "Valeria"
	matriz[12, 2] <- "Castro"
	matriz[12, 3] <- "1154782248"
	matriz[12, 4] <- ""
	matriz[12, 5] <- "Calle Tucum�n 600, Buenos Aires"
	
	matriz[13, 0] <- "13"
	matriz[13, 1] <- "Juan"
	matriz[13, 2] <- "Salazar"
	matriz[13, 3] <- "1154782249"
	matriz[13, 4] <- ""
	matriz[13, 5] <- "Av. Rivadavia 1000, Buenos Aires"
	
	matriz[14, 0] <- "14"
	matriz[14, 1] <- "Sandra"
	matriz[14, 2] <- "Bravo"
	matriz[14, 3] <- "1154782250"
	matriz[14, 4] <- ""
	matriz[14, 5] <- "Calle Chile 800, Buenos Aires"
	
	matriz[15, 0] <- "15"
	matriz[15, 1] <- "Emilio"
	matriz[15, 2] <- "Guti�rrez"
	matriz[15, 3] <- "1154782251"
	matriz[15, 4] <- ""
	matriz[15, 5] <- "Av. Santa Fe 900, Buenos Aires"
	
	matriz[16, 0] <- "16"
	matriz[16, 1] <- "Florencia"
	matriz[16, 2] <- "Sosa"
	matriz[16, 3] <- "1154782252"
	matriz[16, 4] <- ""
	matriz[16, 5] <- "Calle Montevideo 500, Buenos Aires"
	
	matriz[17, 0] <- "17"
	matriz[17, 1] <- "�lvaro"
	matriz[17, 2] <- "Jim�nez"
	matriz[17, 3] <- "1154782253"
	matriz[17, 4] <- ""
	matriz[17, 5] <- "Av. Belgrano 1200, Buenos Aires"
	
	matriz[18, 0] <- "18"
	matriz[18, 1] <- "Carmen"
	matriz[18, 2] <- "Rivas"
	matriz[18, 3] <- "1154782254"
	matriz[18, 4] <- ""
	matriz[18, 5] <- "Calle Paran� 300, Buenos Aires"
	
	matriz[19, 0] <- "19"
	matriz[19, 1] <- "Jorge"
	matriz[19, 2] <- "Gonz�lez"
	matriz[19, 3] <- "1154782255"
	matriz[19, 4] <- ""
	matriz[19, 5] <- "Calle Lavalle 1200, Buenos Aires"
	
	matriz[20, 0] <- "20"
	matriz[20, 1] <- "Silvia"
	matriz[20, 2] <- "Cruz"
	matriz[20, 3] <- "1154782256"
	matriz[20, 4] <- ""
	matriz[20, 5] <- "Av. Corrientes 1500, Buenos Aires"
	
	matriz[21, 0] <- "21"
	matriz[21, 1] <- "Ricardo"
	matriz[21, 2] <- "Vega"
	matriz[21, 3] <- "1154782257"
	matriz[21, 4] <- ""
	matriz[21, 5] <- "Calle San Mart�n 2000, Buenos Aires"
	
	matriz[22, 0] <- "22"
	matriz[22, 1] <- "Gabriela"
	matriz[22, 2] <- "Ram�rez"
	matriz[22, 3] <- "1154782258"
	matriz[22, 4] <- "gabriela.ramirez@example.com"
	matriz[22, 5] <- ""
	
	matriz[23, 0] <- "23"
	matriz[23, 1] <- "Tom�s"
	matriz[23, 2] <- "Fern�ndez"
	matriz[23, 3] <- "1154782259"
	matriz[23, 4] <- ""
	matriz[23, 5] <- "Calle Olavarr�a 123, Buenos Aires"
	
	matriz[24, 0] <- "24"
	matriz[24, 1] <- "Renata"
	matriz[24, 2] <- "Gonz�lez"
	matriz[24, 3] <- "1154782260"
	matriz[24, 4] <- "renata.gonzalez@example.com"
	matriz[24, 5] <- "Av. Libertador 200, Buenos Aires"
	
	matriz[25, 0] <- "25"
	matriz[25, 1] <- "Sandro"
	matriz[25, 2] <- "Comanche"
	matriz[25, 3] <- "5477861216"
	matriz[25, 4] <- ""
	matriz[25, 5] <- ""	
FinSubAlgoritmo

