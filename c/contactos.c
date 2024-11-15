#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "contactos.h"

void contactosMain(contacto_t* ListaDeContactos) {
    opcionesMenuContactos_t opcionMenu;
    bool salir = false;

    printf("**Agenda de contactos**");

    do
    {
        opcionMenu = menuContactos();
        switch (opcionMenu) {
        case CON_LISTAR:
        listadoCompleto(ListaDeContactos);
        break;
        case CON_CREAR:
        printf("acá iriía la parte de crear");
        esperarTecla(NULL);
        break;
        case CON_SALIR:
        salir = true;
        break;
        default: printf("Saliendo...");
            break;
        }
    } while (salir == false);
}

opcionesMenuContactos_t menuContactos() {
    opcionesMenuContactos_t opcion;
    bool invalido = false;

    do {
        limpiarPantalla();
        if (invalido) {
            printf("**Debe elegir una opción válida**\n");
        }
        else {
            printf("Opciones de navegación:\n");
        }
        printf("1 - Ver por apellido\n");
        printf("2 - Crear un nuevo contacto\n");
        printf("0 - Para salir de la agenda\n");
        scanf("%d", &opcion);
        limpiarBuffer();
        if (opcion < CON_SALIR || opcion > CON_MAX_OPCION) {
            invalido = true;
        }
        else {
            invalido = false;
        }
    } while (invalido == true);

    return opcion;
}

void listadoCompleto(Contactos ListaDeContactos) {
    pContacto current = ListaDeContactos, anterior;
    int pagAnterior, pagSiguiente, iterador, maxPag = 10;

    limpiarPantalla();
    printf("**Listado de contactos**\n");

    if (current == NULL) {
        printf("No existe ningún contacto");
    }
    else {
        while (current != NULL && iterador < maxPag + 1) {
            printf("%i) %s, %s\n", iterador, current->apellido, current->nombre);
            current = current->siguiente;
            iterador++;
        }
        if (current->siguiente != NULL) {
            printf("\n1 - Página anterior");
            printf("\n2 - Página siguiente");
            printf("\n3 - Elegir de esta página");
        }
    }

    esperarTecla("fin");
}

void poblarContactos(Contactos* ListaDeContactos, pContacto* contacto_p) {
    int num_contacts = 25;
    contacto_t contactosIniciales[] = {
      {"Ana", "García", "1154782236", "ana.garcia@example.com", "Calle Falsa 456, Buenos Aires"},
      {"Luis", "Martínez", "", "", "Av. Santa Fe 1234, Buenos Aires"},
      {"Sofía", "Rodríguez", "1154782238", "", "Calle Córdoba 789, Buenos Aires"},
      {"Martín", "Silva", "1154782239", "martin.silva@example.com", ""},
      {"Julia", "Pérez", "1154782240", "", "Calle Avellaneda 234, Buenos Aires"},
      {"Ricardo", "Fernández", "1154782241", "", "Calle Moreno 678, Buenos Aires"},
      {"Carla", "Vega", "", "", "Av. Córdoba 890, Buenos Aires"},
      {"Pedro", "Gómez", "1154782243", "pedro.gomez@example.com", "Calle San Juan 300, Buenos Aires"},
      {"Natalia", "Vargas", "1154782244", "", "Av. San Martín 1500, Buenos Aires"},
      {"Tomás", "Morales", "", "", ""},
      {"Mónica", "Fernández", "1154782246", "", "Calle Sarmiento 250, Buenos Aires"},
      {"Gustavo", "Martínez", "1154782247", "", "Av. 9 de Julio 700, Buenos Aires"},
      {"Valeria", "Castro", "1154782248", "", "Calle Tucumán 600, Buenos Aires"},
      {"Juan", "Salazar", "1154782249", "", "Av. Rivadavia 1000, Buenos Aires"},
      {"Sandra", "Bravo", "1154782250", "", "Calle Chile 800, Buenos Aires"},
      {"Emilio", "Gutiérrez", "1154782251", "", "Av. Santa Fe 900, Buenos Aires"},
      {"Florencia", "Sosa", "1154782252", "", "Calle Montevideo 500, Buenos Aires"},
      {"Álvaro", "Jiménez", "1154782253", "", "Av. Belgrano 1200, Buenos Aires"},
      {"Carmen", "Rivas", "1154782254", "", "Calle Paraná 300, Buenos Aires"},
      {"Jorge", "González", "1154782255", "", "Calle Lavalle 1200, Buenos Aires"},
      {"Silvia", "Cruz", "1154782256", "", "Av. Corrientes 1500, Buenos Aires"},
      {"Ricardo", "Vega", "1154782257", "", "Calle San Martín 2000, Buenos Aires"},
      {"Gabriela", "Ramírez", "1154782258", "gabriela.ramirez@example.com", ""},
      {"Tomás", "Fernández", "1154782259", "", "Calle Olavarría 123, Buenos Aires"},
      {"Renata", "González", "1154782260", "renata.gonzalez@example.com", "Av. Libertador 200, Buenos Aires"}
    };

    for (int i = 0; i < num_contacts; i++) {
        contacto_t* nuevoContacto = (contacto_t*)malloc(sizeof(contacto_t));
        if (nuevoContacto != NULL) {
            strcpy(nuevoContacto->nombre, contactosIniciales[i].nombre);
            strcpy(nuevoContacto->apellido, contactosIniciales[i].apellido);
            strcpy(nuevoContacto->telefono, contactosIniciales[i].telefono);
            strcpy(nuevoContacto->email, contactosIniciales[i].email);
            strcpy(nuevoContacto->direccion, contactosIniciales[i].direccion);
            nuevoContacto->siguiente = NULL;

            if (*ListaDeContactos == NULL) {
                *ListaDeContactos = nuevoContacto;
                *contacto_p = nuevoContacto;
            }
            else {
                (*contacto_p)->siguiente = nuevoContacto;
                *contacto_p = nuevoContacto;
            }
        }
    }
}