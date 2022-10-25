# Service Booking App
A Ruby on Rails web application in where an admin can set up shop, and users can browse and buy their services.

## Admin Privilege
* Admin user can create or edit services with the following settings:

1. Category
2. Price
3. Image
4. Addons
5. Available Schedules
6. Available Timeslots

* Dashboard consists of all registered users and booking history, both in table view.  
* It is also indicated what service is the most booked.
* Can cancel or complete pending bookings.

## Customer Privilege
* Customers can only view services that have available timeslots.
* All of the following are done in one page:

1. Selecting available service
2. Choosing a preferred schedule and time that are available
3. Including addons
4. Filling up a form for the user's details
5. Choosing a payment option
6. Check Out

* May add a payment option that will then be available when booking.
* Access to the current user's booking history.

## Requirements

* ruby 3.1.2
* rails 7.0.3.1
* postgresql

## Startup

* The pre-made accounts can be initialized by running the seed file.
* To show the services on the customer's end, it must have an available timeslot.

#### Admin Account

* username: admin@email.com
* password: 123456

#### Dummy Accounts

* username: dummy01@email.com
* password: 123456  
    
* username: dummy02@email.com
* password: 123456
