#include <stdio.h>
#include <string.h>
#define AGENDA_MAX 1000
#define STRING_MAX 200
#define FALSE 0
#define clrscr() printf("\e[1;1H\e[2J")

void poblarContactos(char[AGENDA_MAX][5][STRING_MAX]);
int menuPrincipal();

int main() {
    int opcion;
    char agenda[AGENDA_MAX][5][STRING_MAX];

    opcion = 0;

    poblarContactos(agenda);

    printf("**Agenda de contactos**");
    opcion = menuPrincipal();

    switch (opcion) {
    case 1: printf("agenda por apellido");
        break;

    case 2: printf("busqueda");
        break;

    default: printf("Saliendo...");
        break;
    }

    fflush(stdin);
    getchar();
    return 0;
}

int menuPrincipal() {
    int invalido, opcion;
    opcion = 0;
    invalido = FALSE;
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
            invalido = 1;
        }
        else {
            invalido = FALSE;
        }
        clrscr();
    } while (invalido != FALSE);
    return opcion;
}

void poblarContactos(char agenda[AGENDA_MAX][5][STRING_MAX]) {
    strcpy(agenda[0][0], "Ana");
    strcpy(agenda[0][1], "García");
    strcpy(agenda[0][2], "1154782236");
    strcpy(agenda[0][3], "ana.garcia@example.com");
    strcpy(agenda[0][4], "Calle Falsa 456, Buenos Aires");

    strcpy(agenda[1][0], "Luis");
    strcpy(agenda[1][1], "Martínez");
    strcpy(agenda[1][2], "");
    strcpy(agenda[1][3], "");
    strcpy(agenda[1][4], "Av. Santa Fe 1234, Buenos Aires");

    strcpy(agenda[2][0], "Sofía");
    strcpy(agenda[2][1], "Rodríguez");
    strcpy(agenda[2][2], "1154782238");
    strcpy(agenda[2][3], "");
    strcpy(agenda[2][4], "Calle Córdoba 789, Buenos Aires");

    strcpy(agenda[3][0], "Martín");
    strcpy(agenda[3][1], "Silva");
    strcpy(agenda[3][2], "1154782239");
    strcpy(agenda[3][3], "martin.silva@example.com");
    strcpy(agenda[3][4], "");

    strcpy(agenda[4][0], "Julia");
    strcpy(agenda[4][1], "Pérez");
    strcpy(agenda[4][2], "1154782240");
    strcpy(agenda[4][3], "");
    strcpy(agenda[4][4], "Calle Avellaneda 234, Buenos Aires");

    strcpy(agenda[5][0], "Ricardo");
    strcpy(agenda[5][1], "Fernández");
    strcpy(agenda[5][2], "1154782241");
    strcpy(agenda[5][3], "");
    strcpy(agenda[5][4], "Calle Moreno 678, Buenos Aires");

    strcpy(agenda[6][0], "Carla");
    strcpy(agenda[6][1], "Vega");
    strcpy(agenda[6][2], "");
    strcpy(agenda[6][3], "");
    strcpy(agenda[6][4], "Av. Córdoba 890, Buenos Aires");

    strcpy(agenda[7][0], "Pedro");
    strcpy(agenda[7][1], "Gómez");
    strcpy(agenda[7][2], "1154782243");
    strcpy(agenda[7][3], "pedro.gomez@example.com");
    strcpy(agenda[7][4], "Calle San Juan 300, Buenos Aires");

    strcpy(agenda[8][0], "Natalia");
    strcpy(agenda[8][1], "Vargas");
    strcpy(agenda[8][2], "1154782244");
    strcpy(agenda[8][3], "");
    strcpy(agenda[8][4], "Av. San Martín 1500, Buenos Aires");

    strcpy(agenda[9][0], "Tomás");
    strcpy(agenda[9][1], "Morales");
    strcpy(agenda[9][2], "");
    strcpy(agenda[9][3], "");
    strcpy(agenda[9][4], "");

    strcpy(agenda[10][0], "Mónica");
    strcpy(agenda[10][1], "Fernández");
    strcpy(agenda[10][2], "1154782246");
    strcpy(agenda[10][3], "");
    strcpy(agenda[10][4], "Calle Sarmiento 250, Buenos Aires");

    strcpy(agenda[11][0], "Gustavo");
    strcpy(agenda[11][1], "Martínez");
    strcpy(agenda[11][2], "1154782247");
    strcpy(agenda[11][3], "");
    strcpy(agenda[11][4], "Av. 9 de Julio 700, Buenos Aires");

    strcpy(agenda[12][0], "Valeria");
    strcpy(agenda[12][1], "Castro");
    strcpy(agenda[12][2], "1154782248");
    strcpy(agenda[12][3], "");
    strcpy(agenda[12][4], "Calle Tucumán 600, Buenos Aires");

    strcpy(agenda[13][0], "Juan");
    strcpy(agenda[13][1], "Salazar");
    strcpy(agenda[13][2], "1154782249");
    strcpy(agenda[13][3], "");
    strcpy(agenda[13][4], "Av. Rivadavia 1000, Buenos Aires");

    strcpy(agenda[14][0], "Sandra");
    strcpy(agenda[14][1], "Bravo");
    strcpy(agenda[14][2], "1154782250");
    strcpy(agenda[14][3], "");
    strcpy(agenda[14][4], "Calle Chile 800, Buenos Aires");

    strcpy(agenda[15][0], "Emilio");
    strcpy(agenda[15][1], "Gutiérrez");
    strcpy(agenda[15][2], "1154782251");
    strcpy(agenda[15][3], "");
    strcpy(agenda[15][4], "Av. Santa Fe 900, Buenos Aires");

    strcpy(agenda[16][0], "Florencia");
    strcpy(agenda[16][1], "Sosa");
    strcpy(agenda[16][2], "1154782252");
    strcpy(agenda[16][3], "");
    strcpy(agenda[16][4], "Calle Montevideo 500, Buenos Aires");

    strcpy(agenda[17][0], "Álvaro");
    strcpy(agenda[17][1], "Jiménez");
    strcpy(agenda[17][2], "1154782253");
    strcpy(agenda[17][3], "");
    strcpy(agenda[17][4], "Av. Belgrano 1200, Buenos Aires");

    strcpy(agenda[18][0], "Carmen");
    strcpy(agenda[18][1], "Rivas");
    strcpy(agenda[18][2], "1154782254");
    strcpy(agenda[18][3], "");
    strcpy(agenda[18][4], "Calle Paraná 300, Buenos Aires");

    strcpy(agenda[19][0], "Jorge");
    strcpy(agenda[19][1], "González");
    strcpy(agenda[19][2], "1154782255");
    strcpy(agenda[19][3], "");
    strcpy(agenda[19][4], "Calle Lavalle 1200, Buenos Aires");

    strcpy(agenda[20][0], "Silvia");
    strcpy(agenda[20][1], "Cruz");
    strcpy(agenda[20][2], "1154782256");
    strcpy(agenda[20][3], "");
    strcpy(agenda[20][4], "Av. Corrientes 1500, Buenos Aires");

    strcpy(agenda[21][0], "Ricardo");
    strcpy(agenda[21][1], "Vega");
    strcpy(agenda[21][2], "1154782257");
    strcpy(agenda[21][3], "");
    strcpy(agenda[21][4], "Calle San Martín 2000, Buenos Aires");

    strcpy(agenda[22][0], "Gabriela");
    strcpy(agenda[22][1], "Ramírez");
    strcpy(agenda[22][2], "1154782258");
    strcpy(agenda[22][3], "gabriela.ramirez@example.com");
    strcpy(agenda[22][4], "");

    strcpy(agenda[23][0], "Tomás");
    strcpy(agenda[23][1], "Fernández");
    strcpy(agenda[23][2], "1154782259");
    strcpy(agenda[23][3], "");
    strcpy(agenda[23][4], "Calle Olavarría 123, Buenos Aires");

    strcpy(agenda[24][0], "Renata");
    strcpy(agenda[24][1], "González");
    strcpy(agenda[24][2], "1154782260");
    strcpy(agenda[24][3], "renata.gonzalez@example.com");
    strcpy(agenda[24][4], "Av. Libertador 200, Buenos Aires");
}