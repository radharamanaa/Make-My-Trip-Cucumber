Feature: One Side Make my trip
  User books a one side flight

  Background:
    Given User is on MakeMyTrip landing page
    And "ONEWAY" option is selected

 Scenario Outline: User searches for a city which has flight destination and verifies it
   Given "ONEWAY" option is selected
   When user clicks on from section
   And he enters <city>
   Then he finds <city> in the Select list
   And verifies DEPARTURE date to be the next day
   And DEPARTURE also shows the day of departure

   Examples:
     | city     |
     | Chennai  |
     | Kochi    |

  Scenario Outline: From field updates with valid details when user selects a city
     Given "ONEWAY" option is selected
     When User enters <sourceCity>
     Then User verifies <sourceCity> Airport appearance in dropdown list
     When User clicks on TO desination field and enters <destinationCity>
     Then User verifies <destinationCity> to be present in the drop down
     When he clicks on Departure field
     Then he verifies a that a calendar appears
     When he selects a future date
     Then he verifies the date and day shows, is as he selected
     Examples:
       | sourceCity | destinationCity|
       | Chennai    | New york       |
       | Kochi      | Chicago       |

  Scenario: user types gibberish in From field he gets
     suggestions according to the first letter of the gibberish text
     Given "ONEWAY" option is selected
     When User types "asdfasdlasdn" text in From field
     Then user verifies selection list to have airports names starting with  "A"

  Scenario Outline: User selects number of travellers and verifies the same
    Given "ONEWAY" option is selected
    When user clicks on Travellers and class field
    And User selects 2 adults
    And selects 1 child(2y-12y)
    And and 1 infant below 2 yrs
    And chooses <class> class and submits
    Then he verifies 4 travellers in the Travellers
    And verifies class to be <class>

    Examples:
    | class |
    | Economy |
    | Premium Economy |
    | Business |
    | First Class |


  Scenario: User is shown delhi and bangalore as default FROM and TO for first time indian user
    Given "ONEWAY" option is selected
    And user is from India
    Then user verifies FROM city to be "Delhi"
    And TO city to be "Bangalore"
    And RETURN date to be day after tomorrow

  Scenario: User is the only traveller by default
    Given "ONEWAY" option is selected
    Then user verifies 1 traveller showing in TRAVELLERS & CLASS field
    And class is Economy

  Scenario Outline: Verify details listed in FROM field after selection
    Given "ONEWAY" option is selected
    When User enters <userReqLoc> in FROM field
    And User selects <actualReqLoc> from dropdown options
    Then user verifies Airport code to be <airportCode> as airport code
    And user verifies <airportName>  in FROM field

    Examples:
    | userReqLoc |actualReqLoc | airportCode | airportName |
    | Goa        | Goa         | GOI         | Dabolim Goa International Airport India |
