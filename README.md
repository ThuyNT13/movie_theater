# README

https://cinemix.herokuapp.com

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

Screen
  has_many :movies

Movie
  belongs_to :screen
  has_many :tickets
