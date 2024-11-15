#include <stdio.h>

void limpiarPantalla();
void esperarTecla(char*);

void limpiarPantalla() {
  printf("\e[1;1H\e[2J");
}

void esperarTecla(char* mensaje) {
  if (mensaje != NULL && strlen(mensaje) > 0) {
    printf("\n%s", mensaje);
  }
  else {
    printf("\nPresione una tecla para continuar");
  }
  fflush(stdin);
  getchar();
}