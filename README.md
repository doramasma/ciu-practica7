# Ciu práctica 7
video & audio 
## Autor 
**Doramas Báez Bernal** <br/>
Correo: doramas.baez101@alu.ulpgc.es

## Gif
<div align="center">
  <img src="/main/animacion.gif" alt="gif de la practica 7">
  <p align="center">
    Figura 1: Ejemplo de ejecucion
  </p>
</div>

## Índice
* [Introducción](#introducción)
* [Dependencias](#dependencias) 
* [Desarrollo](#desarrollo)
    * [Información general](#informaciónGeneral)
    * [Filtros](#filtros)
* [Referencias](#referencias)

## Introducción
El objetivo de esta práctica es realizar una nueva propuesta donde al menos se integre un apartado gráfico (en este caso se ha realizado un piano) y una síntesis de sonido (en este caso las notas). 


## Dependencias
Es necesario disponer de minim para poder ejecutar la práctica. Ya que, se utilizará esta librería para la creacion de los sonidos.
 

## Desarrollo

### Información general <a id="informaciónGeneral"></a>

Básicamente se ha realizado la asignación de una tecla a una nota: 
 - Left key: change filter
 - Right key: change filter
 - Enter: Cambiar entre modo pausa y modo resume 
 - Mouse: Modificar la intensidad del filtro
 

### Filtros<a id="filtros"></a>
Una vez pulsamos el botón enter, comenzará el funcionamiento de la aplicación en este caso dandonos 4 filtros. 
 - Efecto1: Se harán uso de las funciones de Imgproc para realizar un blur y un canny sobre la foto original y copiar dichos cambios en la segunda imagen.
 - Efecto2: Básicamente consiste en aplicar uno de los 3 colores RGB sobre la imagen original.
 - Efecto3: Básicamente consiste en aplicar uno de los 3 colores RGB sobre la imagen original.
 - Efecto4: Básicamente consiste en aplicar uno de los 3 colores RGB sobre la imagen original.
 
 Además, de estos filtros se permite modificar la intensidad de los mismos. En cuanto a los colores, se vería la imagen más oscura o mas  rojiza,azulada o verdosa. En cuanto al primer efecto, se haría mas intenso siendo más notable los patrones o menos intensos.



## Referencias

* [Guion de prácticas](https://cv-aep.ulpgc.es/cv/ulpgctp20/pluginfile.php/126724/mod_resource/content/22/CIU_Pr_cticas.pdf)
* [GifAnimation](https://github.com/extrapixel/gif-animation)
* [Adobe xd](https://www.adobe.com/es/products/xd.html)
* [processing.org](https://processing.org/)
