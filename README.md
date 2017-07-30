# README

A client of LaunchPad Lab is opening a movie theater. We need you to build a Rails app so they can start selling tickets online.

Customers should be able to come to the site and see all movies playing with their showtimes. Seating is limited for each theater so a particular showtime should only have a limited number of seats. Once a show sells out, a customer should no longer be able to buy tickets. Customers should only be able to buy one ticket at a time so don't worry about a shopping cart for this version.

When customers decide to buy their ticket, they should be able to checkout by entering their name, email, credit card, and expiration date. We want to make sure we don't get any bogus orders, so please keep an eye out for any validations and make sure the user knows if there's a problem with the order. We'll add a credit card processor later on, so you DON’T need to integrate with a credit card processor. Once the customer purchases their tickets, they should receive an email receipt.

The theater owner needs a way to manage the movies playing and seating capacities . She should be able to add auditoriums and seating capacities. In addition, the movies change all the time so our client should be able to set which movie is showing in which auditorium.

The theater owner also wants to keep track of her sales, so the order information should be saved to the database. She wants to see a list of all orders and a list of orders for each movie. We don't need any authentication on the app for now.

We're not worried about custom visual design, so feel free to use any CSS framework, or roll your own. However, we need the site to work on mobile, so keep that in mind.

There are many ways to code this challenge, so we'd like to see your thought processes in the app's Readme file.

Please submit your challenge application within 7 days. We have designed the challenge so you should be able to finish it in no more than 6 hours. You can submit the challenge by pushing your code to GitHub and deploying the app to Heroku and emailing me your GitHub and Heroku links.

---

User
  has_many :tickets, foreign_key: :ticketholder_id
  has_many :ticketed_movies, through: :tickets, source: :movies

  has_many :ticket_sales, foreign_key: :owner_id
  has_many :sold_movies, through: :ticket_sales, source: :movies

  has_many :credit_cards

  has_many :theaters, foreign_key: :owner_id

CreditCard
  belongs_to :user

Ticket
  belongs_to :ticketholder, class_name: :User
  belongs_to :movie

  has_one :ticket_sale # ?

TicketSale
  belongs_to :owner, class_name: :User
  belongs_to :movie

  belongs_to :ticket # ?

Theater
  belongs_to :owner, class_name: :User
  has_many :screens
  has_many :movies, through: :screens

Screen
  belongs_to :theater
  has_many :movies

Movie
  belongs_to :screen
  has_many :tickets
  has_many :ticket_sales
