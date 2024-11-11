Algoritmo CalendarioConTareas
    Definir mes, año, diaInicio, diasMes, diaSeleccionado, opc, numTarea Como Entero
    Definir nombreMes, nuevaTarea Como Cadena
    Definir continuarPrograma, continuarSeleccionMes Como Logico
    continuarPrograma <- Verdadero
    Dimensionar tareas[32]
    Dimensionar tareasRealizadas[32, 11] 
    Dimensionar listaTareas[32, 11] 
    Dimensionar contadorTareas[33]
    
    // Inicialización de las matrices
    Para i <- 1 Hasta 31 Hacer
        contadorTareas[i] <- 0
        Para j <- 1 Hasta 10 Hacer
            listaTareas[i, j] <- ""
            tareasRealizadas[i, j] <- "No"
        Fin Para
    Fin Para
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
                            
							// Precargar tareas si es noviembre de 2024
                            Si (año = 2024 Y mes = 11) Entonces
                                cal_PrecargarTareas2024(listaTareas, tareasRealizadas, contadorTareas)
                            Fin Si
							
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
                                        cal_MenuAccionesDia(diaSeleccionado, nombreMes, año, listaTareas, tareasRealizadas, contadorTareas, diasMes, 10, diaInicio)
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
Fin Algoritmo


//--------------- SUBALGORITMOS --------------- 

Subalgoritmo cal_MenuAccionesDia(diaSeleccionado, nombreMes, año, listaTareas, tareasRealizadas, contadorTareas, maxDias, maxTareas, diaInicio)
    continuarDia <- Verdadero
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

