# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# Setup

```bash
rails new pi-image --database=postgresql --skip-turbolinks  --no-scaffold-stylesheet
cd pi-image
git init
git add .
git commit -m "Initialized with 'rails new pi-image --database=postgresql --skip-turbolinks  --no-scaffold-stylesheet'"

rails active_storage:install
rails g scaffold user username:string
rails g scaffold post content:text

rails db:create
rails db:migrate

git commit -m "Add users and storage."
```

## Extra stuff
```bash
# Apply our template, add some color.
```
