# Setting Up Rails Rspec Capybara testing
## TESTING
--
### Dependencies
| name | url |
| ---- | --- |
| capybara | [Link](https://github.com/teamcapybara/capybara) |
| rspec-rails | [Link](https://github.com/rspec/rspec-rails) |
| database_cleaner | [Link](https://github.com/DatabaseCleaner/database_cleaner) |
| poltergiest | [Link](https://github.com/teampoltergeist/poltergeist) |

### Steps

1. Add dependencies to gemfile
2. install rspec testing `rails g rspec:install`
3. add capybara to `rails_helper.rb`
4. add poltergiest as a driver in `rails_helper.rb`
5. setup database_cleaner to clean testing database after every test
