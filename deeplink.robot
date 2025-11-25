*** Settings ***
Library       AppiumLibrary
*** Variables ***
${App}   /Users/dominiquemereaux/AndroidStudioProjects/MyApplication9/app/build/intermediates/apk/debug/app-debug.apk  
${Server}  http://localhost:4723
&{scriptArgument}       command=am    args=start -d 'android-app://com.example.myapplication/http/www.example.com/gizmos'
*** Test Cases ***
test deeplink
    lancer l'application
    sleep  5
    Execute Script    mobile:shell    &{scriptArgument}
    sleep  5
    Element Text Should Be     id=com.example.myapplication:id/textView2   Activité 2

*** Keywords ***
lancer l'application
	Open Application  ${Server}	 platformName=Android	platformVersion=10	deviceName=M10	app=${App}	automationName=UiAutomator2	
 