*** Settings ***
Library        AppiumLibrary

*** Variables ***
${App}   /Users/dominiquemereaux/Downloads/app-debug.apk  
${Server}  http://localhost:4723   

*** Test Cases ***

test_demo
    lancer l'application
    lancer activite B
    vérifier B
    Afficher Dialog

	Verifier Dialog
    fermer Dialog
    lancer activite A
    vérifier A

*** Keyword ***
lancer l'application
	Open Application  ${Server}	 platformName=Android	platformVersion=8.0	deviceName=M8	app=${App}	automationName=UIAutomator2	appPackage=com.example.android.lifecycle

lancer activite B
		Click Element	id=com.example.android.lifecycle:id/btn_start_b
lancer activite A
    Click Element	id=com.example.android.lifecycle:id/btn_start_a
lancer activite C
    Click Element	id=com.example.android.lifecycle:id/btn_start_c


Afficher Dialog
   Click Element	id=com.example.android.lifecycle:id/btn_start_dialog

vérifier A
	${Var}	Get Text	xpath=/hierarchy/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.widget.TextView[1]
	Should Be Equal	${Var}	Activity A

vérifier B
	${Var}	Get Text	xpath=/hierarchy/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.widget.TextView[1]
	Should Be Equal	${Var}	Activity B

vérifier C
	${Var}	Get Text	xpath=/hierarchy/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.widget.TextView[1]
	Should Be Equal	${Var}	Activity C
Passer en mode paysage
    landscape

Verifier Dialog
    Wait Until Element Is Visible   id=com.example.android.lifecycle:id/btn_finish_dialog   7
	${Var}	Get Text	xpath=/hierarchy/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.TextView
	Should Be Equal	${Var}		Simple Dialog

fermer Dialog
   Wait Until Element Is Visible   id=com.example.android.lifecycle:id/btn_finish_dialog   7
   Click Element    id=com.example.android.lifecycle:id/btn_finish_dialog


