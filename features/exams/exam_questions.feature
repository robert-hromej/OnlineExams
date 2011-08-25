Feature: Exam Question

  Background:
    Given I am not logged in
    And I am on the home page
    And I go to the sign up page
    And I am admin
    And I am sign in by admin role
    And Create new Exam category 'Ruby'
    And Create new Exam Type 'Ruby Core(1 level)' for exam category 'Ruby'
    And Create question '"a" + "a"' for exam 'ruby core(1 level)':
      | answer | true? |
      | "a"*2  | true  |
      | "aa"   | true  |
      | "2a"   | false |
      | "a2"   | false |
      | "aaa"  | false |
    And Create question '"a".class' for exam 'ruby core(2 level)':
      | answer | true? |
      | "a"*2  | true  |
      | "aa"   | true  |
      | "2a"   | false |
      | "a2"   | false |
      | "aaa"  | false |

  Scenario: asfsdf
    Given sdf sdf
    When sdfsdf
    Then df