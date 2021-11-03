Readme — instructions to compile and run the app

Team project: Food Radar app

Member 1 Name: Samuel Oh
Member 1 UNI: so2604
Member 2 Name: Lucas Bamidele Tinoco Kalejaiye
Member 2 UNI: lt2803
Member 3 Name: Brian Paick
Member 3 UNI: bsp2121
Member 4 Name: Abhishek Kalyan Adupa
Member 4 UNI: aa4761

##Instructions to run the app
The app was developed using Ruby 3.0.0 and Rails 6.1.4.1

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
You should also ensure that you have node.js installed in a stable version (we used 14.16.0 for this project)

Afterward, you should clone our git repo
```
git clone https://github.com/abhi-klyn/foodradar.git
```
After entering the project directory, you should run:
```
Bundle install
```
To install all dependencies listed on our gem file. You also need to install webpacker
```
rails webpacker:install
```

Then, if everything runs smoothly, you should perform a db migration
```
rails db:migrate
```
You can, optionally, add some data to the app, to be able to test some functionalities:
```
rails db:seed
```
Now, you just need to run the server
```
rails s
```
And open our project on your browser. Alternatively, you can see our project on heroku:

https://proj-foodradar.herokuapp.com

For testing, you can simply run

```
rake spec cucumber
```
And see all test cases we created. Coverage report has been added and can be displayed on
app/coverage/index.html 
We ignored the coverage on the test files themselves (As there are test functions that might be useful later, and including those were hurting understanding the real coverage of the code we developed)






