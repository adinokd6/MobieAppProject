# Guide for installing ruby, rails and postgresql
## Virtual machine specs:
    user: ubuntu
    password: admin
    database user: appadmin

### Before all
1. Update your packages. In terminal<br>
    **sudo apt-get update**<br>
    **sudo apt-get upgrade**<br>
2. Reboot your system<br>
3. After booting first what we need to do is to install very important packages which allow you to install for example virtualBox addons. To do this in terminal:<br>
    **sudo apt-get update**<br>
    **sudo apt-get install build-essential gcc make perl dkms**<br>
    **reboot**<br>


#### Install Ruby
1. First step<br>
    Download three sh files:<br>
    <a href="https://github.com/adinokd6/MobieAppProject/tree/main/Config%20files">Link</a><br>
    Open terminal and run commands in exact order:<br>
    **REMEMBER TO USE SUDO**<br>
    chmod +xrw ruby.sh<br>
    chmod +xrw certificate.sh<br>
    chmod +xrw packages.sh<br>
    ![](https://i.imgur.com/kXQ47vk.png)
2. Now we need to install ruby. Enter following command in terminal:<br>
    **bash ruby.sh**
#### Connect with your github account
1. Add key to your github account<br>
    a)Generate certificate:<br>
    Run following command:<br>
    bash certificate.sh<br>
    
    then type your github name and github email:<br>
    ![](https://i.imgur.com/qPOtd3z.png)<br>
    Next you will be shown such command:<br>
    ![](https://i.imgur.com/OYvGIbh.png)<br>
    Skip these three items by clicking 3xenter key:<br>
    ![](https://i.imgur.com/vr6lGOk.png)<br>
    b)Add ssh key to your github account:<br>
    Github page in which you need to add your ssh key will be opened. Sign in to your github account.<br>
    Click on **New SSH key**:<br>
    ![](https://i.imgur.com/RoJM7vG.png)<br>
    Enter title and below in key field paste the key you've just generated:<br>
    ![](https://i.imgur.com/xLNI67K.png)<br>
    Click <br>
    **Add SSH key**<br>
    
    
#### Install packages
1. Open new terminal window and run following command:<br>
    bash packages.sh<br>

2. You will see another question:<br>
 ![](https://i.imgur.com/Ti7YeuT.png)<br>
 type **yes and hit enter**<br>

3. Now you need to enter sudo passowrd if you haven't done this before.<br>
![](https://i.imgur.com/xRAxo2f.png)<br>

    The program will install all necessary packages.<br>
    If you will see such thing simply type **Y**:<br>
    ![](https://i.imgur.com/jJw6BQO.png)<br>
4. Now you need to configure new user password for using our database. Our script has logged us to postgres user which is our 'root' user for database. Our username is appadmin to configure password for it you need to enter this command:<br>
    a)**\password appadmin**<br>
    ![](https://i.imgur.com/hM8mpUN.png)<br>
    b)to return to our local user click **Ctrl+D**<br>
    

#### Check the result

1. To check if everything worked well we will have to do some basic steps and run default app.<br>
    Open terminal and type:<br>
    **rails new myapp -d postgresql**<br>
2. Move into new directory with:<br>
    **cd myapp**<br>
3. Now we need to do some changes in our database.yml which is responsible for our app database.<br>
    a)Go into config directory<br>
    **cd config/**<br>
    b)Open database.yml with text editor. In my case I will use Vim.<br>
    **vim database.yml**<br>
    ![](https://i.imgur.com/XhWcRep.png)<br>
    c)Find line as in the above example. Under line beggining with 'pool:' add three lines:<br>
* First:<br>
    user: appadmin<br>
* Second<br>
    password: #the password you entered when you configured it for appadmin user<br>
* Third:<br>
    host: localhost<br>

    ![](https://i.imgur.com/wfAsiQy.png)<br>
    
4. Now we will run application. Type **rake db:create** in terminal. This will create database for app.<br>
    ![](https://i.imgur.com/uo3Ildv.png)<br>
5. Simply run app. Type **rails server**:<br>
    ![](https://i.imgur.com/P2t3TsN.png)<br>
6. If you haven't skipped any steps you should see such image if you visit http://localhost:3000 in browser:<br>
    ![](https://i.imgur.com/gpjgvm8.png)<br>
    
#### How to connect our virtual machine with host?<br>

1. We need to forward right ports to connect our host with guest system.<br>
2. If you are using virtualBox. First you need to turn off your machine. Then go to your machine settings->Network->Advanced settings->Port forwarding<br>
    ![](https://i.imgur.com/mm5x9Kr.png)<br>
3. Click add new rule and add as below:<br>
    ![](https://i.imgur.com/PpK2sCf.png)<br>

4. Now go to virtual machine and now run app in a little different way:<br>
    **rails server -b 10.0.2.15**<br>
    ![](https://i.imgur.com/7qxIP8H.png)<br>
5. Return to your host machine, go to browser and type:<br>
    **127.0.0.1:3000**<br>
    and you will see ruby window:<br>
    ![](https://i.imgur.com/aLTPRZX.png)<br>

 






    


    



    


    
