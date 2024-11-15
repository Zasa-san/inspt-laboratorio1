#ifndef UTILIDADES_H
#define UTILIDADES_H

typedef enum {
  MAIN_SALIR = 0,
  MAIN_POMODORO = 1,
  MAIN_CONTACTOS = 2,
  MAIN_MAX_OPCION = 2,
} opcionesMenuPrincipal_t;

void limpiarPantalla();
void limpiarBuffer();
void esperarTecla(char*);
void dibujarTitulo();
opcionesMenuPrincipal_t menuPrincipal();

#endif