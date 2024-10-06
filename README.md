# Proyecto de Aplicativos de oficina
Repositorio para el proyecto de "Aplicativos de oficina". Este repositorio contine dos versiones de la aplicación. Una en pseudocódigo para pseint y otra en C. Referirse a cada apartado para ver más detalles sobre las particularidades de cada versión.

## Como contribuir
Se debe crear un pull request a `main` para agregar o modificar código. Solo se verificará que la rama creada esté al día con los últimos cambios que `main` tenga para poder combinarla.

## Estilo de codigo
Se debe anteponer a cada algoritmo o subalgoritmo una nomenclatura que refiera al módulo, por ejemplo:
```
SubAlgoritmo pom_pomodoro(argumentos)
    /// algoritmo
FinSubAlgoritmo
```

Para las definiciones de tipos en C se usará la convención estandar
```
nombreDeMiTipo_t
```

---

## **PSEINT**
## Tipos de dato

### Contactos
```
[
    [nombre, apellido, telefono, email, dirección],
]
```
| Nombre del dato  | Tipo de dato           | ¿Vacio?
| -------------    | -------------          | -------------
| `nombre`         | Cadena de caracteres   | No
| `apellido`       | Cadena de caracteres   | No
| `telefono`       | Cadena de caracteres   | Si
| `email`          | Cadena de caracteres   | Si
| `dirección`      | Cadena de caracteres   | Si

### Índice alfabético 
```
[
    [indice, cantidad],
]
```
| Nombre del dato  | Tipo de dato   | Descripción                                                           | ¿Vacio?   
| -------------    | -------------  | -------------                                                         | -------------
| `indice`         | Número         | indice en la agenda donde está el primer nombre para le letra elegida | No
| `cantidad`       | Número         | canitdad de nombres con esa letra                                     | No

El índice es inicializado en cantidades en `-1`, de esta forma se puede avisar que en una determinada letra no hay contactos. A medida que se construye el índice esos `-1` serán actualizados para reflejar la cantidad de contactos en determinada letra del alfabeto.

Ya que no se puede tener matrices con datos combinados, usamos números para representar las letras del abecedario.
```
0 : a | A | á | Á
1 : b | B
2 : c | C
3 : d | D
...etc
26: z | Z
```

---

## **C**
## Tipos de dato

### Contactos
```
Lista de contacto_t
```
Estructura de `contacto_t`:
| Nombre del dato  | Tipo de dato           | NULL
| -------------    | -------------          | -------------
| `nombre`         | char                   | No
| `apellido`       | char                   | No
| `telefono`       | char                   | Si
| `email`          | char                   | Si
| `dirección`      | char                   | Si
| `siguiente`      | contacto*              | Si

### Índice alfabético 
```
int32_t indice[26][2]
```
| Nombre del dato  | Tipo de dato   | Descripción                                                           | ¿Vacio?   
| -------------    | -------------  | -------------                                                         | -------------
| `indice`         | Número         | indice en la agenda donde está el primer nombre para le letra elegida | No
| `cantidad`       | Número         | canitdad de nombres con esa letra                                     | No

El índice es inicializado en cantidades en `-1`, de esta forma se puede avisar que en una determinada letra no hay contactos. A medida que se construye el índice esos `-1` serán actualizados para reflejar la cantidad de contactos en determinada letra del alfabeto.

Se usará una lógica de correspondencia entre número y letra del alfabeto
```
0 : a | A | á | Á
1 : b | B
2 : c | C
3 : d | D
...etc
26: z | Z
```