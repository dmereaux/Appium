# This sample code uses the Appium python client v2
# pip install Appium-Python-Client
# Then you can paste this into a file and simply run with Python

from appium import webdriver
from appium.webdriver.common.appiumby import AppiumBy

# For W3C actions
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.common.actions import interaction
from selenium.webdriver.common.actions.action_builder import ActionBuilder
from selenium.webdriver.common.actions.pointer_input import PointerInput

caps = {}
caps["platformName"] = "Android"
caps["appium:app"] = "PUBLIC:ExpenseAppVer1.0.apk"
caps["appium:platformVersion"] = "10"
caps["appium:appPackage"] = "io.perfecto.expense.tracker"
caps["appium:autoLaunch"] = True
caps["appium:autoInstrument"] = True
caps["appium:ensureWebviewsHavePages"] = True
caps["appium:nativeWebScreenshot"] = True
caps["perfecto:options"] = {"securityToken":"eyJhbGciOiJIUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICI2ZDM2NmJiNS01NDAyLTQ4MmMtYTVhOC1kODZhODk4MDYyZjIifQ.eyJpYXQiOjE2OTM0MDE0NDksImp0aSI6IjE2MGUyMThmLTczN2YtNDg0Ni1iNTA4LWJmN2E5Y2I4ZWJiYyIsImlzcyI6Imh0dHBzOi8vYXV0aDMucGVyZmVjdG9tb2JpbGUuY29tL2F1dGgvcmVhbG1zL3RyaWFsLXBlcmZlY3RvbW9iaWxlLWNvbSIsImF1ZCI6Imh0dHBzOi8vYXV0aDMucGVyZmVjdG9tb2JpbGUuY29tL2F1dGgvcmVhbG1zL3RyaWFsLXBlcmZlY3RvbW9iaWxlLWNvbSIsInN1YiI6Ijg3MzU2ZDk4LTIwMmMtNDZmZC1hNjNjLWVkNjE5ODIyOGVjOSIsInR5cCI6Ik9mZmxpbmUiLCJhenAiOiJvZmZsaW5lLXRva2VuLWdlbmVyYXRvciIsIm5vbmNlIjoiNWRhNWU4ZjItODVmMy00M2U0LTg0ODMtZGEzMWJkMDkxODVjIiwic2Vzc2lvbl9zdGF0ZSI6ImY0Y2M2ZDQ4LWM2YWEtNGU1NS04MzQ3LTNjOGVkMGIzMTQ2NiIsInNjb3BlIjoib3BlbmlkIG9mZmxpbmVfYWNjZXNzIHByb2ZpbGUgZW1haWwifQ.zyKTkD3os8Me_IcxfIpRMjCAcMEES2G-20hGpocpNBA"}
caps["appium:newCommandTimeout"] = 3600
caps["appium:connectHardwareKeyboard"] = True

driver = webdriver.Remote("http://trial.perfectomobile.com:80/nexperience/perfectomobile/wd/hub", caps)


driver.quit()