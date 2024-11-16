Algoritmo funcionalidades_Oficina
	Definir opc, iteradorI, iteradorJ Como Entero
	//ESPACIO GLOBAL
	//VAIRABLES GLOBALES DE CONFIGURACION
	Definir AGENDA_MAX, ID Como Entero
	AGENDA_MAX = 1000
	
	//VARIABLES GLOBALES PARA EL MODULO CONTACTOS
	Definir con_indiceApellidos Como Entero
	Definir con_agenda Como Caracter
	Dimensionar con_agenda[AGENDA_MAX,6]	
	Dimensionar con_indiceApellidos[27,2]
	
	//VARIABLE DEL MODULO CALENDARIO
	Dimensionar tareas[32]
    Dimensionar tareasRealizadas[32, 11] 
    Dimensionar listaTareas[32, 11] 
    Dimensionar contadorTareas[33]
	
	//ALGORITMOS DE INICIALIZACION DEL MODULO CONTACTO
	con_poblarContactos(con_agenda, ID)	
	con_ordenarPorApellido(con_agenda, con_indiceApellidos, AGENDA_MAX)
	
	//ALGORITMOS DE INICIALIZACION DEL MODULO CALENDARIO
    Para iteradorI <- 1 Hasta 31 Hacer
        contadorTareas[iteradorI] <- 0
        Para iteradorJ <- 1 Hasta 10 Hacer
            listaTareas[iteradorI, iteradorJ] <- ""
            tareasRealizadas[iteradorI, iteradorJ] <- "No"
        Fin Para
    Fin Para
	cal_PrecargarTareas2024(listaTareas, tareasRealizadas, contadorTareas)
	
	main_Pantalla_Inicio
	Repetir
		opc = main_menu
		Limpiar Pantalla
		Segun opc Hacer
			Caso 1: 
				con_ContactosMain(con_agenda, con_indiceApellidos, AGENDA_MAX, ID)
			Caso 2: 
				Calendario(con_agenda, AGENDA_MAX, tareas, tareasRealizadas, listaTareas, contadorTareas)
			Caso 3: 
				Pomodoro
			De Otro Modo:
				Escribir "Hasta pronto..."
		FinSegun
	Mientras Que opc <> 0	
FinAlgoritmo

SubProceso main_Pantalla_Inicio
	esperar 1 segundos
	main_Pantalla_Inicio_1
	esperar 500 Milisegundos
	Borrar Pantalla
	main_Pantalla_Inicio_2
	esperar 500 Milisegundos
	Borrar Pantalla
	main_Pantalla_Inicio_3
	esperar 500 Milisegundos
	Borrar Pantalla
	main_Pantalla_Inicio_4
	esperar 500 Milisegundos
	Borrar Pantalla
	main_Pantalla_Inicio_3
	esperar 500 Milisegundos
	Borrar Pantalla
	main_Pantalla_Inicio_2
	esperar 500 Milisegundos
	Borrar Pantalla
	main_Pantalla_Inicio_1
	esperar 500 Milisegundos
FinSubProceso

//FUENTE: SPEED. Tomado de https://patorjk.com/
SubProceso main_Pantalla_Inicio_1
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir ">>============================================================================<<"
	Escribir "||   _______               _________                                          ||"
	Escribir "||   ___    |____  _____  _______  /_____ _   ______________ _____________ _  ||"
	Escribir "||   __  /| |_  / / /  / / /  __  /_  __ `/   ___  __ \  __ `/_  ___/  __ `/  ||"
	Escribir "||   _  ___ |  /_/ // /_/ // /_/ / / /_/ /    __  /_/ / /_/ /_  /   / /_/ /   ||"
	Escribir "||   /_/  |_|\__, / \__,_/ \__,_/  \__,_/     _  .___/\__,_/ /_/    \__,_/    ||"
	Escribir "||          /____/                            /_/                             ||"
	Escribir "||   ______                ____________      _____                            ||"
	Escribir "||   ___  /_____ _   _________  __/__(_)________(_)____________ _             ||"
	Escribir "||   __  /_  __ `/   _  __ \_  /_ __  /_  ___/_  /__  __ \  __ `/             ||"
	Escribir "||   _  / / /_/ /    / /_/ /  __/ _  / / /__ _  / _  / / / /_/ /              ||"
	Escribir "||   /_/  \__,_/     \____//_/    /_/  \___/ /_/  /_/ /_/\__,_/               ||"
	Escribir "||                                                                            ||"
	Escribir ">>============================================================================<<"
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
FinSubProceso

//FUENTE: SPEED. Tomado de https://patorjk.com/
SubProceso main_Pantalla_Inicio_2
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir ">>============================================================================<<"
	Escribir "||   _______               _________                                          ||"
	Escribir "||   ___    |____  _____  _______  /_____ _   ______________ _____________ _  ||"
	Escribir "||   __  /| |_  / / /  / / /  __  /_  __ `/   ___  __ \  __ `/_  ___/  __ `/  ||"
	Escribir "||   _  ___ |  /_/ // /_/ // /_/ / / /_/ /    __  /_/ / /_/ /_  /   / /_/ /   ||"
	Escribir "||   /_/  |_|\__, / \__,_/ \__,_/  \__,_/     _  .___/\__,_/ /_/    \__,_/    ||"
	Escribir "||          /____/                            /_/                             ||"
	Escribir "||   ______                ____________      _____                            ||"
	Escribir "||   ___  /_____ _   _________  __/__(_)________(_)____________ _             ||"
	Escribir "||   __  /_  __ `/   _  __ \_  /_ __  /_  ___/_  /__  __ \  __ `/             ||"
	Escribir "||   _  / / /_/ /    / /_/ /  __/ _  / / /__ _  / _  / / / /_/ /              ||"
	Escribir "||   /_/  \__,_/     \____//_/    /_/  \___/ /_/  /_/ /_/\__,_/               ||"
	Escribir "||                                                                            ||"
	Escribir ">>============================================================================<<"
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
FinSubProceso

//FUENTE: SPEED. Tomado de https://patorjk.com/
SubProceso main_Pantalla_Inicio_3
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir ">>============================================================================<<"
	Escribir "||   _______               _________                                          ||"
	Escribir "||   ___    |____  _____  _______  /_____ _   ______________ _____________ _  ||"
	Escribir "||   __  /| |_  / / /  / / /  __  /_  __ `/   ___  __ \  __ `/_  ___/  __ `/  ||"
	Escribir "||   _  ___ |  /_/ // /_/ // /_/ / / /_/ /    __  /_/ / /_/ /_  /   / /_/ /   ||"
	Escribir "||   /_/  |_|\__, / \__,_/ \__,_/  \__,_/     _  .___/\__,_/ /_/    \__,_/    ||"
	Escribir "||          /____/                            /_/                             ||"
	Escribir "||   ______                ____________      _____                            ||"
	Escribir "||   ___  /_____ _   _________  __/__(_)________(_)____________ _             ||"
	Escribir "||   __  /_  __ `/   _  __ \_  /_ __  /_  ___/_  /__  __ \  __ `/             ||"
	Escribir "||   _  / / /_/ /    / /_/ /  __/ _  / / /__ _  / _  / / / /_/ /              ||"
	Escribir "||   /_/  \__,_/     \____//_/    /_/  \___/ /_/  /_/ /_/\__,_/               ||"
	Escribir "||                                                                            ||"
	Escribir ">>============================================================================<<"
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
FinSubProceso

//FUENTE: SPEED. Tomado de https://patorjk.com/
SubProceso main_Pantalla_Inicio_4
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
	Escribir "||   _______               _________                                          ||"
	Escribir "||   ___    |____  _____  _______  /_____ _   ______________ _____________ _  ||"
	Escribir "||   __  /| |_  / / /  / / /  __  /_  __ `/   ___  __ \  __ `/_  ___/  __ `/  ||"
	Escribir "||   _  ___ |  /_/ // /_/ // /_/ / / /_/ /    __  /_/ / /_/ /_  /   / /_/ /   ||"
	Escribir "||   /_/  |_|\__, / \__,_/ \__,_/  \__,_/     _  .___/\__,_/ /_/    \__,_/    ||"
	Escribir "||          /____/                            /_/                             ||"
	Escribir "||   ______                ____________      _____                            ||"
	Escribir "||   ___  /_____ _   _________  __/__(_)________(_)____________ _             ||"
	Escribir "||   __  /_  __ `/   _  __ \_  /_ __  /_  ___/_  /__  __ \  __ `/             ||"
	Escribir "||   _  / / /_/ /    / /_/ /  __/ _  / / /__ _  / _  / / / /_/ /              ||"
	Escribir "||   /_/  \__,_/     \____//_/    /_/  \___/ /_/  /_/ /_/\__,_/               ||"
	Escribir "||                                                                            ||"
	Escribir ">>============================================================================<<"
	Escribir "                                                                                "
FinSubProceso

Funcion opc <- main_menu
	Definir opc Como Entero
	Repetir
		Limpiar Pantalla
		//FUENTE: IVRIT. Tomado de https://patorjk.com/
		Escribir "                                                                                "
		Escribir "                                                                                "
		Escribir "                                                                                "
		Escribir "                                                                                "
		Escribir "                                                                                "
		Escribir "           _        ____            _             _                             "
		Escribir "          / |      / ___|___  _ __ | |_ __ _  ___| |_ ___  ___                  "
		Escribir "          | |     | |   / _ \| `_ \| __/ _` |/ __| __/ _ \/ __|                 "
		Escribir "          | |  _  | |__| (_) | | | | || (_| | (__| || (_) \__ \                 "
		Escribir "          |_| (_)  \____\___/|_| |_|\__\__,_|\___|\__\___/|___/                 "
		Escribir "           ____         ____      _                _            _               "
		Escribir "          |___ \       / ___|__ _| | ___ _ __   __| | __ _ _ __(_) ___          "
		Escribir "            __) |     | |   / _` | |/ _ \ `_ \ / _` |/ _` | `__| |/ _ \         "
		Escribir "           / __/   _  | |__| (_| | |  __/ | | | (_| | (_| | |  | | (_) |        "
		Escribir "          |_____| (_)  \____\__,_|_|\___|_| |_|\__,_|\__,_|_|  |_|\___/         "
		Escribir "           _____       ____                           _                         "
		Escribir "          |___ /      |  _ \ ___  _ __ ___   ___   __| | ___  _ __ ___          "
		Escribir "            |_ \      | |_) / _ \| `_ ` _ \ / _ \ / _` |/ _ \| `__/ _ \         "
		Escribir "           ___) |  _  |  __/ (_) | | | | | | (_) | (_| | (_) | | | (_) |        "
		Escribir "          |____/  (_) |_|   \___/|_| |_| |_|\___/ \__,_|\___/|_|  \___/         "
		Escribir "                                                                                "
		Escribir "                                                                                "
		Escribir "                                                                                "
		Escribir "                                                                                "
		Escribir "Ingrese la opción deseada: " Sin Saltar
		Leer opc
	Mientras Que opc<0 o opc>3
FinFuncion


//FUENTE: IVRIT. Tomado de https://patorjk.com/
//--------------------------------------------------------------------------------------------------
//                  _        ____            _             _                             
//                / |      / ___|___  _ __ | |_ __ _  ___| |_ ___  ___                  
//               | |     | |   / _ \| `_ \| __/ _` |/ __| __/ _ \/ __|                 
//              | |  _  | |__| (_) | | | | || (_| | (__| || (_) \__ \                 
//             |_| (_)  \____\___/|_| |_|\__\__,_|\___|\__\___/|___/                 
//--------------------------------------------------------------------------------------------------
// FUNCIONES MODULO CONTACTOS INICIO
//ALGORITMOS Y FUNCIONES ESPECÍFICAS DEL MÓDULO
SubAlgoritmo con_ContactosMain(agenda, indiceApellidos, AGENDA_MAX, ID Por Referencia)
	Definir seleccion, cantidadDeContactos, reordenarContacto Como Entero
	
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
	elementos[5] = "Dirección"
	
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
			Escribir "Ha alcanzado el máximo de contactos posibles, no se pueden agregar nuevos contactos"
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
			Escribir "Elija la opción " Sin Saltar
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
				Escribir "Use las teclas numéricas para elegir un contacto"
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
					Escribir "Use las teclas numéricas para elegir un contacto"
					Escribir "o 0 para salir"
					Leer contactoElegido
					Si contactoElegido > 0 Entonces					
						Mientras contactoElegido > iterador + 1
							Limpiar Pantalla
							Escribir "*El número elegido no corresponde a ningún contacto listado*"
							Escribir "Elija un número de la siguiente lista"
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
			Escribir "Debe elegir una opción válida"
			con_hacerLinea
		FinSi
		
		Escribir "Pagina " pagina + 1
		Escribir "0 - Salir"
		Escribir "1 - Página anterior"
		Escribir "2 - Página siguiente"
		Escribir "3 - Elegir contacto de esta página"
		
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
	
	Escribir "Use las teclas numéricas para elegir un contacto"
	Escribir "o 0 para salir"
	
	Para iterador <- pagina * 10 Hasta tope - 1 Con Paso 1 Hacer
		Escribir iterador + 1, ") ",  agenda[iterador, 2], " ", agenda[iterador, 1]
	Fin Para
	
	Leer opcionElegida	
	
	Si opcionElegida > 0 Entonces					
		
		Mientras opcionElegida > tope O opcionElegida < listadoMin
			Limpiar Pantalla
			con_tituloListarTodos
			Escribir "*El número elegido no corresponde a ningún contacto listado*"
			Escribir "Elija un número de la siguiente lista"
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
			Escribir "Debe elegir una opción válida"
			Esperar Tecla
		FinSi
		Escribir "¿Desea borrar este contacto?"
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
	Escribir "Dirección: ", agenda[indice, 5]
FinSubAlgoritmo

Funcion con_tituloAgregarOCambiar
	Limpiar Pantalla
	con_hacerLinea()
	Escribir "Creación de nuevo contacto"
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
			Escribir "**Debe elegir una opción válida**"
		FinSi
		Escribir "Opciones de navegación:"
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
	matriz[0, 2] <- "García"
	matriz[0, 3] <- "1154782236"
	matriz[0, 4] <- "ana.garcia@example.com"
	matriz[0, 5] <- "Calle Falsa 456, Buenos Aires"
	
	matriz[1, 0] <- "1"
	matriz[1, 1] <- "Luis"
	matriz[1, 2] <- "Martínez"
	matriz[1, 3] <- ""
	matriz[1, 4] <- ""
	matriz[1, 5] <- "Av. Santa Fe 1234, Buenos Aires"
	
	matriz[2, 0] <- "2"
	matriz[2, 1] <- "Sofía"
	matriz[2, 2] <- "Rodríguez"
	matriz[2, 3] <- "1154782238"
	matriz[2, 4] <- ""
	matriz[2, 5] <- "Calle Córdoba 789, Buenos Aires"
	
	matriz[3, 0] <- "3"
	matriz[3, 1] <- "Martín"
	matriz[3, 2] <- "Silva"
	matriz[3, 3] <- "1154782239"
	matriz[3, 4] <- "martin.silva@example.com"
	matriz[3, 5] <- ""
	
	matriz[4, 0] <- "4"
	matriz[4, 1] <- "Julia"
	matriz[4, 2] <- "Pérez"
	matriz[4, 3] <- "1154782240"
	matriz[4, 4] <- ""
	matriz[4, 5] <- "Calle Avellaneda 234, Buenos Aires"
	
	matriz[5, 0] <- "5"
	matriz[5, 1] <- "Ricardo"
	matriz[5, 2] <- "Fernández"
	matriz[5, 3] <- "1154782241"
	matriz[5, 4] <- ""
	matriz[5, 5] <- "Calle Moreno 678, Buenos Aires"
	
	matriz[6, 0] <- "6"
	matriz[6, 1] <- "Carla"
	matriz[6, 2] <- "Vega"
	matriz[6, 3] <- ""
	matriz[6, 4] <- ""
	matriz[6, 5] <- "Av. Córdoba 890, Buenos Aires"
	
	matriz[7, 0] <- "7"
	matriz[7, 1] <- "Pedro"
	matriz[7, 2] <- "Gómez"
	matriz[7, 3] <- "1154782243"
	matriz[7, 4] <- "pedro.gomez@example.com"
	matriz[7, 5] <- "Calle San Juan 300, Buenos Aires"
	
	matriz[8, 0] <- "8"
	matriz[8, 1] <- "Natalia"
	matriz[8, 2] <- "Vargas"
	matriz[8, 3] <- "1154782244"
	matriz[8, 4] <- ""
	matriz[8, 5] <- "Av. San Martín 1500, Buenos Aires"
	
	matriz[9, 0] <- "9"
	matriz[9, 1] <- "Tomás"
	matriz[9, 2] <- "Morales"
	matriz[9, 3] <- ""
	matriz[9, 4] <- ""
	matriz[9, 5] <- ""
	
	matriz[10, 0] <- "10"
	matriz[10, 1] <- "Mónica"
	matriz[10, 2] <- "Fernández"
	matriz[10, 3] <- "1154782246"
	matriz[10, 4] <- ""
	matriz[10, 5] <- "Calle Sarmiento 250, Buenos Aires"
	
	matriz[11, 0] <- "11"
	matriz[11, 1] <- "Gustavo"
	matriz[11, 2] <- "Martínez"
	matriz[11, 3] <- "1154782247"
	matriz[11, 4] <- ""
	matriz[11, 5] <- "Av. 9 de Julio 700, Buenos Aires"
	
	matriz[12, 0] <- "12"
	matriz[12, 1] <- "Valeria"
	matriz[12, 2] <- "Castro"
	matriz[12, 3] <- "1154782248"
	matriz[12, 4] <- ""
	matriz[12, 5] <- "Calle Tucumán 600, Buenos Aires"
	
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
	matriz[15, 2] <- "Gutiérrez"
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
	matriz[17, 1] <- "Álvaro"
	matriz[17, 2] <- "Jiménez"
	matriz[17, 3] <- "1154782253"
	matriz[17, 4] <- ""
	matriz[17, 5] <- "Av. Belgrano 1200, Buenos Aires"
	
	matriz[18, 0] <- "18"
	matriz[18, 1] <- "Carmen"
	matriz[18, 2] <- "Rivas"
	matriz[18, 3] <- "1154782254"
	matriz[18, 4] <- ""
	matriz[18, 5] <- "Calle Paraná 300, Buenos Aires"
	
	matriz[19, 0] <- "19"
	matriz[19, 1] <- "Jorge"
	matriz[19, 2] <- "González"
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
	matriz[21, 5] <- "Calle San Martín 2000, Buenos Aires"
	
	matriz[22, 0] <- "22"
	matriz[22, 1] <- "Gabriela"
	matriz[22, 2] <- "Ramírez"
	matriz[22, 3] <- "1154782258"
	matriz[22, 4] <- "gabriela.ramirez@example.com"
	matriz[22, 5] <- ""
	
	matriz[23, 0] <- "23"
	matriz[23, 1] <- "Tomás"
	matriz[23, 2] <- "Fernández"
	matriz[23, 3] <- "1154782259"
	matriz[23, 4] <- ""
	matriz[23, 5] <- "Calle Olavarría 123, Buenos Aires"
	
	matriz[24, 0] <- "24"
	matriz[24, 1] <- "Renata"
	matriz[24, 2] <- "González"
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
// FUNCIONES MODULO CONTACTOS FIN

//FUENTE: IVRIT. Tomado de https://patorjk.com/
//--------------------------------------------------------------------------------------------------
//               ____         ____      _                _            _               
//             |___ \       / ___|__ _| | ___ _ __   __| | __ _ _ __(_) ___          
//              __) |     | |   / _` | |/ _ \ `_ \ / _` |/ _` | `__| |/ _ \         
//            / __/   _  | |__| (_| | |  __/ | | | (_| | (_| | |  | | (_) |        
//          |_____| (_)  \____\__,_|_|\___|_| |_|\__,_|\__,_|_|  |_|\___/         
//--------------------------------------------------------------------------------------------------

SubAlgoritmo Calendario(con_agenda, AGENDA_MAX, tareas, tareasRealizadas, listaTareas, contadorTareas)
    Definir mes, año, diaInicio, diasMes, diaSeleccionado, opc, numTarea Como Entero
    Definir nombreMes, nuevaTarea Como Cadena
    Definir continuarPrograma, continuarSeleccionMes Como Logico
    continuarPrograma <- Verdadero

    cal_Pantalla_inicio
    // BUCLE PRINCIPAL
    Mientras continuarPrograma Hacer
		
        Limpiar Pantalla
        Escribir "Introduce el año (2020-2030 o 0 para salir): "
        Leer año
        Si (año = 0) Entonces
            Escribir "Saliendo del programa..."
            continuarPrograma <- Falso
        Sino
            Si (año < 2020 O año > 2030) Entonces
                Escribir "El año debe estar entre 2020 y 2030."
            Sino
                continuarSeleccionMes <- Verdadero
                Mientras continuarSeleccionMes Hacer
                    Limpiar Pantalla
                    Escribir "Introduce el mes (1-12 o 0 para volver a seleccionar el año): "
                    Leer mes
                    Si (mes = 0) Entonces
                        continuarSeleccionMes <- Falso
                    Sino
                        Si (mes < 1 O mes > 12) Entonces
                            Escribir "El mes debe estar entre 1 y 12."
                        Sino
                            // Calculo del primer día del mes (fórmula de Zeller)
                            d <- 1
                            m <- mes
                            a <- año
                            
                            Si (mes = 1 O mes = 2) Entonces
                                m <- m + 12
                                a <- año - 1
                            Fin Si
                            
                            k <- a % 100
                            t <- trunc(a / 100)
                            diaInicio <- ((d + trunc(13 * (m + 1) / 5) + k + trunc(k / 4) + trunc(t / 4) + (5 * t)) % 7) - 1
                            Si diaInicio = 0 Entonces
                                diaInicio <- 7 
                            Fin Si
                            
                            // Definición de días de los meses
                            Segun mes Hacer
                                1: nombreMes <- "Enero"; diasMes <- 31
                                2: nombreMes <- "Febrero"
                                    Si (año % 4 = 0 Y (año % 100 <> 0 O año % 400 = 0)) Entonces
                                        diasMes <- 29
                                    Sino
                                        diasMes <- 28
                                    Fin Si
                                3: nombreMes <- "Marzo"; diasMes <- 31
                                4: nombreMes <- "Abril"; diasMes <- 30
                                5: nombreMes <- "Mayo"; diasMes <- 31
                                6: nombreMes <- "Junio"; diasMes <- 30
                                7: nombreMes <- "Julio"; diasMes <- 31
                                8: nombreMes <- "Agosto"; diasMes <- 31
                                9: nombreMes <- "Septiembre"; diasMes <- 30
                                10: nombreMes <- "Octubre"; diasMes <- 31
                                11: nombreMes <- "Noviembre"; diasMes <- 30
                                12: nombreMes <- "Diciembre"; diasMes <- 31
                            Fin Segun
							
                            // Mostrar el calendario por primera vez
                            cal_RenderCalendario(diaInicio, diasMes, nombreMes, año, contadorTareas)
                            
                            // Selección del día y menú de acciones
                            continuarDias <- Verdadero
                            Mientras continuarDias Hacer
                                Limpiar Pantalla
                                Escribir "Mes seleccionado: ", nombreMes, " ", año
                                cal_RenderCalendario(diaInicio, diasMes, nombreMes, año, contadorTareas)
                                Escribir "Introduce el día para ver o agregar tareas (0 para volver a seleccionar el mes): "
                                Leer diaSeleccionado
                                Si (diaSeleccionado = 0) Entonces
                                    Escribir "Volviendo a la selección del mes..."
                                    continuarDias <- Falso
                                Sino
                                    Si (diaSeleccionado >= 1 Y diaSeleccionado <= diasMes) Entonces
                                        // Llamada al subalgoritmo para el menú de acciones en el día seleccionado
                                        cal_MenuAccionesDia(diaSeleccionado, nombreMes, año, listaTareas, tareasRealizadas, contadorTareas, diasMes, 10, diaInicio, con_agenda, AGENDA_MAX)
                                    Sino
                                        Escribir "Día no válido."
                                    Fin Si
                                Fin Si
                            Fin Mientras
                        Fin Si
                    Fin Si
                Fin Mientras
            Fin Si
        Fin Si
    Fin Mientras
Fin SubAlgoritmo


//--------------- SUBALGORITMOS --------------- 

Subalgoritmo cal_MenuAccionesDia(diaSeleccionado, nombreMes, año, listaTareas, tareasRealizadas, contadorTareas, maxDias, maxTareas, diaInicio, agenda, AGENDA_MAX)
	Definir cantidadDeContactos, indiceContactoElegido, iterador Como Entero
	Definir idContactoElegido Como Caracter
	
    continuarDia <- Verdadero	
	cantidadDeContactos = con_longitudArreglo(agenda, AGENDA_MAX)
	
    Mientras continuarDia Hacer
        Limpiar Pantalla
        Escribir "Fecha seleccionada: ", diaSeleccionado, " de ", nombreMes, " de ", año
        Escribir "Tareas para el día"
        
        Si (contadorTareas[diaSeleccionado] = 0) Entonces
            Escribir "No hay tareas para el día ", diaSeleccionado
        Sino
            Para i <- 1 Hasta contadorTareas[diaSeleccionado] Hacer
                Si tareasRealizadas[diaSeleccionado, i] = "Si" Entonces
                    Escribir i, ". ", listaTareas[diaSeleccionado, i], " --Realizada--"
                Sino
                    Escribir i, ". ", listaTareas[diaSeleccionado, i]
                Fin Si
            Fin Para
        Fin Si
        
        Escribir "Selecciona una opción: "
        Escribir "1. Agregar una nueva tarea"
        Escribir "2. Volver al mes"
        Escribir "3. Marcar tarea como realizada"
        Escribir "4. Asignar participantes a una tarea"
        Leer opc
        
        Segun opc Hacer
            1: 
                Limpiar Pantalla
                Escribir "Introduce la nueva tarea: "
                Leer nuevaTarea
                contadorTareas[diaSeleccionado] <- contadorTareas[diaSeleccionado] + 1
                listaTareas[diaSeleccionado, contadorTareas[diaSeleccionado]] <- nuevaTarea
                tareasRealizadas[diaSeleccionado, contadorTareas[diaSeleccionado]] <- "No"
                Escribir "Tarea agregada."
                
            2: 
                continuarDia <- Falso
                cal_RenderCalendario(diaInicio, maxDias, nombreMes, año, contadorTareas) // Renderizar calendario
                
            3: 
                Limpiar Pantalla
                Si (contadorTareas[diaSeleccionado] = 0) Entonces
                    Escribir "No hay tareas para marcar como realizadas."
                Sino
                    Escribir "Selecciona el número de la tarea que deseas marcar como realizada (0 para volver): "
                    Leer numTarea
                    Si (numTarea > 0 Y numTarea <= contadorTareas[diaSeleccionado]) Entonces
                        tareasRealizadas[diaSeleccionado, numTarea] <- "Si"
                        Escribir "Tarea marcada como realizada."
                    Sino
                        Escribir "Número de tarea no válido."
                    Fin Si
                Fin Si
                
            4:
                Limpiar Pantalla
                Si (contadorTareas[diaSeleccionado] = 0) Entonces
                    Escribir "No hay tareas para asignar participantes."
                Sino
					Escribir "Fecha seleccionada: ", diaSeleccionado, " de ", nombreMes, " de ", año
					Escribir "Tareas para el día"
					
					Si (contadorTareas[diaSeleccionado] = 0) Entonces
						Escribir "No hay tareas para el día ", diaSeleccionado
					Sino
						Para i <- 1 Hasta contadorTareas[diaSeleccionado] Hacer
							Si tareasRealizadas[diaSeleccionado, i] = "Si" Entonces
								Escribir i, ". ", listaTareas[diaSeleccionado, i], " --Realizada--"
							Sino
								Escribir i, ". ", listaTareas[diaSeleccionado, i]
							Fin Si
						Fin Para
					Fin Si
					Escribir ""
                    Escribir "Selecciona el número de la tarea a la que deseas asignar participantes (0 para volver): "
                    Leer numTarea
                    Si (numTarea > 0 Y numTarea <= contadorTareas[diaSeleccionado]) Entonces
						idContactoElegido = cal_listaDeContactos(agenda, cantidadDeContactos, AGENDA_MAX)											
						Para iterador<-0 Hasta cantidadDeContactos Con Paso 1 Hacer
							Si agenda[iterador, 0] == idContactoElegido Entonces
								indiceContactoElegido = iterador
								iterador = cantidadDeContactos
							FinSi
						Fin Para					
						Si agenda[indiceContactoElegido, 0] <> "" Entonces
							listaTareas[diaSeleccionado, numTarea] <- listaTareas[diaSeleccionado, numTarea] + " - " + agenda[indiceContactoElegido, 1] + " " + agenda[indiceContactoElegido, 2]
							Escribir "Contacto asignado."
						Sino
							Escribir "Número de contacto no válido."
						Fin Si
						Escribir "Introduce el número del contacto que deseas asignar (0 para terminar): "
                    Sino
                        Escribir "Número de tarea no válido."
                    Fin Si
                Fin Si
            De Otro Modo:
                Escribir "Opción no válida."
        Fin Segun
    Fin Mientras
Fin Subalgoritmo

Subalgoritmo cal_RenderCalendario(diaInicio, diasMes, nombreMes, año, contadorTareas)
    Escribir "Calendario de ", nombreMes, " ", año
    Escribir "  L      M      X      J      V      S      D  " // Encabezado de la semana
    Para i <- 1 Hasta diaInicio - 1 Hacer
        Escribir "       " Sin Saltar
    Fin Para
    Para dia <- 1 Hasta diasMes Hacer
        Si contadorTareas[dia] > 0 Entonces
            Si dia < 10 Entonces
                Escribir " [ ", dia, " ] " Sin Saltar // Días con tareas resaltados con espacios adicionales
            Sino
                Escribir "[", dia, "] " Sin Saltar
            Fin Si
        Sino
            Si dia < 10 Entonces
                Escribir "   ", dia, "   " Sin Saltar // Días sin tareas con espacios adicionales
            Sino
                Escribir "  ", dia, "   " Sin Saltar
            Fin Si
        Fin Si
        Si ((dia + diaInicio - 1) % 7 = 0) Entonces
            Escribir ""
        Fin Si
    Fin Para
    Escribir ""
Fin Subalgoritmo

Subalgoritmo cal_Pantalla_inicio
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir ">>============================================================================<<"
	Escribir "||                   _____      _                _            _                ||"
	Escribir "||                  / ____|    | |              | |          (_)               ||"
	Escribir "||                 | |     __ _| | ___ _ __   __| | __ _ _ __ _  ___           ||"
	Escribir "||                 | |    / _` | |/ _ | ´_ \ / _` |/ _` | ´__| |/ _ \          ||"
	Escribir "||                 | |___| (_| | |  __| | | | (_| | (_| | |  | | (_) |         ||"
	Escribir "||                  \_____\__,_|_|\___|_| |_|\__,_|\__,_|_|  |_|\___/          ||"
	Escribir ">>============================================================================<<"
	Escribir "                                                                                "
	Escribir "                                                                                "
	Escribir "              Bienvenido al calendario. Presiona una tecla para comenzar        "
	Escribir "    																			   "Sin Saltar
	Esperar Tecla
FinSubProceso

Subalgoritmo cal_PrecargarTareas2024(listaTareas, tareasRealizadas, contadorTareas)
    // Precarga de tareas para noviembre de 2024
    contadorTareas[5] <- 1
    listaTareas[5, 1] <- "Reunion"
    tareasRealizadas[5, 1] <- "Si"
	
    contadorTareas[8] <- 1
    listaTareas[8, 1] <- "Entregar informe"
    tareasRealizadas[8, 1] <- "Si"
	
    contadorTareas[15] <- 1
    listaTareas[15, 1] <- "Status de objetivos"
    tareasRealizadas[15, 1] <- "No"
	
    contadorTareas[20] <- 1
    listaTareas[20, 1] <- "Entrega de proyecto final"
    tareasRealizadas[20, 1] <- "No"
	
    contadorTareas[25] <- 1
    listaTareas[25, 1] <- "Reunion con gerencia"
    tareasRealizadas[25, 1] <- "No"
	
    contadorTareas[30] <- 1
    listaTareas[30, 1] <- "Entregar informes mensuales"
    tareasRealizadas[30, 1] <- "No"
Fin Subalgoritmo

Funcion idContactoElegido <- cal_listaDeContactos(agenda, cantidadDeContactos, AGENDA_MAX)
	Definir salir Como Logico
	Definir iterador, pagina, maxPagina, opcionElegida, tope Como Entero
	
	salir = Falso
	pagina = 0
	maxPagina = 10
	
	Repetir	
		tope = (pagina * 10 + maxPagina)
		
		Si tope > cantidadDeContactos Entonces
			tope = cantidadDeContactos
		FinSi
		
		con_tituloListarTodos
		
		Si opcionElegida < 0 O opcionElegida > 3 Entonces
			Escribir "Debe elegir una opción válida"
			con_hacerLinea
		FinSi
		
		Escribir "Pagina " pagina + 1
		Escribir "0 - Salir"
		Escribir "1 - Página anterior"
		Escribir "2 - Página siguiente"
		Escribir "3 - Elegir contacto de esta página"
		
		con_hacerLinea
		
		Para iterador <- pagina * 10 Hasta tope - 1 Con Paso 1 Hacer
			Escribir iterador + 1, ") ",  agenda[iterador, 2], " ", agenda[iterador, 1]
		Fin Para
		
		Leer opcionElegida
		
		Segun opcionElegida Hacer
			0:
				salir = Verdadero
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
				idContactoElegido = cal_elegirContacto(agenda, tope, pagina, AGENDA_MAX)
				salir = Verdadero
		Fin Segun
		
	Mientras Que salir == Falso
FinFuncion

Funcion idContactoElegido <- cal_elegirContacto(agenda, tope, pagina, AGENDA_MAX)
	Definir iterador, opcionElegida, indiceContacto, listadoMin Como Entero
	
	listadoMin = pagina * 10 + 1
	
	con_tituloListarTodos
	
	Escribir "Use las teclas numéricas para elegir un contacto"
	Escribir "o 0 para salir"
	
	Para iterador <- pagina * 10 Hasta tope - 1 Con Paso 1 Hacer
		Escribir iterador + 1, ") ",  agenda[iterador, 2], " ", agenda[iterador, 1]
	Fin Para
	
	Leer opcionElegida	
	
	Si opcionElegida > 0 Entonces		
		Mientras opcionElegida > tope O opcionElegida < listadoMin
			Limpiar Pantalla
			con_tituloListarTodos
			Escribir "*El número elegido no corresponde a ningún contacto listado*"
			Escribir "Elija un número de la siguiente lista"
			Escribir "Para salir, escriba 0"
			Para iterador <- pagina * 10 Hasta tope - 1 Con Paso 1 Hacer
				Escribir iterador + 1, ") ",  agenda[iterador, 2], " ", agenda[iterador, 1]
			Fin Para
			Leer opcionElegida
		FinMientras		
		Si opcionElegida > 0 Entonces
			indiceContacto = opcionElegida - 1
			idContactoElegido = agenda[indiceContacto, 0]
		FinSi
	FinSi
FinFuncion

//FUENTE: IVRIT. Tomado de https://patorjk.com/
//--------------------------------------------------------------------------------------------------
//            _____       ____                           _                         
//          |___ /      |  _ \ ___  _ __ ___   ___   __| | ___  _ __ ___          
//           |_ \      | |_) / _ \| `_ ` _ \ / _ \ / _` |/ _ \| `__/ _ \         
//         ___) |  _  |  __/ (_) | | | | | | (_) | (_| | (_) | | | (_) |        
//       |____/  (_) |_|   \___/|_| |_| |_|\___/ \__,_|\___/|_|  \___/         
//--------------------------------------------------------------------------------------------------

//SubAlgoritmo que inicia el módulo pomodoro
SubAlgoritmo Pomodoro
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
	
FinSubAlgoritmo


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
		si min < 1 o min >= 60 Entonces
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