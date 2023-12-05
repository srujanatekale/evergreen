## CSE6950 Grad Independent Study
 This is a database design project for a shopping store called: Evergreen Groceries which is miniature version of amazon
 The project is designed using Ruby on Rails.
 All the the dataFiles and app are included in Respository
 To run using docker, make sure you have git, docker desktop and docker-compose setup on your machine.
 To setup the container run this command from the root of the repo: docker-compose build
 To start the server run: docker-compose up -d, you should now be able to access the application on http://localhost:3000/
 Since data-base is not setup and there is no data, one has to run setup taks to setup database and seed the data
 This can be done by runing the setup tasks inside the container. To get shell access run:
 doker ps 
 This whill show container ids for each running container. Copy the container id with the image name  shopping_cart-webapp
 docker exec -it "copiedID" sh. Once you have access to shell run:  ruby bin/setup , this should setup database and load it with
 data from csv. Shutdown the server using: docker-compose down and restart again. Now the application should be ready for usage.
 
