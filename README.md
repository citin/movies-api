# The Problem

Our application has movies, seasons and episodes.
Movies and seasons can be purchased (but not episodes), each one can have several purchase options, a purchase option has a price (2.99) and a video quality (HD or SD).

We also have users. A user can make a purchase of a content (movie/season) through a purchase option. When a user makes a purchase, we store it in his library, the user has up to 2 days to see the content. In his library, we only show the titles that the user has "alive" and he can see and not the expired purchases. Also, while the user has a content in his library, he can't purchase the same content again.

Define and implement the following JSON REST API in Ruby:

 1. An endpoint to return the movies, ordered by creation.
 
 ```
/api/v1/movies
 ```

 2. An endpoint to return the seasons ordered by creation, including the list of episod
 es ordered by its number.

 ```
 /api/v1/seasons
 ```

 3. An endpoint to return both movies and seasons, ordered by creation.

 ```
/api/v1/movies_and_seasons
 ```

 4. An endpoint for a user to perform a purchase of a content.

  ```
/api/v1/users/:id/purchase
 ```

 5. An endpoint to get the library of a user ordered by the remaining time to watch the content.

 ```
/api/v1/users/:id/purchases  
params: { "purchase_option_id": 2 }
 ```

# Installation

- Install dependencies:

 ```
 bundle install
```

- Setup database

 ```
 rails db:setup
 rails db:migrate
```

- Run local server

 ```
 rails server
```

Runs the app in the development mode.<br>
Open [http://localhost:3000](http://localhost:3000) to view it in the browser.


# ToDo

- Add validations
- Add pagination on json responses
- Add caching
