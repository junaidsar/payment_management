# Instructions

This is your own personal fork of a little internal app which is used by our Community Success team to manage and process all Applicants to receive funding for specific Projects. They require a new feature to be added and they have also found a bug with the system.

Our Operations team also uses this app to keep track of the upcoming Payments that will be made to successful Applicants, however this is proving problematic as the number of applicants increases.

We are hoping to receive 3 separate pull requests to your forked repository for each of the following:

1. There is a bug in the Applicants index page, the Project title is the same for every Applicant, this needs to be fixed. Once this is fixed, we are interested to know your thoughts on how this bug could have been avoided?
2. The Community Success team have asked for a feature to be able to attach a comment to every change in status they make to an Applicant, noting the reason for the status change. The complete history of these changes and reasons should be available in the app for future review.
3. The Operations team need the Payments page to be more performant as they are receiving 504 timeouts when accessing this in our production environment sometimes. Please describe where you think the issue(s) lie and provide your thoughts on how they might be resolved. If time permits, implement your solution (or implement just enough to prove your ideas).

## Some extra notes:

This is a Rails 7.0 application, using RSpec for specs, run on Ruby 3.1. Once you have the app checked out and have installed all gems, you should run `rails db:reset` to setup the database.

## Care about
Readability of the code, separation of concerns, reasonable spec coverage