To build containers and start the project in local environment

```bash
 $ docker-compose up --build -d
 $ docker-compose run web bin/rails db:migrate
```
Visit:
http://0.0.0.0:3000/

The 'bin/rails' command is executed inside the container, allowing you to run Rails commands

```bash
$ docker-compose run web bin/rails
```
