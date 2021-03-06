@e2e

Feature: Validate end to end response from elastic search , demographics and NBA API

  Background: User get the access token
#    Given user wants a valid access token from "/auth/realms/YBL/protocol/openid-connect/token" URI
#    And to get valid access token user passes "yes-genie-frontend" as "client_id" and "password" as "grant_type" and "chandan" as "username" and "chandan" as "password" and "f2b07a8f-ce69-41c6-9d28-f056bc9713fe" as "client_secret"
    Given api to test is "/api/genie/customer/search"

  Scenario Outline: This is the test to validate response upto demographics where customer type is individual
    When a user search with value "996264849" and setting value for threshold "50"
    Then a user get the status code 200 as a response from the api
    And user get the response from the api and count of records is more than or equal to 1
    Then a genie user has a demographic api to test is "/api/genie/demographic/"
    And a genie user passes the "996264849" as a parameter to get the response from demographic api where customer type is individual
    Then a user get the status code 200 as a response from the demographic api where customer type is individual
    And user get the response for "emailId" is "csadana@yahoo.co.in" from the demographic api where customer type is individual
    And user get the response for "vintage" is "3.3" from the demographic api where customer type is individual
    And user get the response for "<key>" is "<value>" from the demographic api where customer type is individual
    Examples:
      | key                    | value                      |
      | name                   | CHARU SADANA               |
      | mdmId                  | 996264849                  |
      | custType               | FEMALE RESIDENT INDIVIDUAL |
      | emailStatus            | VERIFIED                   |
      | currentCityState       | SAHARANPUR,UTTAR PRADESH   |
      | currentCityStateStatus | INDETERMINISTIC                   |
      | mobileNumber           | 917123456789               |
      | mobileNumberStatus     | VERIFIED                   |
      | profitablilityBand     | #FF0000                      |
      | custCategory           | I                          |
      | indexType              | M                          |
      | sentimentBand          | null                       |
      | contactibilityIndex    | 33%                        |
      | homeBranchName         | SAHARANPUR,UTTAR PRADESH   |
      | cKyc                   | null                       |
      | profession             | BUSINESS                   |
      | customerSegment        | YES FIRST PRIMARY OPDT     |
      | aadharNo               | VERIFIED                   |
      | passportNo             | VERIFIED                   |
      | gender                 | F                          |
      | PS                     | RS                         |
      | BS                     | BRB                        |
      | PAN                    | VERIFIED                   |
      | DOB                    | 1975-08-27 00:00:00                |


  Scenario Outline: This is the test to validate response upto demographics where customer type is corporate
    When a user search with value "998003452" and setting value for threshold "50"
    Then a user get the status code 200 as a response from the api
    And user get the response from the api and count of records is more than or equal to 1
    Then a genie user has a demographic api to test is "/api/genie/demographic/"
    And a genie user passes the "998003452" as a parameter to get the response from demographic api where customer type is corporate
    Then a user get the status code 200 as a response from the demographic api where customer type is corporate
    And user get the response for "emailId" is "amarjeets555@gmail.com" from the demographic api where customer type is corporate
    And user get the response for "vintage" is "4.1" from the demographic api where customer type is corporate
    And user get the response for "<key>" is "<value>" from the demographic api where customer type is corporate
    Examples:
      | key                    | value                           |
      | name                   | SURINDRA RADIOS PRIVATE LIMITED |
      | mdmId                  | 998003452                       |
      | custType               | FEMALE RESIDENT INDIVIDUAL      |
      | emailStatus            | VERIFIED                        |
      | currentCityState       | PATNA,BIHAR                     |
      | currentCityStateStatus | INDETERMINISTIC                     |
      | mobileNumber           | 6080112225                      |
      | mobileNumberStatus     | NOTVERIFIED                     |
      | profitablilityBand     | #FF0000                          |
      | custCategory           | C                               |
      | indexType              | M                               |
      | constitution           | null                            |
      | business               | null                            |
      | industry               | Agri Commodities                |
      | annualTurnover         | 1 TO 5 CRORE                    |
      | landlineNumberStatus   | INDETERMINISTIC                    |
      | PS                     | RS                              |
      | BS                     | BRB                             |
      | PAN                    | NOTAVAILABLE                     |
      | DOI                    | 2015-05-27 00:00:00                    |
      | landlineNumber         | null                            |
      | webSite                | null                            |


  Scenario Outline: This is the test to validate response upto nba view api where customer type is individual and validate the response of initial c flag record
    When a user search with value "996264849" and setting value for threshold "50"
    Then a user get the status code 200 as a response from the api
    And user get the response from the api and count of records is more than or equal to 1
    Then a genie user has a demographic api to test is "/api/genie/demographic/"
    And a genie user passes the "996264849" as a parameter to get the response from demographic api where customer type is individual
    Then a user get the status code 200 as a response from the demographic api for initial c flag record where customer type is individual
    And user get the response for "custId" is "996264849" from the demographic api for initial c flag record where customer type is individual
    Then a genie user has a nba api to test is "/api/genie/recommendation/view/"
    And a genie user passes the "996264849" as a mdmid to get the response from nba api where customer type is individual
    Then a user get the status code 200 as a response from the nba api where customer type is individual
    And user get the response for "amount" is "54856.73" from the nba api where customer type is individual
    And user get the response for "<key>" is "<value>" from the nba api where customer type is individual
    Examples:
      | key                 | value                                           |
      | mdmId               | 996264849                                       |
      | actionCode          | FATCA                                            |
      | referenceNo         | 127                                             |
      | toolTip             | ECS instructions not initiated |
      | accountNo           | 39400000000000                                  |
      | dueDate             | 01-Dec-2019                                     |
      | cumulationCount     | 1                                               |
      | priority            | 5                                               |
      | status              | OPEN                                            |
      | recommendationTitle | ECS instructions not initiated |
      | category            | Regulatory                                      |

  Scenario Outline: This is the test to validate response upto nba view API where customer type is individual and validate the response of additional info fields and boolean fields of first Record of NBA Section
    When a user search with value "996264849" and setting value for threshold "50"
    Then a user get the status code 200 as a response from the api
    And user get the response from the api and count of records is more than or equal to 1
    Then a genie user has a demographic api to test is "/api/genie/demographic/"
    And a genie user passes the "996264849" as a parameter to get the response from demographic api where customer type is individual
    Then a user get the status code 200 as a response from the demographic api for initial c flag record where customer type is individual
    And user get the response for "custId" is "996264849" from the demographic api for initial c flag record where customer type is individual
    Then a genie user has a nba api to test is "/api/genie/recommendation/view/"
    And a genie user passes the "996264849" as a mdmid to get the response from nba api where customer type is individual
    Then user get the response for "branch_code" is "1" as additional info from the nba api where customer type is individual
    And user get the response for "amount" is "54856.73" as additional info from the nba api where customer type is individual
    And user get the response for "lob" is "Branch Banking" as additional info from the nba api where customer type is individual
    And user get the response for "BU" is "YES BANK" as additional info from the nba api where customer type is individual
    And user get the response for "<key>" is "<value>" from the nba api where customer type is individual and field is of boolean type
    Examples:
      | key            | value |
      | dismissable    | false |
      | cumulationFlag | true  |

  Scenario Outline: This is the test to validate response upto nba view api where customer type is corporate and validate the response of initial c flag record
    When a user search with value "998003452" and setting value for threshold "50"
    Then a user get the status code 200 as a response from the api
    And user get the response from the api and count of records is more than or equal to 1
    Then a genie user has a demographic api to test is "/api/genie/demographic/"
    And a genie user passes the "998003452" as a parameter to get the response from demographic api where customer type is corporate
    Then a user get the status code 200 as a response from the demographic api for initial c flag record where customer type is corporate
    And user get the response for "custId" is "998003452" from the demographic api for initial c flag record where customer type is corporate
    Then a genie user has a nba api to test is "/api/genie/recommendation/view/"
    And a genie user passes the "998003452" as a mdmid to get the response from nba api where customer type is corporate
    Then a user get the status code 200 as a response from the nba api where customer type is corporate
    And user get the response for "amount" is "54856.73" from the nba api where customer type is corporate
    And user get the response for "<key>" is "<value>" from the nba api where customer type is corporate
    Examples:
      | key                 | value                                           |
      | mdmId               | 998003452                                       |
      | actionCode          | FATCA                                            |
      | recommendationTitle | ECS instructions not initiated |
      | category            | Regulatory                                      |
      | toolTip             | ECS instructions not initiated |
      | accountNo           | 39400000000000                                  |
      | dueDate             | 01-Dec-2019                                   |
      | cumulationCount     | 1                                               |
      | priority            | 5                                               |
      | status              | OPEN                                            |
      | referenceNo         | 127                                            |


  Scenario Outline: This is the test to validate response upto nba view API where customer type is corporate and validate the response of additional info fields and boolean fields of first Record of NBA Section
    When a user search with value "998003452" and setting value for threshold "50"
    Then a user get the status code 200 as a response from the api
    And user get the response from the api and count of records is more than or equal to 1
    Then a genie user has a demographic api to test is "/api/genie/demographic/"
    And a genie user passes the "998003452" as a parameter to get the response from demographic api where customer type is corporate
    Then a user get the status code 200 as a response from the demographic api for initial c flag record where customer type is corporate
    And user get the response for "custId" is "998003452" from the demographic api for initial c flag record where customer type is corporate
    Then a genie user has a nba api to test is "/api/genie/recommendation/view/"
    And a genie user passes the "998003452" as a mdmid to get the response from nba api where customer type is corporate
    Then user get the response for "branch_code" is "2" as additional info from the nba api where customer type is corporate
    And user get the response for "amount" is "54856.73" as additional info from the nba api where customer type is corporate
    And user get the response for "lob" is "Branch Banking" as additional info from the nba api where customer type is corporate
    And user get the response for "<key>" is "<value>" from the nba api where customer type is corporate and field is of boolean type
    Examples:
      | key            | value |
      | dismissable    | false |
      | cumulationFlag | true  |

  Scenario Outline: User search with valid mdmId, reference id and validate response of nba create lead api where customer type is individual for all the mentioned keys in examples
    Given a genie user has a nba api to test is "/api/genie/lead/"
    When a genie user passes the "996264849" as a mdmid and "123" as a refrence id to get the response from nba api where customer type is individual
    Then a user get the status code 200 as a response from the nba lead api where customer type is individual
    And user get the response for "<key>" is "<value>" from the nba lead api where customer type is individual
    Examples:
      | key         | value      |
      | mdmId       | 996264849  |
      | referenceNo | 123        |
      | custId      | 996264849  |
      | productName | 9      |
      | bu          | Branch Banking   |
      | sourceRefId | 9 Branch Banking |
      | branchCode  | 1        |
      | remarks     | null       |



  Scenario Outline: User search with valid mdmId, reference id and validate response of nba create lead api where customer type is corporate for all the mentioned keys in examples
    Given a genie user has a nba api to test is "/api/genie/lead/"
    When a genie user passes the "998003452" as a mdmid and "123" as a refrence id to get the response from nba api where customer type is corporate
    Then a user get the status code 200 as a response from the nba lead api where customer type is corporate
    And user get the response for "<key>" is "<value>" from the nba lead api where customer type is corporate
    Examples:
      | key         | value      |
      | mdmId       | 998003452  |
      | referenceNo | 123        |
      | custId      | 998003452  |
      | productName | 9      |
      | bu          | Branch Banking   |
      | sourceRefId | 9 Branch Banking |
      | branchCode  | 2        |
      | remarks     | null       |



  Scenario Outline: User search with valid custid and validate response for all the mentioned keys in example
    When a user search with value "996264849" and setting value for threshold "50"
    Then user get the response from the api for the initial record for "<key>" is "<value>"
    Examples:
      | key              | value                    |
      | customerName     | CHARU SADANA             |
      | city             | SAHARANPUR               |
      | addressArea      | W/O RAHUL SADANA 25-B    |
      | homeBranch       | SAHARANPUR,UTTAR PRADESH |
      | assetRM          | NULL                     |
      | groupId          | 274937                   |
      | businessSegment  | BRB                      |
      | partnerSegment   | NULL                     |
      | customerOpenDate | 11-Mar-2017              |
      | DOB              | 11-Sep-1987              |
      | custType         | I                        |

  Scenario: User validates the response code of create lead without recommendation api
    Given a genie user has a create lead lineofbusinesses api to test is "/api/genie/lead/lineofbusinesses"
    Then a user get the status code 200 as a response from the create lead lineofbusinesses api
    And user get "BRB" as a response from create lead lineofbusinesses api
    And a genie user has a create lead product name api to test is "/api/genie/lead/productnames"
    When a genie user passes the "BRB" as a product name to get the response from create lead product name api
    Then a user get the status code 200 as a response from the create lead product name api where customer type is individual
    And user get "Savings Account" as a response from create lead product name api
    And a genie user has a create lead branchcodes api to test is "/api/genie/lead/branchcodes"
    Then a user get the status code 200 as a response from the create lead branchcodes api
    And user get "1" as "branchCode" from create lead branchcodes api as a first value
    And user get "NEHRU CENTRE - MUMBAI (1)" as "branchDisplayName" from create lead branchcodes api as a first value
    And a genie user has a nba create lead without recommendation api to test is "/api/genie/lead"
    When a genie user edits the "custId" field by "1234567" and "lineOfBusiness" field by "BRB" and "productName" field by "Savings Account" and "sourceReferenceId" field by "Savings AccountBRB" and "remark" field by "test" and "branchCode" field by "1"
    Then user validates all fields in nba create lead without recommendation api modify successfully
