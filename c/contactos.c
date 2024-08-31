#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <stdbool.h>
#define AGENDA_MAX 1000
#define ALFABETO 26
#define STRING_MAX 200
#define clrscr() printf("\e[1;1H\e[2J")

typedef struct {
    char nombre[STRING_MAX];
    char apellido[STRING_MAX];
    char telefono[STRING_MAX];
    char email[STRING_MAX];
    char direccion[STRING_MAX];
} contacto_t;

void poblarContactos(contacto_t[AGENDA_MAX]);
void ordenarPorApellido(contacto_t[AGENDA_MAX], int32_t[ALFABETO][2]);
int32_t menuPrincipal();


int32_t main() {
    int32_t opcion;
    int32_t indice[ALFABETO][2];
    contacto_t agenda[AGENDA_MAX];

    opcion = -1;
    poblarContactos(agenda);
    ordenarPorApellido(agenda, indice);

    printf("**Agenda de contactos**");
    opcion = menuPrincipal();

    do {
        switch (opcion) {
        case 1: printf("agenda por apellido");
            break;

        case 2: printf("busqueda");
            break;

        default: printf("Saliendo...");
            break;
        }
    } while (opcion == -1);

    fflush(stdin);
    getchar();
    return 0;
}

int32_t menuPrincipal() {
    int32_t opcion;
    bool invalido;
    opcion = 0;
    invalido = false;

    printf("\n");

    do {
        if (opcion < 0 || opcion > 2) {
            printf("**Debe elegir una opción válida**\n");
        }
        printf("Opciones de navegación:\n");
        printf("1 - Ver por apellido\n");
        printf("2 - Buscar por nombre o apellido\n");
        printf("0 - Para salir de la agenda\n");
        scanf("%d", &opcion);
        if (opcion < 0 || opcion > 2) {
            invalido = true;
        }
        else {
            invalido = false;
        }
        clrscr();
    } while (invalido != false);

    return opcion;
}

void ordenarPorApellido(contacto_t agenda[AGENDA_MAX], int32_t indice[ALFABETO][2]) {

}

void poblarContactos(contacto_t agenda[AGENDA_MAX]) {
    strcpy(agenda[0].nombre, "Ana");
    strcpy(agenda[0].apellido, "García");
    strcpy(agenda[0].telefono, "1154782236");
    strcpy(agenda[0].email, "ana.garcia@example.com");
    strcpy(agenda[0].direccion, "Calle Falsa 456, Buenos Aires");

    strcpy(agenda[1].nombre, "Luis");
    strcpy(agenda[1].apellido, "Martínez");
    strcpy(agenda[1].telefono, "");
    strcpy(agenda[1].email, "");
    strcpy(agenda[1].direccion, "Av. Santa Fe 1234, Buenos Aires");

    strcpy(agenda[2].nombre, "Sofía");
    strcpy(agenda[2].apellido, "Rodríguez");
    strcpy(agenda[2].telefono, "1154782238");
    strcpy(agenda[2].email, "");
    strcpy(agenda[2].direccion, "Calle Córdoba 789, Buenos Aires");

    strcpy(agenda[3].nombre, "Martín");
    strcpy(agenda[3].apellido, "Silva");
    strcpy(agenda[3].telefono, "1154782239");
    strcpy(agenda[3].email, "martin.silva@example.com");
    strcpy(agenda[3].direccion, "");

    strcpy(agenda[4].nombre, "Julia");
    strcpy(agenda[4].apellido, "Pérez");
    strcpy(agenda[4].telefono, "1154782240");
    strcpy(agenda[4].email, "");
    strcpy(agenda[4].direccion, "Calle Avellaneda 234, Buenos Aires");

    strcpy(agenda[5].nombre, "Ricardo");
    strcpy(agenda[5].apellido, "Fernández");
    strcpy(agenda[5].telefono, "1154782241");
    strcpy(agenda[5].email, "");
    strcpy(agenda[5].direccion, "Calle Moreno 678, Buenos Aires");

    strcpy(agenda[6].nombre, "Carla");
    strcpy(agenda[6].apellido, "Vega");
    strcpy(agenda[6].telefono, "");
    strcpy(agenda[6].email, "");
    strcpy(agenda[6].direccion, "Av. Córdoba 890, Buenos Aires");

    strcpy(agenda[7].nombre, "Pedro");
    strcpy(agenda[7].apellido, "Gómez");
    strcpy(agenda[7].telefono, "1154782243");
    strcpy(agenda[7].email, "pedro.gomez@example.com");
    strcpy(agenda[7].direccion, "Calle San Juan 300, Buenos Aires");

    strcpy(agenda[8].nombre, "Natalia");
    strcpy(agenda[8].apellido, "Vargas");
    strcpy(agenda[8].telefono, "1154782244");
    strcpy(agenda[8].email, "");
    strcpy(agenda[8].direccion, "Av. San Martín 1500, Buenos Aires");

    strcpy(agenda[9].nombre, "Tomás");
    strcpy(agenda[9].apellido, "Morales");
    strcpy(agenda[9].telefono, "");
    strcpy(agenda[9].email, "");
    strcpy(agenda[9].direccion, "");

    strcpy(agenda[10].nombre, "Mónica");
    strcpy(agenda[10].apellido, "Fernández");
    strcpy(agenda[10].telefono, "1154782246");
    strcpy(agenda[10].email, "");
    strcpy(agenda[10].direccion, "Calle Sarmiento 250, Buenos Aires");

    strcpy(agenda[11].nombre, "Gustavo");
    strcpy(agenda[11].apellido, "Martínez");
    strcpy(agenda[11].telefono, "1154782247");
    strcpy(agenda[11].email, "");
    strcpy(agenda[11].direccion, "Av. 9 de Julio 700, Buenos Aires");

    strcpy(agenda[12].nombre, "Valeria");
    strcpy(agenda[12].apellido, "Castro");
    strcpy(agenda[12].telefono, "1154782248");
    strcpy(agenda[12].email, "");
    strcpy(agenda[12].direccion, "Calle Tucumán 600, Buenos Aires");

    strcpy(agenda[13].nombre, "Juan");
    strcpy(agenda[13].apellido, "Salazar");
    strcpy(agenda[13].telefono, "1154782249");
    strcpy(agenda[13].email, "");
    strcpy(agenda[13].direccion, "Av. Rivadavia 1000, Buenos Aires");

    strcpy(agenda[14].nombre, "Sandra");
    strcpy(agenda[14].apellido, "Bravo");
    strcpy(agenda[14].telefono, "1154782250");
    strcpy(agenda[14].email, "");
    strcpy(agenda[14].direccion, "Calle Chile 800, Buenos Aires");

    strcpy(agenda[15].nombre, "Emilio");
    strcpy(agenda[15].apellido, "Gutiérrez");
    strcpy(agenda[15].telefono, "1154782251");
    strcpy(agenda[15].email, "");
    strcpy(agenda[15].direccion, "Av. Santa Fe 900, Buenos Aires");

    strcpy(agenda[16].nombre, "Florencia");
    strcpy(agenda[16].apellido, "Sosa");
    strcpy(agenda[16].telefono, "1154782252");
    strcpy(agenda[16].email, "");
    strcpy(agenda[16].direccion, "Calle Montevideo 500, Buenos Aires");

    strcpy(agenda[17].nombre, "Álvaro");
    strcpy(agenda[17].apellido, "Jiménez");
    strcpy(agenda[17].telefono, "1154782253");
    strcpy(agenda[17].email, "");
    strcpy(agenda[17].direccion, "Av. Belgrano 1200, Buenos Aires");

    strcpy(agenda[18].nombre, "Carmen");
    strcpy(agenda[18].apellido, "Rivas");
    strcpy(agenda[18].telefono, "1154782254");
    strcpy(agenda[18].email, "");
    strcpy(agenda[18].direccion, "Calle Paraná 300, Buenos Aires");

    strcpy(agenda[19].nombre, "Jorge");
    strcpy(agenda[19].apellido, "González");
    strcpy(agenda[19].telefono, "1154782255");
    strcpy(agenda[19].email, "");
    strcpy(agenda[19].direccion, "Calle Lavalle 1200, Buenos Aires");

    strcpy(agenda[20].nombre, "Silvia");
    strcpy(agenda[20].apellido, "Cruz");
    strcpy(agenda[20].telefono, "1154782256");
    strcpy(agenda[20].email, "");
    strcpy(agenda[20].direccion, "Av. Corrientes 1500, Buenos Aires");

    strcpy(agenda[21].nombre, "Ricardo");
    strcpy(agenda[21].apellido, "Vega");
    strcpy(agenda[21].telefono, "1154782257");
    strcpy(agenda[21].email, "");
    strcpy(agenda[21].direccion, "Calle San Martín 2000, Buenos Aires");

    strcpy(agenda[22].nombre, "Gabriela");
    strcpy(agenda[22].apellido, "Ramírez");
    strcpy(agenda[22].telefono, "1154782258");
    strcpy(agenda[22].email, "gabriela.ramirez@example.com");
    strcpy(agenda[22].direccion, "");

    strcpy(agenda[23].nombre, "Tomás");
    strcpy(agenda[23].apellido, "Fernández");
    strcpy(agenda[23].telefono, "1154782259");
    strcpy(agenda[23].email, "");
    strcpy(agenda[23].direccion, "Calle Olavarría 123, Buenos Aires");

    strcpy(agenda[24].nombre, "Renata");
    strcpy(agenda[24].apellido, "González");
    strcpy(agenda[24].telefono, "1154782260");
    strcpy(agenda[24].email, "renata.gonzalez@example.com");
    strcpy(agenda[24].direccion, "Av. Libertador 200, Buenos Aires");
}