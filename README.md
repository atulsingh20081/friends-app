# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
   - ruby 2.6.9p207 (2021-11-24 revision 67954)
* System dependencies
   - mysql
   - redis for sidekiq
   
* Configuration
   - Not needed
* Database creation : Run the followig commands from the root of the project
   - Install & run a Mysql server using commmand - mysql.server start
   - Login to root. mysql -u root -p. Enter password 'root'. If password not set use the query to set the password
     UPDATE user SET password=PASSWORD("NEWPASSWORD") WHERE User='root';

* Database initialization
  - Run the followig commands from the root of the project
    - db:create
    - db:migrate

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions
   - run the app in intelliJ 
   - open http://localhost:3000 on browser
  ![](/Users/atsingh/Desktop/Home Page.png)
  
* Description
   - Simple web app with login functionality(using devise).
   - User can perform crud operation on friends resource. The user can add/update/delete/view his/her friends.
   - Upon adding email while adding a friends, the person added as the friend receives a notification via email
   - The user can search his/her friends using their first or last name. This is done by indexing the friends while they are createed/updated/deleted in elastic search. 
  
