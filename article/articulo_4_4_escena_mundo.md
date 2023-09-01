# Godot Engine 4: Crea tú primer videojuego con Godot Engine 4 desdé cero
## Parte 4: Creando la escena Mundo

- [Introducción](#introducción)
- [Creando la escena Mundo](#creando-la-escena-world)
- [Creando y diseñando el mapa](#creando-y-diseñando-el-mapa)
- [TileMaps y TileSets](#tilemaps-y-tilesets)
- [Creando el TileMap de nuestro mapa](#creando-el-tilemap-de-nuestro-mapa)
- [Añadiendo nuestro personaje a la escena World](#añadiendo-nuestro-personaje-a-la-escena-world)
- [Añadiendo colisiones al mapa](#añadiendo-colisiones-al-mapa)
- [Añadiendo un fondo al mapa](#añadiendo-un-fondo-al-mapa)
- [Conclusión](#conclusión)
- [Siguiente parte](#siguiente-parte)

### Introducción
Luego de haber creado la escena de nuestro personaje, necesitaremos un lugar dónde poder hacer pruebas con las nuevas mecánicas que implementaremos más adelante a nuestro personaje, por lo que para eso necesitaremos una escena Mundo donde colocaremos a nuestro personaje.

### Creando la escena World
Primero vamos a crear una nueva escena, para eso nos vamos al panel de pestañas en la parte superior del viewport y daremos click izquierdo sobre el botón con el símbolo **+**:

![scene_panel_tabs](resources/scene_panel_tabs.png)

Al hacer eso se nos debe de crear una nueva escena vacía como la siguiente:

![new_world_scene](resources/new_world_scene.png)

Ahora, en el panel de edición de escenas, vamos a dar click izquierdo en la opción que dice **2D Scene**:

![click_2d_scene](resources/click_2d_scene.png)

Eso nos creará un nodo de tipo Node2D qué será dónde crearemos toda la estructura de nodos de la escena Mundo:

![create_world_node_2d](resources/create_world_node_2d.png)

### Creando y diseñando el mapa

Una vez hemos creado la escena en la que vamos a crear el mundo de nuestro videojuego, vamos comenzar a diseñar el mapa.

### TileMaps y TileSets
Para diseñar nuestro mapa vamos a utilizar un tipo de nodo especial llamado TileMap, los tilemaps son cuadrículas o mapas de mosaicos(tiles) en la que cada casilla o mosaico es un elemento que conforma el diseño o patrón gráfico de alguna zona del mapa tal como si fueran las fichas de un rompecabezas, dónde cada ficha es un **tile** con un patrón o diseño específico y el rompecabezas sería el **tilemap**. Los diseños o patrónes de estos mosaicos conforman el TileSet o conjunto de mosaicos en el cuál podemos disponer de una gran variedad de mosaicos con diferentes patrónes y propiedades que podemos utilizar para diseñar el tilemap del mapa de la escena mundo de nuestro videojuego. 
Para profundizar más sobré los tilemaps y tilesets en godot recomiendo leer la [documentación oficial sobre tilemaps y tilesets de godot](https://docs.godotengine.org/es/stable/tutorials/2d/using_tilemaps.html).

### Creando el TileMap de nuestro mapa
Teniendo ya una idea básica de lo que son tilemaps y tilesets, podemos proceder a crear el nodo de tipo TileMap en el cual vamos a crear los TileSets con los diseños de los tiles para diseñar nuestro mapa, y también vamos a ver cómo podemos añadirle colisiones a nuestros tiles.

Primero vamos a crear un nodo de TileMap, el proceso es el mismo que hemos seguido para la creación de nodos en la [primera parte de la creación de la escena Player](articulo_4_3_escena_player_parte_1.md).

1. Damos click derecho sobre el nodo Node2D.
2. Damos click izquierdo en la opción **Add Child Node**
3. Buscamos el tipo de nodo en la lista de tipos de nodos que nos muestra la ventana emergente
4. Seleccionamos el tipo de nodo que estamos buscando y damos click izquierdo en el botón **Create** y ya tendremos nuestro nuevo nodo creado.

Una vez que hayamos creado el nodo TileMap, nos debe aparecer de la siguiente forma:

![create_tilemap_node](resources/create_tilemap_node.png)

Ahora



### Añadiendo nuestro personaje a la escena World
### Añadiendo colisiones al mapa




### Conclusión


### Siguiente parte
[Parte 5: Creando la escena Player de nuestro personaje parte 2](articulo_4_5_escena_player_parte_2.md)
