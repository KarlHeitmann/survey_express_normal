# Introducción

Esta aplicación web escrita en Ruby on Rails tiene como fin complementar las reuniones que se hacen por zoom.
Esto debido a que el chat de zoom es bastante deficiente: Si uno llega atrasado, o se cae de la reunión y después
vuelve, se pierde el historial del chat. Para quienes no están familiarizados con la aplicación, no es sencillo
encontrar los íconos para levantar la mano y otros.

Si bien el slack se puede utilizar para complementar las reuniones del zoom. Los mensajes ahí se pierden con el tiempo,
y si llegan muchos mensajes, se pueden perder otros mensajes importantes dentro de todo lo que va ahí. O puede ser que
hayan muchas cosas que no se entiendan. Además, los códigos que se comparten por slack quedan con caracteres raros
que al pegarse en el VS Code, generan errores

El objetivo de la aplicación es que sea simple de usar, y que se pueda usar para colocar algún código y se pueda compartir
con facilidad, sin tener que acudir al chat de zoom, que a veces es difícil de ubicar porque al compartir pantalla este se oculta.
También que se puedan hacer encuestas: Alguien hace una pregunta, y los demás pueden votar por alternativas. Esto no está
implementado todavía

**Es importante que la aplicación sea simple de usar, y que los elementos del chat estén siempre visibles y accesibles**

# Modelos

La aplicación comenzó con tan solo 3 modelos:

- user: modela los usuarios de nuestra aplicación. Hace uso de la gema `devise` para hacer un registro de usuario y tener login.
Tiene muchos room messages: `has_many :room_messages`

- room: Son las salas de chat. La idea es usar una sala de chat por cada reunión en zoom que se haga. Tiene
muchos mensajes: `has_many room_messages`

- room_message: Son los mensajes que se mandan. Está asociado con `belongs_to :user` y `belongs_to :user`

# Controladores

- rooms: es un crud que está a medias de los rooms. Permite crear, listar y ver salas.

- room_messages: Tiene una sola acción: `create`, que es donde llegan los nuevos mensajes, quizás esta sea la parte más
  difícil de la aplicación, a pesar de que tiene poquitas líneas. Aquí se crea un nuevo mensaje, y luego
  este se transmite a través de broadcast. Aquí es donde ActionCable entra en acción. Todos los navegadores que están
  suscritos, viendo página, están conectados a través de un websocket, y entonces cuando se transmite el broadcast con
  el ActionCable, los navegadores reciben el mensaje y mediante javascript pueden actualizar la lista de mensajes del chat

# Dependencias

Esta aplicación para funcionar en entorno de desarrollo necesita tener redis instalado. https://redis.io/
En Windows no sé bien como instalarlo. Puede probar instalando redis en windows, y ejecutando "redis-server", o
si no puede probar con estos pasos para descargar redis en el WSL y compilarlo desde el código fuente

Debiera poder descargarlo de aquí: https://redis.io/download Llevarlo a la carpeta home de WSL.
Descompactar los archivos fuentes con el comando

> tar xvf redis-6.2.1.tar.gz

Luego de descompactarlo, entrar a la carpeta

> cd redis-6.2.1

Dentro de esta carpeta, compilar con el comando siguiente. OJO: Si tiene problemas para compilarlo, revise el archivo INSTALL.md.
Es posible que necesite instalar algunas cositas con `sudo apt install`. O si le falla el comando siguiente, busque el error e
instale las dependencias que le faltan para compilar el comando mediante `sudo apt install`

> make

Aquí se va a quedar pensando un rato. Tómese un café. Luego ejecute el siguiente comando: esto va a ejecutar el programa recién compilado, recién salido del horno

> ./src/redis-server

Ahora que tiene corriendo el servidor de redis, puede echar a andar su copia de esta aplicación en rails

Vaya a la carpeta donde ha clonado este proyecto, y ejecute los siguientes comandos:

> bundle install

> yarn install

> rails db:migrate

Antes de correr el servidor rails. Copie el archivo .env-sample con el siguiente comando:

> cp .env-sample .env

Ahora **abra** el archivo .env **con sus datos personales** estos están marcados con `# XXX`, en las líneas 8 y 9 del archivo.
Debe poner ahí sus datos personales de usuario de postgresql, y contraseña de
ese usuario de postgresql.
Es importante que siga estos pasos, porque el archivo .env está incluido dentro del
archivo de .gitignore. De esta forma, ahí usted puede colocar lo que quiera y
sus credenciales no irán a parar al repositorio público. Estos pasos
dan la flexibilidad para que con cada commit que se haga y se envíe a la rama
master, no se vayan colocando las credenciales de la base de datos postgresql
de todos los colaboradores del proyecto.

Ahora, antes de lanzar el servidor de rails, corra el siguiente comando:

> source .env

Con esto estará cargando las variables de entorno que acaba de colocar
dentro del archivo `.env`

Ahora si, corra el comando

> rails s

Y está listo para desarrollar la aplicación en Ruby on Rails.
