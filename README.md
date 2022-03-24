## Steps to create an API in Rails

1. Create a new Rails API

```
rails new hello-world-back-end --api --database=postgresql
```

2. Enable CORS(Cross Origin Resource Sharing)
   1. Go to config -> initializers -> cors.rb

```
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*'

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
```

3. Go to GemFile and un-comment

```
gem 'rack-cors'
```

4. Create model, controller, database migration table and route via rails g resource command

```
rails g resource Greeting
```

5. Specify attributes and datatypes of a secret menu item

```
class Greeting < ActiveRecord::Migration[6.0]
  def change
    create_table :greetings do |t|
      t.text :message
    end
  end
end
```

rails db:migrate

6. Define index, show, create, update, and destroy actions

```
module Api
  module V1
    class GreetingsController < ApplicationController
      def index
        @greetings = Greeting.all
        render json: @greetings
      end

      def show
          @greeting = Greeting.find(params[:id])
          render json: @greeting
      end

    end
  end
end
```

7. Create routes for index, show, create, update, and destroy actions

```
Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
  resources :greetings, only: [:index, :show, :create, :update, :destroy]
    end
  end
end
```

8. Seed data

```
greeting1 = Greeting.create(message: "Hello from the other side 1")
greeting2 = Greeting.create(message: "Hello from the other side 2")
greeting3 = Greeting.create(message: "Hello from the other side 3")
greeting4 = Greeting.create(message: "Hello from the other side 4")
greeting5 = Greeting.create(message: "Hello from the other side 5")
```

9. Fire up your server & postman to test API functionality

Credit:- [Lisa's Article on dev.to](https://dev.to/lisahjung/beginner-s-guide-to-creating-an-api-from-scratch-using-rails-2eie)

## Other useful commands

Generate Model

```
rails generate User name username email
```

Generate Resource

```
rails generate resource Greeting message:text
```

Generate Scaffold

```
rails generate scaffold User name username email
```

Rubocop

```
rubocop -A
```

Stylelinter

```
npx stylelint "**/*.{css,scss}"
```
