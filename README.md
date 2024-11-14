To build containers and start the project in local environment

```bash
 $ docker-compose up --build -d
```
Visit:
http://0.0.0.0:3000/

To enter rails console in the container

```bash
$ docker-compose exec web bash

$ bin/rails console
```
