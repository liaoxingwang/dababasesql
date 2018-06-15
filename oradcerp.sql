prompt PL/SQL Developer import file
prompt Created on 2018年6月15日 by Administrator
set feedback off
set define off
prompt Creating ADDRESS...
create table ADDRESS
(
  ADDRESSID       VARCHAR2(20) not null,
  ADDRESS         VARCHAR2(20),
  EMAIL_CODE      VARCHAR2(20),
  CONTACTS        VARCHAR2(20),
  ADDRESSID_TITLE VARCHAR2(20),
  TELEPHONE       VARCHAR2(20),
  ROUTE           VARCHAR2(20),
  REMARKS         VARCHAR2(20)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column ADDRESS.ADDRESSID
  is '地址编号';
comment on column ADDRESS.ADDRESS
  is '地址';
comment on column ADDRESS.EMAIL_CODE
  is '邮政编码';
comment on column ADDRESS.CONTACTS
  is '联系人';
comment on column ADDRESS.ADDRESSID_TITLE
  is '联系人的职称';
comment on column ADDRESS.TELEPHONE
  is '联系电话';
comment on column ADDRESS.ROUTE
  is '行走的路线';
comment on column ADDRESS.REMARKS
  is '备注';
alter table ADDRESS
  add constraint FK_ADDRESS_CUSTOMERID primary key (ADDRESSID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating ADVANCE_HOST...
create table ADVANCE_HOST
(
  AHID            VARCHAR2(50) not null,
  AHDATE          DATE,
  SUPPLIERSID     VARCHAR2(50),
  CURRENCYID      VARCHAR2(50),
  AHCLEARINGONE   NUMBER(11,2),
  AHCLEARINGTOW   NUMBER(11,2),
  AHCLEARINGTHREE NUMBER(11,2),
  AHEXCHANGERATE  NUMBER(11,4),
  AHDISCOUNTRATE  NUMBER(11,2),
  AHDEPT          VARCHAR2(10),
  AHMAKINGNAME    VARCHAR2(10),
  AHVERIFIER      VARCHAR2(10),
  AHREVIEWSTATE   CHAR(1) default '0',
  AHREVIEWDATE    DATE,
  AHREMARK        VARCHAR2(255),
  TESTA           VARCHAR2(10),
  TESTB           VARCHAR2(10)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column ADVANCE_HOST.AHID
  is '单号';
comment on column ADVANCE_HOST.AHDATE
  is '日期';
comment on column ADVANCE_HOST.SUPPLIERSID
  is '供应商id';
comment on column ADVANCE_HOST.CURRENCYID
  is '币别id';
comment on column ADVANCE_HOST.AHCLEARINGONE
  is '结算方式一';
comment on column ADVANCE_HOST.AHCLEARINGTOW
  is '结算方式二';
comment on column ADVANCE_HOST.AHCLEARINGTHREE
  is '计算方式三';
comment on column ADVANCE_HOST.AHEXCHANGERATE
  is '汇率';
comment on column ADVANCE_HOST.AHDISCOUNTRATE
  is '折扣率';
comment on column ADVANCE_HOST.AHDEPT
  is '所属部门';
comment on column ADVANCE_HOST.AHMAKINGNAME
  is '制单人员';
comment on column ADVANCE_HOST.AHVERIFIER
  is '审核人';
comment on column ADVANCE_HOST.AHREVIEWSTATE
  is '审核状态0-未审核1-已审核';
comment on column ADVANCE_HOST.AHREVIEWDATE
  is '审核时间';
comment on column ADVANCE_HOST.AHREMARK
  is '备注';
comment on column ADVANCE_HOST.TESTA
  is '备用字段1';
comment on column ADVANCE_HOST.TESTB
  is '备用字段2';
alter table ADVANCE_HOST
  add primary key (AHID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating ADVANCE_DETAIL...
create table ADVANCE_DETAIL
(
  ADID      VARCHAR2(50) not null,
  ADLINE    NUMBER(11) not null,
  ADMONEY   NUMBER(11,2),
  ADSINGLE  VARCHAR2(50),
  ADSOURCE  NUMBER(11),
  ADSUMMARY VARCHAR2(255),
  TESTA     VARCHAR2(10),
  TESTB     VARCHAR2(10)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column ADVANCE_DETAIL.ADID
  is '单号(引用预付款主表)';
comment on column ADVANCE_DETAIL.ADLINE
  is '行号';
comment on column ADVANCE_DETAIL.ADMONEY
  is '预付金额';
comment on column ADVANCE_DETAIL.ADSINGLE
  is '来源单别(采购订单)';
comment on column ADVANCE_DETAIL.ADSOURCE
  is '来源单号';
comment on column ADVANCE_DETAIL.ADSUMMARY
  is '摘要';
comment on column ADVANCE_DETAIL.TESTA
  is '备用字段1';
comment on column ADVANCE_DETAIL.TESTB
  is '备用字段2';
alter table ADVANCE_DETAIL
  add primary key (ADID, ADLINE)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table ADVANCE_DETAIL
  add foreign key (ADID)
  references ADVANCE_HOST (AHID);

prompt Creating BALANCE_HOST...
create table BALANCE_HOST
(
  BHID            VARCHAR2(50) not null,
  BHDATE          DATE,
  SUPPLIERSID     VARCHAR2(11),
  CURRENCYID      VARCHAR2(11),
  BHCLEARINGONE   NUMBER(11,2),
  BHCLEARINGTOW   NUMBER(11,2),
  BHCLEARINGTHREE NUMBER(11,2),
  BHEXCHANGERATE  NUMBER(11,4),
  BHDISCOUNTRATE  NUMBER(11,2),
  BHDEPT          VARCHAR2(20),
  BHREMARK        VARCHAR2(255),
  BHMAKINGNAME    VARCHAR2(20),
  BHVERIFIER      VARCHAR2(20),
  BHREVIEWDATA    CHAR(1) default '0',
  BHREVIEWDATE    DATE,
  TESTA           VARCHAR2(20),
  TESTB           VARCHAR2(20)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column BALANCE_HOST.BHID
  is '单号';
comment on column BALANCE_HOST.BHDATE
  is '日期';
comment on column BALANCE_HOST.SUPPLIERSID
  is '供应商id(fk)';
comment on column BALANCE_HOST.CURRENCYID
  is '币别id(fk)';
comment on column BALANCE_HOST.BHCLEARINGONE
  is '结算方式一';
comment on column BALANCE_HOST.BHCLEARINGTOW
  is '结算方式二';
comment on column BALANCE_HOST.BHCLEARINGTHREE
  is '结算方式三';
comment on column BALANCE_HOST.BHEXCHANGERATE
  is '汇率';
comment on column BALANCE_HOST.BHDISCOUNTRATE
  is '折扣率';
comment on column BALANCE_HOST.BHDEPT
  is '所属部门';
comment on column BALANCE_HOST.BHREMARK
  is '备注';
comment on column BALANCE_HOST.BHMAKINGNAME
  is '制单人员';
comment on column BALANCE_HOST.BHVERIFIER
  is '审核人';
comment on column BALANCE_HOST.BHREVIEWDATA
  is '审核状态0-未审核1-已审核';
comment on column BALANCE_HOST.BHREVIEWDATE
  is '审核时间';
comment on column BALANCE_HOST.TESTA
  is '备用字段1';
comment on column BALANCE_HOST.TESTB
  is '备用字段2';
alter table BALANCE_HOST
  add primary key (BHID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating BALANCE_ADVANCEDETAIL...
create table BALANCE_ADVANCEDETAIL
(
  BAID    VARCHAR2(50) not null,
  BALINE  NUMBER(11) not null,
  ADID    VARCHAR2(11),
  ADLINE  VARCHAR2(11),
  BAMONEY NUMBER(11,2),
  TEST1   VARCHAR2(20),
  TEST2   VARCHAR2(20)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column BALANCE_ADVANCEDETAIL.BAID
  is '单号';
comment on column BALANCE_ADVANCEDETAIL.BALINE
  is '行号';
comment on column BALANCE_ADVANCEDETAIL.ADID
  is '预付单单号(fk)';
comment on column BALANCE_ADVANCEDETAIL.ADLINE
  is '预付单行号(fk)';
comment on column BALANCE_ADVANCEDETAIL.BAMONEY
  is '取用预付金额';
comment on column BALANCE_ADVANCEDETAIL.TEST1
  is '备用字段1';
comment on column BALANCE_ADVANCEDETAIL.TEST2
  is '备用字段2';
alter table BALANCE_ADVANCEDETAIL
  add primary key (BAID, BALINE)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table BALANCE_ADVANCEDETAIL
  add foreign key (BAID)
  references BALANCE_HOST (BHID);

prompt Creating BALANCE_DETAIL...
create table BALANCE_DETAIL
(
  BDID             VARCHAR2(50) not null,
  BDLINE           NUMBER(11) not null,
  BDSINGLE         VARCHAR2(20),
  BDSOURCE         VARCHAR2(11),
  BDPRIMARYMONEY   NUMBER(11,2),
  BDDISCOUNTSMONEY NUMBER(11,2),
  BDCHARGEMONEY    NUMBER(11,2),
  TESTA            VARCHAR2(20),
  TESTB            VARCHAR2(20)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column BALANCE_DETAIL.BDID
  is '单号';
comment on column BALANCE_DETAIL.BDLINE
  is '行号';
comment on column BALANCE_DETAIL.BDSINGLE
  is '来源单别(采购入库单)';
comment on column BALANCE_DETAIL.BDSOURCE
  is '来源单号';
comment on column BALANCE_DETAIL.BDPRIMARYMONEY
  is '原单金额';
comment on column BALANCE_DETAIL.BDDISCOUNTSMONEY
  is '折让金额';
comment on column BALANCE_DETAIL.BDCHARGEMONEY
  is '冲款金额';
comment on column BALANCE_DETAIL.TESTA
  is '备用字段1';
comment on column BALANCE_DETAIL.TESTB
  is '备用字段2';
alter table BALANCE_DETAIL
  add primary key (BDID, BDLINE)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table BALANCE_DETAIL
  add foreign key (BDID)
  references BALANCE_HOST (BHID);

prompt Creating BILLTYPE...
create table BILLTYPE
(
  ID          NUMBER(2) not null,
  SOTYPE      VARCHAR2(50),
  ENNAME      VARCHAR2(100),
  DETAILTABLE VARCHAR2(200)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table BILLTYPE
  is '订单类型表';
comment on column BILLTYPE.ID
  is '类型编号';
comment on column BILLTYPE.SOTYPE
  is '类型名称';
comment on column BILLTYPE.ENNAME
  is '对应单据主表数据表';
comment on column BILLTYPE.DETAILTABLE
  is '该表的详细表';
alter table BILLTYPE
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating BUYER...
create table BUYER
(
  ID           VARCHAR2(50) not null,
  TIME         DATE not null,
  SUPPLIERNAME VARCHAR2(100) not null,
  STATE        NUMBER(7),
  MONEYTYPE    NUMBER(7),
  TAXSTATE     NUMBER(7),
  RATE         NUMBER(7,1),
  DELIVER      VARCHAR2(50),
  TOUCHING     VARCHAR2(100),
  SECTION      VARCHAR2(100),
  CHECKPEOPLE  VARCHAR2(50),
  REMARK       VARCHAR2(150),
  COLUMNSTATE  NUMBER(7),
  CHECKSTATE   NUMBER(7),
  COLUMN1      VARCHAR2(150),
  COLUMN2      VARCHAR2(150),
  COLUMN3      VARCHAR2(50)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column BUYER.ID
  is '单据号码';
comment on column BUYER.TIME
  is '仓库id';
comment on column BUYER.SUPPLIERNAME
  is '供应商id，名字';
comment on column BUYER.STATE
  is '单况0未完结/1完结/2废弃';
comment on column BUYER.MONEYTYPE
  is '币别 0RMR';
comment on column BUYER.TAXSTATE
  is '是否含税0含税/1不含税';
comment on column BUYER.RATE
  is '汇率';
comment on column BUYER.DELIVER
  is '送货地址';
comment on column BUYER.TOUCHING
  is '制单人员';
comment on column BUYER.SECTION
  is '所属部门';
comment on column BUYER.CHECKPEOPLE
  is '复核人员';
comment on column BUYER.REMARK
  is '备注';
comment on column BUYER.COLUMNSTATE
  is '表数据的状态 0正常/1删除';
comment on column BUYER.CHECKSTATE
  is '审核状态0审核/1未审核';
comment on column BUYER.COLUMN1
  is '备用字段1';
comment on column BUYER.COLUMN2
  is '备用字段2';
comment on column BUYER.COLUMN3
  is '备用字段3';
alter table BUYER
  add constraint PK_BUYER primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating BUYERSON...
create table BUYERSON
(
  ID          VARCHAR2(50) not null,
  LINE        NUMBER(7) not null,
  FID         VARCHAR2(50) not null,
  WID         VARCHAR2(50) not null,
  FROMID      VARCHAR2(50) not null,
  FROMTYPE    VARCHAR2(50) not null,
  PRICE       NUMBER(7),
  NUM         NUMBER(7),
  TIME        DATE,
  NOTNUM      NUMBER(7),
  MONEY       NUMBER(7,1),
  TARIFF      NUMBER(7,1),
  TARIFFMONEY NUMBER(7,1),
  MONEYTARIFF NUMBER(7,1),
  GIFT        NUMBER(7),
  REMARK      VARCHAR2(50),
  COLUMNSTATE NUMBER(7),
  COLUMN1     VARCHAR2(50),
  COLUMN2     VARCHAR2(50),
  COLUMN3     VARCHAR2(50)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column BUYERSON.ID
  is '单据号码';
comment on column BUYERSON.LINE
  is '行号';
comment on column BUYERSON.FID
  is '父单据号';
comment on column BUYERSON.WID
  is '物料号';
comment on column BUYERSON.FROMID
  is '来源单号';
comment on column BUYERSON.FROMTYPE
  is '来源单别';
comment on column BUYERSON.PRICE
  is '税前金额';
comment on column BUYERSON.NUM
  is '汇率';
comment on column BUYERSON.TIME
  is '单据时间';
comment on column BUYERSON.NOTNUM
  is '未入库量';
comment on column BUYERSON.MONEY
  is '单价';
comment on column BUYERSON.TARIFFMONEY
  is '税额';
comment on column BUYERSON.MONEYTARIFF
  is '含税金额';
comment on column BUYERSON.GIFT
  is '是否为非赠品0非赠品,1赠品';
comment on column BUYERSON.REMARK
  is '备注';
comment on column BUYERSON.COLUMNSTATE
  is '表数据的状态 0正常/1删除';
comment on column BUYERSON.COLUMN1
  is '备用字段1';
comment on column BUYERSON.COLUMN2
  is '备用字段2';
comment on column BUYERSON.COLUMN3
  is '备用字段3';
alter table BUYERSON
  add constraint PK_BUYERSON primary key (ID, LINE, FID, WID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table BUYERSON
  add constraint FK_BUYER foreign key (FID)
  references BUYER (ID);

prompt Creating CHECK1...
create table CHECK1
(
  PDNUMBERS       VARCHAR2(20) not null,
  PDWAREHOUSE     VARCHAR2(20),
  PDDATE          DATE,
  PDPERSONNEL     VARCHAR2(20),
  PDZDPERSONNEL   VARCHAR2(20),
  PDDEPARTMENT    VARCHAR2(20),
  PDRECHECKNUMBER VARCHAR2(20),
  PDCOLUMN1       VARCHAR2(20),
  PDCOLUMN2       VARCHAR2(20),
  PDREMARK        VARCHAR2(200),
  PDEXAMINESTATUS NUMBER(2)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table CHECK1
  is '盘点单主表';
comment on column CHECK1.PDNUMBERS
  is '盘点号';
comment on column CHECK1.PDWAREHOUSE
  is '盘点仓库编号，名称 ';
comment on column CHECK1.PDDATE
  is '单据日期';
comment on column CHECK1.PDPERSONNEL
  is '盘点人员编号，名称';
comment on column CHECK1.PDZDPERSONNEL
  is '制单人员';
comment on column CHECK1.PDDEPARTMENT
  is '所属部门编号，名称';
comment on column CHECK1.PDRECHECKNUMBER
  is '	复核人员';
comment on column CHECK1.PDCOLUMN1
  is '自定义栏一';
comment on column CHECK1.PDCOLUMN2
  is '自定义栏二';
comment on column CHECK1.PDREMARK
  is '备注';
comment on column CHECK1.PDEXAMINESTATUS
  is '审核状态（0，已审核1，未审核）';
alter table CHECK1
  add primary key (PDNUMBERS)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating MATTERTYPE...
create table MATTERTYPE
(
  MATTERTYPEID VARCHAR2(50) not null,
  TYPE         VARCHAR2(50),
  ENAME        VARCHAR2(50),
  SAVECOURSE   VARCHAR2(50),
  SALESPROCEED VARCHAR2(50),
  SALESCOST    VARCHAR2(50),
  REMARK       VARCHAR2(50),
  STATUS       NUMBER(2),
  PREPARE1     VARCHAR2(50),
  PREPARE2     VARCHAR2(50)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table MATTERTYPE
  is '物料类别设定';
comment on column MATTERTYPE.MATTERTYPEID
  is '类型编号';
comment on column MATTERTYPE.TYPE
  is '类型';
comment on column MATTERTYPE.ENAME
  is '英文名称';
comment on column MATTERTYPE.SAVECOURSE
  is '存货科目';
comment on column MATTERTYPE.SALESPROCEED
  is '销售收入科目';
comment on column MATTERTYPE.SALESCOST
  is '销售成本科目';
comment on column MATTERTYPE.REMARK
  is '备注';
comment on column MATTERTYPE.STATUS
  is '状态';
comment on column MATTERTYPE.PREPARE1
  is '预留列1';
comment on column MATTERTYPE.PREPARE2
  is '预留列2';
alter table MATTERTYPE
  add primary key (MATTERTYPEID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating T_SUPPLIERTYPE...
create table T_SUPPLIERTYPE
(
  SUPTYPEID   VARCHAR2(50) not null,
  SUPTYPENAME VARCHAR2(50)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column T_SUPPLIERTYPE.SUPTYPEID
  is '供应商类别编号';
comment on column T_SUPPLIERTYPE.SUPTYPENAME
  is '类别名称';
alter table T_SUPPLIERTYPE
  add primary key (SUPTYPEID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating COINTYPE...
create table COINTYPE
(
  ID      VARCHAR2(50) not null,
  CNAME   VARCHAR2(50),
  PAITIES NUMBER(11,4)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table COINTYPE
  is '币别表';
comment on column COINTYPE.ID
  is '类型编号';
comment on column COINTYPE.CNAME
  is '类型名称';
comment on column COINTYPE.PAITIES
  is '汇率';
alter table COINTYPE
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating DEPARTMENT...
create table DEPARTMENT
(
  DEPARTMENTID      VARCHAR2(20) not null,
  DEPARTMENTCN_NAME VARCHAR2(20),
  STANDBY_1         VARCHAR2(200),
  STANDBY_2         VARCHAR2(200)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table DEPARTMENT
  is '部门表';
comment on column DEPARTMENT.DEPARTMENTID
  is '部门编号';
comment on column DEPARTMENT.DEPARTMENTCN_NAME
  is '部门名称';
alter table DEPARTMENT
  add primary key (DEPARTMENTID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating NATION...
create table NATION
(
  NATIONID      VARCHAR2(20) not null,
  NATIONCN_NAME VARCHAR2(20)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table NATION
  is '民族表';
comment on column NATION.NATIONID
  is '民族编号';
comment on column NATION.NATIONCN_NAME
  is '民族名称';
alter table NATION
  add primary key (NATIONID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating NATIONALITY...
create table NATIONALITY
(
  NATIONALITYID      VARCHAR2(20) not null,
  NATIONALITYCN_NAME VARCHAR2(20)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table NATIONALITY
  is '国籍表';
comment on column NATIONALITY.NATIONALITYID
  is '国籍编号';
comment on column NATIONALITY.NATIONALITYCN_NAME
  is '国籍名称';
alter table NATIONALITY
  add primary key (NATIONALITYID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating RECORD_OF_FORMAL_SCHOOLING...
create table RECORD_OF_FORMAL_SCHOOLING
(
  ROFSID      VARCHAR2(20) not null,
  ROFSCN_NAME VARCHAR2(20)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table RECORD_OF_FORMAL_SCHOOLING
  is '学历表';
comment on column RECORD_OF_FORMAL_SCHOOLING.ROFSID
  is '学历编号';
comment on column RECORD_OF_FORMAL_SCHOOLING.ROFSCN_NAME
  is '学历名称';
alter table RECORD_OF_FORMAL_SCHOOLING
  add primary key (ROFSID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating STAFF_MASTER_FILE...
create table STAFF_MASTER_FILE
(
  STAFFID             VARCHAR2(20) not null,
  PWD                 VARCHAR2(20),
  DEPARTMENTID        VARCHAR2(20),
  STAFFNAME           VARCHAR2(20),
  SEX                 VARCHAR2(20),
  STAFFEN_NAME        VARCHAR2(30),
  IDCARD              VARCHAR2(20),
  BIRTHDAY            DATE,
  POLITICS_STATUS     VARCHAR2(20),
  MARRIAGE_STATUS     NUMBER,
  INDUCTION_DATE      DATE,
  BLOOD_GROUP         VARCHAR2(10),
  REGULAR_WORKER_DATE DATE,
  NATIVE_PLACE        VARCHAR2(20),
  QUALIFYING_PERIOD   VARCHAR2(20),
  NATIONALITY         VARCHAR2(20),
  LEAVE_OFFICE_DATE   DATE,
  NATION              VARCHAR2(20),
  TECHNICAL_TITLE     VARCHAR2(20),
  CN_DUTIES           VARCHAR2(20),
  EN_DUTIES           VARCHAR2(20),
  LINKPOSTCODE        VARCHAR2(20),
  LINKADDRESS         VARCHAR2(50),
  LINKPHONE           VARCHAR2(20),
  PHONE               VARCHAR2(20),
  HIGHEST_EDUCATION   VARCHAR2(20),
  EXPIRATION_DATE     DATE,
  BACHELOR_DEGREE     VARCHAR2(20),
  ARRIVAL_DATE        DATE,
  GRADUATE            VARCHAR2(20),
  PASSPORT_NUMBER     VARCHAR2(20),
  COLLEGE_MAJOR       VARCHAR2(20),
  PACT_START_DATE     DATE,
  EXPERIENCES_DATE    DATE,
  EMAIL               VARCHAR2(50),
  CONTRACT_PERIOD     DATE,
  NOW_PHONE           VARCHAR2(20),
  DOMICILE_PHONE      VARCHAR2(20),
  NOW_ADDRESS         VARCHAR2(30),
  HOME_PHONE          VARCHAR2(20),
  HOME_ADDRESS        VARCHAR2(30),
  REMARK              VARCHAR2(200),
  STANDBY_1           VARCHAR2(200),
  STANDBY_2           VARCHAR2(200)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table STAFF_MASTER_FILE
  is '人员主文件表';
comment on column STAFF_MASTER_FILE.STAFFID
  is '人员编号';
comment on column STAFF_MASTER_FILE.PWD
  is '密码';
comment on column STAFF_MASTER_FILE.DEPARTMENTID
  is '所属部门，外键';
comment on column STAFF_MASTER_FILE.STAFFNAME
  is '人员姓名';
comment on column STAFF_MASTER_FILE.SEX
  is '性别';
comment on column STAFF_MASTER_FILE.STAFFEN_NAME
  is '英文姓名';
comment on column STAFF_MASTER_FILE.IDCARD
  is '身份证号码';
comment on column STAFF_MASTER_FILE.BIRTHDAY
  is '出生日期';
comment on column STAFF_MASTER_FILE.POLITICS_STATUS
  is '政治面貌';
comment on column STAFF_MASTER_FILE.MARRIAGE_STATUS
  is '婚姻状况';
comment on column STAFF_MASTER_FILE.INDUCTION_DATE
  is '入职日期';
comment on column STAFF_MASTER_FILE.BLOOD_GROUP
  is '血型';
comment on column STAFF_MASTER_FILE.REGULAR_WORKER_DATE
  is '转正日期';
comment on column STAFF_MASTER_FILE.NATIVE_PLACE
  is '籍贯';
comment on column STAFF_MASTER_FILE.QUALIFYING_PERIOD
  is '试用期长';
comment on column STAFF_MASTER_FILE.NATIONALITY
  is '国籍，外键';
comment on column STAFF_MASTER_FILE.LEAVE_OFFICE_DATE
  is '离职日期';
comment on column STAFF_MASTER_FILE.NATION
  is '民族，外键';
comment on column STAFF_MASTER_FILE.TECHNICAL_TITLE
  is '技术职称';
comment on column STAFF_MASTER_FILE.CN_DUTIES
  is '中文职务';
comment on column STAFF_MASTER_FILE.EN_DUTIES
  is '英文职务';
comment on column STAFF_MASTER_FILE.LINKPOSTCODE
  is '联系邮编';
comment on column STAFF_MASTER_FILE.LINKADDRESS
  is '联系地址';
comment on column STAFF_MASTER_FILE.LINKPHONE
  is '联系电话';
comment on column STAFF_MASTER_FILE.PHONE
  is '移动电话';
comment on column STAFF_MASTER_FILE.HIGHEST_EDUCATION
  is '最高学历，外键';
comment on column STAFF_MASTER_FILE.EXPIRATION_DATE
  is '到期日期';
comment on column STAFF_MASTER_FILE.BACHELOR_DEGREE
  is '学位';
comment on column STAFF_MASTER_FILE.ARRIVAL_DATE
  is '入境日期';
comment on column STAFF_MASTER_FILE.GRADUATE
  is '毕业学校';
comment on column STAFF_MASTER_FILE.PASSPORT_NUMBER
  is '护照号码';
comment on column STAFF_MASTER_FILE.COLLEGE_MAJOR
  is '所学专业';
comment on column STAFF_MASTER_FILE.PACT_START_DATE
  is '合同起始日期';
comment on column STAFF_MASTER_FILE.EXPERIENCES_DATE
  is '体验日期';
comment on column STAFF_MASTER_FILE.EMAIL
  is '电子邮箱';
comment on column STAFF_MASTER_FILE.CONTRACT_PERIOD
  is '合同期（长）';
comment on column STAFF_MASTER_FILE.NOW_PHONE
  is '现电话';
comment on column STAFF_MASTER_FILE.DOMICILE_PHONE
  is '户籍电话';
comment on column STAFF_MASTER_FILE.NOW_ADDRESS
  is '现地址';
comment on column STAFF_MASTER_FILE.HOME_PHONE
  is '家庭电话';
comment on column STAFF_MASTER_FILE.HOME_ADDRESS
  is '现地址';
comment on column STAFF_MASTER_FILE.REMARK
  is '备注';
alter table STAFF_MASTER_FILE
  add primary key (STAFFID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table STAFF_MASTER_FILE
  add constraint FK_SMF_BM foreign key (DEPARTMENTID)
  references DEPARTMENT (DEPARTMENTID);
alter table STAFF_MASTER_FILE
  add constraint FK_SMF_GJ foreign key (NATIONALITY)
  references NATIONALITY (NATIONALITYID);
alter table STAFF_MASTER_FILE
  add constraint FK_SMF_MZ foreign key (NATION)
  references NATION (NATIONID);
alter table STAFF_MASTER_FILE
  add constraint FK_SMF_XL foreign key (HIGHEST_EDUCATION)
  references RECORD_OF_FORMAL_SCHOOLING (ROFSID);

prompt Creating T_SUPPLIERMASTER...
create table T_SUPPLIERMASTER
(
  SUPPLIERID      VARCHAR2(50) not null,
  SUPTYPEID       VARCHAR2(50),
  ADDRESSNAME     VARCHAR2(50),
  CURRENCYID      VARCHAR2(50),
  PURCHASEMAN     VARCHAR2(50),
  SURPLUSMONEY    NUMBER(11,2),
  PAYTERM         VARCHAR2(50) default '货到',
  CREDITRAT       VARCHAR2(50),
  STARTADVRECV    NUMBER(11,2),
  STARTRECEIVABLE NUMBER(11,2),
  CURADVRECV      NUMBER(11,2),
  CURRECEIVABLE   NUMBER(11,2),
  PRICEOFTAX      CHAR(1) default '0',
  AMOUNTQUOTA     NUMBER(11,2),
  COLUMNONE       VARCHAR2(10),
  COLUMNTWO       VARCHAR2(10)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column T_SUPPLIERMASTER.SUPPLIERID
  is '供应商编号';
comment on column T_SUPPLIERMASTER.SUPTYPEID
  is '类别编号';
comment on column T_SUPPLIERMASTER.ADDRESSNAME
  is '地区名称';
comment on column T_SUPPLIERMASTER.CURRENCYID
  is '币别编号';
comment on column T_SUPPLIERMASTER.PURCHASEMAN
  is '采购人员编号';
comment on column T_SUPPLIERMASTER.SURPLUSMONEY
  is '剩余额度';
comment on column T_SUPPLIERMASTER.PAYTERM
  is '付款条件';
comment on column T_SUPPLIERMASTER.CREDITRAT
  is '信用等级';
comment on column T_SUPPLIERMASTER.STARTADVRECV
  is '期初预付款';
comment on column T_SUPPLIERMASTER.STARTRECEIVABLE
  is '期初应付款';
comment on column T_SUPPLIERMASTER.CURADVRECV
  is '期末预付款';
comment on column T_SUPPLIERMASTER.CURRECEIVABLE
  is '期末应付款';
comment on column T_SUPPLIERMASTER.PRICEOFTAX
  is '单价是否含税';
comment on column T_SUPPLIERMASTER.AMOUNTQUOTA
  is '账款额度';
comment on column T_SUPPLIERMASTER.COLUMNONE
  is '备用字段1';
comment on column T_SUPPLIERMASTER.COLUMNTWO
  is '备用字段2';
alter table T_SUPPLIERMASTER
  add primary key (SUPPLIERID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table T_SUPPLIERMASTER
  add foreign key (SUPTYPEID)
  references T_SUPPLIERTYPE (SUPTYPEID);
alter table T_SUPPLIERMASTER
  add foreign key (CURRENCYID)
  references COINTYPE (ID);
alter table T_SUPPLIERMASTER
  add foreign key (PURCHASEMAN)
  references STAFF_MASTER_FILE (STAFFID);

prompt Creating MATTERINFO...
create table MATTERINFO
(
  MATTERID     VARCHAR2(50) not null,
  MATTERNAME   VARCHAR2(50),
  MATTERTYPEID VARCHAR2(50),
  SAVE         VARCHAR2(20),
  MODELS       VARCHAR2(20),
  SUGGESTPRICE VARCHAR2(50),
  ASELL        NUMBER(10,2),
  BSELL        NUMBER(10,2),
  CSELL        NUMBER(10,2),
  DSELL        NUMBER(10,2),
  ESELL        NUMBER(10,2),
  STANDARDBID  NUMBER(10,2),
  MONEYTYPE    VARCHAR2(50),
  BIAOCB       NUMBER(10,2),
  TAXSTATE     NUMBER(10,2),
  MATTERREMARK VARCHAR2(50),
  SHUILV       NUMBER(10,2),
  ALOCAIGOU    NUMBER(10,2),
  SALESERID    VARCHAR2(50),
  ANQUSAVE     NUMBER(10,2),
  BSUMCOST     NUMBER(10,2),
  AVGCOST      NUMBER(10,2),
  COST         NUMBER(10,2),
  STARTSCOST   NUMBER(10,2),
  STATUS       NUMBER(2),
  PREPARE1     VARCHAR2(50),
  PREPARE2     VARCHAR2(50)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table MATTERINFO
  is '物料主文件';
comment on column MATTERINFO.MATTERID
  is '物料编号';
comment on column MATTERINFO.MATTERNAME
  is '物料名称';
comment on column MATTERINFO.MATTERTYPEID
  is '物料类别编号';
comment on column MATTERINFO.SAVE
  is '计量单位';
comment on column MATTERINFO.MODELS
  is '规格型号';
comment on column MATTERINFO.SUGGESTPRICE
  is '建议售价';
comment on column MATTERINFO.ASELL
  is '售价A';
comment on column MATTERINFO.BSELL
  is '售价B';
comment on column MATTERINFO.CSELL
  is '售价C';
comment on column MATTERINFO.DSELL
  is '售价D';
comment on column MATTERINFO.ESELL
  is '售价E';
comment on column MATTERINFO.STANDARDBID
  is '标准进价';
comment on column MATTERINFO.MONEYTYPE
  is '币别编号';
comment on column MATTERINFO.BIAOCB
  is '标准成本价';
comment on column MATTERINFO.TAXSTATE
  is '单价是否含税';
comment on column MATTERINFO.MATTERREMARK
  is '物料说明';
comment on column MATTERINFO.SHUILV
  is '税率';
comment on column MATTERINFO.ALOCAIGOU
  is '采购提前期';
comment on column MATTERINFO.SALESERID
  is '主供应商';
comment on column MATTERINFO.ANQUSAVE
  is '安全存量';
comment on column MATTERINFO.BSUMCOST
  is '期初总数量';
comment on column MATTERINFO.AVGCOST
  is '平均成本';
comment on column MATTERINFO.COST
  is '标准成本';
comment on column MATTERINFO.STARTSCOST
  is '期初总成本';
comment on column MATTERINFO.STATUS
  is '状态';
comment on column MATTERINFO.PREPARE1
  is '预留列1';
comment on column MATTERINFO.PREPARE2
  is '预留列2';
alter table MATTERINFO
  add primary key (MATTERID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table MATTERINFO
  add constraint FK_MATTERINFO_MATTERTYPEID foreign key (MATTERTYPEID)
  references MATTERTYPE (MATTERTYPEID);
alter table MATTERINFO
  add constraint FK_MATTERINFO_MONEYTYPE foreign key (MONEYTYPE)
  references COINTYPE (ID);
alter table MATTERINFO
  add constraint FK_MATTERINFO_SALESERID foreign key (SALESERID)
  references T_SUPPLIERMASTER (SUPPLIERID);

prompt Creating CHECKS...
create table CHECKS
(
  PDNUMBERS           VARCHAR2(20) not null,
  PDLINE              VARCHAR2(20) not null,
  PDMATERIALID        VARCHAR2(20),
  PDMATERIALNAME      VARCHAR2(20),
  PDMATERIALTYPE      VARCHAR2(20),
  PDPAPERNUMBER       NUMBER(11),
  PDNUMBER            NUMBER(11),
  PDLOSSPROFITNUMBERS NUMBER(11),
  PDPRICE             NUMBER(9,4),
  PDLOSSPROFITMONEY   NUMBER(9,4),
  PDCAUSE             VARCHAR2(200)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table CHECKS
  is '盘点单详表';
comment on column CHECKS.PDNUMBERS
  is '盘点号';
comment on column CHECKS.PDLINE
  is '行号 ';
comment on column CHECKS.PDMATERIALID
  is '物料编号';
comment on column CHECKS.PDMATERIALNAME
  is '物料名称';
comment on column CHECKS.PDMATERIALTYPE
  is '规格型号';
comment on column CHECKS.PDPAPERNUMBER
  is '账面数量';
comment on column CHECKS.PDNUMBER
  is '盘点数量';
comment on column CHECKS.PDLOSSPROFITNUMBERS
  is '盈亏数量';
comment on column CHECKS.PDPRICE
  is '单价';
comment on column CHECKS.PDLOSSPROFITMONEY
  is '金额盈亏';
comment on column CHECKS.PDCAUSE
  is '原因';
alter table CHECKS
  add primary key (PDNUMBERS, PDLINE)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table CHECKS
  add constraint PP1 foreign key (PDNUMBERS)
  references CHECK1 (PDNUMBERS);
alter table CHECKS
  add constraint PP3 foreign key (PDMATERIALID)
  references MATTERINFO (MATTERID);

prompt Creating CLIENT_CATEGORY...
create table CLIENT_CATEGORY
(
  CATEGORYID VARCHAR2(20) not null,
  CATEGORYNC VARCHAR2(20),
  REMARKS    VARCHAR2(20)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column CLIENT_CATEGORY.CATEGORYID
  is '类别编号';
comment on column CLIENT_CATEGORY.CATEGORYNC
  is '类别名称';
comment on column CLIENT_CATEGORY.REMARKS
  is '备注';
alter table CLIENT_CATEGORY
  add constraint FK_CLIENT_CATEGORY_CATEGORYID primary key (CATEGORYID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating CLIENT...
create table CLIENT
(
  CUSTOMERID                  VARCHAR2(100) not null,
  CUSTOMERRECEIVABLEBELONGING VARCHAR2(100),
  CUSTOMERNAME                VARCHAR2(100),
  CUSTOMERCLASSID             VARCHAR2(20),
  CUSTOMERSIMPLENAME          VARCHAR2(100),
  CUSTOMERADDRESSID           VARCHAR2(20),
  CUSTOMERCURRENCY            VARCHAR2(100),
  CUSTOMERFUNCTIONARY         VARCHAR2(100),
  PERSONNELID                 VARCHAR2(100),
  CUSTOMERCONTACT             VARCHAR2(100),
  CUSTOMERPHONE               VARCHAR2(100),
  CUSTOMERAMOUNT              NUMBER(18,4),
  CUSTOMERTRADE               VARCHAR2(100),
  CUSTOMERSMAIL               VARCHAR2(100),
  CUSTOMERBANKACCOUNT         VARCHAR2(100),
  CUSTOMERBANKNAME            VARCHAR2(100),
  CUSTOMERPORTRAITURE         VARCHAR2(100),
  CUSTOMERSELLLEVEL           INTEGER,
  CUSTOMERTAX                 INTEGER,
  CUSTOMERCREATEDATE          DATE,
  CUSTOMERRECEIVABLELIMIT     NUMBER(18,4),
  CUSTOMERSURPLUSLIMIT        NUMBER(18,4),
  CUSTOMERADVANCESRECEIVED    NUMBER(18,4),
  CUSTOMERACCOUNTDUE          NUMBER(18,4),
  CUSTOMERREMARK              VARCHAR2(100)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column CLIENT.CUSTOMERID
  is '客户的编号';
comment on column CLIENT.CUSTOMERRECEIVABLEBELONGING
  is '客户的账款归属';
comment on column CLIENT.CUSTOMERNAME
  is '客户的名称';
comment on column CLIENT.CUSTOMERCLASSID
  is '客户类别的编号(外键)';
comment on column CLIENT.CUSTOMERSIMPLENAME
  is '客户的简称';
comment on column CLIENT.CUSTOMERADDRESSID
  is '客户的地址Id';
comment on column CLIENT.CUSTOMERCURRENCY
  is '客户的币别';
comment on column CLIENT.CUSTOMERFUNCTIONARY
  is '客户的负责人';
comment on column CLIENT.PERSONNELID
  is '业务登记人员(外键)';
comment on column CLIENT.CUSTOMERCONTACT
  is '客户的联系人';
comment on column CLIENT.CUSTOMERPHONE
  is '客户的联系电话';
comment on column CLIENT.CUSTOMERAMOUNT
  is ' 客户的资本额';
comment on column CLIENT.CUSTOMERTRADE
  is ' 客户的行业';
comment on column CLIENT.CUSTOMERSMAIL
  is ' 客户的邮箱';
comment on column CLIENT.CUSTOMERBANKACCOUNT
  is ' 客户的银行卡号';
comment on column CLIENT.CUSTOMERBANKNAME
  is ' 客户的开号银行';
comment on column CLIENT.CUSTOMERPORTRAITURE
  is '客户的传真';
comment on column CLIENT.CUSTOMERSELLLEVEL
  is ' 客户的销售等级(0 是建议售价1 ，售价A2 ，售价 B3  ,售价 C)自动升等级，根据消费金额';
comment on column CLIENT.CUSTOMERTAX
  is ' 单价是否含税(0 含税 1 不含税)';
comment on column CLIENT.CUSTOMERCREATEDATE
  is ' 客户的创建日期';
comment on column CLIENT.CUSTOMERRECEIVABLELIMIT
  is '账款的额度';
comment on column CLIENT.CUSTOMERSURPLUSLIMIT
  is '客户剩余额度';
comment on column CLIENT.CUSTOMERADVANCESRECEIVED
  is ' 预收款';
comment on column CLIENT.CUSTOMERACCOUNTDUE
  is ' 应收款';
comment on column CLIENT.CUSTOMERREMARK
  is ' 客户备注';
alter table CLIENT
  add constraint FK_CLIENT_CUSTOMERID primary key (CUSTOMERID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table CLIENT
  add constraint FK_CLIENT_ADDRESS foreign key (CUSTOMERADDRESSID)
  references ADDRESS (ADDRESSID);
alter table CLIENT
  add constraint FK_CLIENT_CLIENT_CATEGORY foreign key (CUSTOMERCLASSID)
  references CLIENT_CATEGORY (CATEGORYID);

prompt Creating PURCHASE...
create table PURCHASE
(
  ID          NUMBER(30) not null,
  SDATE       DATE,
  STYPE       VARCHAR2(50),
  SMONEY      NUMBER(10,4),
  TOUCHING    VARCHAR2(50),
  ACCOUNT     VARCHAR2(50),
  CHECKSTATUS NUMBER(30),
  DEMO1       NUMBER(10,4),
  DEMO2       VARCHAR2(50),
  DEMO3       NUMBER(30)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column PURCHASE.ID
  is '单据编号';
comment on column PURCHASE.SDATE
  is '单据日期';
comment on column PURCHASE.STYPE
  is '分摊方式';
comment on column PURCHASE.SMONEY
  is '待摊金额';
comment on column PURCHASE.TOUCHING
  is '制单人员';
comment on column PURCHASE.ACCOUNT
  is '复核人员';
comment on column PURCHASE.CHECKSTATUS
  is '单据状态';
comment on column PURCHASE.DEMO1
  is '预留字段1';
comment on column PURCHASE.DEMO2
  is '预留字段2';
comment on column PURCHASE.DEMO3
  is '预留字段3';
alter table PURCHASE
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating COSTDETAIL...
create table COSTDETAIL
(
  CID            NUMBER(30) not null,
  PID            NUMBER(30),
  CLOUD          NUMBER(30),
  COSTNAME       VARCHAR2(50),
  CURRENCY       VARCHAR2(50),
  EXCHANGERARATE NUMBER(10,4),
  MONEY          NUMBER(10,4),
  STANDARDCOIN   NUMBER(10,4),
  CHECKSTATUS    NUMBER(30),
  DEMO1          NUMBER(10,4),
  DEMO2          VARCHAR2(50),
  DEMO3          NUMBER(30)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column COSTDETAIL.CID
  is '费用编号';
comment on column COSTDETAIL.PID
  is '行号';
comment on column COSTDETAIL.CLOUD
  is '主表id';
comment on column COSTDETAIL.COSTNAME
  is '费用名称';
comment on column COSTDETAIL.CURRENCY
  is '币别';
comment on column COSTDETAIL.EXCHANGERARATE
  is '汇率';
comment on column COSTDETAIL.MONEY
  is '金额';
comment on column COSTDETAIL.STANDARDCOIN
  is '本位币';
comment on column COSTDETAIL.CHECKSTATUS
  is '单据状态';
comment on column COSTDETAIL.DEMO1
  is '预留字段1';
comment on column COSTDETAIL.DEMO2
  is '预留字段2';
comment on column COSTDETAIL.DEMO3
  is '预留字段3';
alter table COSTDETAIL
  add primary key (CID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table COSTDETAIL
  add constraint FK foreign key (PID)
  references PURCHASE (ID);

prompt Creating CUSTOMERWITHMONEYDETAIL...
create table CUSTOMERWITHMONEYDETAIL
(
  BILLNO       VARCHAR2(50) not null,
  BILLTYPEID   NUMBER(2) not null,
  DATEANDTIME  DATE,
  CUSID        VARCHAR2(50),
  SOURCEMONEY  NUMBER(11,2),
  LEFTGETMONEY NUMBER(11,2)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table CUSTOMERWITHMONEYDETAIL
  is '客户账款明细表';
comment on column CUSTOMERWITHMONEYDETAIL.BILLNO
  is '单据类型编号';
comment on column CUSTOMERWITHMONEYDETAIL.BILLTYPEID
  is '单号';
comment on column CUSTOMERWITHMONEYDETAIL.DATEANDTIME
  is '时间';
comment on column CUSTOMERWITHMONEYDETAIL.CUSID
  is '客户编号';
comment on column CUSTOMERWITHMONEYDETAIL.SOURCEMONEY
  is '原单金额';
comment on column CUSTOMERWITHMONEYDETAIL.LEFTGETMONEY
  is '现行金额';
alter table CUSTOMERWITHMONEYDETAIL
  add primary key (BILLNO, BILLTYPEID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating ENQUIRY...
create table ENQUIRY
(
  ID           VARCHAR2(50) not null,
  TIME         DATE not null,
  SUPPLIERNAME VARCHAR2(100) not null,
  MONEYTYPE    NUMBER(7),
  TAXSTATE     NUMBER(7),
  RATE         NUMBER(7,1),
  DELIVER      VARCHAR2(50),
  TOUCHING     VARCHAR2(100),
  SECTION      VARCHAR2(100),
  CHECKPEOPLE  VARCHAR2(50),
  REMARK       VARCHAR2(150),
  CHECKSTATE   NUMBER(7),
  COLUMNSTATE  NUMBER(7),
  COLUMN1      VARCHAR2(150),
  COLUMN2      VARCHAR2(150),
  COLUMN3      VARCHAR2(50)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column ENQUIRY.ID
  is '单据号码';
comment on column ENQUIRY.TIME
  is '仓库id';
comment on column ENQUIRY.SUPPLIERNAME
  is '供应商id，名字';
comment on column ENQUIRY.TAXSTATE
  is '是否含税0含税/1不含税';
comment on column ENQUIRY.RATE
  is '汇率';
comment on column ENQUIRY.DELIVER
  is '送货地址';
comment on column ENQUIRY.TOUCHING
  is '制单人员';
comment on column ENQUIRY.SECTION
  is '所属部门';
comment on column ENQUIRY.CHECKPEOPLE
  is '复核人员';
comment on column ENQUIRY.REMARK
  is '备注';
comment on column ENQUIRY.CHECKSTATE
  is '审核状态0审核/1未审核';
comment on column ENQUIRY.COLUMNSTATE
  is '表数据的状态 0正常/1删除';
comment on column ENQUIRY.COLUMN1
  is '备用字段1';
comment on column ENQUIRY.COLUMN2
  is '备用字段2';
comment on column ENQUIRY.COLUMN3
  is '备用字段3';
alter table ENQUIRY
  add constraint PK_ENQUIRY primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating ENQUIRYSON...
create table ENQUIRYSON
(
  ID          VARCHAR2(50) not null,
  LINE        NUMBER(7) not null,
  FID         VARCHAR2(50) not null,
  WID         VARCHAR2(50) not null,
  FROMID      VARCHAR2(50) not null,
  FROMTYPE    VARCHAR2(50) not null,
  PRICE       NUMBER(7,1),
  NUM         NUMBER(7,1),
  TIME        DATE,
  NOTNUM      NUMBER(7,1),
  MONEY       NUMBER(7,1),
  TARIFF      NUMBER(7,1),
  TARIFFMONEY NUMBER(7,1),
  MONEYTARIFF NUMBER(7,1),
  GIFT        NUMBER(7),
  REMARK      VARCHAR2(50),
  COLUMNSTATE NUMBER(7),
  COLUMN1     VARCHAR2(50),
  COLUMN2     VARCHAR2(50),
  COLUMN3     VARCHAR2(50)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column ENQUIRYSON.ID
  is '单据号码';
comment on column ENQUIRYSON.LINE
  is '行号';
comment on column ENQUIRYSON.FID
  is '父单据号';
comment on column ENQUIRYSON.WID
  is '物料号';
comment on column ENQUIRYSON.FROMID
  is '来源单号';
comment on column ENQUIRYSON.FROMTYPE
  is '来源单别';
comment on column ENQUIRYSON.PRICE
  is '税前金额';
comment on column ENQUIRYSON.NUM
  is '汇率';
comment on column ENQUIRYSON.TIME
  is '单据时间';
comment on column ENQUIRYSON.NOTNUM
  is '未入库量';
comment on column ENQUIRYSON.MONEY
  is '单价';
comment on column ENQUIRYSON.TARIFFMONEY
  is '税额';
comment on column ENQUIRYSON.MONEYTARIFF
  is '含税金额';
comment on column ENQUIRYSON.GIFT
  is '是否为非赠品0非赠品,1赠品';
comment on column ENQUIRYSON.REMARK
  is '备注';
comment on column ENQUIRYSON.COLUMNSTATE
  is '表数据的状态 0正常/1删除';
comment on column ENQUIRYSON.COLUMN1
  is '备用字段1';
comment on column ENQUIRYSON.COLUMN2
  is '备用字段2';
comment on column ENQUIRYSON.COLUMN3
  is '备用字段3';
alter table ENQUIRYSON
  add constraint PK_ENQUIRYSON primary key (ID, LINE, FID, WID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table ENQUIRYSON
  add constraint FK_ENQUIRYSON foreign key (FID)
  references ENQUIRY (ID);

prompt Creating ENQUIRYSONS...
create table ENQUIRYSONS
(
  ID          VARCHAR2(50) not null,
  LINE        VARCHAR2(50),
  FID         VARCHAR2(50),
  WID         VARCHAR2(50),
  FROMID      VARCHAR2(50),
  FROMTYPE    VARCHAR2(50),
  PRICE       NUMBER(11,2),
  NUM         INTEGER,
  MONEY       NUMBER(11,2),
  TARIFF      NUMBER(11,2),
  TARIFFMONEY NUMBER(11,2),
  MONEYTARIFF NUMBER(11,2),
  GIFT        INTEGER,
  REMARK      VARCHAR2(50),
  COLUMN1     VARCHAR2(50),
  COLUMN2     VARCHAR2(50),
  COLUMN3     VARCHAR2(50)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column ENQUIRYSONS.ID
  is '单据号';
comment on column ENQUIRYSONS.LINE
  is '行号';
comment on column ENQUIRYSONS.FID
  is '总表id';
comment on column ENQUIRYSONS.WID
  is '物料id';
comment on column ENQUIRYSONS.FROMID
  is '来源单号';
comment on column ENQUIRYSONS.FROMTYPE
  is '来源单别';
comment on column ENQUIRYSONS.PRICE
  is '折扣前单价';
comment on column ENQUIRYSONS.NUM
  is '数量';
comment on column ENQUIRYSONS.MONEY
  is '金额';
comment on column ENQUIRYSONS.TARIFF
  is '税率';
comment on column ENQUIRYSONS.TARIFFMONEY
  is '税额';
comment on column ENQUIRYSONS.MONEYTARIFF
  is '含税金额';
comment on column ENQUIRYSONS.GIFT
  is '赠品0非赠品/1赠品';
comment on column ENQUIRYSONS.REMARK
  is '分录备注';
comment on column ENQUIRYSONS.COLUMN1
  is '备用字段1';
comment on column ENQUIRYSONS.COLUMN2
  is '备用字段2';
comment on column ENQUIRYSONS.COLUMN3
  is '备用字段3';
alter table ENQUIRYSONS
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating ESTIMATEMONEYBILL...
create table ESTIMATEMONEYBILL
(
  ID          VARCHAR2(50) not null,
  DATEANDTIME DATE,
  CUSID       VARCHAR2(10),
  COINTYPE    VARCHAR2(50),
  OVERTIME    DATE,
  PAITIES     NUMBER(11,4),
  TRANSFER    NUMBER(11,2),
  DRAFT       NUMBER(11,2),
  OTHERWAY    NUMBER(11,2),
  REMARK      VARCHAR2(200),
  DANDNAME    VARCHAR2(50),
  CANDNAME    VARCHAR2(50),
  MANDNAME    VARCHAR2(50)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table ESTIMATEMONEYBILL
  is '预收款单表';
comment on column ESTIMATEMONEYBILL.ID
  is '单据编号';
comment on column ESTIMATEMONEYBILL.DATEANDTIME
  is '单据时间';
comment on column ESTIMATEMONEYBILL.CUSID
  is '客户编号';
comment on column ESTIMATEMONEYBILL.COINTYPE
  is '币别';
comment on column ESTIMATEMONEYBILL.OVERTIME
  is '终止帐日';
comment on column ESTIMATEMONEYBILL.PAITIES
  is '汇率';
comment on column ESTIMATEMONEYBILL.TRANSFER
  is '转账方式';
comment on column ESTIMATEMONEYBILL.DRAFT
  is '汇票方式';
comment on column ESTIMATEMONEYBILL.OTHERWAY
  is '其他方式';
comment on column ESTIMATEMONEYBILL.REMARK
  is '备注';
comment on column ESTIMATEMONEYBILL.DANDNAME
  is '部门编号-名称';
comment on column ESTIMATEMONEYBILL.CANDNAME
  is '审核人编号-名称';
comment on column ESTIMATEMONEYBILL.MANDNAME
  is '制单人编号-名称';
alter table ESTIMATEMONEYBILL
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating ESTIMATEMONEYBILLDETAIL...
create table ESTIMATEMONEYBILLDETAIL
(
  ID            VARCHAR2(50) not null,
  LINENO        NUMBER(11) not null,
  BILLTYPEID    NUMBER(2),
  BILLNO        VARCHAR2(50),
  ESTIMATEMONEY NUMBER(11,2),
  REMARK        VARCHAR2(200)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table ESTIMATEMONEYBILLDETAIL
  is '预收款单明细表';
comment on column ESTIMATEMONEYBILLDETAIL.ID
  is '主表编号';
comment on column ESTIMATEMONEYBILLDETAIL.LINENO
  is '行号';
comment on column ESTIMATEMONEYBILLDETAIL.BILLTYPEID
  is '来源单别';
comment on column ESTIMATEMONEYBILLDETAIL.BILLNO
  is '摘要';
comment on column ESTIMATEMONEYBILLDETAIL.ESTIMATEMONEY
  is '预收金额';
alter table ESTIMATEMONEYBILLDETAIL
  add primary key (ID, LINENO)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating REPERTORYASSERT...
create table REPERTORYASSERT
(
  REPERTORYID       VARCHAR2(20) not null,
  REPERTORYNAME     VARCHAR2(20),
  REPERTORYCN_SHORT VARCHAR2(20),
  LINKMAN           VARCHAR2(20),
  PHONE             VARCHAR2(20),
  LINKADDRESS       VARCHAR2(50),
  REPERTORYADDRESS  VARCHAR2(50),
  REMARK            VARCHAR2(200)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table REPERTORYASSERT
  is '仓库表';
comment on column REPERTORYASSERT.REPERTORYID
  is '仓库编号';
comment on column REPERTORYASSERT.REPERTORYNAME
  is '仓库名称';
comment on column REPERTORYASSERT.REPERTORYCN_SHORT
  is '仓库简称';
comment on column REPERTORYASSERT.LINKMAN
  is '联系人';
comment on column REPERTORYASSERT.PHONE
  is '联系电话';
comment on column REPERTORYASSERT.LINKADDRESS
  is '联系地址';
comment on column REPERTORYASSERT.REPERTORYADDRESS
  is '仓库地址';
comment on column REPERTORYASSERT.REMARK
  is '备注';
alter table REPERTORYASSERT
  add primary key (REPERTORYID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating MATTERWITHDEPOT...
create table MATTERWITHDEPOT
(
  MATTERWITHDEPOTID VARCHAR2(50) not null,
  DEPOTID           VARCHAR2(20),
  MATTERID          VARCHAR2(50),
  MATTERNUMBER      NUMBER(10,2),
  MATTERMONEY       NUMBER(10,2),
  MATTERPRICE       NUMBER(10,2),
  STATUS            NUMBER(2),
  PREPARE1          VARCHAR2(50),
  PREPARE2          VARCHAR2(50)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table MATTERWITHDEPOT
  is '仓库总账表';
comment on column MATTERWITHDEPOT.MATTERWITHDEPOTID
  is '编号';
comment on column MATTERWITHDEPOT.DEPOTID
  is '仓库编号';
comment on column MATTERWITHDEPOT.MATTERID
  is '物料编号';
comment on column MATTERWITHDEPOT.MATTERNUMBER
  is '数量';
comment on column MATTERWITHDEPOT.MATTERMONEY
  is '金额';
comment on column MATTERWITHDEPOT.MATTERPRICE
  is '单价';
comment on column MATTERWITHDEPOT.STATUS
  is '状态';
comment on column MATTERWITHDEPOT.PREPARE1
  is '预留列1';
comment on column MATTERWITHDEPOT.PREPARE2
  is '预留列2';
alter table MATTERWITHDEPOT
  add primary key (MATTERWITHDEPOTID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table MATTERWITHDEPOT
  add constraint FK_MATTERWITHDEPOT_DEPOTID foreign key (DEPOTID)
  references REPERTORYASSERT (REPERTORYID);
alter table MATTERWITHDEPOT
  add constraint FK_MATTERWITHDEPOT_MATTERID foreign key (MATTERID)
  references MATTERINFO (MATTERID);

prompt Creating MOVESTORAGE...
create table MOVESTORAGE
(
  MSENO          VARCHAR2(20) not null,
  MSEDATE        DATE,
  MSEOUTSTORAGE  VARCHAR2(20),
  MSEINSERTSTOR  VARCHAR2(20),
  MSEEMPLOYEE    VARCHAR2(20),
  MESAUDITINGEMP VARCHAR2(20),
  MESREMARK      VARCHAR2(20),
  MESSTATUS      NUMBER default 0
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table MOVESTORAGE
  is '调拨单主表';
comment on column MOVESTORAGE.MSENO
  is '单据编号';
comment on column MOVESTORAGE.MSEDATE
  is '单据日期';
comment on column MOVESTORAGE.MSEOUTSTORAGE
  is '调出仓库编号';
comment on column MOVESTORAGE.MSEINSERTSTOR
  is '调入仓库编号';
comment on column MOVESTORAGE.MSEEMPLOYEE
  is '制单人员';
comment on column MOVESTORAGE.MESAUDITINGEMP
  is '复核人员';
comment on column MOVESTORAGE.MESREMARK
  is '备注';
comment on column MOVESTORAGE.MESSTATUS
  is '审核状态';
alter table MOVESTORAGE
  add primary key (MSENO)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating MOVEDETAILS...
create table MOVEDETAILS
(
  MSENO            VARCHAR2(20) not null,
  LINEMARK         NUMBER(10) not null,
  MDSMATERIELTYPE  VARCHAR2(20),
  MDSMATERIELNAME  VARCHAR2(20),
  MDSMATERIELSPECS VARCHAR2(20),
  MDSMATERIELUNIT  VARCHAR2(20),
  MDSMATERIELNUM   NUMBER(10),
  MDSREMARK        VARCHAR2(20)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table MOVEDETAILS
  is '调拨单明细表';
comment on column MOVEDETAILS.MSENO
  is '单据编号';
comment on column MOVEDETAILS.LINEMARK
  is '行号';
comment on column MOVEDETAILS.MDSMATERIELTYPE
  is '物料编号';
comment on column MOVEDETAILS.MDSMATERIELNAME
  is '物料名称';
comment on column MOVEDETAILS.MDSMATERIELSPECS
  is '物料规格';
comment on column MOVEDETAILS.MDSMATERIELUNIT
  is '单位';
comment on column MOVEDETAILS.MDSMATERIELNUM
  is '数量';
comment on column MOVEDETAILS.MDSREMARK
  is '分录备注';
alter table MOVEDETAILS
  add primary key (MSENO, LINEMARK)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table MOVEDETAILS
  add constraint FK_MOVEDETAILS_MSENO foreign key (MSENO)
  references MOVESTORAGE (MSENO);

prompt Creating OUTGOINGDETAIL...
create table OUTGOINGDETAIL
(
  LINENUMBER VARCHAR2(50) not null,
  BILLNO     VARCHAR2(50),
  DEPOT      VARCHAR2(50),
  BILLDATE   NUMBER(10,2),
  REMARKS    NUMBER(10,2),
  TYPE       NUMBER(10,2),
  QUANTITY   NUMBER(1),
  MONEY      NUMBER(10,2),
  STATUS     NUMBER(2),
  PREPARE1   VARCHAR2(50),
  PREPARE2   VARCHAR2(50)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table OUTGOINGDETAIL
  is '出入库明细表';
comment on column OUTGOINGDETAIL.LINENUMBER
  is '行号';
comment on column OUTGOINGDETAIL.BILLNO
  is '出入库单号';
comment on column OUTGOINGDETAIL.DEPOT
  is '仓库id';
comment on column OUTGOINGDETAIL.BILLDATE
  is '出入库时间';
comment on column OUTGOINGDETAIL.REMARKS
  is '备注';
comment on column OUTGOINGDETAIL.TYPE
  is '类型';
comment on column OUTGOINGDETAIL.QUANTITY
  is '总数量';
comment on column OUTGOINGDETAIL.MONEY
  is '总金额';
comment on column OUTGOINGDETAIL.STATUS
  is '状态';
comment on column OUTGOINGDETAIL.PREPARE1
  is '预留列1';
comment on column OUTGOINGDETAIL.PREPARE2
  is '预留列2';
alter table OUTGOINGDETAIL
  add primary key (LINENUMBER)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table OUTGOINGDETAIL
  add constraint FK_OUTGOINGDETAIL_DEPOT foreign key (DEPOT)
  references REPERTORYASSERT (REPERTORYID);

prompt Creating PURCHASEREQUEST...
create table PURCHASEREQUEST
(
  QGBILLNUMBER    VARCHAR2(20) not null,
  QGTYPE          VARCHAR2(20),
  QGDATE          DATE,
  QGBILLSTATE     NUMBER(2),
  QGPERSONNEL     VARCHAR2(20),
  QGZDPERSONNEL   VARCHAR2(20),
  QGDEPARTMENT    VARCHAR2(20),
  QGFHDEPARTMENT  VARCHAR2(20),
  QGHEAD          VARCHAR2(20),
  QGCOLUMN1       VARCHAR2(20),
  QGEND           VARCHAR2(20),
  QGCOLUMN2       VARCHAR2(20),
  QGREMARK        VARCHAR2(200),
  QGEXAMINESTATUS NUMBER(2)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table PURCHASEREQUEST
  is '采购请购单主表';
comment on column PURCHASEREQUEST.QGBILLNUMBER
  is '单据号';
comment on column PURCHASEREQUEST.QGTYPE
  is '请购类型编号,名称';
comment on column PURCHASEREQUEST.QGDATE
  is '请购日期';
comment on column PURCHASEREQUEST.QGBILLSTATE
  is '单况（0、已结案,1、未结案,2、失效）';
comment on column PURCHASEREQUEST.QGPERSONNEL
  is '请购人员编号,名称';
comment on column PURCHASEREQUEST.QGZDPERSONNEL
  is '制单人员';
comment on column PURCHASEREQUEST.QGDEPARTMENT
  is '请购部门编号,名称';
comment on column PURCHASEREQUEST.QGFHDEPARTMENT
  is '复核人员';
comment on column PURCHASEREQUEST.QGHEAD
  is '表头条文';
comment on column PURCHASEREQUEST.QGCOLUMN1
  is '自定义栏一';
comment on column PURCHASEREQUEST.QGEND
  is '表尾条文';
comment on column PURCHASEREQUEST.QGCOLUMN2
  is '自定义栏二';
comment on column PURCHASEREQUEST.QGREMARK
  is '备注';
comment on column PURCHASEREQUEST.QGEXAMINESTATUS
  is '审核状态(0、已审核,1、未审核)';
alter table PURCHASEREQUEST
  add primary key (QGBILLNUMBER)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating PURCHASEREQUESTS...
create table PURCHASEREQUESTS
(
  QGBILLNUMBERS   VARCHAR2(20) not null,
  QGLINE          VARCHAR2(20) not null,
  QGMATERIALID    VARCHAR2(20),
  QGMATERIALNAME  VARCHAR2(20),
  QGMATERIALTYPE  VARCHAR2(20),
  QGUNIT          VARCHAR2(20),
  QGNUMBER        NUMBER(2),
  QGSTANDARDJJ    NUMBER(9,2),
  QGSTANDARDJJJE  NUMBER(9,2),
  QGCURRENCY      VARCHAR2(20),
  QGPRICE         NUMBER(9,2),
  QGJJMONEY       NUMBER(9,2),
  QGNEEDDATE      DATE,
  QGSUGGESTDATE   DATE,
  QGTYPEREMARK    VARCHAR2(200),
  QGSOURCEBILL    VARCHAR2(20),
  QGSOURCENUMBERS VARCHAR2(20)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table PURCHASEREQUESTS
  is '采购请购单祥表';
comment on column PURCHASEREQUESTS.QGBILLNUMBERS
  is '单据号';
comment on column PURCHASEREQUESTS.QGLINE
  is '行号';
comment on column PURCHASEREQUESTS.QGMATERIALID
  is '物料编号';
comment on column PURCHASEREQUESTS.QGMATERIALNAME
  is '物料名称';
comment on column PURCHASEREQUESTS.QGMATERIALTYPE
  is '规格型号';
comment on column PURCHASEREQUESTS.QGUNIT
  is '单位';
comment on column PURCHASEREQUESTS.QGNUMBER
  is '数量';
comment on column PURCHASEREQUESTS.QGSTANDARDJJ
  is '标准进价';
comment on column PURCHASEREQUESTS.QGSTANDARDJJJE
  is '标准进价金额';
comment on column PURCHASEREQUESTS.QGCURRENCY
  is '币别';
comment on column PURCHASEREQUESTS.QGPRICE
  is '单价';
comment on column PURCHASEREQUESTS.QGJJMONEY
  is '进价金额';
comment on column PURCHASEREQUESTS.QGNEEDDATE
  is '需求日期';
comment on column PURCHASEREQUESTS.QGSUGGESTDATE
  is '建议采购日期';
comment on column PURCHASEREQUESTS.QGTYPEREMARK
  is '分类备注';
comment on column PURCHASEREQUESTS.QGSOURCEBILL
  is '来源单别';
comment on column PURCHASEREQUESTS.QGSOURCENUMBERS
  is '来源单号';
alter table PURCHASEREQUESTS
  add primary key (QGBILLNUMBERS, QGLINE)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table PURCHASEREQUESTS
  add constraint PP foreign key (QGBILLNUMBERS)
  references PURCHASEREQUEST (QGBILLNUMBER);
alter table PURCHASEREQUESTS
  add constraint PP2 foreign key (QGMATERIALID)
  references MATTERINFO (MATTERID);

prompt Creating PUTSTORAGE...
create table PUTSTORAGE
(
  ID              VARCHAR2(50) not null,
  STORAGEID       VARCHAR2(50),
  SUPPLIERNAME    VARCHAR2(50),
  TIME            DATE,
  SUPPLIERADDRESS VARCHAR2(150),
  STATE           INTEGER,
  TYPE            INTEGER,
  MONEYTYPE       INTEGER,
  TAXSTATE        INTEGER,
  RATE            NUMBER(11,2),
  DELIVER         VARCHAR2(50),
  TOUCHING        VARCHAR2(50),
  SECTION         INTEGER default '0',
  CHECKPEOPLE     INTEGER,
  REMARK          VARCHAR2(155),
  CHECKSTATE      INTEGER,
  COLUMN1         VARCHAR2(50),
  COLUMN2         VARCHAR2(50),
  COLUMN3         VARCHAR2(50)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column PUTSTORAGE.ID
  is '单据号码';
comment on column PUTSTORAGE.STORAGEID
  is '仓库id';
comment on column PUTSTORAGE.SUPPLIERNAME
  is '供应商id，名字';
comment on column PUTSTORAGE.TIME
  is '单据时间';
comment on column PUTSTORAGE.SUPPLIERADDRESS
  is '供应商地址';
comment on column PUTSTORAGE.STATE
  is '单况0未完结/1完结/2废弃';
comment on column PUTSTORAGE.TYPE
  is '采购订单类型';
comment on column PUTSTORAGE.MONEYTYPE
  is '币别 0RMR';
comment on column PUTSTORAGE.TAXSTATE
  is '是否含税0含税/1不含税';
comment on column PUTSTORAGE.RATE
  is '汇率';
comment on column PUTSTORAGE.DELIVER
  is '送货地址';
comment on column PUTSTORAGE.TOUCHING
  is '制单人员';
comment on column PUTSTORAGE.SECTION
  is '所属部门';
comment on column PUTSTORAGE.CHECKPEOPLE
  is '复核人员';
comment on column PUTSTORAGE.REMARK
  is '备注';
comment on column PUTSTORAGE.CHECKSTATE
  is '审核状态0审核/1未审核';
comment on column PUTSTORAGE.COLUMN1
  is '备用字段1';
comment on column PUTSTORAGE.COLUMN2
  is '备用字段2';
comment on column PUTSTORAGE.COLUMN3
  is '备用字段3';
alter table PUTSTORAGE
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table PUTSTORAGE
  add foreign key (ID)
  references ENQUIRYSONS (ID);

prompt Creating SELLQUOTE...
create table SELLQUOTE
(
  BILLID          VARCHAR2(20) not null,
  BILLDATE        DATE,
  CLIID           VARCHAR2(20),
  CLINAME         VARCHAR2(20),
  CLIPLACEID      VARCHAR2(50),
  CLIPLACE        VARCHAR2(50),
  PRICEWHETHERTAX NUMBER,
  EFFECTDATE      DATE,
  BBID            VARCHAR2(50),
  BBEXCHANGE_RATE NUMBER(19,6),
  REMARK          VARCHAR2(200),
  MAKEEMPNAME     VARCHAR2(20),
  AUDITINGEMPNAME VARCHAR2(20),
  EMPNAME         VARCHAR2(20),
  DEPID           VARCHAR2(20),
  DEPNAME         VARCHAR2(20),
  CHECKSTATUS     NUMBER default 0
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table SELLQUOTE
  is '销售报价主表';
comment on column SELLQUOTE.BILLID
  is '单据编号';
comment on column SELLQUOTE.BILLDATE
  is '单据日期';
comment on column SELLQUOTE.CLIID
  is '客户编号';
comment on column SELLQUOTE.CLINAME
  is '客户名称';
comment on column SELLQUOTE.CLIPLACEID
  is '地址编号';
comment on column SELLQUOTE.CLIPLACE
  is '地址';
comment on column SELLQUOTE.PRICEWHETHERTAX
  is '单价是否含税';
comment on column SELLQUOTE.EFFECTDATE
  is '有效日期';
comment on column SELLQUOTE.BBID
  is '币别编号';
comment on column SELLQUOTE.BBEXCHANGE_RATE
  is '汇率';
comment on column SELLQUOTE.REMARK
  is '备注';
comment on column SELLQUOTE.MAKEEMPNAME
  is '制单人员';
comment on column SELLQUOTE.AUDITINGEMPNAME
  is '复核人员';
comment on column SELLQUOTE.EMPNAME
  is '业务人员';
comment on column SELLQUOTE.DEPID
  is '部门编号';
comment on column SELLQUOTE.DEPNAME
  is '所属部门';
comment on column SELLQUOTE.CHECKSTATUS
  is '审核状态';
alter table SELLQUOTE
  add primary key (BILLID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating QUOTEDETAIOLS...
create table QUOTEDETAIOLS
(
  BILLID       VARCHAR2(20) not null,
  LINEMARK     NUMBER not null,
  MATID        VARCHAR2(20),
  MATNAME      VARCHAR2(50),
  MATSPEC      VARCHAR2(200),
  MATUNIT      VARCHAR2(50),
  NUMS         NUMBER,
  AGIOAGOPRICE NUMBER(19,2),
  AGIO         NUMBER(19,2) default 100,
  PRICE        NUMBER(19,2),
  CESS         NUMBER(19,2) default 16,
  TAXMONEY     NUMBER(19,2),
  INTAXMONEY   NUMBER(19,2),
  MONEY        NUMBER(19,2),
  IFPRESENT    NUMBER(1) default 0,
  FMARK        VARCHAR2(200)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table QUOTEDETAIOLS
  is '销售报价主表';
comment on column QUOTEDETAIOLS.BILLID
  is '单据编号';
comment on column QUOTEDETAIOLS.LINEMARK
  is '行号';
comment on column QUOTEDETAIOLS.MATID
  is '物料编号';
comment on column QUOTEDETAIOLS.MATNAME
  is '物料名称';
comment on column QUOTEDETAIOLS.MATSPEC
  is '规格型号';
comment on column QUOTEDETAIOLS.MATUNIT
  is '单位名称';
comment on column QUOTEDETAIOLS.NUMS
  is '数量';
comment on column QUOTEDETAIOLS.AGIOAGOPRICE
  is '折扣前单';
comment on column QUOTEDETAIOLS.AGIO
  is '折数';
comment on column QUOTEDETAIOLS.PRICE
  is '单价';
comment on column QUOTEDETAIOLS.CESS
  is '税率';
comment on column QUOTEDETAIOLS.TAXMONEY
  is '税额';
comment on column QUOTEDETAIOLS.INTAXMONEY
  is '含税金额';
comment on column QUOTEDETAIOLS.MONEY
  is '金额';
comment on column QUOTEDETAIOLS.IFPRESENT
  is '是否赠品';
comment on column QUOTEDETAIOLS.FMARK
  is '分录备注';
alter table QUOTEDETAIOLS
  add primary key (BILLID, LINEMARK)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table QUOTEDETAIOLS
  add constraint FK_QUOTEDETAIOLS_BILLID foreign key (BILLID)
  references SELLQUOTE (BILLID);

prompt Creating SALEORDER...
create table SALEORDER
(
  ID          VARCHAR2(50) not null,
  CUSID       VARCHAR2(100),
  TOADDRESS   VARCHAR2(50),
  SALETYPE    NUMBER(2),
  ISTAX       NUMBER(2),
  ORDERSTATUS NUMBER(2),
  ORDERTIME   DATE,
  COINTYPE    NUMBER(2),
  PAITIES     NUMBER(11,4),
  WANDNAME    VARCHAR2(50),
  DANDNAME    VARCHAR2(50),
  CANDNAME    VARCHAR2(50),
  MANDNAME    VARCHAR2(50),
  CHECKSTATUS NUMBER(2),
  REMARK      VARCHAR2(200)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table SALEORDER
  is '销售订单主表';
comment on column SALEORDER.ID
  is '销售订单编号';
comment on column SALEORDER.CUSID
  is '客户编号';
comment on column SALEORDER.TOADDRESS
  is '主地址-地址';
comment on column SALEORDER.SALETYPE
  is '销售类型';
comment on column SALEORDER.ISTAX
  is '是否含税';
comment on column SALEORDER.ORDERSTATUS
  is '订单状态';
comment on column SALEORDER.ORDERTIME
  is '订单时间';
comment on column SALEORDER.COINTYPE
  is '币别';
comment on column SALEORDER.PAITIES
  is '汇率';
comment on column SALEORDER.WANDNAME
  is '业务人员编号-名称';
comment on column SALEORDER.DANDNAME
  is '部门编号-名称';
comment on column SALEORDER.CANDNAME
  is '审核人编号-名称';
comment on column SALEORDER.MANDNAME
  is '制单人编号-名称';
comment on column SALEORDER.CHECKSTATUS
  is '审核状态';
comment on column SALEORDER.REMARK
  is '备注';
alter table SALEORDER
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating SALEORDERDETAIL...
create table SALEORDERDETAIL
(
  SOID           VARCHAR2(50) not null,
  LINENO         NUMBER(11) not null,
  MID            VARCHAR2(50),
  MNAME          VARCHAR2(100),
  STANDARD       VARCHAR2(50),
  UNITID         VARCHAR2(20),
  UNITNAME       VARCHAR2(20),
  NUM            NUMBER(11),
  BEFOREDISCOUNT NUMBER(11,2),
  DISCOUNT       NUMBER(4,2),
  PRICE          NUMBER(11,2),
  TOTALPRICE     NUMBER(11,2),
  TAXRATE        NUMBER(4,2),
  TOTALTAX       NUMBER(11,2),
  TOTALMONEY     NUMBER(11,2),
  BEFOREOUT      NUMBER(11),
  ESTIMATEDATE   DATE,
  LEFTNUM        NUMBER(11),
  ISGIFT         NUMBER(2),
  FROMBILLTYPE   NUMBER(2),
  FROMBILLID     VARCHAR2(50)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table SALEORDERDETAIL
  is '销售订单详情表';
comment on column SALEORDERDETAIL.SOID
  is '销售订单编号';
comment on column SALEORDERDETAIL.LINENO
  is '行号';
comment on column SALEORDERDETAIL.MID
  is '物料编号';
comment on column SALEORDERDETAIL.MNAME
  is '物料名称';
comment on column SALEORDERDETAIL.STANDARD
  is '物料规格';
comment on column SALEORDERDETAIL.UNITID
  is '单位编号';
comment on column SALEORDERDETAIL.UNITNAME
  is '单位名称';
comment on column SALEORDERDETAIL.NUM
  is '数量';
comment on column SALEORDERDETAIL.BEFOREDISCOUNT
  is '折前单价';
comment on column SALEORDERDETAIL.DISCOUNT
  is '折数';
comment on column SALEORDERDETAIL.PRICE
  is '单价';
comment on column SALEORDERDETAIL.TOTALPRICE
  is '金额';
comment on column SALEORDERDETAIL.TAXRATE
  is '税率';
comment on column SALEORDERDETAIL.TOTALTAX
  is '税额';
comment on column SALEORDERDETAIL.TOTALMONEY
  is '含税金额';
comment on column SALEORDERDETAIL.BEFOREOUT
  is '期初出数';
comment on column SALEORDERDETAIL.ESTIMATEDATE
  is '预出库日';
comment on column SALEORDERDETAIL.LEFTNUM
  is '未出数量';
comment on column SALEORDERDETAIL.ISGIFT
  is '是否赠品';
comment on column SALEORDERDETAIL.FROMBILLTYPE
  is '来源单别';
comment on column SALEORDERDETAIL.FROMBILLID
  is '来源单号';
alter table SALEORDERDETAIL
  add primary key (SOID, LINENO)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table SALEORDERDETAIL
  add constraint FK_SOID_ID foreign key (SOID)
  references SALEORDER (ID);

prompt Creating SALESCARGO...
create table SALESCARGO
(
  SALEID    VARCHAR2(50) not null,
  SALEDATE  DATE,
  CID       VARCHAR2(50),
  DEPOTID   VARCHAR2(20),
  ADDRESSID VARCHAR2(50),
  GOLDID    VARCHAR2(50),
  TAX       VARCHAR2(50),
  REMARKS   VARCHAR2(250),
  YWID      VARCHAR2(50),
  ZDID      VARCHAR2(50),
  SSID      VARCHAR2(50),
  FHID      VARCHAR2(50),
  STATUS    NUMBER(2),
  PREPARE1  VARCHAR2(50),
  PREPARE2  VARCHAR2(50)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table SALESCARGO
  is '销售出库表';
comment on column SALESCARGO.SALEID
  is '单据编号';
comment on column SALESCARGO.SALEDATE
  is '单据日期';
comment on column SALESCARGO.CID
  is '客户编号';
comment on column SALESCARGO.DEPOTID
  is '仓库编号';
comment on column SALESCARGO.ADDRESSID
  is '送货地址';
comment on column SALESCARGO.GOLDID
  is '币别编号';
comment on column SALESCARGO.TAX
  is '是否含税';
comment on column SALESCARGO.YWID
  is '业务人员编号';
comment on column SALESCARGO.ZDID
  is '制单人员编号';
comment on column SALESCARGO.SSID
  is '所属部门编号';
comment on column SALESCARGO.FHID
  is '复核人员编号';
comment on column SALESCARGO.STATUS
  is '状态';
comment on column SALESCARGO.PREPARE1
  is '预留列1';
comment on column SALESCARGO.PREPARE2
  is '预留列2';
alter table SALESCARGO
  add primary key (SALEID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table SALESCARGO
  add constraint FK_SALESCARGO_CID foreign key (CID)
  references CLIENT (CUSTOMERID);
alter table SALESCARGO
  add constraint FK_SALESCARGO_DEPOTID foreign key (DEPOTID)
  references REPERTORYASSERT (REPERTORYID);
alter table SALESCARGO
  add constraint FK_SALESCARGO_GOLDID foreign key (GOLDID)
  references COINTYPE (ID);

prompt Creating SALESCARGODETAIL...
create table SALESCARGODETAIL
(
  DETAILID    VARCHAR2(50) not null,
  SALEID      VARCHAR2(50) not null,
  MATTERID    VARCHAR2(50),
  REBATEPRICE VARCHAR2(50),
  BOKENNUMBER VARCHAR2(50),
  UNITPRICE   VARCHAR2(50),
  MONEY       VARCHAR2(50),
  TAXRATE     VARCHAR2(50),
  TAXAMOUNT   VARCHAR2(50),
  TAXMONEY    VARCHAR2(50),
  GIFT        VARCHAR2(50),
  REMARKS     VARCHAR2(250),
  SOURCEBILL  VARCHAR2(50),
  SOURCEID    VARCHAR2(50),
  STATUS      NUMBER(2),
  PREPARE1    VARCHAR2(50),
  PREPARE2    VARCHAR2(50)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table SALESCARGODETAIL
  is '销售出库明细';
comment on column SALESCARGODETAIL.DETAILID
  is '栏号';
comment on column SALESCARGODETAIL.SALEID
  is '出库编号';
comment on column SALESCARGODETAIL.MATTERID
  is '物料编号';
comment on column SALESCARGODETAIL.REBATEPRICE
  is '折扣前单价';
comment on column SALESCARGODETAIL.BOKENNUMBER
  is '折数';
comment on column SALESCARGODETAIL.UNITPRICE
  is '单价';
comment on column SALESCARGODETAIL.MONEY
  is '金额';
comment on column SALESCARGODETAIL.TAXRATE
  is '税率';
comment on column SALESCARGODETAIL.TAXAMOUNT
  is '税额';
comment on column SALESCARGODETAIL.TAXMONEY
  is '含税金额';
comment on column SALESCARGODETAIL.GIFT
  is '赠品';
comment on column SALESCARGODETAIL.REMARKS
  is '分录备注';
comment on column SALESCARGODETAIL.SOURCEBILL
  is '来源单别';
comment on column SALESCARGODETAIL.SOURCEID
  is '来源单号';
comment on column SALESCARGODETAIL.STATUS
  is '状态';
comment on column SALESCARGODETAIL.PREPARE1
  is '预留列1';
comment on column SALESCARGODETAIL.PREPARE2
  is '预留列2';
alter table SALESCARGODETAIL
  add primary key (DETAILID, SALEID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table SALESCARGODETAIL
  add constraint FK_SALESCARGODETAIL_MATTERID foreign key (MATTERID)
  references MATTERINFO (MATTERID);
alter table SALESCARGODETAIL
  add constraint FK_SALESCARGODETAIL_SALEID foreign key (SALEID)
  references SALESCARGO (SALEID);

prompt Creating SALES_RETURN...
create table SALES_RETURN
(
  REJECTEDID   VARCHAR2(20) not null,
  CLIENTID     VARCHAR2(100),
  REJECTEDDATE DATE,
  ADDRESS      VARCHAR2(20),
  TAX          NUMBER,
  REPOSITORY   NUMBER,
  CURRENCY     VARCHAR2(50),
  WAREHOUSEID  VARCHAR2(20),
  STAFFID      VARCHAR2(20),
  DEPARTMENTID VARCHAR2(20),
  COMPOSITEID  VARCHAR2(20),
  STATE        VARCHAR2(20)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column SALES_RETURN.REJECTEDID
  is '退货单编号';
comment on column SALES_RETURN.CLIENTID
  is '客户编号';
comment on column SALES_RETURN.REJECTEDDATE
  is '单据日期';
comment on column SALES_RETURN.ADDRESS
  is '送货地址';
comment on column SALES_RETURN.TAX
  is '是否含税(1含税，2不含税)';
comment on column SALES_RETURN.REPOSITORY
  is '是否重新入库(1是，2否)';
comment on column SALES_RETURN.CURRENCY
  is '币别';
comment on column SALES_RETURN.WAREHOUSEID
  is '仓库id';
comment on column SALES_RETURN.STAFFID
  is '业务人员id（可根据销,售订单获取）';
comment on column SALES_RETURN.DEPARTMENTID
  is '制单人员id';
comment on column SALES_RETURN.COMPOSITEID
  is '复核人员id';
comment on column SALES_RETURN.STATE
  is '状态（是否审核）';
alter table SALES_RETURN
  add constraint FK_SALES_RETURN primary key (REJECTEDID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table SALES_RETURN
  add constraint FK_SALES_RETURN_LIANHE foreign key (REJECTEDID)
  references SALES_RETURN (REJECTEDID);

prompt Creating SALES_RETURN_DETAILED...
create table SALES_RETURN_DETAILED
(
  REJECTEDID    VARCHAR2(20) not null,
  LINE          NUMBER(18,4) not null,
  PRODID        VARCHAR2(20),
  PRODNAME      VARCHAR2(20),
  PRODSIZE      VARCHAR2(20),
  SUNIT         VARCHAR2(20),
  SQUANTITY     NUMBER(18,4),
  OIDPRICE      NUMBER(18,4),
  DISCOUNT      NUMBER(18,4),
  PRICE         NUMBER(18,4),
  AMOUNT        NUMBER(18,4),
  TAXRATE       NUMBER(18,4),
  TAXAMT        NUMBER(18,4),
  AMOUNTWITHTAX NUMBER(18,4),
  ITEMREMARK    VARCHAR2(20),
  TRANTYPE      VARCHAR2(20),
  FROMNO        VARCHAR2(20)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column SALES_RETURN_DETAILED.REJECTEDID
  is '退货单号';
comment on column SALES_RETURN_DETAILED.LINE
  is '行号';
comment on column SALES_RETURN_DETAILED.PRODID
  is '物料编号';
comment on column SALES_RETURN_DETAILED.PRODNAME
  is '物料名称';
comment on column SALES_RETURN_DETAILED.PRODSIZE
  is '规格型号';
comment on column SALES_RETURN_DETAILED.SUNIT
  is '单位名称';
comment on column SALES_RETURN_DETAILED.SQUANTITY
  is '数量';
comment on column SALES_RETURN_DETAILED.OIDPRICE
  is '折扣前单价';
comment on column SALES_RETURN_DETAILED.DISCOUNT
  is '折数';
comment on column SALES_RETURN_DETAILED.PRICE
  is '单价';
comment on column SALES_RETURN_DETAILED.AMOUNT
  is '  金额';
comment on column SALES_RETURN_DETAILED.TAXRATE
  is '税率';
comment on column SALES_RETURN_DETAILED.TAXAMT
  is '税额';
comment on column SALES_RETURN_DETAILED.AMOUNTWITHTAX
  is '含税金额';
comment on column SALES_RETURN_DETAILED.ITEMREMARK
  is '分录备注';
comment on column SALES_RETURN_DETAILED.TRANTYPE
  is '来源单别';
comment on column SALES_RETURN_DETAILED.FROMNO
  is '来源单号';
alter table SALES_RETURN_DETAILED
  add constraint FK_SALES_RETURN_DETAILED primary key (REJECTEDID, LINE)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating SHAREDETAIL...
create table SHAREDETAIL
(
  SID         NUMBER(30) not null,
  PID         NUMBER(30),
  CLOUD       NUMBER(30),
  MATERIAL    NUMBER(30),
  SNAME       VARCHAR2(50),
  MODEL       VARCHAR2(50),
  SMONEY      NUMBER(10,4),
  NUMBERS     NUMBER(30),
  SPRICE      NUMBER(10,4),
  SWEIGHT     NUMBER(10,4),
  SVOLUME     NUMBER(30),
  SHARES      NUMBER(10,4),
  CHECKSTATUS NUMBER(30),
  DEMO1       NUMBER(10,4),
  DEMO2       VARCHAR2(50),
  DEMO3       NUMBER(30)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column SHAREDETAIL.SID
  is '采购入库单号';
comment on column SHAREDETAIL.PID
  is '行号';
comment on column SHAREDETAIL.CLOUD
  is '主表id';
comment on column SHAREDETAIL.MATERIAL
  is '物料编号';
comment on column SHAREDETAIL.SNAME
  is '物料名称';
comment on column SHAREDETAIL.MODEL
  is '规格型号';
comment on column SHAREDETAIL.SMONEY
  is '金额';
comment on column SHAREDETAIL.NUMBERS
  is '采购金额';
comment on column SHAREDETAIL.SPRICE
  is '单价';
comment on column SHAREDETAIL.SWEIGHT
  is '重量';
comment on column SHAREDETAIL.SVOLUME
  is '材积';
comment on column SHAREDETAIL.SHARES
  is '分摊金额';
comment on column SHAREDETAIL.CHECKSTATUS
  is '单据状态';
comment on column SHAREDETAIL.DEMO1
  is '预留字段1';
comment on column SHAREDETAIL.DEMO2
  is '预留字段2';
comment on column SHAREDETAIL.DEMO3
  is '预留字段3';
alter table SHAREDETAIL
  add primary key (SID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table SHAREDETAIL
  add constraint FK_PID_ID_LXW foreign key (PID)
  references PURCHASE (ID);

prompt Creating SHOULDGETMONEYBILL...
create table SHOULDGETMONEYBILL
(
  ID          VARCHAR2(50) not null,
  DATEANDTIME DATE,
  CUSID       VARCHAR2(10),
  COINTYPE    VARCHAR2(50),
  OVERTIME    DATE,
  DISCOUNT    NUMBER(11,2),
  PAITIES     NUMBER(11,4),
  TRANSFER    NUMBER(11,2),
  DRAFT       NUMBER(11,2),
  OTHERWAY    NUMBER(11,2),
  DANDNAME    VARCHAR2(50),
  CANDNAME    VARCHAR2(50),
  MANDNAME    VARCHAR2(50),
  REMARK      VARCHAR2(200)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table SHOULDGETMONEYBILL
  is '应收冲款单表';
comment on column SHOULDGETMONEYBILL.ID
  is '单据编号';
comment on column SHOULDGETMONEYBILL.DATEANDTIME
  is '单据时间';
comment on column SHOULDGETMONEYBILL.CUSID
  is '客户编号';
comment on column SHOULDGETMONEYBILL.COINTYPE
  is '币别';
comment on column SHOULDGETMONEYBILL.OVERTIME
  is '终止帐日';
comment on column SHOULDGETMONEYBILL.DISCOUNT
  is '折扣率';
comment on column SHOULDGETMONEYBILL.PAITIES
  is '汇率';
comment on column SHOULDGETMONEYBILL.TRANSFER
  is '转账方式';
comment on column SHOULDGETMONEYBILL.DRAFT
  is '汇票方式';
comment on column SHOULDGETMONEYBILL.OTHERWAY
  is '其他方式';
comment on column SHOULDGETMONEYBILL.DANDNAME
  is '部门编号-名称';
comment on column SHOULDGETMONEYBILL.CANDNAME
  is '审核人编号-名称';
comment on column SHOULDGETMONEYBILL.MANDNAME
  is '制单人编号-名称';
comment on column SHOULDGETMONEYBILL.REMARK
  is '备注';
alter table SHOULDGETMONEYBILL
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating SHOULDESTIMATEBILLDETAIL...
create table SHOULDESTIMATEBILLDETAIL
(
  EMID       VARCHAR2(50) not null,
  LINENO     NUMBER(11) not null,
  BILLTYPEID NUMBER(2),
  BILLNO     VARCHAR2(50),
  ESTIMATENO VARCHAR2(50),
  LEFTMONEY  NUMBER(11,2),
  USEMONEY   NUMBER(11,2),
  DANDNAME   VARCHAR2(50)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table SHOULDESTIMATEBILLDETAIL
  is '应收冲款单预收明细表';
comment on column SHOULDESTIMATEBILLDETAIL.EMID
  is '单据编号';
comment on column SHOULDESTIMATEBILLDETAIL.LINENO
  is '行号';
comment on column SHOULDESTIMATEBILLDETAIL.BILLTYPEID
  is '来源单别';
comment on column SHOULDESTIMATEBILLDETAIL.BILLNO
  is '来源单号';
comment on column SHOULDESTIMATEBILLDETAIL.ESTIMATENO
  is '预收款单号';
comment on column SHOULDESTIMATEBILLDETAIL.LEFTMONEY
  is '预收余额';
comment on column SHOULDESTIMATEBILLDETAIL.USEMONEY
  is '使用金额';
alter table SHOULDESTIMATEBILLDETAIL
  add primary key (EMID, LINENO)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table SHOULDESTIMATEBILLDETAIL
  add constraint FK_EMID_ID foreign key (EMID)
  references SHOULDGETMONEYBILL (ID);

prompt Creating SHOULDGETMONEYBILLDETAIL...
create table SHOULDGETMONEYBILLDETAIL
(
  CONTNETID     VARCHAR2(50) not null,
  LINENO        NUMBER(11) not null,
  BILLTYPEID    NUMBER(2),
  BILLNO        VARCHAR2(50),
  BILLDATE      DATE,
  CANDNAME      VARCHAR2(50),
  DANDNAME      VARCHAR2(50),
  HANDNAME      VARCHAR2(50),
  CTYPEANDNAME  VARCHAR2(50),
  SOURCEMONEY   NUMBER(11,2),
  DISCOUNTMONEY NUMBER(11,2),
  USEMONEY      NUMBER(11,2),
  USESMONEY     NUMBER(11,2)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table SHOULDGETMONEYBILLDETAIL
  is '应收冲款单内容明细表';
comment on column SHOULDGETMONEYBILLDETAIL.CONTNETID
  is '单据编号';
comment on column SHOULDGETMONEYBILLDETAIL.LINENO
  is '行号';
comment on column SHOULDGETMONEYBILLDETAIL.BILLTYPEID
  is '来源单别';
comment on column SHOULDGETMONEYBILLDETAIL.BILLNO
  is '来源单号';
comment on column SHOULDGETMONEYBILLDETAIL.BILLDATE
  is '原单日期';
comment on column SHOULDGETMONEYBILLDETAIL.CANDNAME
  is '客户编号-客户名称';
comment on column SHOULDGETMONEYBILLDETAIL.DANDNAME
  is '部门编号-部门名称';
comment on column SHOULDGETMONEYBILLDETAIL.HANDNAME
  is '业务员编号-业务员名称';
comment on column SHOULDGETMONEYBILLDETAIL.CTYPEANDNAME
  is '币别编号-币别-汇率';
comment on column SHOULDGETMONEYBILLDETAIL.SOURCEMONEY
  is '原单金额';
comment on column SHOULDGETMONEYBILLDETAIL.DISCOUNTMONEY
  is '折让金额';
comment on column SHOULDGETMONEYBILLDETAIL.USEMONEY
  is '冲款金额';
comment on column SHOULDGETMONEYBILLDETAIL.USESMONEY
  is '冲抵金额';
alter table SHOULDGETMONEYBILLDETAIL
  add primary key (CONTNETID, LINENO)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table SHOULDGETMONEYBILLDETAIL
  add constraint FK_CONTNETID_ID foreign key (CONTNETID)
  references SHOULDGETMONEYBILL (ID);

prompt Creating TIAOJIADANZHUBIAO...
create table TIAOJIADANZHUBIAO
(
  BILLNO      VARCHAR2(20) not null,
  ADJUSTDATE  DATE,
  MAKER       VARCHAR2(20),
  PERMITTER   VARCHAR2(20),
  AUDITSTATUS NUMBER(2),
  WHMEMO      VARCHAR2(20)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table TIAOJIADANZHUBIAO
  is '调价单主表';
comment on column TIAOJIADANZHUBIAO.BILLNO
  is '单据号码';
comment on column TIAOJIADANZHUBIAO.ADJUSTDATE
  is '单据日期';
comment on column TIAOJIADANZHUBIAO.MAKER
  is '制单人员';
comment on column TIAOJIADANZHUBIAO.PERMITTER
  is '复核人员';
comment on column TIAOJIADANZHUBIAO.AUDITSTATUS
  is '审核状态';
comment on column TIAOJIADANZHUBIAO.WHMEMO
  is '备注';
alter table TIAOJIADANZHUBIAO
  add primary key (BILLNO)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating TIAOJIADANXIANGBIAO...
create table TIAOJIADANXIANGBIAO
(
  SERNO      NUMBER(2) not null,
  BILLNO     VARCHAR2(20) not null,
  PRODID     VARCHAR2(50),
  PRODNAME   VARCHAR2(20),
  PRODSIZE   VARCHAR2(20),
  UNIT       VARCHAR2(20),
  CURQTY     NUMBER(11),
  LCOSTAVG   NUMBER(11,2),
  PRICE      NUMBER(11,2),
  AMOUNT     NUMBER(11,2),
  ITEMREMARK VARCHAR2(50)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table TIAOJIADANXIANGBIAO
  is '调价单祥表';
comment on column TIAOJIADANXIANGBIAO.SERNO
  is '栏号';
comment on column TIAOJIADANXIANGBIAO.BILLNO
  is '主表外键单号';
comment on column TIAOJIADANXIANGBIAO.PRODID
  is '物品编号';
comment on column TIAOJIADANXIANGBIAO.PRODNAME
  is '物品名称';
comment on column TIAOJIADANXIANGBIAO.PRODSIZE
  is '规格型号';
comment on column TIAOJIADANXIANGBIAO.UNIT
  is '单位';
comment on column TIAOJIADANXIANGBIAO.CURQTY
  is '库存量';
comment on column TIAOJIADANXIANGBIAO.LCOSTAVG
  is '平均成本';
comment on column TIAOJIADANXIANGBIAO.PRICE
  is '单价';
comment on column TIAOJIADANXIANGBIAO.AMOUNT
  is '调价金额';
comment on column TIAOJIADANXIANGBIAO.ITEMREMARK
  is '分录备注';
alter table TIAOJIADANXIANGBIAO
  add primary key (SERNO, BILLNO)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table TIAOJIADANXIANGBIAO
  add foreign key (BILLNO)
  references TIAOJIADANZHUBIAO (BILLNO);

prompt Creating TIAOZHENGFANGSHILEIXINGBIAO...
create table TIAOZHENGFANGSHILEIXINGBIAO
(
  LID          NUMBER(2) not null,
  BADIUSTSTYLE VARCHAR2(20)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table TIAOZHENGFANGSHILEIXINGBIAO
  is '调价单类型表';
comment on column TIAOZHENGFANGSHILEIXINGBIAO.LID
  is '主键id';
comment on column TIAOZHENGFANGSHILEIXINGBIAO.BADIUSTSTYLE
  is '调整方式';
alter table TIAOZHENGFANGSHILEIXINGBIAO
  add primary key (LID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating T_CGTHDETAIL...
create table T_CGTHDETAIL
(
  T_DETAILID  VARCHAR2(50) not null,
  LINEID      INTEGER not null,
  MATTERID    VARCHAR2(50),
  QUANTUM     NUMBER(11,2),
  UNITPRICE   NUMBER(11,2),
  SUMMONEY    NUMBER(11,2),
  TAXRATE     VARCHAR2(50),
  TAXMONEY    NUMBER(11,2),
  SUMTAX      NUMBER(11,2),
  REMARK      VARCHAR2(50),
  SUPPLIERID  VARCHAR2(50),
  PAYMENTDATE DATE,
  PAYMENTTERM VARCHAR2(50),
  TRANTYPE    VARCHAR2(20),
  FROMNO      VARCHAR2(20),
  COLUMNONE   VARCHAR2(10),
  COLUMNTWO   VARCHAR2(10)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column T_CGTHDETAIL.T_DETAILID
  is '单据号码';
comment on column T_CGTHDETAIL.LINEID
  is '行号';
comment on column T_CGTHDETAIL.MATTERID
  is '物料编号';
comment on column T_CGTHDETAIL.QUANTUM
  is '数量';
comment on column T_CGTHDETAIL.UNITPRICE
  is '单价';
comment on column T_CGTHDETAIL.SUMMONEY
  is '金额（单价*数量）';
comment on column T_CGTHDETAIL.TAXRATE
  is '税率';
comment on column T_CGTHDETAIL.TAXMONEY
  is '税额';
comment on column T_CGTHDETAIL.SUMTAX
  is '含税金额';
comment on column T_CGTHDETAIL.REMARK
  is '分录备注';
comment on column T_CGTHDETAIL.SUPPLIERID
  is '供应商编号';
comment on column T_CGTHDETAIL.PAYMENTDATE
  is '付款日期';
comment on column T_CGTHDETAIL.PAYMENTTERM
  is '付款条件';
comment on column T_CGTHDETAIL.TRANTYPE
  is '来源单别';
comment on column T_CGTHDETAIL.FROMNO
  is '来源单号';
comment on column T_CGTHDETAIL.COLUMNONE
  is '备用字段1';
comment on column T_CGTHDETAIL.COLUMNTWO
  is '备用字段2';
alter table T_CGTHDETAIL
  add primary key (T_DETAILID, LINEID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table T_CGTHDETAIL
  add foreign key (SUPPLIERID)
  references T_SUPPLIERMASTER (SUPPLIERID);
alter table T_CGTHDETAIL
  add foreign key (MATTERID)
  references MATTERINFO (MATTERID);

prompt Creating T_CGTHMASTER...
create table T_CGTHMASTER
(
  T_CGGTHID    VARCHAR2(50) not null,
  T_CGTHDATE   DATE,
  T_GYSID      VARCHAR2(50),
  WAREHOUSEID  VARCHAR2(50),
  SALESMAN     VARCHAR2(50),
  DEPARTMENTID VARCHAR2(50),
  CURRENCYID   VARCHAR2(50),
  TOUCHPERSON  VARCHAR2(50),
  CHECKPERSON  VARCHAR2(50),
  BOOLPUT      CHAR(1) default '0',
  BOOLTAX      CHAR(1) default '0',
  COLUMNONE    VARCHAR2(10),
  COLUMNTWO    VARCHAR2(10),
  PERMITTER    CHAR(1) default '0',
  EXCHRATE     NUMBER(11,4)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column T_CGTHMASTER.T_CGGTHID
  is '单据号码';
comment on column T_CGTHMASTER.T_CGTHDATE
  is '单据日期';
comment on column T_CGTHMASTER.T_GYSID
  is '供应商编号(fk)';
comment on column T_CGTHMASTER.WAREHOUSEID
  is '仓库编号';
comment on column T_CGTHMASTER.SALESMAN
  is '采购人员编号，采购人员';
comment on column T_CGTHMASTER.DEPARTMENTID
  is '部门编号，部门名称';
comment on column T_CGTHMASTER.CURRENCYID
  is '币别编号，币别名称';
comment on column T_CGTHMASTER.TOUCHPERSON
  is '制单编号，制单人员';
comment on column T_CGTHMASTER.CHECKPERSON
  is '复核人员编号，复核人员';
comment on column T_CGTHMASTER.BOOLPUT
  is '是否重新入库';
comment on column T_CGTHMASTER.BOOLTAX
  is '单价是否含税';
comment on column T_CGTHMASTER.COLUMNONE
  is '备用字段1';
comment on column T_CGTHMASTER.COLUMNTWO
  is '备用字段2';
comment on column T_CGTHMASTER.PERMITTER
  is '审核状态';
comment on column T_CGTHMASTER.EXCHRATE
  is '汇率';
alter table T_CGTHMASTER
  add primary key (T_CGGTHID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table T_CGTHMASTER
  add foreign key (T_GYSID)
  references T_SUPPLIERMASTER (SUPPLIERID);
alter table T_CGTHMASTER
  add foreign key (WAREHOUSEID)
  references REPERTORYASSERT (REPERTORYID);
alter table T_CGTHMASTER
  add foreign key (SALESMAN)
  references STAFF_MASTER_FILE (STAFFID);
alter table T_CGTHMASTER
  add foreign key (DEPARTMENTID)
  references DEPARTMENT (DEPARTMENTID);
alter table T_CGTHMASTER
  add foreign key (CURRENCYID)
  references COINTYPE (ID);
alter table T_CGTHMASTER
  add foreign key (TOUCHPERSON)
  references STAFF_MASTER_FILE (STAFFID);
alter table T_CGTHMASTER
  add foreign key (CHECKPERSON)
  references STAFF_MASTER_FILE (STAFFID);

prompt Creating UNIT_OF_MEASURE...
create table UNIT_OF_MEASURE
(
  UNITID      VARCHAR2(20) not null,
  UNITCN_NAME VARCHAR2(20),
  REMARK      VARCHAR2(200)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table UNIT_OF_MEASURE
  is '计量单位表';
comment on column UNIT_OF_MEASURE.UNITID
  is '单位编号';
comment on column UNIT_OF_MEASURE.UNITCN_NAME
  is '单位名称';
comment on column UNIT_OF_MEASURE.REMARK
  is '备注';
alter table UNIT_OF_MEASURE
  add primary key (UNITID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Disabling foreign key constraints for ADVANCE_DETAIL...
alter table ADVANCE_DETAIL disable constraint SYS_C005672;
prompt Disabling foreign key constraints for BALANCE_ADVANCEDETAIL...
alter table BALANCE_ADVANCEDETAIL disable constraint SYS_C005677;
prompt Disabling foreign key constraints for BALANCE_DETAIL...
alter table BALANCE_DETAIL disable constraint SYS_C005675;
prompt Disabling foreign key constraints for BUYERSON...
alter table BUYERSON disable constraint FK_BUYER;
prompt Disabling foreign key constraints for STAFF_MASTER_FILE...
alter table STAFF_MASTER_FILE disable constraint FK_SMF_BM;
alter table STAFF_MASTER_FILE disable constraint FK_SMF_GJ;
alter table STAFF_MASTER_FILE disable constraint FK_SMF_MZ;
alter table STAFF_MASTER_FILE disable constraint FK_SMF_XL;
prompt Disabling foreign key constraints for T_SUPPLIERMASTER...
alter table T_SUPPLIERMASTER disable constraint SYS_C005747;
alter table T_SUPPLIERMASTER disable constraint SYS_C005750;
alter table T_SUPPLIERMASTER disable constraint SYS_C005751;
prompt Disabling foreign key constraints for MATTERINFO...
alter table MATTERINFO disable constraint FK_MATTERINFO_MATTERTYPEID;
alter table MATTERINFO disable constraint FK_MATTERINFO_MONEYTYPE;
alter table MATTERINFO disable constraint FK_MATTERINFO_SALESERID;
prompt Disabling foreign key constraints for CHECKS...
alter table CHECKS disable constraint PP1;
alter table CHECKS disable constraint PP3;
prompt Disabling foreign key constraints for CLIENT...
alter table CLIENT disable constraint FK_CLIENT_ADDRESS;
alter table CLIENT disable constraint FK_CLIENT_CLIENT_CATEGORY;
prompt Disabling foreign key constraints for COSTDETAIL...
alter table COSTDETAIL disable constraint FK;
prompt Disabling foreign key constraints for ENQUIRYSON...
alter table ENQUIRYSON disable constraint FK_ENQUIRYSON;
prompt Disabling foreign key constraints for MATTERWITHDEPOT...
alter table MATTERWITHDEPOT disable constraint FK_MATTERWITHDEPOT_DEPOTID;
alter table MATTERWITHDEPOT disable constraint FK_MATTERWITHDEPOT_MATTERID;
prompt Disabling foreign key constraints for MOVEDETAILS...
alter table MOVEDETAILS disable constraint FK_MOVEDETAILS_MSENO;
prompt Disabling foreign key constraints for OUTGOINGDETAIL...
alter table OUTGOINGDETAIL disable constraint FK_OUTGOINGDETAIL_DEPOT;
prompt Disabling foreign key constraints for PURCHASEREQUESTS...
alter table PURCHASEREQUESTS disable constraint PP;
alter table PURCHASEREQUESTS disable constraint PP2;
prompt Disabling foreign key constraints for PUTSTORAGE...
alter table PUTSTORAGE disable constraint SYS_C005714;
prompt Disabling foreign key constraints for QUOTEDETAIOLS...
alter table QUOTEDETAIOLS disable constraint FK_QUOTEDETAIOLS_BILLID;
prompt Disabling foreign key constraints for SALEORDERDETAIL...
alter table SALEORDERDETAIL disable constraint FK_SOID_ID;
prompt Disabling foreign key constraints for SALESCARGO...
alter table SALESCARGO disable constraint FK_SALESCARGO_CID;
alter table SALESCARGO disable constraint FK_SALESCARGO_DEPOTID;
alter table SALESCARGO disable constraint FK_SALESCARGO_GOLDID;
prompt Disabling foreign key constraints for SALESCARGODETAIL...
alter table SALESCARGODETAIL disable constraint FK_SALESCARGODETAIL_MATTERID;
alter table SALESCARGODETAIL disable constraint FK_SALESCARGODETAIL_SALEID;
prompt Disabling foreign key constraints for SALES_RETURN...
alter table SALES_RETURN disable constraint FK_SALES_RETURN_LIANHE;
prompt Disabling foreign key constraints for SHAREDETAIL...
alter table SHAREDETAIL disable constraint FK_PID_ID_LXW;
prompt Disabling foreign key constraints for SHOULDESTIMATEBILLDETAIL...
alter table SHOULDESTIMATEBILLDETAIL disable constraint FK_EMID_ID;
prompt Disabling foreign key constraints for SHOULDGETMONEYBILLDETAIL...
alter table SHOULDGETMONEYBILLDETAIL disable constraint FK_CONTNETID_ID;
prompt Disabling foreign key constraints for TIAOJIADANXIANGBIAO...
alter table TIAOJIADANXIANGBIAO disable constraint SYS_C005655;
prompt Disabling foreign key constraints for T_CGTHDETAIL...
alter table T_CGTHDETAIL disable constraint SYS_C005749;
alter table T_CGTHDETAIL disable constraint SYS_C005758;
prompt Disabling foreign key constraints for T_CGTHMASTER...
alter table T_CGTHMASTER disable constraint SYS_C005748;
alter table T_CGTHMASTER disable constraint SYS_C005752;
alter table T_CGTHMASTER disable constraint SYS_C005753;
alter table T_CGTHMASTER disable constraint SYS_C005754;
alter table T_CGTHMASTER disable constraint SYS_C005755;
alter table T_CGTHMASTER disable constraint SYS_C005756;
alter table T_CGTHMASTER disable constraint SYS_C005757;
prompt Deleting UNIT_OF_MEASURE...
delete from UNIT_OF_MEASURE;
commit;
prompt Deleting T_CGTHMASTER...
delete from T_CGTHMASTER;
commit;
prompt Deleting T_CGTHDETAIL...
delete from T_CGTHDETAIL;
commit;
prompt Deleting TIAOZHENGFANGSHILEIXINGBIAO...
delete from TIAOZHENGFANGSHILEIXINGBIAO;
commit;
prompt Deleting TIAOJIADANXIANGBIAO...
delete from TIAOJIADANXIANGBIAO;
commit;
prompt Deleting TIAOJIADANZHUBIAO...
delete from TIAOJIADANZHUBIAO;
commit;
prompt Deleting SHOULDGETMONEYBILLDETAIL...
delete from SHOULDGETMONEYBILLDETAIL;
commit;
prompt Deleting SHOULDESTIMATEBILLDETAIL...
delete from SHOULDESTIMATEBILLDETAIL;
commit;
prompt Deleting SHOULDGETMONEYBILL...
delete from SHOULDGETMONEYBILL;
commit;
prompt Deleting SHAREDETAIL...
delete from SHAREDETAIL;
commit;
prompt Deleting SALES_RETURN_DETAILED...
delete from SALES_RETURN_DETAILED;
commit;
prompt Deleting SALES_RETURN...
delete from SALES_RETURN;
commit;
prompt Deleting SALESCARGODETAIL...
delete from SALESCARGODETAIL;
commit;
prompt Deleting SALESCARGO...
delete from SALESCARGO;
commit;
prompt Deleting SALEORDERDETAIL...
delete from SALEORDERDETAIL;
commit;
prompt Deleting SALEORDER...
delete from SALEORDER;
commit;
prompt Deleting QUOTEDETAIOLS...
delete from QUOTEDETAIOLS;
commit;
prompt Deleting SELLQUOTE...
delete from SELLQUOTE;
commit;
prompt Deleting PUTSTORAGE...
delete from PUTSTORAGE;
commit;
prompt Deleting PURCHASEREQUESTS...
delete from PURCHASEREQUESTS;
commit;
prompt Deleting PURCHASEREQUEST...
delete from PURCHASEREQUEST;
commit;
prompt Deleting OUTGOINGDETAIL...
delete from OUTGOINGDETAIL;
commit;
prompt Deleting MOVEDETAILS...
delete from MOVEDETAILS;
commit;
prompt Deleting MOVESTORAGE...
delete from MOVESTORAGE;
commit;
prompt Deleting MATTERWITHDEPOT...
delete from MATTERWITHDEPOT;
commit;
prompt Deleting REPERTORYASSERT...
delete from REPERTORYASSERT;
commit;
prompt Deleting ESTIMATEMONEYBILLDETAIL...
delete from ESTIMATEMONEYBILLDETAIL;
commit;
prompt Deleting ESTIMATEMONEYBILL...
delete from ESTIMATEMONEYBILL;
commit;
prompt Deleting ENQUIRYSONS...
delete from ENQUIRYSONS;
commit;
prompt Deleting ENQUIRYSON...
delete from ENQUIRYSON;
commit;
prompt Deleting ENQUIRY...
delete from ENQUIRY;
commit;
prompt Deleting CUSTOMERWITHMONEYDETAIL...
delete from CUSTOMERWITHMONEYDETAIL;
commit;
prompt Deleting COSTDETAIL...
delete from COSTDETAIL;
commit;
prompt Deleting PURCHASE...
delete from PURCHASE;
commit;
prompt Deleting CLIENT...
delete from CLIENT;
commit;
prompt Deleting CLIENT_CATEGORY...
delete from CLIENT_CATEGORY;
commit;
prompt Deleting CHECKS...
delete from CHECKS;
commit;
prompt Deleting MATTERINFO...
delete from MATTERINFO;
commit;
prompt Deleting T_SUPPLIERMASTER...
delete from T_SUPPLIERMASTER;
commit;
prompt Deleting STAFF_MASTER_FILE...
delete from STAFF_MASTER_FILE;
commit;
prompt Deleting RECORD_OF_FORMAL_SCHOOLING...
delete from RECORD_OF_FORMAL_SCHOOLING;
commit;
prompt Deleting NATIONALITY...
delete from NATIONALITY;
commit;
prompt Deleting NATION...
delete from NATION;
commit;
prompt Deleting DEPARTMENT...
delete from DEPARTMENT;
commit;
prompt Deleting COINTYPE...
delete from COINTYPE;
commit;
prompt Deleting T_SUPPLIERTYPE...
delete from T_SUPPLIERTYPE;
commit;
prompt Deleting MATTERTYPE...
delete from MATTERTYPE;
commit;
prompt Deleting CHECK1...
delete from CHECK1;
commit;
prompt Deleting BUYERSON...
delete from BUYERSON;
commit;
prompt Deleting BUYER...
delete from BUYER;
commit;
prompt Deleting BILLTYPE...
delete from BILLTYPE;
commit;
prompt Deleting BALANCE_DETAIL...
delete from BALANCE_DETAIL;
commit;
prompt Deleting BALANCE_ADVANCEDETAIL...
delete from BALANCE_ADVANCEDETAIL;
commit;
prompt Deleting BALANCE_HOST...
delete from BALANCE_HOST;
commit;
prompt Deleting ADVANCE_DETAIL...
delete from ADVANCE_DETAIL;
commit;
prompt Deleting ADVANCE_HOST...
delete from ADVANCE_HOST;
commit;
prompt Deleting ADDRESS...
delete from ADDRESS;
commit;
prompt Loading ADDRESS...
insert into ADDRESS (ADDRESSID, ADDRESS, EMAIL_CODE, CONTACTS, ADDRESSID_TITLE, TELEPHONE, ROUTE, REMARKS)
values ('1', '1', '1', '1', null, null, null, null);
commit;
prompt 1 records loaded
prompt Loading ADVANCE_HOST...
prompt Table is empty
prompt Loading ADVANCE_DETAIL...
prompt Table is empty
prompt Loading BALANCE_HOST...
prompt Table is empty
prompt Loading BALANCE_ADVANCEDETAIL...
prompt Table is empty
prompt Loading BALANCE_DETAIL...
prompt Table is empty
prompt Loading BILLTYPE...
insert into BILLTYPE (ID, SOTYPE, ENNAME, DETAILTABLE)
values (1, '销售订单表', 'saleorder', 'saleorderdetail');
insert into BILLTYPE (ID, SOTYPE, ENNAME, DETAILTABLE)
values (2, '采购请购单', 'purchaserequests', null);
insert into BILLTYPE (ID, SOTYPE, ENNAME, DETAILTABLE)
values (3, '采购订单表', 'buyer', null);
insert into BILLTYPE (ID, SOTYPE, ENNAME, DETAILTABLE)
values (4, '采购询价单', 'enquiry', null);
insert into BILLTYPE (ID, SOTYPE, ENNAME, DETAILTABLE)
values (5, '预付款单主表', 'advance_host', null);
insert into BILLTYPE (ID, SOTYPE, ENNAME, DETAILTABLE)
values (6, '应付冲款单主表', 'balance_host', null);
commit;
prompt 6 records loaded
prompt Loading BUYER...
prompt Table is empty
prompt Loading BUYERSON...
prompt Table is empty
prompt Loading CHECK1...
prompt Table is empty
prompt Loading MATTERTYPE...
prompt Table is empty
prompt Loading T_SUPPLIERTYPE...
insert into T_SUPPLIERTYPE (SUPTYPEID, SUPTYPENAME)
values ('01', '主要供应商');
insert into T_SUPPLIERTYPE (SUPTYPEID, SUPTYPENAME)
values ('02', '一般供应商');
insert into T_SUPPLIERTYPE (SUPTYPEID, SUPTYPENAME)
values ('03', '委外厂');
insert into T_SUPPLIERTYPE (SUPTYPEID, SUPTYPENAME)
values ('04', '其他供应商');
commit;
prompt 4 records loaded
prompt Loading COINTYPE...
insert into COINTYPE (ID, CNAME, PAITIES)
values ('1', '人民币', 1);
commit;
prompt 1 records loaded
prompt Loading DEPARTMENT...
insert into DEPARTMENT (DEPARTMENTID, DEPARTMENTCN_NAME, STANDBY_1, STANDBY_2)
values ('201806121', '财务部', null, null);
insert into DEPARTMENT (DEPARTMENTID, DEPARTMENTCN_NAME, STANDBY_1, STANDBY_2)
values ('201806122', '直销部', null, null);
commit;
prompt 2 records loaded
prompt Loading NATION...
insert into NATION (NATIONID, NATIONCN_NAME)
values ('201806121', '汉');
insert into NATION (NATIONID, NATIONCN_NAME)
values ('201806122', '藏');
commit;
prompt 2 records loaded
prompt Loading NATIONALITY...
insert into NATIONALITY (NATIONALITYID, NATIONALITYCN_NAME)
values ('201806121', '华东区');
insert into NATIONALITY (NATIONALITYID, NATIONALITYCN_NAME)
values ('201806122', '西南区');
commit;
prompt 2 records loaded
prompt Loading RECORD_OF_FORMAL_SCHOOLING...
insert into RECORD_OF_FORMAL_SCHOOLING (ROFSID, ROFSCN_NAME)
values ('201806121', '大专');
insert into RECORD_OF_FORMAL_SCHOOLING (ROFSID, ROFSCN_NAME)
values ('201806122', '本科');
commit;
prompt 2 records loaded
prompt Loading STAFF_MASTER_FILE...
insert into STAFF_MASTER_FILE (STAFFID, PWD, DEPARTMENTID, STAFFNAME, SEX, STAFFEN_NAME, IDCARD, BIRTHDAY, POLITICS_STATUS, MARRIAGE_STATUS, INDUCTION_DATE, BLOOD_GROUP, REGULAR_WORKER_DATE, NATIVE_PLACE, QUALIFYING_PERIOD, NATIONALITY, LEAVE_OFFICE_DATE, NATION, TECHNICAL_TITLE, CN_DUTIES, EN_DUTIES, LINKPOSTCODE, LINKADDRESS, LINKPHONE, PHONE, HIGHEST_EDUCATION, EXPIRATION_DATE, BACHELOR_DEGREE, ARRIVAL_DATE, GRADUATE, PASSPORT_NUMBER, COLLEGE_MAJOR, PACT_START_DATE, EXPERIENCES_DATE, EMAIL, CONTRACT_PERIOD, NOW_PHONE, DOMICILE_PHONE, NOW_ADDRESS, HOME_PHONE, HOME_ADDRESS, REMARK, STANDBY_1, STANDBY_2)
values ('201806121', '123', '201806121', '张三', '男', null, '4302015612616541', to_date('25-01-1990', 'dd-mm-yyyy'), '党员', 0, to_date('15-02-2015', 'dd-mm-yyyy'), 'O', to_date('23-09-2015', 'dd-mm-yyyy'), null, '2年', '201806121', to_date('06-06-2018', 'dd-mm-yyyy'), '201806121', null, null, null, null, '株洲荷塘区', '123456789', '123456789', '201806121', to_date('12-08-2017', 'dd-mm-yyyy'), '研究生', null, '湖南工业大学', '164984', 'IT', to_date('12-12-2016', 'dd-mm-yyyy'), null, '46549846@163.com', null, '123456789', '123456789', '湖南株洲', '4564654', '美国洛杉矶', null, null, null);
insert into STAFF_MASTER_FILE (STAFFID, PWD, DEPARTMENTID, STAFFNAME, SEX, STAFFEN_NAME, IDCARD, BIRTHDAY, POLITICS_STATUS, MARRIAGE_STATUS, INDUCTION_DATE, BLOOD_GROUP, REGULAR_WORKER_DATE, NATIVE_PLACE, QUALIFYING_PERIOD, NATIONALITY, LEAVE_OFFICE_DATE, NATION, TECHNICAL_TITLE, CN_DUTIES, EN_DUTIES, LINKPOSTCODE, LINKADDRESS, LINKPHONE, PHONE, HIGHEST_EDUCATION, EXPIRATION_DATE, BACHELOR_DEGREE, ARRIVAL_DATE, GRADUATE, PASSPORT_NUMBER, COLLEGE_MAJOR, PACT_START_DATE, EXPERIENCES_DATE, EMAIL, CONTRACT_PERIOD, NOW_PHONE, DOMICILE_PHONE, NOW_ADDRESS, HOME_PHONE, HOME_ADDRESS, REMARK, STANDBY_1, STANDBY_2)
values ('201806122', '123', '201806122', '李四', '女', null, '4302015612616541', to_date('25-01-1990', 'dd-mm-yyyy'), '党员', 0, to_date('15-02-2015', 'dd-mm-yyyy'), 'AB', to_date('23-09-2015', 'dd-mm-yyyy'), null, '2年', '201806122', to_date('06-06-2018', 'dd-mm-yyyy'), '201806122', null, null, null, null, '长沙岳麓区', '123456789', '123456789', '201806122', to_date('12-08-2017', 'dd-mm-yyyy'), '硕士', null, '北京大学', '164984', 'IT', to_date('12-12-2016', 'dd-mm-yyyy'), null, '46549846@163.com', null, '123456789', '123456789', '湖南长沙', '2412441', '法国巴黎', null, null, null);
commit;
prompt 2 records loaded
prompt Loading T_SUPPLIERMASTER...
prompt Table is empty
prompt Loading MATTERINFO...
prompt Table is empty
prompt Loading CHECKS...
prompt Table is empty
prompt Loading CLIENT_CATEGORY...
prompt Table is empty
prompt Loading CLIENT...
prompt Table is empty
prompt Loading PURCHASE...
prompt Table is empty
prompt Loading COSTDETAIL...
prompt Table is empty
prompt Loading CUSTOMERWITHMONEYDETAIL...
prompt Table is empty
prompt Loading ENQUIRY...
prompt Table is empty
prompt Loading ENQUIRYSON...
prompt Table is empty
prompt Loading ENQUIRYSONS...
prompt Table is empty
prompt Loading ESTIMATEMONEYBILL...
prompt Table is empty
prompt Loading ESTIMATEMONEYBILLDETAIL...
prompt Table is empty
prompt Loading REPERTORYASSERT...
insert into REPERTORYASSERT (REPERTORYID, REPERTORYNAME, REPERTORYCN_SHORT, LINKMAN, PHONE, LINKADDRESS, REPERTORYADDRESS, REMARK)
values ('201806121', '上海仓库', '上海仓', '张三', '123456789', '株洲荷塘区', '浦东区浦东路', null);
insert into REPERTORYASSERT (REPERTORYID, REPERTORYNAME, REPERTORYCN_SHORT, LINKMAN, PHONE, LINKADDRESS, REPERTORYADDRESS, REMARK)
values ('201806122', '北京仓库', '北京仓', '李四', '987654321', '株洲石峰区', '中关村中关路', null);
commit;
prompt 2 records loaded
prompt Loading MATTERWITHDEPOT...
prompt Table is empty
prompt Loading MOVESTORAGE...
prompt Table is empty
prompt Loading MOVEDETAILS...
prompt Table is empty
prompt Loading OUTGOINGDETAIL...
prompt Table is empty
prompt Loading PURCHASEREQUEST...
prompt Table is empty
prompt Loading PURCHASEREQUESTS...
prompt Table is empty
prompt Loading PUTSTORAGE...
prompt Table is empty
prompt Loading SELLQUOTE...
prompt Table is empty
prompt Loading QUOTEDETAIOLS...
prompt Table is empty
prompt Loading SALEORDER...
prompt Table is empty
prompt Loading SALEORDERDETAIL...
prompt Table is empty
prompt Loading SALESCARGO...
prompt Table is empty
prompt Loading SALESCARGODETAIL...
prompt Table is empty
prompt Loading SALES_RETURN...
prompt Table is empty
prompt Loading SALES_RETURN_DETAILED...
prompt Table is empty
prompt Loading SHAREDETAIL...
prompt Table is empty
prompt Loading SHOULDGETMONEYBILL...
prompt Table is empty
prompt Loading SHOULDESTIMATEBILLDETAIL...
prompt Table is empty
prompt Loading SHOULDGETMONEYBILLDETAIL...
prompt Table is empty
prompt Loading TIAOJIADANZHUBIAO...
prompt Table is empty
prompt Loading TIAOJIADANXIANGBIAO...
prompt Table is empty
prompt Loading TIAOZHENGFANGSHILEIXINGBIAO...
insert into TIAOZHENGFANGSHILEIXINGBIAO (LID, BADIUSTSTYLE)
values (1, '调单价');
insert into TIAOZHENGFANGSHILEIXINGBIAO (LID, BADIUSTSTYLE)
values (2, '调金额');
commit;
prompt 2 records loaded
prompt Loading T_CGTHDETAIL...
prompt Table is empty
prompt Loading T_CGTHMASTER...
prompt Table is empty
prompt Loading UNIT_OF_MEASURE...
insert into UNIT_OF_MEASURE (UNITID, UNITCN_NAME, REMARK)
values ('201806121', '斤', null);
insert into UNIT_OF_MEASURE (UNITID, UNITCN_NAME, REMARK)
values ('201806122', '块', null);
commit;
prompt 2 records loaded
prompt Enabling foreign key constraints for ADVANCE_DETAIL...
alter table ADVANCE_DETAIL enable constraint SYS_C005672;
prompt Enabling foreign key constraints for BALANCE_ADVANCEDETAIL...
alter table BALANCE_ADVANCEDETAIL enable constraint SYS_C005677;
prompt Enabling foreign key constraints for BALANCE_DETAIL...
alter table BALANCE_DETAIL enable constraint SYS_C005675;
prompt Enabling foreign key constraints for BUYERSON...
alter table BUYERSON enable constraint FK_BUYER;
prompt Enabling foreign key constraints for STAFF_MASTER_FILE...
alter table STAFF_MASTER_FILE enable constraint FK_SMF_BM;
alter table STAFF_MASTER_FILE enable constraint FK_SMF_GJ;
alter table STAFF_MASTER_FILE enable constraint FK_SMF_MZ;
alter table STAFF_MASTER_FILE enable constraint FK_SMF_XL;
prompt Enabling foreign key constraints for T_SUPPLIERMASTER...
alter table T_SUPPLIERMASTER enable constraint SYS_C005747;
alter table T_SUPPLIERMASTER enable constraint SYS_C005750;
alter table T_SUPPLIERMASTER enable constraint SYS_C005751;
prompt Enabling foreign key constraints for MATTERINFO...
alter table MATTERINFO enable constraint FK_MATTERINFO_MATTERTYPEID;
alter table MATTERINFO enable constraint FK_MATTERINFO_MONEYTYPE;
alter table MATTERINFO enable constraint FK_MATTERINFO_SALESERID;
prompt Enabling foreign key constraints for CHECKS...
alter table CHECKS enable constraint PP1;
alter table CHECKS enable constraint PP3;
prompt Enabling foreign key constraints for CLIENT...
alter table CLIENT enable constraint FK_CLIENT_ADDRESS;
alter table CLIENT enable constraint FK_CLIENT_CLIENT_CATEGORY;
prompt Enabling foreign key constraints for COSTDETAIL...
alter table COSTDETAIL enable constraint FK;
prompt Enabling foreign key constraints for ENQUIRYSON...
alter table ENQUIRYSON enable constraint FK_ENQUIRYSON;
prompt Enabling foreign key constraints for MATTERWITHDEPOT...
alter table MATTERWITHDEPOT enable constraint FK_MATTERWITHDEPOT_DEPOTID;
alter table MATTERWITHDEPOT enable constraint FK_MATTERWITHDEPOT_MATTERID;
prompt Enabling foreign key constraints for MOVEDETAILS...
alter table MOVEDETAILS enable constraint FK_MOVEDETAILS_MSENO;
prompt Enabling foreign key constraints for OUTGOINGDETAIL...
alter table OUTGOINGDETAIL enable constraint FK_OUTGOINGDETAIL_DEPOT;
prompt Enabling foreign key constraints for PURCHASEREQUESTS...
alter table PURCHASEREQUESTS enable constraint PP;
alter table PURCHASEREQUESTS enable constraint PP2;
prompt Enabling foreign key constraints for PUTSTORAGE...
alter table PUTSTORAGE enable constraint SYS_C005714;
prompt Enabling foreign key constraints for QUOTEDETAIOLS...
alter table QUOTEDETAIOLS enable constraint FK_QUOTEDETAIOLS_BILLID;
prompt Enabling foreign key constraints for SALEORDERDETAIL...
alter table SALEORDERDETAIL enable constraint FK_SOID_ID;
prompt Enabling foreign key constraints for SALESCARGO...
alter table SALESCARGO enable constraint FK_SALESCARGO_CID;
alter table SALESCARGO enable constraint FK_SALESCARGO_DEPOTID;
alter table SALESCARGO enable constraint FK_SALESCARGO_GOLDID;
prompt Enabling foreign key constraints for SALESCARGODETAIL...
alter table SALESCARGODETAIL enable constraint FK_SALESCARGODETAIL_MATTERID;
alter table SALESCARGODETAIL enable constraint FK_SALESCARGODETAIL_SALEID;
prompt Enabling foreign key constraints for SALES_RETURN...
alter table SALES_RETURN enable constraint FK_SALES_RETURN_LIANHE;
prompt Enabling foreign key constraints for SHAREDETAIL...
alter table SHAREDETAIL enable constraint FK_PID_ID_LXW;
prompt Enabling foreign key constraints for SHOULDESTIMATEBILLDETAIL...
alter table SHOULDESTIMATEBILLDETAIL enable constraint FK_EMID_ID;
prompt Enabling foreign key constraints for SHOULDGETMONEYBILLDETAIL...
alter table SHOULDGETMONEYBILLDETAIL enable constraint FK_CONTNETID_ID;
prompt Enabling foreign key constraints for TIAOJIADANXIANGBIAO...
alter table TIAOJIADANXIANGBIAO enable constraint SYS_C005655;
prompt Enabling foreign key constraints for T_CGTHDETAIL...
alter table T_CGTHDETAIL enable constraint SYS_C005749;
alter table T_CGTHDETAIL enable constraint SYS_C005758;
prompt Enabling foreign key constraints for T_CGTHMASTER...
alter table T_CGTHMASTER enable constraint SYS_C005748;
alter table T_CGTHMASTER enable constraint SYS_C005752;
alter table T_CGTHMASTER enable constraint SYS_C005753;
alter table T_CGTHMASTER enable constraint SYS_C005754;
alter table T_CGTHMASTER enable constraint SYS_C005755;
alter table T_CGTHMASTER enable constraint SYS_C005756;
alter table T_CGTHMASTER enable constraint SYS_C005757;
set feedback on
set define on
prompt Done.
