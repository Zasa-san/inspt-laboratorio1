Algoritmo Contactos
	//ESPACIO GLOBAL
	Definir con_agenda Como Caracter
	Dimensionar con_agenda[1000,5]
	
	con_poblarContactos(con_agenda)
	con_ContactosMain(con_agenda)
	
FinAlgoritmo

//ALGORITMOS Y FUNCIONES ESPECÍFICAS DEL MÓDULO
SubAlgoritmo con_ContactosMain(con_agenda)
	Definir seleccion Como Entero
	
	Escribir "*Agenda de contactos*"
	
	seleccion = con_MenuPrincipal
	
	Segun seleccion Hacer
		1:
			Escribir "Ver contactos por apellido"
		2:
			Escribir "Ver contactos por nombre"
		3:
			Escribir "Buscar por nombre o apellido"
		De Otro Modo:
			Escribir "Saliendo..."
	Fin Segun
	
FinSubAlgoritmo

Funcion seleccion = con_MenuPrincipal
	Definir opcion_elegida Como Entero	
	Repetir
		opcion_elegida = 4
		Escribir "Opciones de navegación:"
		Escribir "1 - Ver por apellido"
		Escribir "2 - Ver por nombre"
		Escribir "3 - Buscar por nombre o apellido"
		Escribir "0 - Para salir de la agenda"
		Leer opcion_elegida
		
		Si opcion_elegida < 0 O opcion_elegida > 3 Entonces
			Escribir "Debe elegir una opción válida"
		SiNo
			seleccion = opcion_elegida
		FinSi
	Mientras Que opcion_elegida >= 4
FinFuncion

Funcion con_poblarContactos(matriz)
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
FinFuncion
