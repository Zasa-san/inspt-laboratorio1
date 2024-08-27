Algoritmo CalendarioConTareas
    Definir mes, año, diaInicio, diasMes, diaSeleccionado, opcion Como Entero
    Definir nombreMes, tareas, nuevaTarea Como Cadena
    Dimensionar tareas[32]
    Para i <- 1 Hasta 31 Hacer
        tareas[i] <- ""
    FinPara
	
	Repetir
		
	
    Escribir "Introduce el mes (1-12): "
    Leer mes
    Escribir "Introduce el año: "
    Leer año
	
    // Determinar el nombre del mes y la cantidad de días
    Segun mes Hacer
        1: nombreMes <- "Enero"; diasMes <- 31
        2: nombreMes <- "Febrero"
            //año bisiesto
			Si (año % 4 = 0 Y (año % 100 <> 0 O año % 400 = 0)) Entonces
                diasMes <- 29
            Sino
                diasMes <- 28
            FinSi
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
    FinSegun
	
	
    // Determinar el día de inicio del mes
    Escribir "Introduce el día de la semana en que empieza el mes (1=Lunes, 7=Domingo): "
    Leer diaInicio
	
    // Imprimir el calendario
    Escribir "Calendario de ", nombreMes, " ", año
    Escribir "L  M  X  J  V  S  D"
    Para i <- 1 Hasta diaInicio - 1 Hacer
        Escribir "   " Sin Saltar
    FinPara
    Para dia <- 1 Hasta diasMes Hacer
        Si (dia < 10) Entonces
            Escribir " ", dia, " " Sin Saltar
        Sino
            Escribir dia, " " Sin Saltar
        FinSi
        Si ((dia + diaInicio - 1) % 7 = 0) Entonces
            Escribir ""
        FinSi
    FinPara
	
    // Bucle para seleccionar un día y mostrar o agregar tareas
    
        Escribir ""
        Escribir "Introduce el día para ver o agregar tareas (0 para salir): "
        Leer diaSeleccionado
        Si (diaSeleccionado >= 1 Y diaSeleccionado <= diasMes) Entonces
			Escribir "Selecciona una opción: "
			Escribir "1. Ver todas las tareas"
			Escribir "2. Agregar una nueva tarea"
			Leer opcion
			Si (opcion = 1) Entonces
				Si (tareas[diaSeleccionado] = "") Entonces
					Escribir "No hay tareas para el día ", diaSeleccionado
				Sino
					Escribir "Tareas para el día ", diaSeleccionado, ": "
					Escribir "- ",tareas[diaSeleccionado]
				FinSi
			FinSi
			Si (opcion = 2) Entonces
				Escribir "Introduce la nueva tarea: "
				Leer nuevaTarea
				Si (tareas[diaSeleccionado] = "") Entonces
					tareas[diaSeleccionado] <- nuevaTarea
				Sino
					tareas[diaSeleccionado] <- tareas[diaSeleccionado] + "; " + nuevaTarea
				FinSi
				Escribir "Tarea agregada."
			Sino
				Escribir "Opción no válida."
			FinSi
		FinSi
    Hasta Que  diaSeleccionado = 0
FinAlgoritmo


