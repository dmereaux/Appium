*** Settings ***
Library       AppiumLibrary  5
#Test Teardown   Close Application

*** Variables ***
${platformName}    Android
${appium:platformVersion}    8
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
test_toaster

    [Tags]  regression
    Set Appium Timeout    5
    lancer l'application
    Wait Until Page Contains Element  accessibility_id=Views  10
    Click Element   accessibility_id=Views
    Swipe    start_x=491    start_y=2190    end_x=581    end_y=441
    click element  accessibility_id=Popup Menu
    Wait Until Page Contains Element  xpath=//android.widget.Button[@content-desc="Make a Popup!"]   5
    click element   accessibility_id=Make a Popup!
    Wait Until Page Contains Element    xpath=//android.widget.LinearLayout[1]/android.widget.RelativeLayout/android.widget.TextView
    click element    xpath=//android.widget.LinearLayout[1]/android.widget.RelativeLayout/android.widget.TextView   
    Wait Until Page Contains   Clicked   5

Test_Date
    lancer l'application
    Wait Until Page Contains Element  accessibility_id=Views  10
    Click Element   accessibility_id=Views
    Click Element   accessibility_id=Date Widgets
    Click Element    accessibility_id=2. Inline
    Wait Until Page Contains Element    id=android:id/hours   5
    click element   id=android:id/hours
    Wait Until Page Contains Element   accessibility_id=5   5
    Click Element   accessibility_id=5
    Click Element   accessibility_id=20
    element text should be   id=android:id/hours  5
    element text should be   id=android:id/minutes  20

Test_alert

    Open Application    http://127.0.0.1:4723    platformName=Android    appium:platformVersion=10    appium:deviceName=M10    appium:app=/Users/dominiquemereaux/code/appium/appium-1.x/sample-code/apps/ApiDemos-debug.apk    appium:automationName=UiAutomator2    appium:appPackage=io.appium.android.apis    appium:ensureWebviewsHavePages=${True}    appium:nativeWebScreenshot=${True}    appium:newCommandTimeout=${3600}    appium:connectHardwareKeyboard=${True}
    ${el2} =    Set Variable     accessibility_id=App
    Tap With Number Of Taps    ${el2}   1  1
    ${el3} =    Set Variable     accessibility_id=Alert Dialogs
    Click Element    ${el3}
    ${el4} =    Set Variable     accessibility_id=OK Cancel dialog with a message
    Click Element    ${el4}
    ${el5} =    Set Variable     id=android:id/button1
    Click Element    ${el5}

Test_scroll
    lancer l'application
    Wait Until Page Contains Element  accessibility_id=Views  10
    Click Element   accessibility_id=Views
    wait until keyword succeeds   10   1 s  my Scroll	 accessibility_id=ScrollBars
	
Test Alertes
     lancer l'application
   ${el1} =    Set Variable     accessibility_id=App
      Click Element    ${el1}
    ${el2} =    Set Variable     accessibility_id=Alert Dialogs
    Click Element    ${el2}
    ${el3} =    Set Variable     accessibility_id=Repeat alarm
    Click Element    ${el3}
    ${el4} =    Set Variable     xpath=//android.widget.CheckedTextView[@resource-id="android:id/text1" and @text="Every Monday"]
    Click Element    ${el4}
    ${el5} =    Set Variable     id=android:id/button1
    Click Element    ${el5}
    ${el6} =    Set Variable     accessibility_id=Repeat alarm
    Click Element    ${el6}
    Element Should Be Enabled   xpath=//android.widget.CheckedTextView[@resource-id="android:id/text1" and @text="Every Monday"]
    	
Notifications
    lancer l'application
    ${el1} =    Set Variable     accessibility_id=App
    Click Element    ${el1}
    ${el2} =    Set Variable     accessibility_id=Notification
    Click Element    ${el2}
    ${el3} =    Set Variable     accessibility_id=Status Bar
    Click Element    ${el3}
    ${el4} =    Set Variable     accessibility_id=Clear notification
    Click Element    ${el4}
    ${el5} =    Set Variable     id=io.appium.android.apis:id/happy
    Click Element    ${el5}
    Execute Script    mobile: openNotifications
    Element Should Be Visible   //android.widget.TextView[@resource-id="android:id/app_name_text" and @text="API Demos"]
Other toaster
    lancer l'application
    ${el1} =    Set Variable     accessibility_id=App
    Click Element    ${el1}
    ${el2} =    Set Variable     accessibility_id=Notification
    Click Element    ${el2}
    ${el3} =    Set Variable     accessibility_id=NotifyWithText
    Click Element    ${el3}
     ${el4} =    Set Variable     accessibility_id=Show Long Notification
    Click Element    ${el4}
#    Wait Until Element Is Visible     class=android.widget.Toast  5
     Wait Until Page Contains  This is a long notification. See, you might need a second more to read it.

Tester saisie
    lancer l'application
    aller au menu app
    aller au menu alerte
    aller menu dialog
    Saisir nom et mot de passe   fdaueyfd   efuzrhyf
    aller menu dialog
    controler nom  fdaueyfd

# cliquer avec positions
Test linkify
  lancer l'application
  ${el1} =    Set Variable     accessibility_id=Text
  Click Element    ${el1}
  ${el2} =    Set Variable     accessibility_id=Linkify
  Click Element    ${el2}
  @{finger} =    Create List    ${872}    ${1640}
  @{positions} =    Create List    ${finger}
  Tap With Positions    ${100}    @{positions}
test completion
  lancer l'application
  aller au menu views
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
  aller au menu views
  aller au menu bouton
  cliquer sur le bouton ON-OFF
  La valeur doit etre a ON
  Faire un appel
  Mettre en arriere plan
  La valeur doit etre a ON

*** Keywords ***
lancer l'application
	Open Application	http://localhost:4723	platformName=Android	platformVersion=8	app=${app}	automationName=UIAutomator2

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
aller au menu views
  ${el1} =    Set Variable     accessibility_id=Views
  Click Element    ${el1}  
aller au menu bouton
  ${el2} =    Set Variable     accessibility_id=Buttons
  Click Element    ${el2}
cliquer sur le bouton ON-OFF
  ${el3} =    Set Variable     accessibility_id=Toggle
  Click Element    ${el3}

La valeur doit etre a ON
  ${el3} =    Set Variable     accessibility_id=Toggle
  	Wait Until Element Is Visible  ${el3}  5
  Element Text Should Be  ${el3}  ON
Faire un appel
  &{scriptArgument}    Create Dictionary    phoneNumber=0876565    action=call
  Execute Script    mobile: gsmCall    &{scriptArgument}
  &{scriptArgument}    Create Dictionary    phoneNumber=0876565    action=accept
  Execute Script    mobile:gsmCall    &{scriptArgument}
  sleep  2
  &{scriptArgument}    Create Dictionary    phoneNumber=0876565    action=cancel
  Execute Script    mobile:gsmCall    &{scriptArgument}
Mettre en arriere plan
  &{scriptArgument}    Create Dictionary    seconds=${5}
  Execute Script    mobile: backgroundApp    &{scriptArgument}
