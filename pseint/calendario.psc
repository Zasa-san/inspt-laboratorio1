Algoritmo CalendarioConTareas
    Definir mes, año, diaInicio, diasMes, diaSeleccionado, opc, numTarea Como Entero
    Definir nombreMes, nuevaTarea Como Cadena
    Definir continuarPrograma, continuarSeleccionMes Como Logico
    continuarPrograma <- Verdadero
    Dimensionar tareas[32]
    Dimensionar tareasRealizadas[32, 11] 
    Dimensionar listaTareas[32, 11] 
    Dimensionar contadorTareas[33]
    
    // Inicializacion de las matrices
    Para i <- 1 Hasta 31 Hacer
        contadorTareas[i] <- 0
        Para j <- 1 Hasta 10 Hacer
            listaTareas[i, j] <- ""
            tareasRealizadas[i, j] <- "No"
        Fin Para
    Fin Para
    
    // BUCLE PRINCIPAL
    Mientras continuarPrograma Hacer
        Escribir "Introduce el año (2020-2030 o 0 para salir): "
        Leer año
        Si (año = 0) Entonces
            Escribir "Saliendo del programa..."
            continuarPrograma <- Falso // Cambia el valor para terminar el programa
        Sino
			//SOLICITAR AÑO
            Si (año < 2020 O año > 2030) Entonces
                Escribir "El año debe estar entre 2020 y 2030."
            Sino
                // SOLICITAR MES
                continuarSeleccionMes <- Verdadero
                Mientras continuarSeleccionMes Hacer
                    Escribir "Introduce el mes (1-12 o 0 para volver a seleccionar el año): "
                    Leer mes
                    Si (mes = 0) Entonces
                        continuarSeleccionMes <- Falso // 0 PARA VOLVER A LA SELECCION DEL AÑO
                    Sino
                        Si (mes < 1 O mes > 12) Entonces
                            Escribir "El mes debe estar entre 1 y 12."
                        Sino
                            // CALCULO DE PRIMER DIA DEL MES (fórmula Zeller)
                            d <- 1
                            m <- mes
                            a <- año
                            
                            // Si el mes es enero o febrero, lo tratamos como el 13 y 14 del año anterior
                            Si (mes = 1 O mes = 2) Entonces
                                m <- m + 12
                                a <- año - 1
                            Fin Si
                            
                            k <- a % 100 //ultimos 2 digitos del año
                            t <- trunc(a / 100) //indica el número de siglo
                            
                            // FORMULA ZELLER
                            diaInicio <- ((d + trunc(13 * (m + 1) / 5) + k + trunc(k / 4) + trunc(t / 4) + (5 * t)) % 7) - 1
                            Si diaInicio = 0 Entonces
                                diaInicio <- 7 
                            Fin Si
                            
                            // DEFINICION DE DIAS DE LOS MESES
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
                            
                            // RENDER DEL CALENDARIO
                            Escribir "Calendario de ", nombreMes, " ", año
                            Escribir "L  M  X  J  V  S  D"
                            Para i <- 1 Hasta diaInicio - 1 Hacer
                                Escribir "   " Sin Saltar
                            Fin Para
                            Para dia <- 1 Hasta diasMes Hacer
                                Si (dia < 10) Entonces
                                    Escribir " ", dia, " " Sin Saltar
                                Sino
                                    Escribir dia, " " Sin Saltar
                                Fin Si
                                Si ((dia + diaInicio - 1) % 7 = 0) Entonces
                                    Escribir ""
                                Fin Si
                            Fin Para
                            
                            // SELECCION DEL DIA Y MENU DE FUNCIONES
                            continuarDias <- Verdadero
                            Mientras continuarDias Hacer
                                Escribir ""
                                Escribir "Introduce el día para ver o agregar tareas (0 para volver a seleccionar el mes): "
                                Leer diaSeleccionado
                                Si (diaSeleccionado = 0) Entonces
                                    Escribir "Volviendo a la selección del mes..."
                                    continuarDias <- Falso // Salir del bucle de días
                                Sino 
                                    Si (diaSeleccionado >= 1 Y diaSeleccionado <= diasMes) Entonces
										// RENDER DE TEREAS Y MARCAR COMO REALIZADA
										Si (contadorTareas[diaSeleccionado] = 0) Entonces
											Escribir "No hay tareas para el día ", diaSeleccionado
										Sino
											Escribir "Tareas para el día ", diaSeleccionado, ": "
											Para i <- 1 Hasta contadorTareas[diaSeleccionado] Hacer
												Si tareasRealizadas[diaSeleccionado, i] = "Sí" Entonces
													Escribir i, ". ", listaTareas[diaSeleccionado, i], " --Realizada--"
												Sino
													Escribir i, ". ", listaTareas[diaSeleccionado, i]
												Fin Si
											Fin Para
										Fin Si
										
										// MENU ACCIONES DEL DIA
										Escribir "Selecciona una opción: "
										Escribir "1. Agregar una nueva tarea"
										Escribir "2. Volver al mes"
										Escribir "3. Marcar tarea como realizada"
										Leer opc
										
										Segun opc Hacer
											1:  
												// AGREGAR TAREA
												Escribir "Introduce la nueva tarea: "
												Leer nuevaTarea
												contadorTareas[diaSeleccionado] <- contadorTareas[diaSeleccionado] + 1
												listaTareas[diaSeleccionado, contadorTareas[diaSeleccionado]] <- nuevaTarea
												tareasRealizadas[diaSeleccionado, contadorTareas[diaSeleccionado]] <- "No"
												Escribir "Tarea agregada."
											2:  
												// VOLVER A SELECCIONAR MES
												Escribir "Volviendo al calendario del mes..."
												continuarDias <- Falso
											3:  
												// MARCAR TAREA REALIZADA
												Si (contadorTareas[diaSeleccionado] = 0) Entonces
													Escribir "No hay tareas para marcar como realizadas."
												Sino
													Escribir "Selecciona el número de la tarea que deseas marcar como realizada (0 para volver): "
													Leer numTarea
													Si (numTarea > 0 Y numTarea <= contadorTareas[diaSeleccionado]) Entonces
														tareasRealizadas[diaSeleccionado, numTarea] <- "Sí"
														Escribir "Tarea marcada como realizada."
													Sino
														Escribir "Número de tarea no válido."
													Fin Si
												Fin Si
											De Otro Modo:
												Escribir "Opción no válida."
										Fin Segun
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

