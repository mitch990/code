/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2018/10/30 15:52:38                          */
/*==============================================================*/


drop table if exists Authority;

drop table if exists Authority_Group;

drop table if exists Authority_Relate_Group;

drop table if exists Authority_Relate_Page;

drop table if exists PageAccess;

drop table if exists Role;

drop table if exists Role_Relate_AuthorityGroup;

drop table if exists Role_Relate_User;

drop table if exists Role_Relate_UserGroup;

drop table if exists Role_Related_Authority;

drop table if exists User;

drop table if exists User_Group;

drop table if exists User_Relate_Group;

/*==============================================================*/
/* Table: Authority                                             */
/*==============================================================*/
create table Authority
(
   authority_id         varchar(50),
   authority_name       varchar(50),
   authority_type       varchar(10)
);

alter table Authority comment '权限表';

/*==============================================================*/
/* Table: Authority_Group                                       */
/*==============================================================*/
create table Authority_Group
(
   group_id             varchar(50),
   group_name           varchar(20)
);

alter table Authority_Group comment '权限组表';

/*==============================================================*/
/* Table: Authority_Relate_Group                                */
/*==============================================================*/
create table Authority_Relate_Group
(
   authority_id         varchar(50),
   authority_group_id   varchar(50)
);

alter table Authority_Relate_Group comment '权限与权限组中间表';

/*==============================================================*/
/* Table: Authority_Relate_Page                                 */
/*==============================================================*/
create table Authority_Relate_Page
(
   authority_id         varchar(50),
   page_id              varchar(50)
);

alter table Authority_Relate_Page comment '权限与访问页面关联表';

/*==============================================================*/
/* Table: PageAccess                                            */
/*==============================================================*/
create table PageAccess
(
   page_id              varchar(50),
   page_address         varchar(50)
);

alter table PageAccess comment '页面访问表';

/*==============================================================*/
/* Table: Role                                                  */
/*==============================================================*/
create table Role
(
   role_id              varchar(50),
   role_name            varchar(20)
);

alter table Role comment '角色表';

/*==============================================================*/
/* Table: Role_Relate_AuthorityGroup                            */
/*==============================================================*/
create table Role_Relate_AuthorityGroup
(
   role_id              varchar(50),
   authority_group_id   varchar(50)
);

alter table Role_Relate_AuthorityGroup comment '角色关联权限组表';

/*==============================================================*/
/* Table: Role_Relate_User                                      */
/*==============================================================*/
create table Role_Relate_User
(
   user_id              varchar(50),
   role_id              varchar(50)
);

alter table Role_Relate_User comment '角色关联用户表';

/*==============================================================*/
/* Table: Role_Relate_UserGroup                                 */
/*==============================================================*/
create table Role_Relate_UserGroup
(
   user_group_id        varchar(50),
   role_id              varchar(50)
);

alter table Role_Relate_UserGroup comment '角色与用户组关联表';

/*==============================================================*/
/* Table: Role_Related_Authority                                */
/*==============================================================*/
create table Role_Related_Authority
(
   role_id              varchar(50),
   authority_id         varchar(50)
);

alter table Role_Related_Authority comment '角色关联权限表';

/*==============================================================*/
/* Table: User                                                  */
/*==============================================================*/
create table User
(
   user_id              varchar(50),
   user_code            varchar(20),
   user_name            varchar(20),
   user_account         varchar(20),
   user_password        varchar(20)
);

alter table User comment '用户表';

/*==============================================================*/
/* Table: User_Group                                            */
/*==============================================================*/
create table User_Group
(
   group_id             varchar(50),
   group_name           varchar(20),
   group_code           varchar(20)
);

alter table User_Group comment '用户组';

/*==============================================================*/
/* Table: User_Relate_Group                                     */
/*==============================================================*/
create table User_Relate_Group
(
   user_id              varchar(50),
   group_id             varchar(50)
);

alter table User_Relate_Group comment '用户与用户组中间表';

