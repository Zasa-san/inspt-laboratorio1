#ifndef POMODORO_H
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
#endif