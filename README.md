# International Showtimes API


### Specification summary:

- RESTful api.
- JSON response
- Api versioning.
- Exception Handling
- Authentication
- RSpec testing.
- API Request monitoring
- Dockerized


Getting Started
---------------

The application is Dockerized to streamline the setup of the development
environment on a new machine and enable the app to run Dockerized in production.

The only dependency is that you have Docker up and running on your host system.
See the [Get Docker](https://docs.docker.com/get-docker/) guide for your system.


Pull the repo, build the app, setup the database:

```
git clone git@github.com/isa-api.git
cd isa-api

docker-compose build
docker-compose run --rm app rake db:setup
```

### Running

To start all the services, run:

```shell
docker-compose up
```

This will block your shell, so you'll want to run this in tmux or its own tab.
If you want to detach after starting, you can use the `-d` flag.

```shell
docker-compose up -d
```


#### Open a Rails console

```shell
docker-compose exec app rails console
```

#### Run database migrations

```shell
docker-compose exec app rake db:migrate
```


- Install [Httpie](https://httpie.io/cli) to use in testing endpoints locally from the terminal

```
# For Mac
$ brew install httpie

# Linux
$ apt install httpie
```


### API Endpoints

| API Endpoint                      | Functionality                           |
| ----------------------------------| --------------------------------------- |
| GET /listjobs         | Fetches a list of jobs and their statues                   |
| POST /createjob     | Creates a new job   |
| GET /sidekiq         | Displays the sidekiq dashboard                   |


### Testing API locally from terminal using the Httpie

```ruby
# To login existing the existing user
http POST :3000/auth/login email=test@example.com password=foobar

# To get all jobs
http :3000/listsjobs \
>Authorization:<auth_token>

# To create a new job
http POST :3000/createjob name='The vampire diaries'
```

## Author

James Okunlade

- [LinkedIN](https://www.linkedin.com/in/james-okunlade/)
- [Github](https://github.com/JamesOkunlade)
- [Twitter](https://twitter.com/JamesOkunlade)