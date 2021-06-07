# Spocket

This is an application to help suppliers and retailers to sell more.
Based on spocket.co

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

What things you need to install the software and how to install them

- First install [ruby and rails](https://www.tutorialspoint.com/ruby-on-rails/rails-installation.htm)
- Then install [elasticsearch](https://www.elastic.co/guide/en/elasticsearch/reference/current/install-elasticsearch.html)
    or run:
```
docker pull docker.elastic.co/elasticsearch/elasticsearch:7.13.1
docker run -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" docker.elastic.co/elasticsearch/elasticsearch:7.13.1
```

### Installing

A step by step series of examples that tell you how to get a development env running

For create your database
```
rails db:create db:migrate
```
Then to run the server
```
rails s
```

You will get
```
=> Booting Puma
=> Rails 5.2.3 application starting in development
=> Run `rails server -h` for more startup options
Puma starting in single mode...
* Version 3.12.1 (ruby 2.6.3-p62), codename: Llamas in Pajamas
* Min threads: 5, max threads: 5
* Environment: development
* Listening on tcp://localhost:3000
```

## Running the tests

For tests it was decided that rspec was the best option:

`rspec spec --format documentation`

Any problem?
[https://rspec.info/](https://rspec.info/)

## Built With

* [Ruby](https://www.ruby-lang.org/pt/)
* [Rails](https://guides.rubyonrails.org/getting_started.html)

## Authors

* **Pedro Correia** - [Github](https://github.com/pedromcorreia)
