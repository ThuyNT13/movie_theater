# README

https://cinemix.herokuapp.com

Presently, I have set up a basic movie listing so that anybody can view or manipulate the database, adding or updating movies or screens.

The next step is to implement a User, as well as Ticket for a Ticketholder to purchase tickets for the movie of their choice, and Ticket_sales for an Owner to keep track of sales.

The following are the associations that I currently have in mind:

```ruby
Screen
  has_many :movies, dependent: :destroy

Movie
  belongs_to :screen
  has_many :tickets

User
  has_many :tickets, foreign_key: :ticketholder_id
  has_many :ticketed_movies, through: :tickets, source: :movies

  has_many :ticket_sales, foreign_key: :owner_id
  has_many :sold_movies, through: :ticket_sales, source: :movies

  has_many :credit_cards

CreditCard
  belongs_to :user

Ticket
  belongs_to :ticketholder, class_name: :User
  belongs_to :movie

TicketSale
  belongs_to :owner, class_name: :User
  belongs_to :movie
```

I have also included a visual schema to help clarify how I perceived the different parts relating to each other: [schema](https://github.com/ThuyNT13/movie_theater/blob/master/theater_schema.png)

---

Issues
---
*Issues* to be addressed, or further *implementations* [here](https://github.com/ThuyNT13/movie_theater/issues)
