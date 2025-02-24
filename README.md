# README

This is a survey app that will allow for branching based on answers to questions and its database will provide a record of how users answered.  


This is built with:

- **rails**: 8.0
- **ruby**: 3.4.2

Future improvements
- CSS styling
- Currently, a user has a session and ID based on a browser cookie. Authentication can be added in the future for users who may be on the same machine.
- Currently, survey data is hardcoded in seeds.rb. Future iterations may warrant a more dynamic creation UI. 

* System dependencies
  - Currently, this application requires a modern browser.

#TODO
* Configuration

* Database creation
```shell
$ bundle install
$ rails db:seed #The survey is built in the seed data
$ rails s #to start the datbaase
```


Deployment

Currently, the database runs by default on localhost:3000 . Deploying requires
- downloading this git folder
- downloading Rails
- Navigate to the folder that contains the git folder
- following the database creation steps above  

