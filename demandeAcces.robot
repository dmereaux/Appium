*** Settings ***
Library           AppiumLibrary
Test Teardown     Remove Application    com.example.localisation

*** Variables ***
# depend des versions d'android
&{scriptArgument}       command=am    args=startservice -e longitude 58 -e latitude 70 io.appium.settings/.LocationService
&{scriptArgument2}      command=pm    args=grant io.appium.settings android.permission.ACCESS_MOCK_LOCATION

*** Test Cases ***
Test Case Name
    ouvrir l'application
    set location  200  100
    menu localisation
    Autoriser la localisation
    Sleep  2
    set location  50  40
    Sleep  2
    Go Back
    menu localisation
    Sleep  2

*** Keywords ***
ouvrir l'application
        Open Application    http://127.0.0.1:4723    platformName=Android   gpsEnabled=true   appium:platformVersion=16    appium:app=/Users/dominiquemereaux/AndroidStudioProjects/localisation/app/build/outputs/apk/debug/app-debug.apk    appium:gpsEnabled=true    appium:automationName=UIAutomator2    appium:ensureWebviewsHavePages=${True}    appium:nativeWebScreenshot=${True}    appium:newCommandTimeout=${3600}    appium:connectHardwareKeyboard=${True} 
Autoriser la localisation
    ${el2} =    Set Variable     id=com.android.permissioncontroller:id/permission_allow_one_time_button
    Click Element    ${el2}
    #    ${el2} =    Set Variable     id=com.android.permissioncontroller:id/permission_allow_only_while_using_the_app
menu localisation
    Click Element    com.example.localisation:id/location_button    
