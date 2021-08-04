@ignore
Feature: Make Appointment for Doctor

Background:
	* configure driver = { type: 'chrome' }
@ignore
	Scenario: Login Scenario
		#Given driver 'https://katalon-demo-cura.herokuapp.com/'
		Given driver 'https://parabank.parasoft.com/'
		* maximize()
		And delay(3000)
		And click('#btn-make-appointment')
		And input('#txt-username','John Doe')
		And input('#txt-password','ThisIsNotAPassword')
		And delay(3000)
		When click('#btn-login')
		* waitUntil("document.readyState == 'complete'")
		* screenshot()
		* def urldriver = driver.url
		* print urldriver
		And delay(3000)
		# Then click('#combo_facility > option:nth-child(3)')
		And select('select[id=combo_facility]', 2)
		And delay(3000)
		Then click('#chk_hospotal_readmission')
		And delay(3000)
		Then click('#appointment > div > div > form > div:nth-child(3) > div > label:nth-child(2)')
		And delay(3000)
		Then input('#txt_visit_date',"28/07/2021")
		And delay(3000)
		Then input('#txt_comment',"Pain in Eye")
		And delay(3000)
		Then click('#btn-book-appointment')
		* waitUntil("document.readyState == 'complete'")
		And match text('#comment') == 'Pain in Eye'
		* close()





