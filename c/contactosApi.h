#ifndef CONTACTOS_GLOBAL_H
#define CONTACTOS_GLOBAL_H

Contactos getListaDeContactos();
pContacto getUltimoElemento();
Contactos* listaDeContactosSetter();
pContacto* ultimoElementoSetter();
int* getGeneradorId();

void generadorIdInit(int);
void listaDeContactosInit(Contactos);
void ultimoElementoInit(pContacto);

void liberarContactos();

#endif
