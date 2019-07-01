# CI/CD Pipeline With NodeJS Application And Generate Code Coverage Test Repots

## Table of contents
- [Overview](#overview)
- [Pre-Requisites](#pre-requisites)
- [Practice 1: CI/CD Pipeline With NodeJS Application And Generate Code Coverage Test Repots](#practice-1-cicd-pipeline-with-nodejs-application-and-generate-code-coverage-test-repots)
- [conclusion](#conclusion)
## Overview
In this lab we building sample nodejs application  and run sample test cases.   
## Pre-Requisites  
NodeJs plugin  
Sample nodejs application code,clone the repo `https://github.com/krishnaprasadkv/Nodejs.git`.  
## Practice 1: CI/CD Pipeline With NodeJS Application And Generate Code Coverage Test Repots
### install NodeJS plugin and Cofigure NodeJS 
1. Click **Manage Jenkins** left corner on the jenkins dashboard.    
![/Advanced/img/n-ci-managejenkins.png?token=AJU3VUTMCZTUJMDEGXQMQ3C5AZFTI](/Advanced/img/n-ci-managejenkins.png?token=AJU3VUTMCZTUJMDEGXQMQ3C5AZFTI)  
2. Select **Manage Plugins** view  
![/Advanced/img/n-ci-manageplugins.png?token=AJU3VUUEC3LJVPEKHZB343C5AZGHO](/Advanced/img/n-ci-manageplugins.png?token=AJU3VUUEC3LJVPEKHZB343C5AZGHO)
3. Click on **Available** tab, search `Nodejs` plugin.  
4. Click **install without restart**.   
![/Advanced/img/n-ci-plugins.png?token=AJU3VUQ5KOGCSF7KEBOFFOK5AZEJI](/Advanced/img/n-ci-plugins.png?token=AJU3VUQ5KOGCSF7KEBOFFOK5AZEJI)  
5. Once plugin is installed you will get success message.  
6. Next click on **Manage Jenkins**   
7. Select **Global Tool Configuration**   
![/Advanced/img/n-ci-gloabaltool.png?token=AJU3VUXMX2652CC7TFS4ILC5AZFVO](/Advanced/img/n-ci-gloabaltool.png?token=AJU3VUXMX2652CC7TFS4ILC5AZFVO)  
8. Scroll down to **NodeJS** section.  
9. Add NodeJS by clicking **Add NodeJS** button.  
![/Advanced/img/n-ci-nodejs-add.png?token=AJU3VUWZWNLZEY4TE3KW4NS5AZFXE](/Advanced/img/n-ci-nodejs-add.png?token=AJU3VUWZWNLZEY4TE3KW4NS5AZFXE)  
10. Enter **node** in name field and select version.  
![/Advanced/img/n-ci-nodeversion.png?token=AJU3VUSE6DFO6NPIIMU52BS5AZFZK](/Advanced/img/n-ci-nodeversion.png?token=AJU3VUSE6DFO6NPIIMU52BS5AZFZK)  
11. Click **Apply** and **Save**.  
### Create NodeJS Pipeline
12. Click **New Item** in the top left corner on the dashboard.  
![/Advanced/img/new_item.png?token=AJU3VUX7BNZDGDS4RE7WSYC5AY5YS](/Advanced/img/new_item.png?token=AJU3VUX7BNZDGDS4RE7WSYC5AY5YS)  
13. Enter the name of your project in the **Enter an item name** field, and select **Pipeline** project , and click **OK** button.  
e.g: node-js_pipeline  
14. Next Enter the **description** if you want.  
15. Go to pipeline section, **Definition** field indicates Pipeline script option.  
16. write your pipeline code into script area.  
17. In this lab we are going to explain declarative pipeline. select **pipeline script** in **definition** field.  
- For example:-  
Replace your Git Hub URL in the script and copy and paste the following declarative pipeline script into script area.  

```groovy
pipeline {
  agent any
  tools {nodejs "node"}  
  stages {        
    stage('git_clone') {
      steps {
        git 'https://github.com/krishnaprasadkv/Nodejs.git'
      }
    }        
    stage('npm_install') {
      steps {
        // For installing npm
        sh 'npm install'
      }
    }     
    stage('npm_test') {
      steps {
        // For Test sample application.  
         sh 'npm test'
      }
    }      
  }
}
```
![/Advanced/img/n-ci-script-area.png?token=AJU3VUR254CIY53YRZKJLHS5AY6JU](/Advanced/img/n-ci-script-area.png?token=AJU3VUR254CIY53YRZKJLHS5AY6JU)  
18. Finally click on **Apply** and **Save**. it will redirect to pipeline view page.  
19. Click **Build Now** button to execute your pipeline.  
20. After pipeline execution is completed the pipeline view will be bellow screenshot.  
![/Advanced/img/n-ci-pipelineview.png?token=AJU3VUXJGGTGPFG3LCRZY3S5AY6OE](/Advanced/img/n-ci-pipelineview.png?token=AJU3VUXJGGTGPFG3LCRZY3S5AY6OE)  
21. We can verify the history of executed build by clicking the build number e.g: **#1**  
22. Click on build number and select **console output**  
![/Advanced/img/n-ci-console-output.png?token=AJU3VUTNKZJTDUZ576JVYEK5AY6RI](/Advanced/img/n-ci-console-output.png?token=AJU3VUTNKZJTDUZ576JVYEK5AY6RI)  
23. scroll down you will see the **npm** and **test cases** results  
![/Advanced/img/n-ci-testcases-output.png?token=AJU3VUTMLIAOVITZWX5OOY25AY6S6](/Advanced/img/n-ci-testcases-output.png?token=AJU3VUTMLIAOVITZWX5OOY25AY6S6)  
### Configure CI/CD Process on Jenkins and GitHub Repository.  
13. next we have to configured our Jenkins machine to communicate with our Git Hub repository. For that we need to  get the Hook URL of Jenkins machine.  
14. Go to **Manage Jenkins** and select **Configure System**.  
15. Find the **GitHub** Plugin Configuration, and click on **Advanced** button.  
![/Advanced/img/n-ci-advanced.png?token=AJU3VUVME3VLUB5B3BZ3VLS5AY6XW](/Advanced/img/n-ci-advanced.png?token=AJU3VUVME3VLUB5B3BZ3VLS5AY6XW)  
16. Select the  **Specify another hook URL for GitHub configuration**  
![/Advanced/img/n-ci-sepcify-hook.png?token=AJU3VUW3CLV4EEQDXHGYR5C5AY6ZC](/Advanced/img/n-ci-sepcify-hook.png?token=AJU3VUW3CLV4EEQDXHGYR5C5AY6ZC)  
17. Copy URL  in the text box field and unselect it.  
18. Click **Apply** and **Save**.  
19. Open your **GitHub** repository.  
20. Click  on **Settings**. It will navigate to the repository settings.  
![/Advanced/img/n-ci-ghsettings.png?token=AJU3VUTS3TLT5ZXJ4CO6RLS5AY64I](/Advanced/img/n-ci-ghsettings.png?token=AJU3VUTS3TLT5ZXJ4CO6RLS5AY64I)  
21. Click on **Webhooks**.   
![/Advanced/img/n-ci-webhooks.png?token=AJU3VUT2SC2VWUES6IE5TQS5AY66C](/Advanced/img/n-ci-webhooks.png?token=AJU3VUT2SC2VWUES6IE5TQS5AY66C)  
22. Click on **Add Webhook**. It will prompt password window.  
![/Advanced/img/n-ci-addwebhook.png?token=AJU3VUWOYOYVJFK6EF3Q3EC5AY674](/Advanced/img/n-ci-addwebhook.png?token=AJU3VUWOYOYVJFK6EF3Q3EC5AY674)  
23. Paste the **Hook URL** on the **Payload URL** field.  
24. By default selected **Just the push event**.if you want to select individual events click on **Let me select individual events** radio button.  
25. you will get a list of events that you can select  individual events to triggers your jenkins build.  
26. Click **Add webhook** it will add the webhook to your repository.  
![/Advanced/img/n-ci-webhook-options.png?token=AJU3VUXZNVLGR76CVVGAT425AY7CS](/Advanced/img/n-ci-webhook-options.png?token=AJU3VUXZNVLGR76CVVGAT425AY7CS)  
27.  Once you added webhook successfully.You can see the webhook with green tick.  
![/Advanced/img/n-ci-greentick.png?token=AJU3VUUDXOGAR3YVHSNJTNK5AY7FE](/Advanced/img/n-ci-greentick.png?token=AJU3VUUDXOGAR3YVHSNJTNK5AY7FE)  
28. Next Jenkins configuration to run builds automatically when code is pushed to Git Hub repository. Jenkins doesn’t run all builds for all projects. To specify which project builds need to run, we have to modify the project configuration.  
29. Select the project and Click on **configure**.  
![/Advanced/img/n-ci-configure.png?token=AJU3VUQAAJ3SIUIODUWIJ7S5AY7HC](/Advanced/img/n-ci-configure.png?token=AJU3VUQAAJ3SIUIODUWIJ7S5AY7HC)  
30. Go to **Build Triggers** section and  select **GitHub hook trigger for GITScm polling**.  
![/Advanced/img/n-ci-jobconfiguration.png?token=AJU3VUQ7BTTZBK4SXV42RVC5AY7I4](/Advanced/img/n-ci-jobconfiguration.png?token=AJU3VUQ7BTTZBK4SXV42RVC5AY7I4)  
31. Click **Apply** and **Save**.  
32. Go to Git Hub and Update any of the file. in this lab we update **README.md** file.   
![/Advanced/img/n-ci-readme.png?token=AJU3VURJW7IGYMYRFV7DCV25AY7LK](/Advanced/img/n-ci-readme.png?token=AJU3VURJW7IGYMYRFV7DCV25AY7LK) 
33. Now see the jenkins Job it will trigger automatically.  
![/Advanced/img/n-ci-buildtriggers.png?token=AJU3VUXXRLWOB23DJFKEK7C5AY7OQ](/Advanced/img/n-ci-buildtriggers.png?token=AJU3VUXXRLWOB23DJFKEK7C5AY7OQ)  
34. you will see the console output of hook triggered build, by clicking green ball of  build number **#2**.  
![/Advanced/img/n-ci-hookconsole-output.png?token=AJU3VUXUYSKFLAO7SXXVHZK5AY7RQ](/Advanced/img/n-ci-hookconsole-output.png?token=AJU3VUXUYSKFLAO7SXXVHZK5AY7RQ)  

## Conclusion
Congratulations! You have successfully completed the jenkins advance lab. In this lab, you created github hooks and configured continious integration on Jenkins . Feel free to continue exploring or start a new lab.Thank you for taking this training lab!
