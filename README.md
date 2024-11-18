
![Vote](https://github.com/user-attachments/assets/9c56c186-abbc-4472-be42-8ae4ca707328)

To build containers and start the project in local environment

```bash
 $ docker-compose up --build -d
 $ docker-compose run app bin/rails db:migrate
 $ docker-compose run app yarn install
 $ docker-compose run app yarn dev-server
```
Seed the DB
```bash
$ docker-compose run app bin/rails db:seed
```

Visit:
http://0.0.0.0:3000

Run specs
```bash
$ docker-compose run app bundle exec rspec
```

Run Rubocop
```bash
$ docker-compose run app bundle exec rubocop
```

Run SIdekiq

```bash
$ docker-compose up sidekiq
```
Visit:
http://0.0.0.0:3000/sidekiq

To read mails afte you log in with one of the quicklogin options. Sidekiq should be running !
Visit: http://127.0.0.1:1080
