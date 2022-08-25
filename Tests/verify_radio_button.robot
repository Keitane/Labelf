*** Settings ***
#Documentation  Testing labelf
Library  SeleniumLibrary
Resource  ../PageObjects/locators.robot
Resource  ../PageObjects/variables.robot
Resource  ../Resources/keywords.robot
Resource  ../Resources/SingleLabelingKeywords.robot

Suite Setup  Start WebTest
Suite Teardown  End WebTest

*** Variables ***

${BROWSER}  chrome

*** Test Cases ***

Verify Radio Button Is Shown
    [Documentation]  Verify Radio Button Is Shown When Multiple Choice Is Clicked
    [Tags]  Testcase 7  stagWorkspace
    Given User Is Logged In, Have Changed Workspace And Created A Model
    When User Adds Multiple Choice Label
    Given Multiple Choice Is Provided As Option
    When Multiple Choice Is Selected
    Then Radio Buttons For Created Labels Is Shown

Train dataset and add third label
    [Documentation]  Train Model with MultipleLabels
    [Tags]  Testcase 8  stagWorkspace
    Given Radio Buttons For Created Labels Is Shown
    When Model Is Trained with MultipleLables
    And A Third Label Is Added To Model
    Then All Labels Are Possible To Select

Verify Model Overview Reports
    [Documentation]  Verify training of model shows properly on model overview page
    [Tags]  Testcase 9  stagWorkspace
    Given That Model Is Trained With Three Labels
    When User Navigate To Model Overview
    Then The Trained Labels Are Shown In Report