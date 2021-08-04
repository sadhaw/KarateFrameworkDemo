Feature: Sample Banking Application Tests

Background:
	* call read 'data.json'
	#* configure driver = { type: 'chrome' }
	#* configure driver = { type: 'geckodriver' }
	#* configure driver = { type: 'msedge' }
	* driver baseURL
	#* def username = input_username
Scenario: Create account and transfer funds
	* maximize()
    And delay(3000)
	And input(locators.input_username,usr)
	And input(locators.input_password,pwd)
	And delay(3000)
	Then click(locators.button_login)
	* waitUntil("document.readyState == 'complete'")
	* match text(locators.text_welcome) == txtWelcome
	And click(locators.link_newaccount) 
	And select(locators.drop_accounttype, drpAcntType)
	And delay(3000)
	And select(locators.drop_accountnumber, drpAcntNmbr)
	And delay(2000)
	Then click(locators.button_openaccount)
	And delay(2000)
	* match text(locators.text_newaccount) == txtNewAcnt
	* click(locators.link_transferfunds)
	* match text(locators.text_transferfunds) == txtTrnfrFnds
	And input(locators.input_amount, nmbrAmnt)
	And delay(2000)
	And select(locators.drop_fromaccount, drpFrmAcnt)
	And delay(2000)
	And select(locators.drop_toaccount, drpToAcnt)
	And delay(2000)
	Then click(locators.button_transfer)
	And delay(2000)
	* match text(locators.text_transfercomplete) == txtTrnfrCmplt
