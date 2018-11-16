@search
Feature: Validate Search API

  Background: User has api to test
    Given api to test is "http://yesgenie.com:30978/api/customer/search"

  @simple
  Scenario Outline: User search with mdmid, mobile no, pan, adhar,name,account number etc. and validate customerSearchEnabled is true or false
    When As a user i search with value "<query>" and setting isCustomerId "<custID>" and value for threshold "<threshold>"
    Then As a user i should get the positive response
    Examples:
      | query                  | custID | threshold |
      | 838191                 | false  | 50        |
      | 9927217421             | false  | 50        |
      | AAHXX7837X             | false  | 50        |
      | Y7654537               | false  | 50        |
      | customer kumar37       | false  | 50        |
      | 181400005300037        | false  | 50        |
      | 12355612355636         | false  | 5000      |
      | 223355567736           | false  | 5000      |
      | customer36@yesbank     | false  | 5000      |
      | 08/09/2003             | false  | 5000      |

  @simple
  Scenario: User search with mdmid and validate customerSearchEnabled is true or false
     When As a user i search with value "838297" and setting isCustomerId "true" and value for threshold "50"
     Then As a user i should get the response true or false "true"

   @simple
  Scenario Outline: User search with valid custid and validate response for customerName, addressCity, addressArea, homeBranch, assetRM, liabilityRM, groupId, businessSegment, partnerSegment, customerOpenDate and  DOB
     When As a user i search with value "838297" and setting isCustomerId "true" and value for threshold "50"
     Then As a user i should get the response for "<key>" is "<value>"
    Examples:
      | key              | value         |
      | customerName     | Foo6 foo      |
      | city             | goa           |
      | addressArea      | mmm road      |
      | homeBranch       | fort goa      |
      | assetRM          | sandeep kumar |
      | liabilityRM      | rahul rawel   |
      | groupId          | 274361        |
      | businessSegment  | brb           |
      | partnerSegment   | brb           |
      | customerOpenDate | 01/05/2011    |
      | DOB              | 05/05/2007    |

  @simple
  Scenario Outline: User search with valid custid and validate response for custId, mdmId and customerSearchEnabled
    When As a user i search with value "838297" and setting isCustomerId "true" and value for threshold "50"
    Then As a user i should get the response true or false "true"
    Then As a user i should get the response for "<nkey>" is <nvalue> of numeric type
    Examples:
      | nkey   | nvalue |
      | custId | 838297 |
      | mdmId  | 838191 |

  @simple
  Scenario: User search with valid custid and validate schema
    When As a user i search with value "838297" and setting isCustomerId "true" and value for threshold "50"
    Then search api response schema is validated successfully

  @simple
  Scenario: User search to test threshold validation
    When As a user i search with value "Vibhu" and setting isCustomerId "false" and value for threshold "50"
    Then As a user i should get status code is 400 as response

  @simple
  Scenario: User search with name and validate the count is greater
    When As a user i search with value "Vibhu" and setting isCustomerId "false" and value for threshold "5000"
    Then As a user i will validate that count is greater than 50

  @refine
  Scenario: User perform refine search with valid customer name and city and validate status
    When As a user i search with value "Venkata Bhuvana Santhosh Kumar Rikka swamy+Thiruvananthapuram" and setting isCustomerId "false" and value for threshold "50"
    Then As a user i should get the positive response

  @refine
  Scenario Outline: User perform refine search with valid customer name and city and validate status and validate response for customerName, addressCity, addressArea, homeBranch, assetRM, liabilityRM, groupId, businessSegment, partnerSegment, customerOpenDate and  DOB
    When As a user i search with value "Foo6 foo+goa" and setting isCustomerId "false" and value for threshold "50"
    Then As a user i should get the response for "<key>" is "<value>"
    Examples:
      | key              | value         |
      | customerName     | Foo6 foo      |
      | city             | goa           |
      | addressArea      | mmm road      |
      | homeBranch       | fort goa      |
      | assetRM          | sandeep kumar |
      | liabilityRM      | rahul rawel   |
      | groupId          | 274361        |
      | businessSegment  | brb           |
      | partnerSegment   | brb           |
      | customerOpenDate | 01/05/2011    |
      | DOB              | 05/05/2007    |

  @refine
  Scenario Outline: User perform refine search with valid customer name and city and validate status and validate response for customerName, addressCity, addressArea, homeBranch, assetRM, liabilityRM, groupId, businessSegment, partnerSegment, customerOpenDate and  DOB
    When As a user i search with value "Foo6 foo+05/05/2007" and setting isCustomerId "false" and value for threshold "50"
    Then As a user i should get the response for "<key>" is "<value>"
    Examples:
      | key              | value         |
      | customerName     | Foo6 foo      |
      | city             | goa           |
      | addressArea      | mmm road      |
      | homeBranch       | fort goa      |
      | assetRM          | sandeep kumar |
      | liabilityRM      | rahul rawel   |
      | groupId          | 274361        |
      | businessSegment  | brb           |
      | partnerSegment   | brb           |
      | customerOpenDate | 01/05/2011    |
      | DOB              | 05/05/2007    |