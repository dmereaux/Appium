*** Settings ***
Library        AppiumLibrary
*** Variables ***
${appium:chromedriverExecutable}    /Users/dominiquemereaux/code/appium/chromedriver
${LOC_NOMBRE_RESULTATS}   //*[@id="js-product-list-top"]/div[3]
*** Keywords ***
Ouvrir prestashop
	Open Application	http://localhost:4723	platformName=android   automationName=UIAutomator2      platformVersion=16  noReset=true	  browserName=Chrome   chromedriverExecutable=${appium:chromedriverExecutable}
	Go To Url	http://www.qualifiez.fr/monPrestashop2/prestashop/index.php
fermer prestashop
    Close Application
lancer recherche avec ${terme}
    Wait Until Element Is Visible   xpath=//*[@id="search_widget"]/form/input[2]
    Input Text   xpath=//*[@id="search_widget"]/form/input[2]   ${terme}
    Press Keycode  66
verifier les messages ${message}
    Wait Until Element Is Visible   ${LOC_NOMBRE_RESULTATS}  5s
    Element Text Should Be     ${LOC_NOMBRE_RESULTATS}   ${message}