import unittest
from appium import webdriver
from appium.webdriver.common.appiumby import AppiumBy

# For W3C actions
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.common.actions import interaction
from selenium.webdriver.common.actions.action_builder import ActionBuilder
from selenium.webdriver.common.actions.pointer_input import PointerInput


class MyTestCase(unittest.TestCase):

    def test_something(self):
        caps = {}
        caps["platformName"] = "Android"
        caps["appium:platformVersion"] = "8"
        caps["appium:deviceName"] = "M8"
        caps["appium:app"] = "/Users/dominiquemereaux/AndroidStudioProjects/Dice/app/build/outputs/apk/app-debug.apk"
        caps["appium:automationName"] = "UIAutomator2"
        caps["appium:appPackage"] = "com.example.dominiquemereaux.dice"
        caps["appium:ensureWebviewsHavePages"] = True
        caps["appium:nativeWebScreenshot"] = True
        caps["appium:newCommandTimeout"] = 3600
        caps["appium:connectHardwareKeyboard"] = True
        driver = webdriver.Remote("http://127.0.0.1:4723", caps)
        driver.implicitly_wait(5000)
        el1 = driver.find_element(by=AppiumBy.ID, value="com.example.dominiquemereaux.dice:id/button6")
        el1.click()
        el2 = driver.find_element(by=AppiumBy.ID, value="com.example.dominiquemereaux.dice:id/textTitle")

        self.assertEqual(el2.text, "6 sided dice")  # add assertion here


    def test_webView(self):
        caps = {}
        caps["platformName"] = "Android"
        caps["appium:platformVersion"] = "10"
        caps["appium:deviceName"] = "M10"
        caps["appium:app"] = "/Users/dominiquemereaux/AndroidStudioProjects/MyApplication5/app/build/outputs/apk/debug/app-debug.apk"
        caps["appium:automationName"] = "UIAutomator2"
        caps["appium:chromedriverExecutable"] = "/Users/dominiquemereaux/code/appium/chromedriver"
        caps["appium:ensureWebviewsHavePages"] = True
        caps["appium:nativeWebScreenshot"] = True
        caps["appium:newCommandTimeout"] = 3600
        caps["appium:connectHardwareKeyboard"] = True

        driver = webdriver.Remote("http://127.0.0.1:4723", caps)
        driver.switch_to.context('WEBVIEW_com.example.myapplication')
        x=driver.context
        print(x)
        el1 = driver.find_element(by=AppiumBy.XPATH, value="//div/p")
        self.assertEqual(el1.text, "'%23' is the percent code for ‘#‘")

if __name__ == '__main__':
    unittest.main()
