# respond.io
How to run acceptance test
cd to respondRobot
run docker-compose up -d chrome && sleep 5 && emailAddress=[email_address] password=[password] docker-compose up --build test-all
