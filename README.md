# README
## Juan Sebastian Velez Posada

Steps are necessary to get the application up and running.

#### Create an application on Ruby on Rails to manage people.
```
Ruby Version 2.2
Rails Version 4.2
Documentation TomDoc
Database MySQL
```

#### Person model:
```
first_name String
last_name  String
email      String maximum (254 characters)
job        String
bio        Text
Gender     What you think is best.
birthdate  Date
Picture    String (URL)
created_at Datetime
updated_at Datetime
```

It is assume docker is installed on your system, if it is not installed and don't want to do it then you must have intalled on your system:
   MySQL
   Redis
   Ruby
   Rails
   ElasticSearch
   
#### Running test
   
```
$ docker-compose run -e "RAILS_ENV=test" web rake db:setup
$ docker-compose run -e "RAILS_ENV=test" web rake test
```   

Output should be something like this

```
# Running:

...............

Finished in 7.721373s, 1.9427 runs/s, 5.6985 assertions/s.

15 runs, 44 assertions, 0 failures, 0 errors, 0 skips
```
   
#### Configuration
```
$ docker-compose build   
```
   
#### Configure the Database
```
$ docker-compose run web rake db:setup
```   

#### Run the app
```
$ docker-compose up
```

Now http://localhost:3000 is ready to serve request.

#### Features
Resque is the background processor, it can be accessed on http://localhost:3000/resque to see how the Queues are running.
Letter opener on development shows the email been sent by Resque, it can be accessed on http://localhost:3000/letter_opener/
