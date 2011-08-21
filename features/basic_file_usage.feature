Feature: basic filestore usage

  Scenario: no file
    Given an empty file named "test/scratch/currentlog"
    When I remove the file "test/scratch/currentlog"
    And I run `currently -f test/scratch/currentlog`
    Then the exit status should be 0
    And the output should contain "entry log is empty"
    And the file "~/.currentlog" should not exist

  Scenario: empty file
    Given an empty file named "test/scratch/currentlog"
    When I run `currently -f test/scratch/currentlog`
    Then the exit status should be 0
    And the output should contain "entry log is empty"

  Scenario: write one
    Given an empty file named "test/scratch/currentlog"
    When I remove the file "test/scratch/currentlog"
    And I run `currently -f test/scratch/currentlog test data`
    And I run `currently -f test/scratch/currentlog`
    Then the exit status should be 0
    And the output should contain exactly "test data\n"
    And a file named "test/scratch/currentlog" should exist
    And the file "test/scratch/currentlog" should contain "test data"
