FROM gitpod/workspace-mysql

mysql -e "CREATE DATABASE my_db;"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root_password';"