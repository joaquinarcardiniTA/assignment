# Getting started

## Configurations Details

Below are the configuration details to run this application:

* Ruby-2.6.5

* Rails 6

* Sqlite

* Webpacker

To get started with the app, clone the repo and then install the needed gems:

```
$ cd /path/to/repos
$ git clone https://github.com/joaquinarcardiniTA/assignment.git
$ cd assignment
```
Then install the needed gems:

```
$ rvm use 2.6.5
$ bundle install 
```

Install JavaScript dependencies:

```
$ yarn install
```

Create and migrate the database:

```
$ rails db:create db:migrate
```

Next, load the dummy data from seed:

```
$ rails db:seed
```

Finally, run the local server:

```
$ rails server
```