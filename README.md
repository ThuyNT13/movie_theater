# README

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
