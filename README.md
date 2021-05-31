# Selenium Webdriver Framework in Ruby/RSpec

## To Do List:

    [/] Ability to Install Dependencies through Terminal
    [/] Ability to Run All tests (or specific tests) through Terminal
    [/] Can run specific tests that are 'tagged'
    [/] Uses Page Object Model
    [/] Can run tests via a Headless Browser
    [/] Outputs an HTML report
    [x] Add Mobile Tests
    [x] Run tests in parallel
    [x] Takes a screenshot upon test failures/errors
    [x] Dockerize the Project

## Install Dependencies

```ruby
    bundle install
```
## View All Rake Tasks 
If you'd like to see all the Rake Tasks that I've created, execute the below command.

```ruby
    rake --where
```

## Run All Tests
```ruby
    rake desktop
```

## Run Only The Smoke Tests
```ruby
    rake smoke
```

## Run A Specific Test

```ruby
    rspec ./spec/header_spec.rb
```

## Running The Tests Headlessly:

You can run the tests via Chrome Headless by copying the `.env_example` file and naming it `.env`
Setting the env variable `HEADLESS=TRUE` will run the tests headlessly. 
Removing this environment variable or setting this to anything other than TRUE, will open a Chrome browser as normal.