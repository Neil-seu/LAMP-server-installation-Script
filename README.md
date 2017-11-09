# LAMP-server-installation-Script

<b>This script allows any arch based distro to install LAMP server. It is very painful to configure the LAMP server specially if anyone have to reinstall the whole operating system. So I personally decided to write an automatic script. 

N.B: This is only for practising web development locally. This is not recommended for commersial or production purpose. I provide a description how to configure mysql step for easy configuration. </b>

<b> Run the script by typing : sudo sh lamp_server_configuration.sh </b>

#####Setup MySQL/MariaDB root user password

As you may know, It is recommended to setup a password for database root user. As my script is for testing purpose, it's better to skip..

While running the following command, follow my steps:

mysql_secure_installation
#####Sample output:

NOTE: RUNNING ALL PARTS OF THIS SCRIPT IS RECOMMENDED FOR ALL MariaDB
 SERVERS IN PRODUCTION USE! PLEASE READ EACH STEP CAREFULLY!

In order to log into MariaDB to secure it, we'll need the current
password for the root user. If you've just installed MariaDB, and
you haven't set the root password yet, the password will be blank,
so you should just press enter here.

Enter current password for root (enter for none): ## Press Enter
OK, successfully used password, moving on...

Setting the root password ensures that nobody can log into the MariaDB
root user without the proper authorisation.

[ It may ask again just skip ]

Set root password? [Y/n]## Press n

Password updated successfully!
Reloading privilege tables..
 ... Success!

By default, a MariaDB installation has an anonymous user, allowing anyone
to log into MariaDB without having to have a user account created for
them. This is intended only for testing, and to make the installation
go a bit smoother. You should remove them before moving into a
production environment.

Remove anonymous users? [Y/n]## Press n
 ... Success!

Normally, root should only be allowed to connect from 'localhost'. This
ensures that someone cannot guess at the root password from the network.

Disallow root login remotely? [Y/n]## Press n
 ... Success!

By default, MariaDB comes with a database named 'test' that anyone can
access. This is also intended only for testing, and should be removed
before moving into a production environment.

Remove test database and access to it? [Y/n]## Press n

Reloading the privilege tables will ensure that all changes made so far
will take effect immediately.

Reload privilege tables now? [Y/n]## Press Y
 ... Success!

Cleaning up...

All done! If you've completed all of the above steps, your MariaDB
installation should now be secure.

Thanks for using MariaDB!
MariaDB has been installed and ready to use.
