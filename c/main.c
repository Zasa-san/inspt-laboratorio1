#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <stdbool.h>
#include "utilidade.c"

enum opcionesMenu_t {
  SALIR = 0,
  CONTACTOS = 1,
  POMODORO = 2,
};

void dibujarTitulo();

int main() {
  enum opcionesMenu_t opcionSelecionada;

  dibujarTitulo();
  return 0;
}

void dibujarTitulo() {
  //ascii https://patorjk.com/software/taag/#p=display&f=Slant&t=Apps%20de%20Oficina
  limpiarPantalla();
  printf("   /   |  ____  ____  _____   ____/ /__     / __ \\/ __(_)____(_)___  ____ _\n");
  printf("  / /| | / __ \\/ __ \\/ ___/  / __  / _ \\   / / / / /_/ / ___/ / __ \\/ __ `/\n");
  printf(" / ___ |/ /_/ / /_/ (__  )  / /_/ /  __/  / /_/ / __/ / /__/ / / / / /_/ / \n");
  printf("/_/  |_/ .___/ .___/____/   \\__,_/\\___/   \\____/_/ /_/\\___/_/_/ /_/\\__,_/  \n");
  printf("      /_/   /_/                                                            \n");
  printf("\n");
  esperarTecla("Presione una tecla para inciar");
}