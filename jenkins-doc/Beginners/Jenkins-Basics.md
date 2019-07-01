# Jenkins Basics
## Table of contents
- [Overview](#overview)
- [Pre-Requisites](#pre-requisites)
- [Practice 1: Installing Jenkins](#practice-1-installing-jenkins)
- [Practice 2: Jenkins Configuration](#practice-2-jenkins-configuration)
	- [2.1 Manage Plugins](#21-manage-plugins)
	- [2.2 Change Jenkins Home Directory](#22-change-jenkins-home-directory) 
- [Practice 3: Freestyle Jobs](#practice-3-freestyle-jobs)
- [Practice 4: Freestyle with Parameterized Jobs](#practice-4-freestyle-with-parameterized-jobs)
  - [4.1 String Parameter](#41-string-parameter)
  - [4.2 Choice Parameter](#42-choice-parameter)
- [Practice 5: Upstream and Downstream Jobs](#Practice-5-upstream-and-downstream-jobs)
- [conclusion](#conclusion)
## Overview
Jenkins is a continious integration server which can fetch the latest code from Version control system(VCS), build it, test it and notify
it to the developers.Jenkins can do many thing apart from just being a Continious Integration(CI) server. it was originally known a Hudson.
Jenkins is a open source project written by **kohsuke Kawaguchi**.  
jenkins is a java based project.Before installing and running jenkins on your machine,First you need to install **java 8**  
## Pre-Requisites
Before you proceed to install Jenkins in your ubuntu machine,there are some prerequisites for Jenkins to install Jenkins. 
**Hardware Requirements**  
You need minimum 1 GB+ of RAM and 50 GB+ of drive space to install jenkins.  
**Software Requirements**  
• Java 8 - either a Java Runtime Environment (JRE) or a Java Development Kit (JDK) is fine   
Note: This is not a requirement if running Jenkins as a Docker container.

## Practice 1: Installing Jenkins
install jenkins on your ubuntu machine, follow these steps:
1. update the packages  
		`# sudo apt-get update`  
2. install java 8 Open JDK package.  
	  `# sudo apt-get install openjdk-8-jdk`    
3. Add the Jenkins Debian repository to the system  
    `# wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -`  
4. When the key is added, the system will return `OK`. Next, we'll append the Debian package repository address to the server's `sources.list`:  
    `# echo deb https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list`  
5. update the packages one more time  
    `# sudo apt-get update`  
6. Finally install the latest version of jenkins with the following command  
    `# sudo apt-get install jenkins -y`  
7. After the installation process jenkins service is automatically start. you can verify by typing following command.  
    `# sudo service jenkins status`  
   -  output should be like this.  
  ![status_output](/Beginners/img/status-output.png)
8. To set up your latest jenkins installation, open your browser and browse the service host name or IP address followed by port 8080. `http://ip_address or domain.com:8080/`  
  ![Unlock jenkins](/Beginners/img/unlock-jenkins.png)  
9. open the command line and type the following command  
	  `# sudo cat /var/lib/jenkins/secrets/initialAdminPassword`  
    Jenkins installer creates an initial 32- character alphanumeric password copy and paste it into the browser `administrator password`field, then click `continue`.  
10. The setup wizard will ask you whether you want to install `suggested plugins` or you want to install `specific plugins`.
  ![customize jenkins](/Beginners/img/customize-jenkins.png)
11. Click on `suggested plugins box`, and plugin installation process will start's.
  ![suggested plugins](/Beginners/img/getting-started.png)
12. Once the plugins are installed, you will be prompted to set up the first admin user. Fill out all required information and click `Save and Continue`  
  ![create admin user](/Beginners/img/create-admin-user.png)
13. Next set the URL for your Jenkins instance. The URL will be generated automatically. confirm the URL by clicking `Save and Finish button.  
  ![start jenkins](/Beginners/img/instance-configuration.png)
14. once all configuration are done, you can see the `Jenkins is ready`  screen
  ![ready jenkins](/Beginners/img/jenkins-ready.png)
15. click `start using jenkins` it will redirected to the Jenkins dashboard  
 ![jenkins dashborad](/Beginners/img/dashboard.png)

## Practice 2: Jenkins Configuration
### 2.1 Manage Plugins
plugins are the most powerful feature in jenkins. plugins are mainly use of enhancing the performance of jenkins environment to suit organization or individual user needs. plugins are automatically downloaded, with their dependencies from the Update center. Update center is a service it provides open source plugins to jenkins project. These plugins are developed and maintained by plugin community members.
The plugins are packaged as self-contained **.hpi** files, which have all the necessary code, images, and other resources which the plugin needs to execute successfully.
Every plugin we have a wiki page. click on the plugin to read its wiki .
 #### 2.1.1 Installing a Plugins
- They are two methods for installing plugins on jenkins master. 
	- **Manage Plugins** on  Classic UI 
	- **Jenkins CLI**
##### From Classic UI
- This is the easy way to installing plugins on jenkins master 
1. Click **Manage Jenkins** left corner on the jenkins dashboard.  
![/Beginnersimg/manage_jenkins.png?token=AJU3VURJ4H2JRYZT25UAYWK44KETG](/Beginners/img/manage_jenkins.png?token=AJU3VURJ4H2JRYZT25UAYWK44KETG)
2. Select  **Manage Plugins** view 
![/Beginnersimg/manage-plugins.png?token=AJU3VUWWWK7AILDFHVTJFKS44KINO](/Beginners/img/manage-plugins.png?token=AJU3VUWWWK7AILDFHVTJFKS44KINO)
3. Click on **Available** tab, Here the list of available plugins to install, find your plugin using filter. E.g green balls
4. select the check box on your favorite plugin and click **install without restart**. if the settings are not effected restart the jenkins server.
![/Beginnersimg/avaliable_plugins.png?token=AJU3VUSNXCJNDF46GPTP2WC44KIR4](/Beginners/img/avaliable_plugins.png?token=AJU3VUSNXCJNDF46GPTP2WC44KIR4)
##### Jenkins CLI
 The jenkins CLI allows a command line user to download and install plugins with their dependencies.
 ```
 java -jar [jenkins-cli.jar](http://3.17.205.191:8080/jnlpJars/jenkins-cli.jar) -s http://3.17.205.191:8080/ install-plugin SOURCE ... [-deploy] [-name VAL] [-restart]

Installs a plugin either from a file, an URL, or from update center.   
  
 SOURCE    : If this points to a local file (‘-remoting’ mode only), that file
             will be installed. If this is an URL, Jenkins downloads the URL
             and installs that as a plugin. If it is the string ‘=’, the file
             will be read from standard input of the command, and ‘-name’ must
             be specified. Otherwise the name is assumed to be the short name
             of the plugin in the existing update center (like ‘findbugs’), and
             the plugin will be installed from the update center. If the short
             name includes a minimum version number (like ‘findbugs:1.4’), and
             there are multiple update centers publishing different versions,
             the update centers will be searched in order for the first one
             publishing a version that is at least the specified version.
 -deploy   : Deploy plugins right away without postponing them until the reboot.
 -name VAL : If specified, the plugin will be installed as this short name
             (whereas normally the name is inferred from the source name
             automatically).
 -restart  : Restart Jenkins upon successful installation.
 ```
#### 2.1.2 Advanced installation
Here you can upload your own plugins to the jenkins master in **.hpi** format.
for create your plugins you need knowledge on java programming, why because jenkins is written in java.
1.  Click **Manage Jenkins** left corner on the jenkins dashboard.  
2. Select  **Manage Plugins** view
3. click on **Advanced** tab
4. choose the **.hpi** file under the **upload Plugins** section.
5. upload the **.hpi plugin file**.
6. After plugin is upload, restart the jenkins server manually to effect the plugin changes.
![/Beginnersimg/advanced-plugins.png?token=AJU3VUXEJ2K3WTKBO7FIKJ244KIWI](/Beginners/img/advanced-plugins.png?token=AJU3VUXEJ2K3WTKBO7FIKJ244KIWI)
 #### 2.1.3 Updating a Plugins 
 If any plugin is outdated or a version upgrade is available we can see the list of plugins in update tab.
 1. Click **Manage Jenkins** left corner on the jenkins dashboard.  
7. Select  **Manage Plugins** view 
8. select the **Check Now** button on updates tab. it will check if updates available on update center.
9. You are in update tab, you can see the list of plugins need to update.
10. By updating the plugin clicking the checkbox of the desired plugins and select **Download now and install after restart** button. 
![/Beginnersimg/updateds.png?token=AJU3VUWLDWED5NHDSY56MP244KI7A](/Beginners/img/updateds.png?token=AJU3VUWLDWED5NHDSY56MP244KI7A)
#### 2.1.4 Uninstalling a Plugin 
jenkins will automatically determine, which plugin is safe to uninstall those which are not dependencies of other plugins.
1.  Click **Manage Jenkins** left corner on the jenkins dashboard.
2. Select  **Manage Plugins** view
3. click on **Installed** tab
4. you will see the list of plugins with uninstall option, those are not dependence on other plugins.
![/Beginnersimg/uninstall.png?token=AJU3VUVGQBLZ4MNFF7PAFC244KJBK](/Beginners/img/uninstall.png?token=AJU3VUVGQBLZ4MNFF7PAFC244KJBK)   

 ### 2.2 Change Jenkins Home Directory
1. Click on **Manage Jenkins** left corner on the jenkins dashboard.  
![/Beginnersimg/manage_jenkins.png?token=AJU3VURJ4H2JRYZT25UAYWK44KETG](/Beginners/img/manage_jenkins.png?token=AJU3VURJ4H2JRYZT25UAYWK44KETG)
2. select **System Information** tab
![/Beginnersimg/system_information.png?token=AJU3VUW63AUA5VXFZAP3NNC44KEU6](/Beginners/img/system_information.png?token=AJU3VUW63AUA5VXFZAP3NNC44KEU6)
3. Scroll down to **Environment Variables** section, you will  see the **JENKINS_HOME**.
![/Beginnersimg/old-env-variable.png?token=AJU3VUTXTJ5LNYX5JI2J56S44KEXI](/Beginners/img/old-env-variable.png?token=AJU3VUTXTJ5LNYX5JI2J56S44KEXI)
4.  For changing the jenkins home login to Jenkins VM using **Putty**.
5. Navigate to root user using following commands.
```
ubuntu@ip-172-98-76-543:~$ sudo -i
root@ip-172-98-76-543:~#
```
6. Before changing any thing on jenkins master we have to stop the jenkins server
```  
root@ip-172-98-76-543:~# sudo service jenkins stop
root@ip-172-98-76-543:~#
```
7. create a new directory where ever you want to move jenkins home.
in this lab we are creating new directory in **`/home`**  path 
```
root@ip-172-98-76-543:/home# mkdir /home/new_home
root@ip-172-98-76-543:/home# ls
new_home  ubuntu
root@ip-172-98-76-543:/home#
```
8. we need to change the ownership of created directory by using the **chown** command to change the user and group ownership of created directory.
```
root@ip-172-98-76-543:/home#
root@ip-172-98-76-543:/home# sudo chown jenkins:jenkins /home/new_home/
root@ip-172-98-76-543:/home#
```
9. copy the content form old jenkins home directory **/var/lib/jenkins** to new jenkins home directory **/home/new_home/** using following command.
```
root@ip-172-98-76-543:/home#
root@ip-172-98-76-543:/home# sudo cp -prv /var/lib/jenkins /home/new_home/
root@ip-172-98-76-543:/home#
```
10. Next to change the jenkins user home by using following command  
``` 
sudo usermod -d /home/new_home/ jenkins
```
11. update the new jenkins home directory path in **/etc/default/jenkins**   
``` 
sudo vi /etc/default/jenkins
```
12. scroll down to jenkins home location update new home directory path.
```
# jenkins home location
JENKINS_HOME=/home/new_home
```
13. start the jenkins service by using following command.
```
root@ip-172-98-76-543:/home#
root@ip-172-98-76-543:/home# sudo service jenkins start 
root@ip-172-98-76-543:/home#
```
14. Then we need to update the admin password that can be found in new jenkins home directory. 
```
cat /home/new_home/secrets/initalAdmkinPassword  
```
15. copy and paste the Admin Password in **Administrator Password** field. Click **continue** button.
![/Beginnersimg/admin_password.png?token=AJU3VURVP37NFPJ7A35QRT244KFHA](/Beginners/img/admin_password.png?token=AJU3VURVP37NFPJ7A35QRT244KFHA)
16. Next you will be prompted to set up the first admin user. Fill out all required information and click **Save and Continue**
17. Next set the URL for your Jenkins instance. The URL will be generated automatically. confirm the URL by clicking **Save and Finish** button.
18. Once all configuration are done, you can see the **Jenkins is ready** screen. click **start using jenkins** it will redirected to the Jenkins dashboard.
19.  Click on **Manage Jenkins** left corner on the jenkins dashboard.
20. select **System Information** 
22. Scroll down to **Environment Variables** section, you will  see the new **JENKINS_HOME**.
![/Beginnersimg/new_env-variables.png?token=AJU3VUVM2WBM5J2HNVFVJZC44KFKA](/Beginners/img/new_env-variables.png?token=AJU3VUVM2WBM5J2HNVFVJZC44KFKA)


## Practice 3: Freestyle Jobs
Jenkins can be used to perform the builds on servers work like regular builds and run test and repetitive tasks.

### steps to create freestyle project in jenkins.
1. Select **New Item** in the top left-hand corner on the dashboard.  
![new_item](/Beginners/img/new-item.png)
3. Enter the name of your project in the **Enter an item name** field, and select **Freestyle project**, and click **OK** button.  
e.g: project_1
![project_name](/Beginners/img/enter-name.png)
3. Enter the **description** if you want
![description](/Beginners/img/description.png)
4. Go to **Build** section and click on **Add build step**.
![build](/Beginners/img/build-section.png)
6. Select **Execute Shell** as a build step.  
![execute shell](/Beginners/img/execcute-shell.png)
7. Here i am add the shell commands
e.g:print date and time
![command](/Beginners/img/command.png)
8. Click **Apply and save**. it will redirect to job's dashboard.
10. Click **Build Now** button to execute the project.
![build now](/Beginners/img/buildnow.png)
11. After execution is completed we can verify the history of executed build by clicking build number e.g: **#1**
![#1build number](/Beginners/img/build%231.png)
13. Click on the build number and select **console output**
![console-output](/Beginners/img/console-output.png)

## Practice 4: Freestyle with Parameterized Jobs

### 4.1 String Parameter 
1. Select **New Item** in the top left-hand corner on the dashboard.
2. Enter the name of your project in the **Enter an item name** field, and select **Freestyle project**, and click **OK** button.  
e.g: Parameterized _project_1
3. Enter the **description** if you want
4. Under **General** section and you will find option **This project is parameterized** click the checkbox  
![select_parameterized](/Beginners/img/select_parameterized.png?token=AJU3VUSA7D6NGGUL3GC5GH244PJJU)
5. It will show you option to **Add Parameter**, select parameter what you want. 
6. Select **String Parameter** and fill the required details 
	- Name : Name of the parameter
	- Default Value : Specifies the default value of the field.
	- Description : Description of the above parameter     
![parameter_content](/Beginners/img/parameter_content.png?token=AJU3VUUZQ6EBGIKN35STSSS44PJRA)
7. Scroll down to **Build** section, select **Add build step** to  add execute shell command.  
8. Enter the command `echo $NAME`in command text area.   
![echo_name](/Beginners/img/echo_name.png?token=AJU3VUUTZQTJXJPHW353A4C44PKAI)
9. Click **Apply** and **Save** . it will redirect to the project dashboard.  
10. Instead of build we have  a **Build With Parameters** click Build With Parameters option.
![build_with_parameter](/Beginners/img/build_with_parameter.png?token=AJU3VUTHRZU4DGRBQIBAJKS44PKDM)
11. you will find parameter here.By default value here, you can also change if you want.  
12. Click **Build** button to execute the project.  
![build_parameter](/Beginners/img/build_parameter.png?token=AJU3VUT5RZZO2FLYUQSYBDK44PKLS)
13. After execution is completed we can verify the history of executed build by clicking build number e.g: **#1**  
14. Click on the build number and select **console output**
15. you can see it has taken the parameter 'testing' and printed 'testing'.
![console-output](/Beginners/img/console_paramteter.png?token=AJU3VUUD2GTHJWP3C7IJYQC44POF6)
16. you can also change the parameter, by clicking **Build With Parameters** 
17. Change the parameter in name field **Qloudable**, click **Build** button.

18. After execution is completed we can verify the history of executed build by clicking build number e.g: **#2**
19. Next go to console output it print **Qloudable**.

### 4.2 Choice Parameter
1. Select **New Item** in the top left-hand corner on the dashboard.
2. Enter the name of your project in the **Enter an item name** field, and select **Freestyle project**, and click **OK** button.  
e.g: Parameterized _project_2
3. Enter the **description** if you want
4. Under **General** section and you will find option **This project is parameterized** click the checkbox  
5. It will show you option to **Add Parameter**, select parameter what you want. 
![add_parameters](/Beginners/img/select_choice_parameter.png?token=AJU3VUX2MOE4V662V5ZXW6K44PPP2)
6. Select **choice Parameter** and fill the required details 
	- Name : Name of the parameter
	- choices : the Possible Choices, one per line. The first line will be the default value.
	- Description : Description of the above parameter 
![]choice_parameters](/Beginners/img/choice_parameter_details.png?token=AJU3VUXVFSZW5KJKSC7VFMK44PPJW)
7. Scroll down to **Build** section, select **Add build step** to  add execute shell command.
8. Enter the command `echo $number` in command text area.
![build_choice](/Beginners/img/execute_build_choice.png?token=AJU3VUV23Y25FM2MIFYPR4C44PPX4)
9. Click **Apply** and **Save** . it will redirect to the project dashboard.
10. Instead of build we have  a **Build With Parameters** click Build With Parameters option.
11. you will find choice  as a drop down. you can select any one of them. Here i can select **Two**.
![selectdorpdown](/Beginners/img/two_choice.png?token=AJU3VURX7SPLHIDOMM27VH244PP7K)
12. Click **Build** button to execute the project.
13. After execution is completed we can verify the history of executed build by clicking build number e.g: **#2**
14. Click on the build number and select **console output**
15. you can see it has taken the parameter 'Two' and printed 'Two'.  
![two_build](/Beginners/img/two_console_output.png?token=AJU3VUT247CQHNHTWMXN5YK44PQF6)
16. you can also change the parameter, by clicking **Build With Parameters** 
17. select first parameter and click **Build** button.  
![select_firstbuild](/Beginners/img/one_choice.png?token=AJU3VUVTCXYPB642H2BLLHK44PQQC)
18. After execution is completed we can verify the history of executed build by clicking build number e.g: **#2**
19. Next go to console output it print **one**.
![one_console_output](/Beginners/img/one_console_output.png?token=AJU3VUQYIMKRI2IVNBBJ7MK44PQJM)

## Practice 5: Upstream and Downstream Jobs
#### what is Upstream Project 
Upstream project means that a build for the current job may be scheduled when an  upstream build is finished.A project may have one or many upstream job.
#### What is Downstream Project 
Downstream project means default every stable upstream job  builds will schedule a build in the downstream jobs. A project may have one or many downstream jobs. 
##### Steps to create the Upstream and Downstream jobs
1. create 3 new freestyle jobs or we can use already created jobs. In this lab we using already created freestyle jobs.
2. select the **project_1**  job and click **configure** in the top left-hand corner on the dashboard.
![/Beginners/img/up-dw-configue.png?token=AJU3VUTHGNV54RNCM3XPOA244VDFG](/Beginners/img/up-dw-configue.png?token=AJU3VUTHGNV54RNCM3XPOA244VDFG)
3. To configure upstream job go to **Build Triggers** section and select the **Build after other projects are built**  option. 
4. Enter the Project name in **Project to watch** filed. and select the options.
5. By default **Trigger only if build is stable**, means it will trigger when the current job is succeed. 
![/Beginners/img/up-dw-upstream.png?token=AJU3VUSNHYET7ZH6R5HWKK244VDI4](/Beginners/img/up-dw-upstream.png?token=AJU3VUSNHYET7ZH6R5HWKK244VDI4)
6. scroll down to configure the downstream job **Post-build Actions** and  click **Add Post build actions** button.  
7. Select **Build other Project** option, and Add downstream project name in **Projects to build** field and select the options. 
8. By default **Trigger only if build is stable**, means it will trigger when the current job is succeed.  
![/Beginners/img/up-dw-downstream.png?token=AJU3VUQU6UREJ2Q6BPXLQPC44VDLY](/Beginners/img/up-dw-downstream.png?token=AJU3VUQU6UREJ2Q6BPXLQPC44VDLY)
9. Click **Apply and save**. it will redirect to job's dashboard. You will see the upstream and downstream job name.  
![/Beginners/img/up-dw-list.png?token=AJU3VUVEITDCGITMJTNKG5C44VDQU](/Beginners/img/up-dw-list.png?token=AJU3VUVEITDCGITMJTNKG5C44VDQU)
10. Go to **parameterized_project_1** and click **Build Now** button to execute the project.  
11. After execution is completed, it will triggers downstream job, we can verify the history of executed build by clicking build number e.g: **#2**.  
![/Beginners/img/up-dw-triggered-down-stream.png?token=AJU3VUWHOKSVSVKIOQK4IMS44VDZY](/Beginners/img/up-dw-triggered-down-stream.png?token=AJU3VUWHOKSVSVKIOQK4IMS44VDZY)
12. Go to **Project_1**  it will triggers downstream job **parameterized_project_2**,we can verify the history of executed build by clicking build number e.g: **#3**  
![/Beginners/img/up-dw-middle-job.png?token=AJU3VUXOA6SFKQIBOV2IJRC44VECK](/Beginners/img/up-dw-middle-job.png?token=AJU3VUXOA6SFKQIBOV2IJRC44VECK)
13. Go to **parameterized_project_2**, we can verify the history of executed build by clicking build number e.g: **#3**  
![/Beginners/img/up-dw-downstream-console.png?token=AJU3VURPMELBV3PI35BGZIS44VFCO](/Beginners/img/up-dw-downstream-console.png?token=AJU3VURPMELBV3PI35BGZIS44VFCO)

## Conclusion
Congratulations! You have successfully completed the jenkins Beginners lab. In this lab, you installed jenkins, configure jenkins and created freestyle jobs. Feel free to continue exploring or start a new lab.Thank you for taking this training lab!
