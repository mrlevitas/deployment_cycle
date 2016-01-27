Deployment Diagrams

[ ![Codeship Status for mrlevitas/deployment_cycle](https://codeship.com/projects/8d003370-9bbb-0133-8244-4af0faf5a893/status?branch=master)](https://codeship.com/projects/126906)
[![Coverage Status](https://coveralls.io/repos/mrlevitas/deployment_cycle/badge.svg?branch=master&service=github)](https://coveralls.io/github/mrlevitas/deployment_cycle?branch=master)
[![Code Climate](https://codeclimate.com/github/mrlevitas/deployment_cycle/badges/gpa.svg)](https://codeclimate.com/github/mrlevitas/deployment_cycle)

Deployment Diagrams is an interface that allows users to create, view and share their timelines.
Timelines allow teams to coordinate the development or release of a product around ‘events’. 
Different team members can filter these events by tags (i.e. Dev, Test, Q/A, Release) to view events pertinent to their role.


Deployment Diagrams was developed in Ruby on Rails 4 using Ruby version 2.0.0


Also used in the application:

Foundation (http://foundation.zurb.com/) for css styling.
Devise (https://github.com/plataformatec/devise) used for user authentication.

To get it running locally:

    git clone https://github.com/mrlevitas/deployment_cycle.git
    cd deployment_cycle
    bundle install

Initiate local database:

    rake db:create
    rake db:migrate
    
To deploy locally, run:

    rails s

and navigate to 
  localhost:3000


The following gems were used to develop and run unit and feature tests:
- RAKE (http://rake.rubyforge.org/)
- RSpec (http://rspec.info/)
- Capybara (https://github.com/jnicklas/capybara)
- shoulda-matchers (http://matchers.shoulda.io/)
- poltergeist (https://github.com/teampoltergeist/poltergeist)

To run test suite, prepare for testing:
    rake db:test:prepare


To run all test files, run:

    rake

You may specify an individual test file to run using rspec:

    rspec <full test name>
For example:

    rspec spec/features/user/01_user_sign_up_spec.rb

