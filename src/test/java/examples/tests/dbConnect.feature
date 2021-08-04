Feature: Connect to database


Background:
    # use jdbc to validate
* def config = { username: 'test@karatedemo', password: 'Rainbow123', url: 'jdbc:sqlserver://karatedemo.database.windows.net:1433;databaseName=sample', driverClassName: 'com.microsoft.sqlserver.jdbc.SQLServerDriver' }
* def DbUtils = Java.type('examples.tests.DbUtils')
* def db = new DbUtils(config)

Scenario: query customer table
    * karate.logger.info('Test started')
#* def employees = db.readRows('select * from office')

* def customer = db.readRows('SELECT * FROM SalesLT.Customer')
# * def selectQuery = db.readRows('SELECT TOP (10) pc.Name as CategoryName, p.name as ProductName FROM [SalesLT].[ProductCategory] pc JOIN [SalesLT].[Product] p ON pc.productcategoryid = p.productcategoryid')
#* def vehicles = db.readRows(‘SELECT * FROM vehicles’)
# Then match vehicles contains {vehicle_id:1, availability:’true’, type:#ignore }
# * def vehicle = db.readRow(‘SELECT * FROM vehicles D WHERE D.vehicle_id = 2;’)
# Then match vehicle.availability == ‘false’
# * def test = db.readValue(‘SELECT ID FROM vehicles D WHERE D.ID = ‘ + 3;’)
# * match test == id

Then print customer
* karate.logger.info('Test finished')

Scenario: query product category

    * def selectQuery = db.readRows('SELECT TOP (10) pc.Name as CategoryName, p.name as ProductName FROM [SalesLT].[ProductCategory] pc JOIN [SalesLT].[Product] p ON pc.productcategoryid = p.productcategoryid')
    Then print selectQuery

Scenario: update table

    * def query = read('insert_query.txt')
    * db.insertRows(query)
    Then print query
   