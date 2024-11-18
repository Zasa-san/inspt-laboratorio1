#include <stdlib.h>
#include "contactos.h"
#include "contactosApi.h"

static Contactos listaDeContactos = NULL;
static pContacto ultimoElemento = NULL;
static int generadorId = 0;

void generadorIdInit(int inicial) {
  generadorId = inicial;
}

void listaDeContactosInit(Contactos init) {
  listaDeContactos = init;
};

void ultimoElementoInit(pContacto init) {
  ultimoElemento = init;
};

Contactos getListaDeContactos() {
  return listaDeContactos;
}

pContacto getUltimoElemento() {
  return ultimoElemento;
}

int* getGeneradorId() {
  return &generadorId;
}

Contactos* listaDeContactosSetter() {
  return &listaDeContactos;
};

pContacto* ultimoElementoSetter() {
  return &ultimoElemento;
};

void liberarContactos() {
  pContacto listado = listaDeContactos;
  pContacto siguiente;
  while (listado != NULL) {
    siguiente = listado->siguiente;
    free(listado);
    listado = siguiente;
  }
  listaDeContactos = NULL;
  ultimoElemento = NULL;
  generadorId = 0;
}