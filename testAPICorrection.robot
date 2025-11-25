*** Settings ***
Library       AppiumLibrary  5
#Test Teardown   Close Application

*** Variables ***
${platformName}    Android
${appium:platformVersion}    16
${app}    /Users/dominiquemereaux/code/appium/appium-1.x/sample-code/apps/ApiDemos-debug.apk
${appium:automationName}    UiAutomator2
${appium:appPackage}    io.appium.android.apis
${appium:ensureWebviewsHavePages}    true
${appium:nativeWebScreenshot}    true
${appium:newCommandTimeout}    3600
${appium:connectHardwareKeyboard}    true
${LOC_menu_APP}   accessibility_id=App
${LOC_SAISIE_MESSAGE}   accessibility_id=Text Entry dialog
${LOC_NOM}   id=io.appium.android.apis:id/username_edit
${LOC_NOTIFICATION}   accessibility_id=Notification
${LOC_AVEC_TEXTE}   accessibility_id=NotifyWithText
${LOC_MDP}  id=io.appium.android.apis:id/password_edit

*** Test Cases ***

test completion
  lancer l'application
  ${el11} =    Set Variable     accessibility_id=Views
  my Scroll   ${el11}
  Click Element    ${el11}
  ${el12} =    Set Variable     accessibility_id=Auto Complete
  Click Element    ${el12}
  ${el13} =    Set Variable     accessibility_id=1. Screen Top
  Click Element    ${el13}
  ${el19} =    Set Variable     id=io.appium.android.apis:id/edit
  Click Element    ${el19}
  Input Text    ${el19}    Ge
  @{finger} =    Create List    ${285}    ${663}
  @{positions} =    Create List    ${finger}
  Tap With Positions    ${100}    @{positions}
  Element Text Should Be   ${el19}  Germany

test bouton ON/OFF
  lancer l'application
  ${el1} =    Set Variable     accessibility_id=Views
  Click Element    ${el1}   
  ${el2} =    Set Variable     accessibility_id=Buttons
  Click Element    ${el2}
  ${el3} =    Set Variable     accessibility_id=Toggle
  Click Element    ${el3}
  Element Text Should Be  ${el3}  ON

  &{scriptArgument}    Create Dictionary    phoneNumber=0876565    action=call
  Execute Script    mobile: gsmCall    &{scriptArgument}
  &{scriptArgument}    Create Dictionary    phoneNumber=0876565    action=accept
  Execute Script    mobile:gsmCall    &{scriptArgument}
  sleep  2
  &{scriptArgument}    Create Dictionary    phoneNumber=0876565    action=cancel
  Execute Script    mobile:gsmCall    &{scriptArgument}
  &{scriptArgument}    Create Dictionary    seconds=${5}
  Execute Script    mobile: backgroundApp    &{scriptArgument}
	Wait Until Element Is Visible  ${el3}  5
  Element Text Should Be  ${el3}  ON

*** Keywords ***
lancer l'application
	Open Application	http://localhost:4723	platformName=Android	platformVersion=16	app=${app}	automationName=UIAutomator2

my Scroll
   [Arguments]	 ${elt}

   Swipe    start_x=15   start_y=200  end_x=15  end_y=100
   Element Should Be Visible   ${elt}

aller au menu app
  ${el1} =    Set Variable     accessibility_id=App
  Click Element    ${el1}
Saisir nom et mot de passe
  [Arguments]  ${nom}  ${mdp}
   Wait Until Element Is Visible   ${LOC_NOM}
  Input Text    ${LOC_NOM}    ${nom}
  ${el7} =    Set Variable     id=io.appium.android.apis:id/password_edit
  Input Text    ${el7}    ${mdp}
  ${el8} =    Set Variable     id=android:id/button1
  Click Element    ${el8}

aller menu dialog
  Click Element    ${LOC_SAISIE_MESSAGE}

 aller menu notification
   Click Element   ${LOC_NOTIFICATION}

selection avec texte
   Click Element   ${LOC_AVEC_TEXTE}

controler nom
  [Arguments]   ${elt}
     Wait Until Element Is Visible   ${LOC_NOM}
  Element Text Should Be   ${LOC_NOM}   ${elt}  

revenir en arrière
    &{scriptArgument}    Create Dictionary    keycode=${4}
  Execute Script    mobile: pressKey    &{scriptArgument}

aller au menu alerte
   ${el4} =    Set Variable     accessibility_id=Alert Dialogs
  Click Element    ${el4}

