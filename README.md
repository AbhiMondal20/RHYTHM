# Hospital-Management-System-HTML
For Sql server connection download php sql server connecter
https://go.microsoft.com/fwlink/?linkid=2258816
Video Link: https://youtu.be/XLTkcB_T8Mo?si=S00rV5GTg3PHjE7W


# For php.ini file
To resolve this issue, you need to enable the sqlsrv extension in your PHP configuration. Here are the general steps to do this:

Locate the PHP.ini file: Find the PHP configuration file (php.ini). The location of this file can vary depending on your system setup. You can often find it in the PHP installation directory or specified in your web server configuration.

Enable the sqlsrv extension: Look for the line ;extension=sqlsrv or ;extension=php_sqlsrv.dll in the PHP.ini file. Remove the leading semicolon (;) to uncomment the line.

Restart your web server: After making this change, you need to restart your web server for the changes to take effect. This ensures that PHP reloads with the updated configuration.

Once you've completed these steps, the sqlsrv_connect() function should be available, and you should be able to establish a connection to your Microsoft SQL Server database.

