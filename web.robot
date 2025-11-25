*** Settings ***

Library        AppiumLibrary
Documentation   demo for appium library
Resource    ${RESSOURCE}
Test Setup   Ouvrir prestashop


*** Variables ***
${appium:chromedriverExecutable}    /Users/dominiquemereaux/code/appium/chromedriver
${LOC_NOMBRE_RESULTATS}   //*[@id="js-product-list-top"]/div[3]
${RESSOURCE}    web.resource


 
*** Test Cases ***

test_demo

    [Tags]  regression
#	Open Application	http://localhost:4723	platformName=iOS       platformVersion=16.0      deviceName=iPhone 14  browserName=safari    automationName=XCUITest   
	Open Application	http://localhost:4723	platformName=android   automationName=UIAutomator2      platformVersion=16  noReset=true	  browserName=Chrome   chromedriverExecutable=${appium:chromedriverExecutable}
	Go To Url	http://www.qualifiez.fr/monPrestashop2/prestashop/index.php
	${x}    Get Window Title
	Log To Console  ${x} 
	Wait Until Element Is Visible   xpath=//*[@id="search_widget"]/form/input[2]
    Input Text   xpath=//*[@id="search_widget"]/form/input[2]   MUG
	Press Keycode  66
	Wait Until Element Is Visible   ${LOC_NOMBRE_RESULTATS}  5s
    Element Text Should Be     ${LOC_NOMBRE_RESULTATS}   Affichage 1-5 de 5 article(s)


test_recherche_mug
	[Tags]  recherche
	lancer recherche avec MUG
	verifier les messages Affichage 1-5 de 5 article(s)

