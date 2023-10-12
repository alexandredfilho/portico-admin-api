<h1 align="center">
  <strong>Porico</strong> Admin v1
</h1>

  </hr>

  <h4 align="center">This is a personal project that aims to put to the test my knowledge in Ruby on Rails :heart: and mainly the design and development of a shipment control system <ins>(API only)</ins> for small businesses. </h4>
</br>
<p align="center">

# Description
## :rocket: Technologies
This project was developed for [Alexandre Domingos Filho](https://github.com/alexandredfilho) with the following technologies:

-  [Ruby@3.0.0](https://www.ruby-lang.org/en/)
-  [Rails@7.1.0](https://rubyonrails.org/)
-  [PostgreSQL@1.2.3](https://www.postgresql.org/)
-  [Devise](https://github.com/heartcombo/devise)
-  [Devise-JWT](https://github.com/waiting-for-dev/devise-jwt)

## Pre-requirements

Make Sure you have Git and PostgreSql installed! If you do not, check the official documentation of it and make sure to install the latest stable version.

Take a look at your operational system installation steps:
-  [Git Installation](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
-  [PostgreSQL Install](https://www.postgresql.org/download/)

To start working with this project is very simple, you just need:

<code> _Open your terminal or console tab and enter the commands below, respectively:_</code>

Clone this repository on your local machine using the git command:

> git clone

Install all backend gems:

> bundle install

Now it's time to prepare your local database, so run the rails commands:

> rails db:create db:migrate db:seed

</hr>

Congratulations, the API is ready to use! :tada:

</hr>

## Remember

As this project is API only, you will need to log into the system using <code>Postman</code> or other software to obtain the <code>JWT</code> token before making any changes to the tables!

## Unit and integration tests
The tests are being built using the following gems:

-  [RSpec-rails](https://github.com/rspec/rspec-rails)
-  [Shoulda-matchers](https://github.com/thoughtbot/shoulda-matchers)

To run the tests, simply use the commands below:

<i>This command runs all tests:</i>
> bundle exec rspec .

<i>This other one runs each test individually:</i>
> bundle exec rspec ./test_path_spec.rb
