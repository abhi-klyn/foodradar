# ESaaS Group 32: FoodRadar

- Member 1 Name: Samuel Oh
- Member 1 UNI: so2604
- Member 2 Name: Lucas Bamidele Tinoco Kalejaiye
- Member 2 UNI: lt2803
- Member 3 Name: Brian Paick
- Member 3 UNI: bsp2121
- Member 4 Name: Abhishek Kalyan Adupa
- Member 4 UNI: aa4761

## Project link deployed on Heroku:
https://proj-foodradar.herokuapp.com

## Project link on GitHub:
https://github.com/abhi-klyn/foodradar.git

## Demo video (proj-demo) can be seen at:
- https://www.youtube.com/watch?v=PgPb8PHTVHI

## Instructions to run the app

This app was developed using Ruby 3.0.0 and Rails 6.1.4.1

First, you need to install these versions of ruby and rails, and ensure they are working correctly.
Running
```
ruby --version
```
And
```
rails --version
```
will yield the current version of these frameworks.
You should also ensure that you have Node.js installed in a stable version (we used 14.16.0 for this project)

Afterward, you should clone our git repo
```
git clone https://github.com/abhi-klyn/foodradar.git
```
After entering the project directory, you should run:
```
bundle install
```
To install all dependencies listed on our gem file. You also need to install webpacker
```
rails webpacker:install
```
Then, if everything runs smoothly, you should perform a db create first
```
rails db:create
```
Then, perform a db migration
```
rails db:migrate
```
You can, optionally, add some data to the app, to be able to test some functionalities:
```
rails db:seed
```
Now, you just need to run the server
```
rails server
```
And open our project on your browser. 


For testing, you can simply run
```
rake spec cucumber
```

And see all test cases we created. Coverage report has been generated and is located at:
- app/coverage/index.html

For iteration 2, we focused on adding reviews, and being able to estimate whether the review of a plate is good or not. We first identify which food a review is about, and try to use a sentiment analysis to identify whether the review is good (+1) or bad (-1).
This is the core and most important function of our app (as it is what differs us from what currently exists in the market). We now display the foods in rating order (best to worse).

We had to use some postgreSQL specific functions, so a considerable amount of our backend is using "handmade" SQL queries to be able to use these functions, instead of the ORM ones we were using earlier.

We added a food search as well, as we want to empower users to search for what they want to eat, rather than what restaurant they need to go to.

Changes on usability were also added, such as improving the UI and including a better search system. Instead of exact matches in search, our search now matches with more loose constraints (ignore upper/lower cases, punctuation, etc.).

For iteration 3, we implemented the sort feature for columns to empower the users to easily navigate through the different items in the order they desire. We also added tests to these new changes and make sure everything is still working! We believe that we've implemented all the functionalities that we envisioned for this app in the beginning!