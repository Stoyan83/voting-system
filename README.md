To build containers and start the project in local environment

```bash
 $ docker-compose up --build -d
 $ docker-compose run app bin/rails db:migrate
 $ docker-compose run app yarn install
 $ docker-compose run app yarn dev-server
```
Visit:
http://0.0.0.0:3000/

The 'bin/rails' command is executed inside the container, allowing to run Rails commands

```bash
$ docker-compose run app bin/rails
```
