#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "contactos.h"
#include "contactosApi.h"

void contactosMain() {
    opcionesMenuContactos_t opcionMenu;
    bool salir = false;

    printf("**Agenda de contactos**");

    do {
        opcionMenu = menuContactos();

        switch (opcionMenu) {
        case CON_LISTAR:
        listadoCompleto();
        break;
        case CON_CREAR:
        //crearContacto();
        //ordenarPorApellido();
        break;
        case CON_SALIR:
        salir = true;
        break;
        }
    } while (!salir);
}

void verContacto(int idContacto) {
    Contactos ListaDeContactos = getListaDeContactos();
    pContacto contacto = NULL, resultado = ListaDeContactos;

    while (resultado != NULL) {
        if (resultado->id == idContacto) {
            contacto = resultado;
            break;
        }
        resultado = resultado->siguiente;
    }

    printf("Nombre:    \t%s\n", contacto->datos.nombre);
    printf("Apellido:  \t%s\n", contacto->datos.apellido);
    printf("Teléfono:  \t%s\n", contacto->datos.telefono);
    printf("Email:     \t%s\n", contacto->datos.email);
    printf("Dirección: \t%s\n", contacto->datos.direccion);
}

void itemListaContacto(pContacto contacto, int indice) {
    printf("%i) %s, %s (ID:%i)\n", indice + 1, contacto->datos.apellido, contacto->datos.nombre, contacto->id);
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
        if (opcion < CON_SALIR || opcion > CON_MAX_OPCION) {
            invalido = true;
        }
        else {
            invalido = false;
        }
    } while (invalido == true);

    return opcion;
}

void selecionarDeLista(pContacto contactoInicial, int cantidadDeItems) {
    int iterador, opcionElegida;
    bool invalido = false;
    pContacto inicioDeLista;

    do {
        inicioDeLista = contactoInicial;
        iterador = 0;

        limpiarPantalla();
        printf("**Listado de contactos**\n\n");

        while (inicioDeLista->siguiente != NULL && iterador < cantidadDeItems) {
            itemListaContacto(inicioDeLista, iterador);
            inicioDeLista = inicioDeLista->siguiente;
            iterador++;
        }

        if (invalido == true) {
            printf("\n*Debe elegir un número válido*");
        }
        printf("\nSeleccione el número de contacto");
        printf("\n0 - Para volver\n");
        scanf("%i", &opcionElegida);

        if (opcionElegida < 0 || opcionElegida > iterador) {
            invalido = true;
        }
        else if (opcionElegida == 0) {
            invalido = false;
        }
        else {
            invalido = false;
            inicioDeLista = contactoInicial;
            for (int i = 1; i < opcionElegida; i++) {
                inicioDeLista = inicioDeLista->siguiente;
            }
            limpiarPantalla();
            verContacto(inicioDeLista->id);
            esperarTecla("Presione una tecla para volver");
        }

    } while (invalido == true || opcionElegida != 0);

}

void recorrerContactos(pContacto* contactoInicial, int cantidadDeItems) {
    int iterador = 0;
    while (contactoInicial != NULL && (*contactoInicial)->siguiente != NULL && iterador < cantidadDeItems) {
        itemListaContacto(*contactoInicial, iterador);
        *contactoInicial = (*contactoInicial)->siguiente;
        iterador++;
    }
}

void listadoCompleto() {
    pContacto contacto_p = getListaDeContactos();
    pContacto primeroEnPagina;
    int iterador, opcion, pagina = 0, maxPag = 10;
    bool invalido = false, salir = false;

    if (contacto_p == NULL) {
        limpiarPantalla();
        printf("**Listado de contactos**\n\n");
        printf("No existe ningún contacto");
        esperarTecla("Presione una tecla para salir");
    }
    else {
        do {
            limpiarPantalla();
            printf("**Listado de contactos**\n\n");
            printf("Página %i\n", pagina + 1);

            iterador = 0;
            primeroEnPagina = contacto_p;

            recorrerContactos(&contacto_p, maxPag);

            if (invalido) {
                printf("\n*Elija una opción válida*");
            }
            printf("\n1 - Página anterior");
            printf("\n2 - Elegir de esta página");
            printf("\n3 - Página siguiente");
            printf("\n0 - Salir\n");
            scanf("%i", &opcion);

            if (opcion < 0 || opcion > 3) {
                invalido = true;
                contacto_p = primeroEnPagina;
            }
            else {
                invalido = false;

                switch (opcion) {
                case 0:
                salir = true;
                break;

                case 1:
                if (pagina > 0 && primeroEnPagina->anterior != NULL) {
                    pagina--;
                    iterador = 0;
                    contacto_p = primeroEnPagina;

                    while (contacto_p->anterior != NULL && iterador < maxPag) {
                        contacto_p = contacto_p->anterior;
                        iterador++;
                    }
                }
                else {
                    contacto_p = primeroEnPagina;
                }
                break;

                case 2:
                selecionarDeLista(primeroEnPagina, maxPag);
                contacto_p = primeroEnPagina;
                break;

                case 3:
                if (contacto_p->siguiente != NULL) {
                    pagina++;
                }
                else {
                    contacto_p = primeroEnPagina;
                }
                break;
                }
            }
        } while (!salir);
    }
}

void poblarContactos() {
    Contactos* ListaDeContactos = listaDeContactosSetter();
    pContacto* ultimoElemento_p = ultimoElementoSetter();
    int* generadorId = getGeneradorId();
    int maxIniciales = 25;

    datosBasicosContacto_t contactosIniciales[] = {
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

    for (int i = 0; i < maxIniciales; i++) {
        pContacto nuevoContacto = (pContacto)malloc(sizeof(contacto_t));
        if (nuevoContacto != NULL) {
            strcpy(nuevoContacto->datos.nombre, contactosIniciales[i].nombre);
            strcpy(nuevoContacto->datos.apellido, contactosIniciales[i].apellido);
            strcpy(nuevoContacto->datos.telefono, contactosIniciales[i].telefono);
            strcpy(nuevoContacto->datos.email, contactosIniciales[i].email);
            strcpy(nuevoContacto->datos.direccion, contactosIniciales[i].direccion);
            nuevoContacto->id = *generadorId;
            nuevoContacto->siguiente = NULL;
            nuevoContacto->anterior = NULL;

            if (*ListaDeContactos == NULL) {
                *ListaDeContactos = nuevoContacto;
                *ultimoElemento_p = nuevoContacto;
            }
            else {
                (*ultimoElemento_p)->siguiente = nuevoContacto;
                nuevoContacto->anterior = *ultimoElemento_p;
                *ultimoElemento_p = nuevoContacto;
            }

            *generadorId = *generadorId + 1;
        }
    }

    ordenarPorApellido();
}

void ordenarPorApellido() {
    Contactos ListadoDeContactos = getListaDeContactos();

    if (!(ListadoDeContactos == NULL || ListadoDeContactos->siguiente == NULL)) {
        bool cambiados;
        int tempId;
        pContacto nodoActual, tempNodo;
        datosBasicosContacto_t tempDatos;

        do {
            cambiados = false;
            nodoActual = ListadoDeContactos;

            while (nodoActual->siguiente != NULL) {
                if (_stricmp(nodoActual->datos.apellido, nodoActual->siguiente->datos.apellido) > 0) {

                    tempDatos = nodoActual->datos;
                    nodoActual->datos = nodoActual->siguiente->datos;
                    nodoActual->siguiente->datos = tempDatos;

                    tempId = nodoActual->id;
                    nodoActual->id = nodoActual->siguiente->id;
                    nodoActual->siguiente->id = tempId;

                    cambiados = true;
                }
                nodoActual = nodoActual->siguiente;
            }
        } while (cambiados);
    }
}

void guardarDato(const char* campo, char* propiedad, pContacto contacto) {
    char datoContacto[STRING_MAX];
    limpiarBuffer();
    limpiarPantalla();
    printf("**Creación de contacto**\n");
    verContacto(contacto->id);
    printf("Ingrese el %s:\n", campo);
    fgets(datoContacto, STRING_MAX, stdin);
    datoContacto[strcspn(datoContacto, "\n")] = 0;
    strcpy(propiedad, datoContacto);
}

/*void crearContacto(Contactos* ListadoDeContactos, pContacto* ultimoItem, int* generadorDeId) {
    bool valido = false;
    pContacto nuevoContacto = (pContacto)malloc(sizeof(contacto_t));

    strcpy(nuevoContacto->datos.nombre, "");
    strcpy(nuevoContacto->datos.apellido, "");
    strcpy(nuevoContacto->datos.email, "");
    strcpy(nuevoContacto->datos.telefono, "");
    strcpy(nuevoContacto->datos.direccion, "");

    guardarDato("nombre", nuevoContacto->datos.nombre, nuevoContacto);
    guardarDato("apellido", nuevoContacto->datos.apellido, nuevoContacto);
    guardarDato("telefono", nuevoContacto->datos.telefono, nuevoContacto);
    guardarDato("email", nuevoContacto->datos.email, nuevoContacto);
    guardarDato("dirección", nuevoContacto->datos.direccion, nuevoContacto);
    nuevoContacto->id = *generadorDeId;
    nuevoContacto->anterior = NULL;
    nuevoContacto->siguiente = NULL;

    if (*ListadoDeContactos == NULL) {
        *ListadoDeContactos = nuevoContacto;
        *ultimoItem = nuevoContacto;
    }
    else {
        (*ultimoItem)->siguiente = nuevoContacto;
        nuevoContacto->anterior = *ultimoItem;
        *ultimoItem = nuevoContacto;
    }
    *generadorDeId = *generadorDeId + 1;
}*/