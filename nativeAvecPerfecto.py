import os
import traceback
import webbrowser

from appium.webdriver.common.mobileby import MobileBy
from selenium import webdriver
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.ui import WebDriverWait

def main():
    # 1. Replace <<cloud name>> with your perfecto cloud name (e.g. demo is the cloudName of demo.perfectomobile.com).
    cloudName = "trial"

    capabilities = {
        # 2. Replace <<security token>> with your perfecto security token.
        'securityToken' : "eyJhbGciOiJIUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICI2ZDM2NmJiNS01NDAyLTQ4MmMtYTVhOC1kODZhODk4MDYyZjIifQ.eyJpYXQiOjE2OTM0MDE0NDksImp0aSI6IjE2MGUyMThmLTczN2YtNDg0Ni1iNTA4LWJmN2E5Y2I4ZWJiYyIsImlzcyI6Imh0dHBzOi8vYXV0aDMucGVyZmVjdG9tb2JpbGUuY29tL2F1dGgvcmVhbG1zL3RyaWFsLXBlcmZlY3RvbW9iaWxlLWNvbSIsImF1ZCI6Imh0dHBzOi8vYXV0aDMucGVyZmVjdG9tb2JpbGUuY29tL2F1dGgvcmVhbG1zL3RyaWFsLXBlcmZlY3RvbW9iaWxlLWNvbSIsInN1YiI6Ijg3MzU2ZDk4LTIwMmMtNDZmZC1hNjNjLWVkNjE5ODIyOGVjOSIsInR5cCI6Ik9mZmxpbmUiLCJhenAiOiJvZmZsaW5lLXRva2VuLWdlbmVyYXRvciIsIm5vbmNlIjoiNWRhNWU4ZjItODVmMy00M2U0LTg0ODMtZGEzMWJkMDkxODVjIiwic2Vzc2lvbl9zdGF0ZSI6ImY0Y2M2ZDQ4LWM2YWEtNGU1NS04MzQ3LTNjOGVkMGIzMTQ2NiIsInNjb3BlIjoib3BlbmlkIG9mZmxpbmVfYWNjZXNzIHByb2ZpbGUgZW1haWwifQ.zyKTkD3os8Me_IcxfIpRMjCAcMEES2G-20hGpocpNBA",

        # 3. Set device capabilities.
        'platformName': 'Android',
        'platformVersion': '13',
     #   'manufacturer': 'Samsung',
     #   'model': 'Galaxy Note 20',

        # 4. Set Perfecto Media repository path of App under test.
        'app': 'PUBLIC:ExpenseAppVer1.0.apk',

        # 5. Set the unique identifier of your app
        'appPackage': 'io.perfecto.expense.tracker',

        # Set other capabilities.
        'enableAppiumBehavior': True, # Enable new architecture of Appium
        'autoLaunch': True, # Whether to have Appium install and launch the app automatically.
        'autoInstrument': True, # To work with hybrid applications, install the iOS/Android application as instrumented.
        # 'fullReset': false, # Reset app state by uninstalling app
        'takesScreenshot': False,
        'screenshotOnError': True,
        'openDeviceTimeout': 5
    }
    # Initialize the Appium driver
    driver = webdriver.Remote('https://' + cloudName + '.perfectomobile.com/nexperience/perfectomobile/wd/hub', capabilities)
    # set implicit wait time
    driver.implicitly_wait(5)

    error = None
    wait = WebDriverWait(driver, 30)

    testStart(driver, "Native Python Android Sample")
    
    ##
    #############################
    ### Your test starts here. If you test a different app, you need to modify the test steps accordingly. ###
    #############################
    ##
    
    try:
        stepStart(driver, "Enter email")
        email = wait.until(EC.presence_of_element_located((MobileBy.ID, "io.perfecto.expense.tracker:id/login_email")))
        email.send_keys('test@perfecto.com')
        stepEnd(driver)

        stepStart(driver, "Enter password")
        password = wait.until(EC.presence_of_element_located((MobileBy.ID, "io.perfecto.expense.tracker:id/login_password")))
        password.send_keys('test123')
        stepEnd(driver)

        stepStart(driver, "Click login")
        login = wait.until(EC.presence_of_element_located((MobileBy.ID, "io.perfecto.expense.tracker:id/login_login_btn")))
        login.click()
        stepEnd(driver)

        stepStart(driver, "Add expense")
        add = wait.until(EC.presence_of_element_located((MobileBy.ID, "io.perfecto.expense.tracker:id/list_add_btn")))
        add.click()
        stepEnd(driver)

        stepStart(driver, "Select head")
        head = wait.until(EC.presence_of_element_located((MobileBy.ID, "io.perfecto.expense.tracker:id/input_layout_head")))
        head.click()
        flight = wait.until(EC.presence_of_element_located((MobileBy.XPATH, '//*[@text="Flight"]')))
        flight.click()
        stepEnd(driver)

        stepStart(driver, "Enter amount")
        amount = wait.until(EC.presence_of_element_located((MobileBy.ID, "io.perfecto.expense.tracker:id/add_amount")))
        amount.send_keys('100')
        stepEnd(driver)

        stepStart(driver, "Save expense")
        save = wait.until(EC.presence_of_element_located((MobileBy.ID, "io.perfecto.expense.tracker:id/layout_buttons")))
        save.click()
        stepEnd(driver)

        stepStart(driver, "Verify alert")
        expectedText = "Select Currency"
        wait.until(EC.presence_of_element_located((MobileBy.XPATH, "//*[@text='"+expectedText+"']")))
        stepEnd(driver)
    except Exception as e:
        error = traceback.format_exc()
    
    ##
    #############################
    ### Your test ends here. ###
    #############################
    ##
    
    testEnd(driver, error)
    reportURL = driver.capabilities.get('testGridReportUrl') + "&onboardingJourney=automated&onboardingDevice=nativeApp"

    # Quits the driver
    driver.quit()

    print("\nOpen this link to continue with the guide: " + reportURL + "\n")

    # Launch browser with the Report URL
    webbrowser.open(reportURL)

################################################################################
# HELPER FUNCTIONS
################################################################################

def testStart(driver, testName):
    driver.execute_script("mobile:test:start", {"name": testName})

def testEnd(driver, error):
    params = {
        "success": False if error != None else True,
        "failureDescription": error
    }
    driver.execute_script("mobile:test:end", params)

def stepStart(driver, stepName):
    driver.execute_script("mobile:step:start", {"name": stepName})

def stepEnd(driver):
    driver.execute_script("mobile:step:end")

def stepAssert(driver, message):
    driver.execute_script("mobile:status:assert", {
        "status": False, "message": message})

################################################################################
# MAIN ENTRY POINT
################################################################################

if __name__ == '__main__':
    main()
