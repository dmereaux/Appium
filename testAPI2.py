import unittest
from appium import webdriver
from appium.webdriver.common.appiumby import AppiumBy
from appium.webdriver.common.mobileby import MobileBy
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.ui import WebDriverWait
from appium.options.android import UiAutomator2Options

capabilities = dict(
    platformName='Android',
    avdName = 'M10',
    automationName='uiautomator2',    
    app="//Users/dominiquemereaux/Downloads/PUBLIC/ExpenseAppVer1.0.apk",
    language='en',
    locale='US'
)
caps = {}
caps["automationName"] = "uiautomator2"
#caps["automationName"] = "Appium"
#caps["deviceName"] = "2C081FDH200L9G"
caps["platformName"] = "Android"
#caps["appium:app"] = "PUBLIC:ExpenseAppVer1.0.apk"
caps["appium:app"] = "//Users/dominiquemereaux/Downloads/PUBLIC/ExpenseAppVer1.0.apk"
caps["appium:platformVersion"] = "10"
caps["appium:appPackage"] = "io.perfecto.expense.tracker"
caps["appium:autoLaunch"] = True
caps["appium:autoInstrument"] = True
caps["appium:ensureWebviewsHavePages"] = True
caps["appium:nativeWebScreenshot"] = True
caps["perfecto:options"] = {"securityToken":"eyJhbGciOiJIUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICI2ZDM2NmJiNS01NDAyLTQ4MmMtYTVhOC1kODZhODk4MDYyZjIifQ.eyJpYXQiOjE2OTM0MDE0NDksImp0aSI6IjE2MGUyMThmLTczN2YtNDg0Ni1iNTA4LWJmN2E5Y2I4ZWJiYyIsImlzcyI6Imh0dHBzOi8vYXV0aDMucGVyZmVjdG9tb2JpbGUuY29tL2F1dGgvcmVhbG1zL3RyaWFsLXBlcmZlY3RvbW9iaWxlLWNvbSIsImF1ZCI6Imh0dHBzOi8vYXV0aDMucGVyZmVjdG9tb2JpbGUuY29tL2F1dGgvcmVhbG1zL3RyaWFsLXBlcmZlY3RvbW9iaWxlLWNvbSIsInN1YiI6Ijg3MzU2ZDk4LTIwMmMtNDZmZC1hNjNjLWVkNjE5ODIyOGVjOSIsInR5cCI6Ik9mZmxpbmUiLCJhenAiOiJvZmZsaW5lLXRva2VuLWdlbmVyYXRvciIsIm5vbmNlIjoiNWRhNWU4ZjItODVmMy00M2U0LTg0ODMtZGEzMWJkMDkxODVjIiwic2Vzc2lvbl9zdGF0ZSI6ImY0Y2M2ZDQ4LWM2YWEtNGU1NS04MzQ3LTNjOGVkMGIzMTQ2NiIsInNjb3BlIjoib3BlbmlkIG9mZmxpbmVfYWNjZXNzIHByb2ZpbGUgZW1haWwifQ.zyKTkD3os8Me_IcxfIpRMjCAcMEES2G-20hGpocpNBA"}
caps["appium:newCommandTimeout"] = 3600
caps["appium:connectHardwareKeyboard"] = True

options = UiAutomator2Options()
options.platformVersion = '10'
options.udid = 'emulator-5554'
driver= webdriver.Remote(f'http://127.0.0.1:4723', options=options)

appium_server_url = 'http://localhost:4723'


class TestAppium(unittest.TestCase):
    def setUp(self) -> None:
        self.driver= webdriver.Remote(appium_server_url, options=options)
        
#        self.driver = webdriver.Remote(appium_server_url, capabilities)
#         self.driver = webdriver.Remote("http://trial.perfectomobile.com:80/nexperience/perfectomobile/wd/hub", caps)


    def tearDown(self) -> None:
        if self.driver:
            self.driver.quit()

    def test_coucou(self) -> None:
        self.driver.implicitly_wait(5)

        wait = WebDriverWait(self.driver, 30)
        email = wait.until(EC.presence_of_element_located((AppiumBy.ID, "io.perfecto.expense.tracker:id/login_email")))
        email= self.driver.find_element(AppiumBy.ID, value="io.perfecto.expense.tracker:id/login_email")
#        email.send_keys('test@perfecto.com')
        email.send_keys('testperfecto.com')
        pwd = self.driver.find_element(AppiumBy.ID, value="io.perfecto.expense.tracker:id/login_password")
        pwd.send_keys('test123')
        login = wait.until(EC.presence_of_element_located((AppiumBy.ID, "io.perfecto.expense.tracker:id/login_login_btn")))
        login.click()
        toast=wait.until(EC.presence_of_element_located((AppiumBy.XPATH,"/hierarchy/android.widget.Toast")))
        print(toast.text)
        assert  toast.text == "Invalid email or password"

if __name__ == '__main__':
    unittest.main()