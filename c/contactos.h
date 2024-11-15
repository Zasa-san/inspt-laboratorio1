#ifndef CONTACTOS_H
#define CONTACTOS_H
#include "utilidades.h"
#define ALFABETO 26
#define STRING_MAX 100

typedef enum {
  CON_SALIR = 0,
  CON_LISTAR = 1,
  CON_CREAR = 2,
  CON_MAX_OPCION = 2,
} opcionesMenuContactos_t;

typedef struct contacto {
  char nombre[STRING_MAX];
  char apellido[STRING_MAX];
  char telefono[STRING_MAX];
  char email[STRING_MAX];
  char direccion[STRING_MAX];
  struct contacto* siguiente;
} contacto_t;

typedef contacto_t* pContacto;
typedef contacto_t* Contactos;

//void poblarContactos(contacto_t[AGENDA_MAX]);
//void ordenarPorApellido(contacto_t[AGENDA_MAX], int32_t[ALFABETO][2]);
//void verPorApellido(contacto_t[AGENDA_MAX], int32_t[ALFABETO][2]);
void contactosMain();
opcionesMenuContactos_t menuContactos();

#endif