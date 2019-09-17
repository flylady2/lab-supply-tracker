# README

Rails Lab Supply Tracker

This is an app designed to help laboratories keep track of their reagents so that they know where they are, how much they have, and when they need to order more.  A lab that is using the app will have two types of users, regular and administrative.  All users can look up what reagents the lab has and where they are stored. If they are going to use a reagent, they can create reagent_use records that will include the reagent name, amount used, user name and date used.  If a reagent_use record is generated, the app will automatically calculate how much of the reagent remains after this use.  If the amount of the reagent falls below a specified "trigger" level, an email will be sent to a lab administrator telling them that more needs to be ordered.  If the lab doesn't have a reagent that a user needs, the user can fill out a request form and an email will be sent to lab administrators requesting that it be ordered.

Getting Started

This app uses Ruby 2.3.3, Rails 5.2.3 and Sqlite3. Clone the repo and run bundle install.  The app should run on localhost:3000.  To use the email function you will need to provide the username and password of an email account.  The current settings are for a gmail account.

Usage
You must have Ruby installed on your machine.

Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/flylady2/lab-supply-tracker. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the Contributor Covenant code of conduct.

License

The app is available as open source under the terms of the MIT License https://opensource.org/licenses/MIT.
