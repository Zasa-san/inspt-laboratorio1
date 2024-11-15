#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include "utilidades.h"

void limpiarPantalla() {
  printf("\e[1;1H\e[2J");
}

void limpiarBuffer() {
  fflush(stdin);
}

void esperarTecla(char* mensaje) {
  fflush(stdin);
  if (mensaje != NULL && strlen(mensaje) > 0) {
    printf("\n%s", mensaje);
  }
  else {
    printf("\nPresione una tecla para continuar");
  }
  getchar();
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

opcionesMenuPrincipal_t menuPrincipal() {
  opcionesMenuPrincipal_t opcionSelecionada;
  bool invalido = false;

  do {
    limpiarPantalla();
    if (invalido) {
      printf("**Debe elegir una opción válida**\n");
    }
    printf("Menu principal\n");
    printf("Elija una opción\n");
    printf("1 - Pomodoro\n");
    printf("2 - Agenda de contactos\n");
    printf("0 - Salir\n");
    scanf("%d", &opcionSelecionada);
    if (opcionSelecionada < MAIN_SALIR || opcionSelecionada > MAIN_MAX_OPCION) {
      invalido = true;
    }
    else {
      invalido = false;
    }
  } while (invalido != false);

  return opcionSelecionada;
};