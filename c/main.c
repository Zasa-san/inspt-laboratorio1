#include <locale.h>
#include <windows.h>
#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>
#include <stdlib.h>
#include "utilidades.h"
#include "contactos.h"

int main() {
  setlocale(LC_ALL, "es_ES.UTF-8");
  SetConsoleOutputCP(CP_UTF8);

  bool salir = false;
  opcionesMenuPrincipal_t opcionSelecionada;
  pContacto contacto_p;
  Contactos ListaDeContactos = NULL;

  poblarContactos(&ListaDeContactos, &contacto_p);

  dibujarTitulo();

  do {
    opcionSelecionada = menuPrincipal();
    switch (opcionSelecionada) {
    case MAIN_POMODORO:
    printf("Acá iniciaría el módulo pomodoro");
    esperarTecla(NULL);
    break;
    case MAIN_CONTACTOS:
    contactosMain(ListaDeContactos);
    break;
    case MAIN_SALIR:
    salir = true;
    break;
    }
  } while (salir == false);

  limpiarPantalla();
  esperarTecla("Fin de ejecución");
  free(ListaDeContactos);
  return 0;
}
