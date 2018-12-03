# Basic-RR-experiment
Writing small service using only rails provided patterns

# Goal

Create simple app for product price monitoring.

It will be a foundation for comparing different approaches in ruby web application:
  * pure ruby-on-rails MVC
  * ruby-on-rails MVC with service layer, decorators, presenters, specifications etc (thin controller, pure model) 
  * rails application (thin controller, pure model) with trailblazer
  * rails application with trailblazer and rom.rb (without activerecord)
  * hanami application with trailblazer and rom.rb

# Implemented stories

User can create and delete products to maintain product list
Add parser for ulmart.ru for user can add links to that store
User can add link to product's store page to parse product price
Add rake task to periodically run price parsing for all saved links
User can register and authorize to have personal products and maintain them
Authorized user can open price list page to see history of price changes for his product
Authorized user can set desired price for each product to be notified via email if price reaches it

# Stories in backlog

Authorized user can choose notification channel between email notification and web interface notifications
Authorized user can see web interface notifications pop-ups if he choose web interface notifications channel
Authorized user can see history of events with his products on notifications list page
Authorized user can choose desired sales rate for each product to be notified if price falls down 
  by specified percentage (comparing to previous price parsing)
