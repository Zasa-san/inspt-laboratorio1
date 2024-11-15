#include <locale.h>
#include <windows.h>
#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>
#include "utilidades.h"
#include "contactos.h"

int main() {
  setlocale(LC_ALL, "es_ES.UTF-8");
  SetConsoleOutputCP(CP_UTF8);

  bool salir = false;

  opcionesMenuPrincipal_t opcionSelecionada;

  dibujarTitulo();

  do {
    opcionSelecionada = menuPrincipal();
    switch (opcionSelecionada) {
    case MAIN_POMODORO:
    printf("Acá iniciaría el módulo pomodoro");
    esperarTecla(NULL);
    break;
    case MAIN_CONTACTOS:
    contactosMain();
    break;
    case MAIN_SALIR:
    salir = true;
    break;
    }
  } while (salir == false);

  limpiarPantalla();
  esperarTecla("Fin de ejecución");
  return 0;
}

