#include <locale.h>
#include <windows.h>
#include "utilidades.c"

int main() {
  setlocale(LC_ALL, "es_ES.UTF-8");
  SetConsoleOutputCP(CP_UTF8);

  opcionesMenu_t opcionSelecionada;

  dibujarTitulo();

  opcionSelecionada = menuPrincipal();

  switch (opcionSelecionada)
  {
  case POMODORO:
  printf("Acá iniciaría el módulo pomodoro");
  esperarTecla(NULL);
  break;

  case CONTACTOS:
  printf("Acá iniciaría el módulo contactos");
  esperarTecla(NULL);
  break;
  }

  esperarTecla("Fin de ejecución");
  return 0;
}

