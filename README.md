Municipe Application
============================

This is a basic Rails application Dockerized for easy development and deployment.

Prerequisites
-------------

Make sure you have Docker and Docker Compose installed on your machine.

*   Docker
*   Docker Compose

Make sure to populate those ENV Variables:

  - TWILIO_ACCOUNT_SID
  - TWILIO_AUTH_TOKEN
  - TWILIO_PHONE_NUMBER
  - SENDGRID_API_KEY
  - SENDER_EMAIL

Getting Started
---------------

1.  Clone this repository:

    `git clone https://github.com/matheusvetor/municipe.git`

2.  Navigate to the project directory:

    `cd municipe`

3.  Build the Docker images:

    `docker compose build`

4.  Create and migrate the database:

    `docker compose run --rm web rails db:create rails db:migrate`

5.  Start the application:

    `docker compose up`

6.  Access the application in your web browser at `http://localhost:3000`.


Stopping the Application
------------------------

To stop the application and shut down the Docker containers, use `Ctrl + C` in the terminal where the containers are running.

Running Tests
-------------

You can run tests using the `docker-compose run` command:


`docker-compose run --rm web rspec`

Deployment
----------

This repository is configured to do automatic deploy on [heroku](https://municipe-f0a80b46be23.herokuapp.com/) when pushed to `main` branch
