SPISNON                  �  �        Header           
      BID_ITEM      BID_ID   VARCHAR2	   PROD_DESC   VARCHAR2   NDC   VARCHAR2	   SALE_CODE   VARCHAR2   MADE_TO_ORDER   VARCHAR2   INIT_MEASURE_QUAN   VARCHAR2   INIT_MEASURE_TOTAL   VARCHAR2   ONGOING_MEASURE_TOTAL   VARCHAR2   ONGOING_MEASURE_QUAN   VARCHAR2   REG_DATE   DATE   UPDATE_DATE   DATE   PROD_FAMILY   VARCHAR2�  create table BID_ITEM
(
  bid_id                VARCHAR2(50),
  prod_desc             VARCHAR2(100),
  ndc                   VARCHAR2(100),
  sale_code             VARCHAR2(50),
  made_to_order         VARCHAR2(50),
  init_measure_quan     VARCHAR2(50),
  init_measure_total    VARCHAR2(50),
  ongoing_measure_total VARCHAR2(50),
  ongoing_measure_quan  VARCHAR2(50),
  reg_date              DATE,
  update_date           DATE,
  prod_family           VARCHAR2(50)
)
;
   PATHS      PATH_NO   NUMBER   URL   VARCHAR2   DESCRIPTION   VARCHAR2   NEED_LOGIN_FLAG   CHAR�   create table PATHS
(
  path_no         NUMBER,
  url             VARCHAR2(200) not null,
  description     VARCHAR2(200),
  need_login_flag CHAR(1)
)
;
alter table PATHS
  add constraint PK_URL primary key (URL);
   PATH_PERM_ROLE      PATH_NO   NUMBER   PERM_ROLE_NO   NUMBER   PR_TYPE   CHARn   create table PATH_PERM_ROLE
(
  path_no      NUMBER,
  perm_role_no NUMBER,
  pr_type      CHAR(1)
)
;

   PATH_ROLES      PATH_NO   NUMBER   ROLE_NO   NUMBER�   create table PATH_ROLES
(
  path_no NUMBER not null,
  role_no NUMBER not null
)
;
alter table PATH_ROLES
  add constraint PK_PATH_ROLE primary key (PATH_NO, ROLE_NO);
   PERMISSIONS      PERM_NO   NUMBER	   PERM_NAME   VARCHAR2   DESCRIPTION   VARCHAR2�   create table PERMISSIONS
(
  perm_no     NUMBER not null,
  perm_name   VARCHAR2(200),
  description VARCHAR2(200)
)
;
alter table PERMISSIONS
  add constraint PK_PERM_PERM_NO primary key (PERM_NO);
   ROLES      ROLE_NO   NUMBER	   ROLE_NAME   VARCHAR2   DESCRIPTION   VARCHAR2   ADD_DATE   DATE   UPDATE_DATE   DATE�   create table ROLES
(
  role_no     NUMBER,
  role_name   VARCHAR2(200) not null,
  description VARCHAR2(200),
  add_date    DATE,
  update_date DATE
)
;
alter table ROLES
  add constraint PK_ROLE_NAME primary key (ROLE_NAME);
   ROLES_PERMISSIONS      ROLE_NO   VARCHAR2   PERM_NO   VARCHAR2�   create table ROLES_PERMISSIONS
(
  role_no VARCHAR2(200) not null,
  perm_no VARCHAR2(200) not null
)
;
alter table ROLES_PERMISSIONS
  add constraint PK_ROLE_PERM primary key (ROLE_NO, PERM_NO);
   SEQS   	   TYPE_NAME   VARCHAR2
   CURR_VALUE   NUMBERM   create table SEQS
(
  type_name  VARCHAR2(50),
  curr_value NUMBER
)
;
   USERS      USERNAME   VARCHAR2   PASSWORD   VARCHAR2�   create table USERS
(
  username VARCHAR2(200) not null,
  password VARCHAR2(200)
)
;
alter table USERS
  add constraint PK_USERS_USERNAME primary key (USERNAME);

   USER_ROLES      USERNAME   VARCHAR2   ROLE_NO   VARCHAR2�   create table USER_ROLES
(
  username VARCHAR2(200) not null,
  role_no  VARCHAR2(50) not null
)
;
alter table USER_ROLES
  add constraint PK_USERNAME_ROLE primary key (ROLE_NO, USERNAME);
       �   �    �&      1.0   1   /pmax/**   PMAX   Y   2   /pricing/**   Pricing   Y   3   /nad/**   NAD   Y   4   /sc/**   Supply Chain   Y   6   /dashboard/**	   Dashboard   Y   5	   /admin/**   Administrator   Y       Z   Z    [      2.0   6   5   P   2   2   P   3   3   P   4   4   P   5   3   R   1   1   P              �       3.0   1   1   1   2       �   �    �!      4.0   5   dashboard:edit	   Dashboard   1	   pmax:edit   PMAX   2   pricing:edit   Pricing   3   nad:edit   NAD   4   sc:edit   Supply Chain       �   �    6      5.0   3   admin   Administrator��������   2   n_s   Nad  &  Supply Chain��������   13   NAD   NAD only   24-09-2012 01:42:27   24-09-2012 01:42:27   12   Pmax   Pmax   24-09-2012 01:22:18   24-09-2012 01:22:18       >   >    �      6.0   1   1   1   2   12   1   13   3   2   3   2   4       (   (    �      7.0   perm   5   role   12   path   6              '      8.0   kurt   a   porkin   a       T   T    �      9.0   porkin   1   kurt   12   kurt   13   mike   2   kurt   3   porkin   3