# this is a silly language
# let's look into not using pseudo-english for everything
Feature: basic CLI commands

  Scenario: getting help
  When I run `currently --help`
  Then the exit status should be 0
