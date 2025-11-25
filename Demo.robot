*** Settings ***
Library           AppiumLibrary
Test Teardown     Close Application

*** Test Cases ***
Test Case Name
    Open Application    http://127.0.0.1:4723    platformName=Android    appium:platformVersion=10    appium:deviceName=M10    appium:app=/Users/dominiquemereaux/code/appium/appium-1.x/sample-code/apps/ApiDemos-debug.apk    appium:automationName=UiAutomator2    appium:appPackage=io.appium.android.apis    appium:ensureWebviewsHavePages=${True}    appium:nativeWebScreenshot=${True}    appium:newCommandTimeout=${3600}    appium:connectHardwareKeyboard=${True}
    ${el1} =    Set Variable     accessibility_id=Views
    Click Element    ${el1}
    ${el2} =    Set Variable     accessibility_id=ImageButton
    Click Element    ${el2}
    ${el3} =    Set Variable     xpath=//android.widget.LinearLayout/android.widget.ImageButton[1]
    Element Should Be Visible   ${el3}
