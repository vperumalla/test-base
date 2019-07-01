# Securing Jenkins
## Table of contents
- [Overview](#overview)
- [Pre-Requisites](#pre-requisites)
- [Practice 1: Jenkins Global Security](#practice-1-jenkins-global-security)
- [conclusion](#conclusion)
## Overview
To securing jenkins one of the method is **Access Control**, which ensures users are authenticated when accessing Jenkins and their activities are authorized.
You should lock down the access to Jenkins UI so that users are authenticated and appropriate set of permissions are given to them. This setting is controlled mainly by two axes:
-   **Security Realm**, which determines users and their passwords, as well as what groups the users belong to.
 -   **Authorization Strategy**, which determines who has access to what.
  
**Security Realm**  we have different type of options in security realms in this lab we used **Jenkins’ own user database**

**Authorization Strategy** we have different type of options in authorization strategy in this lab we discuss
- Matrix-based security
- Project-based Matrix Authorization Strategy
- Role-Based Strategy

**Matrix-based security**
It allows you to grant specific permissions to users and groups. The available permissions are listed below with their descriptions, and are also available by hovering over the permission heading in the Jenkins UI.

**Project-based Matrix Authorization Strategy**
which we can define which user or group can do what actions on which job. This gives us a fine-grained control over user/group permissions per project

**Role-Based Strategy**
Enable you to assign different roles and privileges to different users.

## Pre-Requisites
Before securing Jenkins we need following requirements.

-   Jenkins 2.x or later version.
-   Plugins 
	- Matrix Authorization Strategy Plugin
	- Role-based Authorization Strategy

## Practice 1: Jenkins Global Security
### 1.1 Matrix-Based Security

1. Login to your Jenkins dashboard.
2. Click on **Manage Jenkins** left corner on the jenkins dashboard.  
![manage-jenkins](/Advanced/img/j-s-manage-jenkins.png?token=AJU3VUSHWBQLCLD57QD7PIS47YI5M)
3. Scroll down and select **Manage Users**.  
![/Advanced/img/j-s-manage-users.png?token=AJU3VUXU4V2X3CJWPQOYUP247YJD6](/Advanced/img/j-s-manage-users.png?token=AJU3VUXU4V2X3CJWPQOYUP247YJD6)
4. Click on **Create User** on left corner on the jenkins  dashboard.  
5. Fill required details and click **Create User** button  
![/Advanced/img/j-s-create-user.png?token=AJU3VUV57ZZSGDEVTHZYG4S47YJF2](/Advanced/img/j-s-create-user.png?token=AJU3VUV57ZZSGDEVTHZYG4S47YJF2)
6. Likewise create one more user.  
7. After users created you will see the users list like bellow screenshot.  
![/Advanced/img/j-s-users-list.png?token=AJU3VUXBCNXPODRC5ND76YC47YJHK](/Advanced/img/j-s-users-list.png?token=AJU3VUXBCNXPODRC5ND76YC47YJHK)
8. Click on **Manage Jenkins**   
9. Select **Configure Global Security**  
![/Advanced/img/j-s-configure-global-security.png?token=AJU3VURJVVSVPETMWY7BAYK47YJIY](/Advanced/img/j-s-configure-global-security.png?token=AJU3VURJVVSVPETMWY7BAYK47YJIY)
10. Click on **Matrix-based security**  radio button in Authorization field.  
![/Advanced/img/j-s-matrix-based-security.png?token=AJU3VUQXP4F7FUCAMDXDQOK47YJKM](/Advanced/img/j-s-matrix-based-security.png?token=AJU3VUQXP4F7FUCAMDXDQOK47YJKM)
11. To add users click on **Add user or group** button. Enter the usernames earlier we created click on **OK**.  
Ex. user1 and user2 
12. Select the permissions you want to assign to the particular user. in this lab we assign overall read and job level Read, Create, Configure and Build permissions.  
![/Advanced/img/j-s-users-permissions.png?token=AJU3VUTQKOUF7335XEWQ4PC47YJU6](/Advanced/img/j-s-users-permissions.png?token=AJU3VUTQKOUF7335XEWQ4PC47YJU6)
13. Click on **Apply** and **Save**   
14. Open **incognito** and enter jenkins IP  
15. Login to the user and see you will get the permission or not   
![/Advanced/img/j-s-user1-login.png?token=AJU3VUWLRB7WFKHAFVA6PXK47YJW6](/Advanced/img/j-s-user1-login.png?token=AJU3VUWLRB7WFKHAFVA6PXK47YJW6)  
16. Create sample freestyle job and build.  
![/Advanced/img/j-s-test-permissions.png?token=AJU3VUVRF2QH5NORXMM6XHK47YJYS](/Advanced/img/j-s-test-permissions.png?token=AJU3VUVRF2QH5NORXMM6XHK47YJYS)  
### 1.2 Project-based Matrix Authorization Strategy
1. Click on **Manage Jenkins** left corner on the jenkins dashboard.  
![manage-jenkins](/Advanced/img/j-s-manage-jenkins.png?token=AJU3VUSHWBQLCLD57QD7PIS47YI5M)
2. Select **Configure Global Security**  
![/Advanced/img/j-s-configure-global-security.png?token=AJU3VURJVVSVPETMWY7BAYK47YJIY](/Advanced/img/j-s-configure-global-security.png?token=AJU3VURJVVSVPETMWY7BAYK47YJIY)  
3. Click on **Project-based Matrix Authorization Strategy**  radio button in Authorization field.  
![/Advanced/img/j-s-project-matrix.png?token=AJU3VUXMKCNWYWCUJOIHI2K47YKAC](/Advanced/img/j-s-project-matrix.png?token=AJU3VUXMKCNWYWCUJOIHI2K47YKAC)
4. To add users click on **Add user or group** button. Enter the usernames earlier we created click on **OK**
5. Select the permissions you want to assign to the particular user. in this lab we assign overall read permissions.  
![/Advanced/img/j-s-project-matrix-permessions.png?token=AJU3VUXMQRFRZZRIJDZX5IC47YJ6A](/Advanced/img/j-s-project-matrix-permessions.png?token=AJU3VUXMQRFRZZRIJDZX5IC47YJ6A)
6. Click on **Apply** and **Save**  
7. Create sample freestyle job  
Ex: Project-matrix 
8. Select the **Enable project-based security** option in general section  
9. To add users click on **Add user or group** button. Enterusername earlier we created click on **OK**.  
Ex. user1
10. Select the permissions you want to assign to the particular project. in this lab we assign **Read** and **Build** permissions.  
![/Advanced/img/j-s-project-matrix-job-permessions.png?token=AJU3VUUPKTEB7FMPMUQ4JKK47YKCI](/Advanced/img/j-s-project-matrix-job-permessions.png?token=AJU3VUUPKTEB7FMPMUQ4JKK47YKCI)  
11. Select  **Execute Shell**  as a build step and add shell command.  
12. Click on **Apply** and **Save**  
13. Open **incognito** and enter jenkins IP  
14. Login to the user and see you will get the permission or not   
![/Advanced/img/j-s-user1-login.png?token=AJU3VUWLRB7WFKHAFVA6PXK47YJW6](/Advanced/img/j-s-user1-login.png?token=AJU3VUWLRB7WFKHAFVA6PXK47YJW6)  
15. Build the job.  
![build-job](/Advanced/img/j-s-project-matrix-console.png?token=AJU3VUQ4MVTTZXWO4DFZPNS47YVOC)
16. Create sample freestyle job  
Ex: Project-matrix-2
17. Select **Enable project-based security** and to add user click on **Add user or group** button. Enter **user2** click on **OK**  
18. Select the permissions in this lab we assign **Read** permissions.  
![/Advanced/img/j-s-project-matrix-job-user2-permissions.png?token=AJU3VUXQJMIXAMU5VVZEVFC47YKT6](/Advanced/img/j-s-project-matrix-job-user2-permissions.png?token=AJU3VUXQJMIXAMU5VVZEVFC47YKT6)  
19. Scroll down to **Build**  section and click on  **Add build step**  
20. Select  **Execute Shell**  as a build step and add shell command.  
21. Click on **Apply** and **Save**  
22. Open **incognito** and enter jenkins IP  
23. Login to the user and see you will get the only Read permission.  
![/Advanced/img/j-s-project-matrix-job-user2-console.png?token=AJU3VUQW2BSPRX5AZTQDQRS47YLNM](/Advanced/img/j-s-project-matrix-job-user2-console.png?token=AJU3VUQW2BSPRX5AZTQDQRS47YLNM)  
### 1.3 Role-Based Strategy  
1. Click  **Manage Jenkins**  left corner on the jenkins dashboard.    
![manage-jenkins](/Advanced/img/j-s-manage-jenkins.png?token=AJU3VUSHWBQLCLD57QD7PIS47YI5M)  
2. Select  **Manage Plugins**  view  
3. Click on  **Available**  tab, Search **Role-based Authorization Strategy**.  
4. Select Role-based Authorization Strategy plugin and click  **install without restart**.   
![/Advanced/img/j-s-role-plugin.png?token=AJU3VUWK5GYNED3SSKJIV4247YLX6](/Advanced/img/j-s-role-plugin.png?token=AJU3VUWK5GYNED3SSKJIV4247YLX6)    
5. Once the plugin is installed, a "success" message will be displayed.  
6. Go to **Manage Jenkins** and select **Configure Global Security**  
![/Advanced/img/j-s-configure-global-security.png?token=AJU3VURJVVSVPETMWY7BAYK47YJIY](/Advanced/img/j-s-configure-global-security.png?token=AJU3VURJVVSVPETMWY7BAYK47YJIY)  
7. Under **Authorization,** section  select **Role Based Strategy**. Click on **Save**.  
![/Advanced/img/j-s-role-based-strategy.png?token=AJU3VUQW7BCK5UIWN65ZFUS47YL4C](/Advanced/img/j-s-role-based-strategy.png?token=AJU3VUQW7BCK5UIWN65ZFUS47YL4C)  
8. Select **Manage and Assign Roles**.  
![/Advanced/img/j-s-manage-roles.png?token=AJU3VUVGPACTOBW2QDTEL5K47YL7C](/Advanced/img/j-s-manage-roles.png?token=AJU3VUVGPACTOBW2QDTEL5K47YL7C)  
9. Click on **Manage Roles** to add new roles based on your organization.  
![/Advanced/img/j-s-select-manage-roles-.png?token=AJU3VUV4MXID7CA5TU4RACS47YMLE](/Advanced/img/j-s-select-manage-roles-.png?token=AJU3VUV4MXID7CA5TU4RACS47YMLE)
10. Create a new role **testing**  
11. Enter role name **testing** in **Role to add** field and click **Add**.  
12. Select the permissions you want to assign to the particular role. in this lab we assign overall read and job level Read, Create, Configure and Build permissions.  
![/Advanced/img/j-s-global-roles.png?token=AJU3VUSOF74OPIOAIULTQDS47YMN2](/Advanced/img/j-s-global-roles.png?token=AJU3VUSOF74OPIOAIULTQDS47YMN2)  
13. Click on **Apply** and **Save**  
14. Select **Assign Roles** Enter User name in **User/group to add** field   
15. Select **testing** role to added user.  
![/Advanced/img/j-s-assign-roles.png?token=AJU3VUTYHC7PLP5TYITGQF247YMUU](/Advanced/img/j-s-assign-roles.png?token=AJU3VUTYHC7PLP5TYITGQF247YMUU)  
16. Click **Apply** and **Save**  
17. Open **incognito** and enter jenkins IP  
18. Login to the user and see you will get the permission or not   
19. Build the job.  
![/Advanced/img/j-s-use1-roles-permissions.png?token=AJU3VUQG5OU4UWS5NU4XMOS47YNBA](/Advanced/img/j-s-use1-roles-permissions.png?token=AJU3VUQG5OU4UWS5NU4XMOS47YNBA)  
20. Go to Admin user and **Manage Jenkins**.  
![manage-jenkins](/Advanced/img/j-s-manage-jenkins.png?token=AJU3VUSHWBQLCLD57QD7PIS47YI5M)  
21. Select **Manage and Assign Roles**.  
![/Advanced/img/j-s-select-manage-roles-.png?token=AJU3VUV4MXID7CA5TU4RACS47YMLE](/Advanced/img/j-s-select-manage-roles-.png?token=AJU3VUV4MXID7CA5TU4RACS47YMLE)  
22. Create a new project specific roles under  **global Roles.**  
23. Enter role name **project-based**  in **Role to add** field and click **Add**.  
24. Select the permissions you want to assign to the particular role. in this lab we assign overall read permissions.  
![/Advanced/img/j-s-project-based-global.png?token=AJU3VURKHJH64EQFLC3XK3K47YOSY](/Advanced/img/j-s-project-based-global.png?token=AJU3VURKHJH64EQFLC3XK3K47YOSY)  
25. You can create project specific roles under  **Project Roles.**  
26. Enter a role as "project-based"  
27. Add a pattern to this by adding **pro.***, so that any username starting with "project" will be assigned the project role you specify.  
![/Advanced/img/j-s-project-roles.png?token=AJU3VUQR7X5627J4XS5QOQK47YNKQ](/Advanced/img/j-s-project-roles.png?token=AJU3VUQR7X5627J4XS5QOQK47YNKQ)  
28. Click **Add** and select pattern based permissions.  
29. Click **Apply** and **Save**
30. Select **Assign Roles** To add global roles enter User name in **User/group to add** field.  
31. To add project roles enter username in **User/group to add** field and select role to added user.  
![/Advanced/img/j-s-project-role-permissions.png?token=AJU3VUVNE5IMDBXO3A2GUQC47YOXQ](/Advanced/img/j-s-project-role-permissions.png?token=AJU3VUVNE5IMDBXO3A2GUQC47YOXQ)
33. Click **Apply** and **Save**  
34. Open **incognito** and enter jenkins IP  
35. Login to the user2 and see you will get the jobs based on pattern prefix should be **pro**.  
![/Advanced/img/j-s-role-project-based-list.png?token=AJU3VUWYDF7K6DFDLFQDVDC47YO4O](/Advanced/img/j-s-role-project-based-list.png?token=AJU3VUWYDF7K6DFDLFQDVDC47YO4O)  
36. Select any one of the job and Run it.  
## Conclusion
Congratulations! You have successfully completed the jenkins advance lab. In this lab, you created user and securing jenkins. Feel free to continue exploring or start a new lab.Thank you for taking this training lab!
