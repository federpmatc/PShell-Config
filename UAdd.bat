dsadd user "cn=%1,ou=ServerClass,ou=WestCampus,dc=itnet,dc=pri" -fn %2 -ln %3 -upn %1@itnet.pri -pwd Password01 -memberof "cn=PowerU,ou=ServerClass,ou=WestCampus,dc=itnet,dc=pri" -mustchpwd yes
