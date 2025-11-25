
*** Settings ***
Library           AppiumLibrary   10


*** Variables ***
${REMOTE_URL}   http://trial.perfectomobile.com:80/nexperience/perfectomobile/wd/hub
${platformName}    Android
${appium:app}    PUBLIC:ExpenseAppVer1.0.apk
${appium:platformVersion}    16
${appium:appPackage}    io.perfecto.expense.tracker
${appium:autoLaunch}    true
${appium:autoInstrument}    true
${appium:ensureWebviewsHavePages}    true
${appium:nativeWebScreenshot}    true
&{perfecto}   securityToken=eyJhbGciOiJIUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICI2ZDM2NmJiNS01NDAyLTQ4MmMtYTVhOC1kODZhODk4MDYyZjIifQ.eyJpYXQiOjE2OTM0MDE0NDksImp0aSI6IjE2MGUyMThmLTczN2YtNDg0Ni1iNTA4LWJmN2E5Y2I4ZWJiYyIsImlzcyI6Imh0dHBzOi8vYXV0aDMucGVyZmVjdG9tb2JpbGUuY29tL2F1dGgvcmVhbG1zL3RyaWFsLXBlcmZlY3RvbW9iaWxlLWNvbSIsImF1ZCI6Imh0dHBzOi8vYXV0aDMucGVyZmVjdG9tb2JpbGUuY29tL2F1dGgvcmVhbG1zL3RyaWFsLXBlcmZlY3RvbW9iaWxlLWNvbSIsInN1YiI6Ijg3MzU2ZDk4LTIwMmMtNDZmZC1hNjNjLWVkNjE5ODIyOGVjOSIsInR5cCI6Ik9mZmxpbmUiLCJhenAiOiJvZmZsaW5lLXRva2VuLWdlbmVyYXRvciIsIm5vbmNlIjoiNWRhNWU4ZjItODVmMy00M2U0LTg0ODMtZGEzMWJkMDkxODVjIiwic2Vzc2lvbl9zdGF0ZSI6ImY0Y2M2ZDQ4LWM2YWEtNGU1NS04MzQ3LTNjOGVkMGIzMTQ2NiIsInNjb3BlIjoib3BlbmlkIG9mZmxpbmVfYWNjZXNzIHByb2ZpbGUgZW1haWwifQ.zyKTkD3os8Me_IcxfIpRMjCAcMEES2G-20hGpocpNBA
${appium:newCommandTimeout}    5000
${appium:connectHardwareKeyboard}    true

*** Test Cases ***
Test 
    Open Application    ${REMOTE_URL}   platformName=${platformName}  appium:app=${appium:app}  appium:platformVersion=${appium:platformVersion}  appium:appPackage=${appium:appPackage}  appium:autoLaunch=${appium:autoLaunch}  appium:autoInstrument=${appium:autoInstrument}  appium:ensureWebviewsHavePages=${appium:ensureWebviewsHavePages}  appium:nativeWebScreenshot=${appium:nativeWebScreenshot}  perfecto:options=${perfecto}  appium:newCommandTimeout=${appium:newCommandTimeout}  appium:connectHardwareKeyboard=${appium:connectHardwareKeyboard}
# id=io.perfecto.expense.tracker:id/login_email
    Sleep   10s
    Text Should Be Visible   Email*
    Sleep  10s
    Input Text    id=io.perfecto.expense.tracker:id/login_email    dom@toto.fr
# id=io.perfecto.expense.tracker:id/login_password
    Input Text    id=io.perfecto.expense.tracker:id/login_password    dom@toto.fr
# id=io.perfecto.expense.tracker:id/login_login_btn
    Click Element    id=io.perfecto.expense.tracker:id/login_login_btn
    Element Text Should Be   xpath=/hierarchy/android.widget.Toast   Invalid email or password


