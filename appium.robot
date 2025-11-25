*** Settings ***
Library       AppiumLibrary

*** Test Cases ***
test_demo

    [Tags]  regression
    lancer l'application
    lancer le de 
    controle du texte
    passer en mode paysage
	
*** Keywords ***
lancer l'application
	Open Application	http://localhost:4723	platformName=Android	platformVersion=10		app=/Users/dominiquemereaux/AndroidStudioProjects/Dice/app/build/outputs/apk/app-debug.apk	automationName=uiautomator2	appPackage=com.example.dominiquemereaux.dice
#	Open Application	http://localhost:4723	platformName=Android	modelName=Pixel_6	app=/Users/dominiquemereaux/AndroidStudioProjects/Dice/app/build/outputs/apk/app-debug.apk	automationName=uiautomator2	appPackage=com.example.dominiquemereaux.dice


lancer le de
	Click Element    id=com.example.dominiquemereaux.dice:id/button6
	
controle du texte
    Wait Until Element Is Visible      id=com.example.dominiquemereaux.dice:id/buttonRoll  
    Element Text Should Be     id=com.example.dominiquemereaux.dice:id/buttonRoll     ROLL THE DICE...
	
Passer en mode paysage
    landscape
