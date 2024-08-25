# Proyecto de Laboratorio 1
Repositorio para el proyecto de Laboratorio 1

## Como agregar código
Se debe crear un pull request a `main` para agregar o modificar código.

## Estilo de codigo
Se debe anteponer a cada algoritmo o subalgoritmo una nomenclatura que refiera al módulo, por ejemplo:
```
SubAlgoritmo pom_pomodoro(argumentos)
    /// algoritmo
FinSubAlgoritmo
```

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

Ya que no se puede tener matrices con datos combinados, usamos números para representar las letras del abecedario.
```
0 : a | A | á | Á
1 : b | B
2 : c | C
3 : d | D
...etc
```