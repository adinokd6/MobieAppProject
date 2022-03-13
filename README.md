# Guide for installing ruby, rails and postgresql
## Virtual machine specs:
    user: ubuntu
    password: admin
    database user: appadmin

### Before all
1. Update your packages. In terminal
    **sudo apt-get update**
    **sudo apt-get upgrade**
2. Reboot your system
3. After booting first what we need to do is to install very important packages which allow you to install for example virtualBox addons. To do this in terminal:
    **sudo apt-get update**
    **sudo apt-get install build-essential gcc make perl         dkms**
    **reboot**


#### Install Ruby
1. First step
    Download three sh files
    Open terminal and run commands in exact order:
    chmod +xrw ruby.sh
    chmod +xrw certificate.sh
    chmod +xrw packages.sh
    ![](https://i.imgur.com/kXQ47vk.png)
2. Now we need to install ruby. Enter following command in terminal:
    **bash ruby.sh**
#### Connect with your github account
1. Add key to your github account
    a)Generate certificate:
    Run following command:
    bash certificate.sh
    
    then type your github name and github email:
    ![](https://i.imgur.com/qPOtd3z.png)
    Nexy you will be shown such command:
    ![](https://i.imgur.com/OYvGIbh.png)
    Skip these three items by clicking 3xenter key:
    ![](https://i.imgur.com/vr6lGOk.png)
    b)Add ssh key to your github account:
    Github page in which you need to add your ssh key will be         opened. Sign in to your github account.
    Click on **New SSH key**:
    ![](https://i.imgur.com/RoJM7vG.png)
    Enter title and below in key field paste the key you've just       generated:
    ![](https://i.imgur.com/xLNI67K.png)
    Click 
    **Add SSH key**
    
    
#### Install packages
1. Open new terminal window and run following command:
    bash packages.sh

2. You will see another question:
 ![](https://i.imgur.com/Ti7YeuT.png)
 type **yes and hit enter**

3. Now you need to enter sudo passowrd if you haven't done this before.
![](https://i.imgur.com/xRAxo2f.png)

    The program will install all necessary packages.
    If you will see such thing simply type **Y**:
    ![](https://i.imgur.com/jJw6BQO.png)
4. Now you need to configure new user password for using our database. Our script has logged us to postgres user which is our 'root' user for database. Our username is appadmin to configure password for it you need to enter this command:
    a)**\password appadmin**
    ![](https://i.imgur.com/hM8mpUN.png)
    b)to return to our local user click **Ctrl+D**
    

#### Check the result

1. To check if everything worked well we will have to do some basic steps and run default app.
    Open terminal and type:
    **rails new myapp -d postgresql**
2. Move into new directory with:
    **cd myapp**
3. Now we need to do some changes in our database.yml which is responsible for our app database.
    a)Go into config directory
    **cd config/**
    b)Open database.yml with text editor. In my case I will use         Vim.
    **vim database.yml**
    ![](https://i.imgur.com/XhWcRep.png)
    c)Find line as in the above example. Under line beggining with     'pool:' add three lines:
* First:
    user: appadmin
* Second
    password: #the password you entered when you configured it for appadmin user
* Third:
    host: localhost

    ![](https://i.imgur.com/wfAsiQy.png)
    
4. Now we will run application. Type **rake db:create** in terminal. This will create database for app.
    ![](https://i.imgur.com/uo3Ildv.png)
5. Simply run app. Type **rails server**:
    ![](https://i.imgur.com/P2t3TsN.png)
6. If you haven't skipped any steps you should see such image if you visit http://localhost:3000 in browser:
    ![](https://i.imgur.com/gpjgvm8.png)
    
#### How to connect our virtual machine with host?

1. We need to forward right ports to connect our host with guest system.
2. If you are using virtualBox. First you need to turn off your machine. Then go to your machine settings->Network->Advanced settings->Port forwarding
    ![](https://i.imgur.com/mm5x9Kr.png)
3. Click add new rule and add as below:
    ![](https://i.imgur.com/PpK2sCf.png)

4. Now go to virtual machine and now run app in a little different way:
    **rails server -b 10.0.2.15**
    ![](https://i.imgur.com/7qxIP8H.png)
5. Return to your host machine, go to browser and type:
    **127.0.0.1:3000**
    and you will see ruby window:
    ![](https://i.imgur.com/aLTPRZX.png)

 






    


    



    


    
