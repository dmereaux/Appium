*** Settings ***
Library       AppiumLibrary
Test Setup    lancer l'application
Test Teardown    Remove Application    com.example.myapplication
 
*** Variables ***
${platformName}    Android  
${appium:platformVersion}    16
${app}    /Users/dominiquemereaux/AndroidStudioProjects/MyApplication5/app/build/outputs/apk/debug/app-debug.apk
${appium:chromedriverExecutable}    /Users/dominiquemereaux/code/appium/chromedriver

${appium:automationName}    UiAutomator2
${appium:ensureWebviewsHavePages}    true
${appium:nativeWebScreenshot}    true
${appium:newCommandTimeout}    3600
${appium:connectHardwareKeyboard}    true
*** Test Cases ***
test_webWiew
    ${x}  Get Source
    Log To Console  ${x}
#    recuperer le contexte webview
    Aller sur la page webview
    Vérifier le texte affiché

*** Keywords ***
recuperer le contexte webview
    Switch To Context    NATIVE_APP
    ${el1} =    Set Variable     android=UiSelector().text("'%23' is the percent code for ‘#‘")
    element text should be   ${el1}  '%23' is the percent code for ‘#‘


lancer l'application
	Open Application	http://localhost:4723	platformName=${platformName}	platformVersion=${appium:platformVersion}	app=${app}	automationName=UIAutomator2	  chromedriverExecutable=${appium:chromedriverExecutable}
Aller sur la page webview
 #   Switch To Context    WEBVIEW_com.example.myapplication
    @{contextes}  Get Contexts
    FOR    ${ctx}    IN    @{contextes}
        Log To Console  ${ctx}
    END    
    Switch To Context    WEBVIEW
Vérifier le texte affiché
    Page Should Contain Text   essai
    element text should be   xpath=//div/p  '%23' is the percent code for ‘#‘
