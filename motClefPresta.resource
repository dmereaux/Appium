*** Settings ***
#Library   SeleniumLibrary   #implicit_wait=5
library    AppiumLibrary
*** Variables ***
${URL}   http://www.qualifiez.fr/monPrestashop2/prestashop/index.php
${NAVIGATEUR}     GC
#${PATH_GC}   /Users/dominiquemereaux/code/driver/chromedriver
${LOC_CHAMP_RECHERCHE}   xpath=//*[@id="search_widget"]/form/input[2]
${LOC_NOMBRE_RESULTATS}   //*[@id="js-product-list-top"]/div[1]/p
${LOC_LIEN_RECHERCHE}   //*[@id="js-product-list"]//article/div/div[2]/h2/a
${LOC_ICONE}   //*[@id="_desktop_logo"]//a/img
${LOC_MESSAGE_ERREUR}   //*[@id="product-search-no-matches"]
${MESSAGE ERREUR}   Aucun produit ne correspond à votre recherche
${LOC_checkbox}    //*[@id="search_filters"]/section/ul/li[1]/label/span/input
${LOC_MENU_VETEMENT}  //*[@id="category-3"]/a
${LOC_MENU_FEMMES}   //*[@id="category-5"]/a
${LOC_CONTINUER}    id=btnAction
${PATH_APPIUM}  http://localhost:4723/
${appium:chromedriverExecutable}    /Users/dominiquemereaux/code/appium/chromedriver
#&{capabilities}    platformName=Android    appium:platformVersion=16    browserName=Chrome    appium:automationName=UiAutomator2    appium:chromedriverExecutable=${chromedriverExecutable}


*** Keywords ***


Ouvrir Prestashop
#   Open Browser  ${URL}  ${NAVIGATEUR}  remote_url=${PATH_APPIUM}  options=&{capabilities}
	Open Application	http://localhost:4723   platformName=android   automationName=UIAutomator2      platformVersion=16  noReset=true	  browserName=Chrome   chromedriverExecutable=${appium:chromedriverExecutable}
	Go To Url	${URL}
#   Title Should Be  monPrestashop
#   ma_lib_selenium.Ma Fonction
Fermer Prestashop
  Close Application
  
Faire une recherche
  [Arguments]   ${item}
  Wait Until Element Is Visible   ${LOC_CHAMP_RECHERCHE}
  Input Text   ${LOC_CHAMP_RECHERCHE}   ${item}
  
  Press Keycode	 160
  #Wait For Condition	return document.title == "Rechercher"  timeout=5

Contrôler le résultat de recherche égal à
  [Arguments]    ${texte-a-vérifier}
  Wait Until Element Is Visible   ${LOC_NOMBRE_RESULTATS}  5s
  Element Text Should Be     ${LOC_NOMBRE_RESULTATS}   ${texte-a-vérifier}

