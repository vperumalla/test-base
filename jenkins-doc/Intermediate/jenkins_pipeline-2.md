# Jenkins 
## Table of contents
- [Overview](#overview)
- [Pre-Requisites](#pre-requisites)
- [Practice 1: Configure Jenkins Master and slave](#practice-1-configure-jenkins-master-and-slave)
- [Practice 2: Setup Build Notifications](#practice-2-setup-build-notifications)
- [Practice 3: Manage Views](#practice-3-manage-views)
- [conclusion](#conclusion)
## Overview

## Pre-Requisites
**Master Configuration**
Install java 8 and deploy jenkins  
**Slave Configuration**
create new instance and install java 8
Gmail account

## Practice 1: Configure Jenkins Master and slave 
A jenkins master comes with the basic installation of jenkins and in this configuration the master handles all the tasks for your build system.
if you are working on multiple projects you may run multiple jobs on each and every project or some projects need to run on some particular nodes in this process we need to configure slaves.
jenkins slaves connect to the jenkins master using Java Network Launch Protocol.  
#### Jenkins Master and Slave Architecture  
![architecture](/Intermediate/img/m-s-architecture.png?token=AJU3VUTB5D7EP3V47ZIRTFS4554G2)  
Jenkins master act to schedule the jobs and assign slaves and send builds to slaves to execute the jobs.
we can run jobs on different environments, like Linux, windows etc..
It will also monitor the slave state (offline or online) and getting back the build results responses from slaves and display build result on console output.
The certain workload of building jobs are delegated to multiple **slaves**. 
- ####  Steps to configure slave in jenkins master.
1. Click on **Manage Jenkins** left corner on the jenkins dashboard.
2. Click on **Manage Nodes**.  

![manage_nodes](/Intermediate/img/m-s-manage-node.png?token=AJU3VURMLWMZSYMMVKM7XWK4554U2)
3. Select  **New Node** enter the name of the node in **Node Name** field. 
4. Select **Permanent Agent** and  click **OK**.  
   -  initially you will get only one option **Permanent Agent**. once you have one or more slaves you will get **Copy Existing Node** option 
![node_name)(/Intermediate/img/m-s-enter-node-name.png?token=AJU3VURFYDN4RKZVR74XANC45546E)
5. Enter the required information.
- Some required fields.   
	- **Name** : Name of the Slave.
	Ex: Test
	- **Description** : Description for this slave (optional).
	Ex: testing slave
	-  **# of Executors** :  Maximum number of Parallel builds jenkins master perform on this slave. 
	Ex: #2
	- **Remote root directory** : An slave needs to have a directory dedicated to Jenkins. Specify the path to this directory on the agent.
	Ex: /home/
	-  **Usage** : Controls how Jenkins schedules builds on this node.
	Ex: Only build jobs with label expressions matching this node
	- **Launch method** : Controls how Jenkins starts this agent.
	Ex:  Launch agent agents via SSH
6. Enter Host name in **Host** field.
7. select **Add** button to add credentials. and click **jenkins**
8. Enter user name and password of above host and provide unique ID.
![add-creds](/Intermediate/img/m-s-add-creds.png?token=AJU3VUQBE4TQ5M2V2UY7NDS4555LW)
9. select drop down to add credential  in **Credentials** field. 
10. Select drop down to add Host Key Verification Strategy **Non verifying Verification Strategy**.
11. select **Keep this agent online as much as possible** in  Availability field.
![configure details](/Intermediate/img/m-s-configure-node.png?token=AJU3VUW5ZAM3Q3BTOP47HM24555F2)
12. Click **Save** 
![save](/Intermediate/img/m-s-slave-name.png?token=AJU3VUVFZCJPIZM7UIMAXN24555Q2)
### 1.1 Running free style job on the slave machine.
1. Select **New Item** in the top left-hand corner on the dashboard. 
2. Enter the name of your project in the **Enter an item name** field
3. Select **Freestyle project**, and click **OK** button. 
4. Enter the **description** if you want
5. Select **Restrict where this project can be run** in general section.
6. Enter slave name in **Label Expression** field
![job_configure](/Intermediate/img/m-s-job-configure.png?token=AJU3VUV4BY2WR3AEPNSFAEC4555UA)
7. Go to **Build** section and click on **Add build step**.
8. Select **Execute Shell** as a build step.  
9. Here i am add the shell commands
e.g: print hostname
10. Click **Apply and save**. it will redirect to job's dashboard.
11. Click **Build Now** button to execute the project.
12. After execution is completed we can verify the history of executed build by clicking build number e.g: **#1**
13. Click on the build number and select **console output** we can see the executed remote 
![console-output](/Intermediate/img/m-s-console-output.png?token=AJU3VUXKQZ7LT33Y2KG266C4555YC)
### 1.2 Running a pipeline job on slave machine.

1.  Click  **New Item**  in the top left corner on the dashboard.  
2.  Enter the name of your project in the  **Enter an item name**  field, and select  **Pipeline**  project , and click  **OK**  button. 
3.  Next Enter the  **description**  if you want.
4.  Go to pipeline section, in  **Definition**  field choose  **Pipeline script **.  
``` groovy
node('test'){
	stage('stage1') {
		sh '''echo  stage1 steps'''
	}
	stage('stage2') {
		sh '''echo stage2 steps'''
	}
	stage('stage3') {
		sh '''echo stage3 steps'''
	}
}
```
![pipeline_configure](/Intermediate/img/m-s-pipeline-script.png?token=AJU3VUVWYTOFDGN453HKI2245554G)  
4.  Finally click on  **Apply**  and  **Save**. it will redirect to pipeline view page.  
5.  Click  **Build Now**  button to execute your pipeline.   
6.  After pipeline execution is completed. We can verify the history of executed build by clicking the build number e.g:  **#1**  
7.  Click on the build number and select  **console output**  
![pipeline_console](/Intermediate/img/m-s-pipeline-console-output.png?token=AJU3VURO5VNCDXDAQDEHFU24556CA)  

## Practice 2: Setup Build Notifications
1. Click on **Manage Jenkins** left corner on the jenkins dashboard.
2. select **Configure System** 
3. Scroll down to **E-mail Notification** 
![email](/Intermediate/img/e-c-email-notification.png?token=AJU3VUWRRUCVGWRPBVFHFUS4567EO)
4. In this lab we are using Gmail because most probably we use Gmail's. for Gmail SMTP server will be **smtp.gmail.com**
5. Click **Advanced** section, you will get extra fields. 
6. select  **Use SMTP Authentication** using gmail you have to provide the mail form which you will be sending the  notifications
7. Enter **User Name** and **Password** of your gmail account in username and password fields.
8. Enter **SMTP Port**  for gmail port will be 465  
![details](/Intermediate/img/e-c-configure-details.png?token=AJU3VUVR7U6J5E2KTBPZK2C4567JU)
9. Before testing email configuration login to your gmail account and Allow less secure apps by clicking the following link [https://myaccount.google.com/lesssecureapps](https://myaccount.google.com/lesssecureapps)
10. Next test the email configuration, By clicking the **Test configuration by sending test e-mail** checkbox.
11. Enter recipient email address in **Test e-mail recipient** field
12. Next hit the **Test configuration** button, we will get the **Email was successfully sent** message.
![test_configure](/Intermediate/img/e-c-test-email-config.png?token=AJU3VUS5VV2TV3REJSPID5K457AG2)
13. Go to recipient email and check if you are got the test configuration email or not.
![test_config](/Intermediate/img/e-c-test-email.png?token=AJU3VUXX2H4WDYVPPRRJYFC457BKQ)
### Configure E-mail Notification in your job
1.  Select **New Item** in the top left-hand corner on the dashboard.  
2. Enter the name of your project in the **Enter an item name** field, and select **Freestyle project**, and click **OK** button.  
e.g: email-test
3. Enter the **description** if you want
4. Go to **Build** section and click on **Add build step**.
5. Select **Execute Shell** as a build step.  
6. Here i am add the shell commands
e.g: date
7. Scroll down to **Post-build Actions** 
8. Click **Add Post-build actions** button and select **E-mail Notification** option.
![/Intermediate/img/e-c-select-email-notification.png?token=AJU3VUQOCXQX7DC35TALJTS457CWQ](/Intermediate/img/e-c-select-email-notification.png?token=AJU3VUQOCXQX7DC35TALJTS457CWQ)
9. Enter *Recipients Email address* in **Recipients** filed. 
![/Intermediate/img/e-c-recipents.png?token=AJU3VUVTIU23OO63LPE6NWC457CU4](/Intermediate/img/e-c-recipents.png?token=AJU3VUVTIU23OO63LPE6NWC457CU4)
10. Click **Apply and save**. it will redirect to job's dashboard.
11. Click **Build Now** button to execute the project.
12. if the project Build Successfully we don't get any email's if nay build fails will get email. 
13. Go to Build step and add `cho test` command 
14. Click **Apply and save**. it will redirect to job's dashboard.
15. Click **Build Now** button to execute the project.
16. After execution is completed we get email in recipient email address. 
17. To verify the history of executed build by clicking the build number e.g: **#2**
18. Click on the build number and select **console output**
![/Intermediate/img/e-c-console-output.png?token=AJU3VUW5ANACUHTQ33CJQVK457C3G](/Intermediate/img/e-c-console-output.png?token=AJU3VUW5ANACUHTQ33CJQVK457C3G)
19. Go to recipient email and see you will get an email.
![/Intermediate/img/e-c-email-address-output.png?token=AJU3VUQCVXGZ52B3F333CWS457DVM](/Intermediate/img/e-c-email-address-output.png?token=AJU3VUQCVXGZ52B3F333CWS457DVM)

## Practice 3: Manage Views
### what is Views
In jenkins views are allow us to set up the jobs into a groups. For example you create a **test** view, which displays testing specific jobs within it. If you have not created any views, then your system will be using the default **All** view.
- Two types of views on jenkins
  - [List View](#list-view)
  - [My View](#my-view)
#### List View
List views shows items in a simple list format. You can choose which jobs are to be displayed in this view and you can add job filters.
#### My View
This view automatically displays all the jobs that the current user has an access to.
### 3.1 Creating a Views 
- In this lab we creating **List view**.
1. Click on **New View** or + icon on your dashboard.
![/Intermediate/img/v-create-views.png?token=AJU3VUVHHVHTXME7AJZW4TK457KKO](/Intermediate/img/v-create-views.png?token=AJU3VUVHHVHTXME7AJZW4TK457KKO)
2. Enter the name of your view in **View name** field and select the **List view** and click **OK**.
Eg: List-view  
![/Intermediate/img/v-list-view.png?token=AJU3VUX2WQCVUQJCJLU5Z5K457KMW](/Intermediate/img/v-list-view.png?token=AJU3VUX2WQCVUQJCJLU5Z5K457KMW)
3. Enter the description of your view and add job filters if you want.
4. Add the preferred jobs to this view by clicking the jobs checkbox.
![/Intermediate/img/v-jobs-checkboxs.png?token=AJU3VUTBZNMNC5JJMJOMIPK457KOU](/Intermediate/img/v-jobs-checkboxs.png?token=AJU3VUTBZNMNC5JJMJOMIPK457KOU)
5.  Then Click **Apply** and **OK**, It will redirect to the view dashboard.
6. you will see the list of jobs what you selected in above steps.
![/Intermediate/img/v-above-step.png?token=AJU3VURHBD2A3V5TPR2ZGGS457KSQ](/Intermediate/img/v-above-step.png?token=AJU3VURHBD2A3V5TPR2ZGGS457KSQ)
### 3.2 Updating a View
 1. Select the view what you want to update.
E.g: List-view 
2. Click **Edit View** in the left corner on the view dashboard.
![/Intermediate/img/v-edit-view.png?token=AJU3VUQB5VOJ6RDUGGUU6CC457LQ6](/Intermediate/img/v-edit-view.png?token=AJU3VUQB5VOJ6RDUGGUU6CC457LQ6)
3. Scroll down to **Add Column** button and select **Git Branches** option.
![/Intermediate/img/v-git-branch.png?token=AJU3VUX7USHA7RBM6MSZCAC457LVW](/Intermediate/img/v-git-branch.png?token=AJU3VUX7USHA7RBM6MSZCAC457LVW)
4. select the **Git Branches** field, and drag to top
![/Intermediate/img/v-dragto%20top.png?token=AJU3VUSFPGVTVWB2BENNJGS457MWA](/Intermediate/img/v-dragto%20top.png?token=AJU3VUSFPGVTVWB2BENNJGS457MWA)
5. Then **Apply** and **OK** it will redirect to view dashboard.
6. You will see the **Git Branches** option on view dashboard.
![/Intermediate/img/v-git-branch-view-dashboard.png?token=AJU3VURXMVXG4HWGSXOVVFC457MY4](/Intermediate/img/v-git-branch-view-dashboard.png?token=AJU3VURXMVXG4HWGSXOVVFC457MY4)
### 3.3 Deleting a View
1. Select the view what you want delete.
E.g: List-view
2. click **Delete view** in the left corner on the view dashboard.
3. Click **yes**
![/Intermediate/img/v-delete-yes.png?token=AJU3VUQUGE5KXMD63AYZKCK457M7A](/Intermediate/img/v-delete-yes.png?token=AJU3VUQUGE5KXMD63AYZKCK457M7A)  
4. List-view is deleted . 

## Conclusion
Congratulations! You have successfully completed the jenkins lab. In this lab, you configured master and slave machines, build notifications, and manage views. Feel free to continue exploring or start a new lab.Thank you for taking this training lab!
