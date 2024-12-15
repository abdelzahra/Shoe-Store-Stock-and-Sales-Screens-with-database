# Shoe-Store-Stock-and-Sales-Screens-with-database
JDBC and Stored Procedures – Interfacing with a Database through a Java GUI

The Shoe Store Stock and Sales Screens
A new company that sells shoes has recently popped up! Although they can manage their inventory
manually, their customers have complained that it is too difficult to place orders via pen and paper. At
the same time, management is always looking for a better way to save time, so an electronic form for
managing inventory would be beneficial. Thus, they want you to help create an application that will allow
users to place orders or update the inventory – only the guests can place orders, and only the
management can update the inventory. Thankfully, the general GUI is already created – it just needs
some functionality to be 100% complete.
Your job is to modify the provided GUI such that it will allow users to interact with the database. This
means you will need to create stored procedures that perform SELECT, INSERT, UPDATE, and/or DELETE
statements! Also thankfully, the database itself is already created, but there is almost no data inside. It
is up to you to allow the management users to populate the database through the GUI, and to let
customers place orders.
Check Canvas for a SQL file that will setup the table structures for you – DO NOT CHANGE THE SCHEMA
NAME OR TABLES! Your GUI must work with the schema and tables provided. You will, however, create
stored procedures. The SQL file also inserts one new fictional account to the “Users” table, for the
“Admin”, which has the role “1”. This row is necessary; some of the GUI screens depend on this.
Also provided for you are two Java class files, which you can use to complete the project. In the GUI class
file, scroll down to about line 515; here is where you will find the functions that you need to complete, by
calling stored procedures from the code.
Notes and Assumptions
1. The “Users” table will allow you to store username and password information that is not
encrypted; while this is not a best practice, we will use this for the purpose of this project.
2. The “Role” attribute of the “Users” table will either have a 1 or a 2. A value of 1 means the user
account is an admin; a value of 2 means the user account is a customer. There will only ever be
one admin account, which is already provided to you. All other accounts will be customers.
3. The connection string provided in the Java class refers to the schema called “FinalGUIProject”.
The credentials to connect to the database should be guest/guest. 


A description of the expected behavior accompanies each function name.
Note that each function listed here will correspond to a unique Stored Procedure.
1. RegisterNewUser() – this function is called when the Register button is clicked on the Register
New User screen. This function connects to the database and calls a stored procedure that
will handle adding a new user to the “User” table. Recall that you are NOT attempting to modify
the Users and Privileges through this function; the “User” table is fictional data that will store
credentials.
2. LoginWithCreds() – this function is called when the Login button is clicked on the Login screen.
This function should connect to the database and call a stored procedure that checks to see if the
username/password pair exists in the Users table. If it does, then the ID, username, and role of
that row should be captured.
3. GetAllProducts() – this function is called when the user loads up the Order screen. This function
should connect to the database and call a stored procedure to get a list of all products stored in
the “Product” table. The product names, ids, and prices should be stored in lists (one list for each
column). The list of product names will then be used to populate the ComboBox on the Order
screen. The lists of IDs and Prices are used to fill labels as well as insert data into the database.
4. GetSalesTotal() – this function is called when the user loads up the Sales screen. This function
should connect to the database and call a stored procedure to simply get the sum of all sales
stored in the “Sale” table.
5. SubmitOrder() – this function is called when the Submit button is clicked on the Order screen.
This function should connect to the database and call a stored procedure that inserts a new record
into the “Sale” table, using data provided by the user.
6. SubmitNewProduct() – this function is called when the Submit button is clicked on the Inventory
screen. This function should connect to the database and call a stored procedure that inserts a
new record into the “Product” table, using data provided by the user.

