*** Settings ***
Library       AppiumLibrary
Test Teardown   Remove Application   com.example.jeuxdede
*** Variables ***
${App2}   /Users/dominiquemereaux/AndroidStudioProjects/jeuxdede/app/build/outputs/apk/debug/app-debug.apk  
${Server}  http://localhost:4723
*** Test Cases ***
test valeur inferieure a 6
    lancer l'application
    Utiliser le dé de six
    controle du texte
    lancer le dé de 6	
    verifier valeur
    Passer en mode paysage
*** Keywords ***
lancer l'application
#	Open Application  ${Server}	 platformName=Android	platformVersion=10	deviceName=M10	app=${App}	automationName=UiAutomator2	appPackage=com.example.dominiquemereaux.dice
	Open Application  ${Server}	 platformName=Android	platformVersion=16	app=${App2}	automationName=UiAutomator2	
Utiliser le dé de six
		Click Element	class=android.widget.Button
vérifier
	${Var}	Get Text	class=android.widget.TextView
	Should Be Equal	${Var}	6 sided dice
controle du texte
    Wait Until Element Is Visible      com.example.jeuxdede:id/buttonRoll  10s
    Element Text Should Be     com.example.jeuxdede:id/buttonRoll     ROLL THE DICE...
lancer le dé de 6	
    Click Element  com.example.jeuxdede:id/buttonRoll
verifier valeur
    Wait Until Element Is Visible      com.example.jeuxdede:id/textResult  10s

    ${x}   get text  com.example.jeuxdede:id/textResult
    Should Be True  ${x} < 7
Passer en mode paysage
    landscape


