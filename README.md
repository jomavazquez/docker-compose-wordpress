# MySQL + WordPress + Nginx + Varnish + Redish

Hi! Here you'll find the docker-compose file for setting in your localhost a good environment based in the following stack: **MySQL**, **WordPress**, **Nginx**, **Varnish** and **Redis**.

Please read this documentation.

## 1. Folders structure

This is the structure used for your project:
```
ROOT: you'll find here docker-compose files (From here you need to run the previous command)
\ 

CONFIGURATION FILES / FOLDERS:
\config\
\config\database (your mysql database will be store here)
\config\nginx
\config\nginx\conf.d
\config\varnish

FILES FOR YOUR WORDPRESS SITE
\web\	
```

## 2. Environment variables

Rename the ".env_template" file to ".env" and then change the values with your own:
- PROJECT_NAME=myproject
- DOMAIN_NAME=myproject.test
- MYSQL_DATABASE=wp_mydatabase
- MYSQL_ROOT_PASSWORD=MyRooPassword
- MYSQL_USER=MyUser
- MYSQL_PASSWORD=MyPassword

Keep in mind "miproject.test" will be the url for your project. Do not forget include it in your host file like:
```
127.0.0.1	www.myproject.test
```
## 3. Nginx configuration

Take a look to the "website.conf" file placed in **\config\nginx\conf.d** folder.

If you deploy "mysql-wordpress-nginx-local.yml" you will need to leave listening the port 80.

If you deploy varnish, the port for nginx should be 8080.

Also you will need to change this line and use the same value in .env (DOMAIN_NAME):
```
server_name myproject.test www.myproject.test;
```
Same for this one in .env (PROJECT_NAME)
````
fastcgi_pass myproject:9000;
````

That's all.

## 4. Docker-composer files

You will find two different docker-composer files:
- mysql-wordpress-nginx-local.yml
- mysql-wordpress-varnish-nginx-local.yml

In both of them you will **need to change** the next path using the folder where you clone the project.
```
/Users/kiwi/Development/php/
```

Choose one of them to set up your environment, If you prefer using varnish for developing, just choose the second one.

And execute the command in your terminal:
```
docker-compose -f mysql-wordpress-varnish-nginx-local.yml up -d
```

#### Happy coding! :blush:

