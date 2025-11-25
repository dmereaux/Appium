*** Settings ***
Library           AppiumLibrary
Library           String
Test Setup      ouvrir l'application
Test Teardown     Remove Application    dev.flutter.example.androidfullscreen

*** Variables ***
${flutter}      id=dev.flutter.example.androidfullscreen:id/launch_button
${exit}      accessibility_id=Exit this screen
${NBTap}      xpath=//android.view.View[@index="2"]
${Action}      accessibility_id=Tap me!


*** Test Cases ***
Test Case Name
    menu flutter
    ${nb}  recup nb tap
    tap me
    verifier increment de 1 ${nb}

*** Keywords ***
ouvrir l'application
        Open Application    http://127.0.0.1:4723    platformName=Android    appium:platformVersion=16    appium:app=/Users/dominiquemereaux/code/appium-robot-stag/flutter/app-debug.apk    appium:automationName=uiAutomator2    appium:settings[disableIdLocatorAutocompletion]=${True}    appium:ensureWebviewsHavePages=${True}    appium:nativeWebScreenshot=${True}    appium:newCommandTimeout=${3600}    appium:connectHardwareKeyboard=${True}
menu flutter
    Click Element    ${flutter}
recup nb tap
    Wait Until Element Is Visible      ${NBTap}    10s
    ${nbText}  Get Element Attribute   ${NBTap}  content-desc
    ${nb}  Fetch From Right    ${nbText}    ${SPACE}
    Log To Console    Number of taps: ${nb}
    RETURN    ${nb}
tap me
    Click Element    ${Action}
verifier increment de 1 ${nb}
    ${nb2}  Evaluate    expression=${nb} + 1
    ${nbText}  Get Element Attribute   ${NBTap}  content-desc
    Should Be Equal    ${nbText}  Taps: ${nb2}
