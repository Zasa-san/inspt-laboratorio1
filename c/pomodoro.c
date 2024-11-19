#include <stdio.h>
#include <stdlib.h>
#include <windows.h>
#include <time.h>

// DEFINICIONES ------------------------------------------------------------------------------------------------
#define MIN_POMODORO 1    // Minutos mínimos para el pomodoro
#define MAX_POMODORO 59   // Minutos máximos para el pomodoro
#define MIN_PAUSA 1       // Minutos mínimos para la pausa
#define MAX_PAUSA 30      // Minutos máximos para la pausa

// FUNCIONES ------------------------------------------------------------------------------------------------
void mostrarTitulo();
void iniciarPomodoro();
void mostrarHora(int minutosPomodoro, int minutosPausa);
void temporizador(int minutos, const char* mensaje);
void esperarTecla(const char* mensaje);

int main() {
    iniciarPomodoro();
    printf("¡Pomodoro terminado!\n");
    return 0;
}

// DESARROLLO FUNCIONES ------------------------------------------------------------------------------------------------

// Función para mostrar la hora actual y la hora de finalización según los minutos adicionales
void mostrarHora(int minutosPomodoro, int minutosPausa) {
    time_t ahora;
    struct tm *horaLocal;
    time(&ahora);
    horaLocal = localtime(&ahora);

    // Muestra la hora de inicio
    printf("Hora de inicio: %02d:%02d:%02d\n", horaLocal->tm_hour, horaLocal->tm_min, horaLocal->tm_sec);

    // Calcula la hora de finalización sumando el tiempo total (Pomodoro + Pausa)
    horaLocal->tm_min += minutosPomodoro + minutosPausa;
    mktime(horaLocal); // Ajusta la estructura de tiempo automáticamente

    // Muestra la hora estimada de finalización
    printf("Hora de finalizacion estimada: %02d:%02d:%02d\n", horaLocal->tm_hour, horaLocal->tm_min, horaLocal->tm_sec);
}

// Función para mostrar el encabezado del título
void mostrarTitulo() {
    system("cls"); // Limpiar pantalla
    printf("=== POMODORO ===\n\n");
}

// Función para mostrar un temporizador en pantalla con actualización de tiempo
void temporizador(int minutos, const char* mensaje) {
    for (int i = minutos * 60; i > 0; i--) {
        mostrarTitulo();
        printf("%s\n", mensaje);
        printf("Tiempo restante: %02d:%02d\n", i / 60, i % 60);
        Sleep(1000); // Pausa de 1 segundo
    }
}

// Función para esperar la entrada de una tecla para continuar
void esperarTecla(const char* mensaje) {
    printf("%s", mensaje);
    getchar();
    getchar(); // Captura el Enter adicional
}

// Función principal del Pomodoro
void iniciarPomodoro() {
    int tiempoPomodoro, tiempoPausa;
    char continuar;

    do {
        mostrarTitulo();

        // Ingreso y validación del tiempo del pomodoro
        do {
            mostrarTitulo();
            printf("Ingrese la duracion del pomodoro (minutos, entre %d y %d): ", MIN_POMODORO, MAX_POMODORO);
            scanf("%d", &tiempoPomodoro);
        } while (tiempoPomodoro < MIN_POMODORO || tiempoPomodoro > MAX_POMODORO);

        // Ingreso y validación del tiempo de la pausa
        do {
            mostrarTitulo();
            printf("Ingrese la duracion de la pausa (minutos, entre %d y %d): ", MIN_PAUSA, MAX_PAUSA);
            scanf("%d", &tiempoPausa);
        } while (tiempoPausa < MIN_PAUSA || tiempoPausa > MAX_PAUSA);

        // Muestra la hora de inicio y de finalización total
        mostrarTitulo();
        printf("Detalles del Pomodoro:\n");
        mostrarHora(tiempoPomodoro, tiempoPausa);
        esperarTecla("\nPresione una tecla para comenzar el Pomodoro...");

        // Temporizador del pomodoro
        temporizador(tiempoPomodoro, "Pomodoro en curso...");

        // Temporizador de la pausa
        mostrarTitulo();
        printf("Iniciando descanso...\n");
        temporizador(tiempoPausa, "Descanso en curso...");
        esperarTecla("\nPresione una tecla para finalizar la pausa...");

        // Pregunta si se desea iniciar un nuevo pomodoro
        mostrarTitulo();
        printf("Desea iniciar un nuevo pomodoro? (s/n): ");
        scanf(" %c", &continuar);

    } while (continuar == 's' || continuar == 'S');
}