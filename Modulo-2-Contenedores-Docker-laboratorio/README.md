## Ejercicio 1

1) Creamos el network lemoncode-challenge:

```
docker network create lemoncode-challenge
```

2) creamos el volumen mongodbvol:

```
docker volume create mongodbvol
```

3) Arrancamos mongodb expuesto por el puerto 27017 como contenedor some-mongo

```
docker run --name some-mongo -p 27017:27017 --mount source=mongodbvol,target=/data/db -v $(pwd)/some-mongo/mongo-init.js:/docker-entrypoint-initdb.d/mongo-init.js  --network lemoncode-challenge -d mongo
```

4) Hacemos build del contenedor de backend y arrancamos en el network, poniendo el connection string a mongo con la variable de entorno TopicstoreDatabaseSettings__ConnectionString 

```
pushd backend
docker build -t backend .
docker run -d --name backend -p 5000:80 --network lemoncode-challenge --env TopicstoreDatabaseSettings__ConnectionString=mongodb://some-mongo:27017 backend
popd
```

5) Hacemos build del frontend y arrancamos dentro del mismo network. Accediendo a http://localhost:8080 accederemos al site.

```
pushd frontend
docker build -t frontend .
docker run --name frontend -p 8080:3000 --network lemoncode-challenge -e API_URI=http://backend/api/topics -d frontend
```

6) Añadir nuevos topics:

```Ejecutar requests del fichero backend/client.http```

## Ejercicio 2

Levantar el entorno:

```docker-compose up```

Añadir nuevos topics:

```Ejecutar requests del fichero backend/client.http```

Eliminar los contenedores:

```docker-compose down``` 

Eliminar los contenedores y recursos (red y volumenes):

```docker-compose down -v```