*** Settings ***
Library           Selenium2Library

*** Variables ***
${URL}  https://www.seleniumeasy.com/test/
${BROWSER}  chrome
${XPATH_Close_Popup}  xpath=//*[@class="at-cv-button at-cv-lightbox-yesno at-cm-no-button"]
${XPATH_Wait_Popup}  xpath=//*[@id="at-cv-lightbox-header"]
${XPATH_Navigate_Menu_Table}  xpath=//*[@id="navbar-brand-centered"]/ul[1]/li[3]/a
${XPATH_Navigate_Table Sort&Search}  xpath=//*[@id="navbar-brand-centered"]/ul[1]/li[3]/ul/li[4]/a
${XPATH_Navigate_AGE}  xpath=//*[@id="example"]/thead/tr/th[4]

*** Keywords ***

*** Test Cases ***
1.Navigate to browser:
    Open Browser  ${URL}  ${BROWSER}
    #Open Browser  https://datatables.net/  ${BROWSER}
2.Navigate to Table:
    Wait Until Element Is Visible  ${XPATH_Wait_Popup}
    Click Element  ${XPATH_Close_Popup}
    Click Element  ${XPATH_Navigate_Menu_Table}
    Click Element  ${XPATH_Navigate_Table Sort&Search}
    Click Element  ${XPATH_Navigate_AGE}
    ${ASC}=   Get Element Attribute  ${XPATH_Navigate_AGE}  aria-sort
    Log To Console  ${ASC}
    Should Be Equal  ascending  ${ASC}
    Click Element  ${XPATH_Navigate_AGE}
    ${DESC}=   Get Element Attribute  ${XPATH_Navigate_AGE}  aria-sort
    Log To Console  ${DESC}
    Should Be Equal  descending  ${DESC}