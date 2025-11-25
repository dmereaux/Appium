
# This sample code uses the Appium robot client
# pip install robotframework-appiumlibrary
# Then you can paste this into a file and simply run with robot
#
#  more keywords on: http://serhatbolsu.github.io/robotframework-appiumlibrary/AppiumLibrary.html
#
# if your tests fails saying 'did not match any elements' consider use 'wait activity' or 
# 'wait until page contains element' before a click command 

*** Settings ***
Library           AppiumLibrary
Test Teardown     Close Application
#Suite Teardown    Close Application

*** Variables ***
${REMOTE_URL}   http://127.0.0.1:4723

${platformName}    iOS
${appium:app}    /Users/dominiquemereaux/Katalon Studio/essaiIOS2/App/Your-First-iOS-App/Coffee Timer/build/Release-iphonesimulator/Coffee Timer.app
${appium:app2}   /Users/dominiquemereaux/Library/Developer/Xcode/DerivedData/BMI_Calculator-dvdsawwmingmkzatmrpbfvezgsfu/Build/Products/Debug-iphonesimulator/BMI Calculator.app
${appium:automationName}    XCUITest
${appium:deviceName}    iPad Air 13-inch (M2)
${appium:includeSafariInWebviews}    true
${appium:newCommandTimeout}    3600
${appium:connectHardwareKeyboard}    true

*** Test Cases ***
Café
        Open Application    ${REMOTE_URL}     platformName=${platformName}  appium:app=${appium:app}  appium:automationName=${appium:automationName}  appium:deviceName=${appium:deviceName}  appium:includeSafariInWebviews=${appium:includeSafariInWebviews}  appium:newCommandTimeout=${appium:newCommandTimeout}  appium:connectHardwareKeyboard=${appium:connectHardwareKeyboard}
        # accessibility_id=Colombien
        Click Element    accessibility_id=Colombien
        Element text should be   xpath=//XCUIElementTypeStaticText[@name="Commence"]   Commence
modifier temps
   Open Application    ${REMOTE_URL}     platformName=${platformName}  appium:app=${appium:app}  appium:automationName=${appium:automationName}  appium:deviceName=${appium:deviceName}  appium:includeSafariInWebviews=${appium:includeSafariInWebviews}  appium:newCommandTimeout=${appium:newCommandTimeout}  appium:connectHardwareKeyboard=${appium:connectHardwareKeyboard}

# accessibility_id=Colombien
    Click Element    accessibility_id=Colombien
# accessibility_id=Modifier
    Click Element    accessibility_id=Modifier
# xpath=//XCUIElementTypeApplication[@name="ChronoCafé"]/XCUIElementTypeWindow/XCUIElementTypeOther[2]/XCUIElementTypeOther[2]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeSlider[1]
    Input Text    xpath=//XCUIElementTypeApplication[@name="ChronoCafé"]/XCUIElementTypeWindow/XCUIElementTypeOther[2]/XCUIElementTypeOther[2]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeSlider[1]    0.2
# xpath=//XCUIElementTypeApplication[@name="ChronoCafé"]/XCUIElementTypeWindow/XCUIElementTypeOther[2]/XCUIElementTypeOther[2]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeSlider[2]
    Input Text    xpath=//XCUIElementTypeApplication[@name="ChronoCafé"]/XCUIElementTypeWindow/XCUIElementTypeOther[2]/XCUIElementTypeOther[2]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeSlider[2]    0.3
# accessibility_id=OK
    Click Element    accessibility_id=OK
# accessibility_id=1:17
    Element Text Should Be   accessibility_id=1:17    1:17
