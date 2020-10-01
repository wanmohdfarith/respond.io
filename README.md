# respond.io
#### How to run acceptance test
###### run docker-compose up -d chrome && sleep 5 && emailAddress=[email_address] password=[password] docker-compose up --build test-all

#### How to run load test
###### run email=[email_address] password=[password] docker-compose up --build --scale respondio=1 respondio
