# README

Agenda for 4/19/22

## Serialization

- [AMS](https://github.com/rails-api/active_model_serializers/tree/0-10-stable) (X)
- [JsonApi Serializer](https://github.com/jsonapi-serializer/jsonapi-serializer) (X)

## Useful gems

- [better_errors](https://github.com/BetterErrors/better_errors)
- binding_of_caller (allows further customization for errors)
- [bullet](https://github.com/flyerhzm/bullet) (shows you errors for N+1 queries)

## Scoping routes

- [scope & namespace](https://guides.rubyonrails.org/routing.html#controller-namespaces-and-routing)
- [scope VS namespace](https://skyxu.me/2021/02/11/rails-nested-routes-scope-vs-namespace/)

## N+1 queries & siz vs count vs length

- [slides](https://docs.google.com/presentation/d/1QqBknZRdiZAruEW7KD9IytUSXwPRwS6IEB3-mjdJKQI/edit?usp=sharing)

Agenda for 4/20/2021

## Deployment Steps

- Create a Heroku account
- Install Heroku CLI
- heroku login
- check what ruby version you’re using: ruby -v (suggestion use 2.7.4)
- Remove every trace of sqlite3 and replace with pg
- Install postgresql
- brew services start postgresql
- bundle lock --add-platform x86_64-linux --add-platform ruby
- rails db:create db:migrate db:seed
- git add .
- git commit -m “”
- heroku create
- git push heroku main/master
- heroku run rails db:migrate db:seed

[Useful lesson](https://learning.flatironschool.com/courses/4698/pages/deploying-a-rails-api-to-heroku?module_item_id=287623)

[WSL Postgres Troubleshooting](https://docs.microsoft.com/en-us/windows/wsl/tutorials/wsl-database#install-postgresql)

[Rails Troubleshooting on Heroku](https://devcenter.heroku.com/articles/getting-started-with-rails6#troubleshooting)

[Deploying Rails 6 Apps on Heroku](https://devcenter.heroku.com/articles/getting-started-with-rails6)
