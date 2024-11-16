#ifndef CONTACTOS_H
#define CONTACTOS_H
#include "utilidades.h"
#define STRING_MAX 100

typedef enum {
  CON_SALIR = 0,
  CON_LISTAR = 1,
  CON_CREAR = 2,
  CON_MAX_OPCION = 2,
} opcionesMenuContactos_t;

typedef struct datosBasicosContacto {
  char nombre[STRING_MAX];
  char apellido[STRING_MAX];
  char telefono[STRING_MAX];
  char email[STRING_MAX];
  char direccion[STRING_MAX];
} datosBasicosContacto_t;

typedef struct contacto {
  int id;
  datosBasicosContacto_t datos;
  struct contacto* siguiente;
  struct contacto* anterior;
} contacto_t;

typedef contacto_t* pContacto;
typedef contacto_t* Contactos;

void poblarContactos(Contactos*, pContacto*, int*);
void contactosMain(Contactos, pContacto, int*);
void ordenarPorApellido(Contactos);
void listadoCompleto(Contactos);
void verContacto(pContacto);
void recorrerContactos(pContacto*, int);
void selecionarDeLista(pContacto, int);
void itemListaContacto(pContacto, int);
opcionesMenuContactos_t menuContactos();

#endif