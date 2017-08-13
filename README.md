# Gerenzuoye (Individual assignment)

## Introduction

This application was created as a final individual assignment for development training. It allows a teacher to log in, to create batches of students, and to keep track of students' performance on certain days. Evaluations can be positive (green), mixed (yellow), or negative (red). For a given batch a teacher can also randomly select a student for a question. Red students (evaluated red on the last day) are picked 50% of the time, yellow students are picked ~33% of the time, and green students ~17% of the time.

## Configuration

The application was developed using Ruby v2.4.1. The version of PostgreSQL used is v9.5.7. Dependencies of other versions can be found in the Gemfile.

To get the application up and running, run the following commands:

1. `bundle install`
2. `rails db:create`
3. `rails db:migrate`
4. `rails server`

Optionally, one can run `rails db:seed` to populate the database.

To run integration tests, run `rspec`
