prompt PL/SQL Developer import file
prompt Created on 2018��6��15�� by Administrator
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
  is '��ַ���';
comment on column ADDRESS.ADDRESS
  is '��ַ';
comment on column ADDRESS.EMAIL_CODE
  is '��������';
comment on column ADDRESS.CONTACTS
  is '��ϵ��';
comment on column ADDRESS.ADDRESSID_TITLE
  is '��ϵ�˵�ְ��';
comment on column ADDRESS.TELEPHONE
  is '��ϵ�绰';
comment on column ADDRESS.ROUTE
  is '���ߵ�·��';
comment on column ADDRESS.REMARKS
  is '��ע';
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
  is '����';
comment on column ADVANCE_HOST.AHDATE
  is '����';
comment on column ADVANCE_HOST.SUPPLIERSID
  is '��Ӧ��id';
comment on column ADVANCE_HOST.CURRENCYID
  is '�ұ�id';
comment on column ADVANCE_HOST.AHCLEARINGONE
  is '���㷽ʽһ';
comment on column ADVANCE_HOST.AHCLEARINGTOW
  is '���㷽ʽ��';
comment on column ADVANCE_HOST.AHCLEARINGTHREE
  is '���㷽ʽ��';
comment on column ADVANCE_HOST.AHEXCHANGERATE
  is '����';
comment on column ADVANCE_HOST.AHDISCOUNTRATE
  is '�ۿ���';
comment on column ADVANCE_HOST.AHDEPT
  is '��������';
comment on column ADVANCE_HOST.AHMAKINGNAME
  is '�Ƶ���Ա';
comment on column ADVANCE_HOST.AHVERIFIER
  is '�����';
comment on column ADVANCE_HOST.AHREVIEWSTATE
  is '���״̬0-δ���1-�����';
comment on column ADVANCE_HOST.AHREVIEWDATE
  is '���ʱ��';
comment on column ADVANCE_HOST.AHREMARK
  is '��ע';
comment on column ADVANCE_HOST.TESTA
  is '�����ֶ�1';
comment on column ADVANCE_HOST.TESTB
  is '�����ֶ�2';
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
  is '����(����Ԥ��������)';
comment on column ADVANCE_DETAIL.ADLINE
  is '�к�';
comment on column ADVANCE_DETAIL.ADMONEY
  is 'Ԥ�����';
comment on column ADVANCE_DETAIL.ADSINGLE
  is '��Դ����(�ɹ�����)';
comment on column ADVANCE_DETAIL.ADSOURCE
  is '��Դ����';
comment on column ADVANCE_DETAIL.ADSUMMARY
  is 'ժҪ';
comment on column ADVANCE_DETAIL.TESTA
  is '�����ֶ�1';
comment on column ADVANCE_DETAIL.TESTB
  is '�����ֶ�2';
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
  is '����';
comment on column BALANCE_HOST.BHDATE
  is '����';
comment on column BALANCE_HOST.SUPPLIERSID
  is '��Ӧ��id(fk)';
comment on column BALANCE_HOST.CURRENCYID
  is '�ұ�id(fk)';
comment on column BALANCE_HOST.BHCLEARINGONE
  is '���㷽ʽһ';
comment on column BALANCE_HOST.BHCLEARINGTOW
  is '���㷽ʽ��';
comment on column BALANCE_HOST.BHCLEARINGTHREE
  is '���㷽ʽ��';
comment on column BALANCE_HOST.BHEXCHANGERATE
  is '����';
comment on column BALANCE_HOST.BHDISCOUNTRATE
  is '�ۿ���';
comment on column BALANCE_HOST.BHDEPT
  is '��������';
comment on column BALANCE_HOST.BHREMARK
  is '��ע';
comment on column BALANCE_HOST.BHMAKINGNAME
  is '�Ƶ���Ա';
comment on column BALANCE_HOST.BHVERIFIER
  is '�����';
comment on column BALANCE_HOST.BHREVIEWDATA
  is '���״̬0-δ���1-�����';
comment on column BALANCE_HOST.BHREVIEWDATE
  is '���ʱ��';
comment on column BALANCE_HOST.TESTA
  is '�����ֶ�1';
comment on column BALANCE_HOST.TESTB
  is '�����ֶ�2';
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
  is '����';
comment on column BALANCE_ADVANCEDETAIL.BALINE
  is '�к�';
comment on column BALANCE_ADVANCEDETAIL.ADID
  is 'Ԥ��������(fk)';
comment on column BALANCE_ADVANCEDETAIL.ADLINE
  is 'Ԥ�����к�(fk)';
comment on column BALANCE_ADVANCEDETAIL.BAMONEY
  is 'ȡ��Ԥ�����';
comment on column BALANCE_ADVANCEDETAIL.TEST1
  is '�����ֶ�1';
comment on column BALANCE_ADVANCEDETAIL.TEST2
  is '�����ֶ�2';
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
  is '����';
comment on column BALANCE_DETAIL.BDLINE
  is '�к�';
comment on column BALANCE_DETAIL.BDSINGLE
  is '��Դ����(�ɹ���ⵥ)';
comment on column BALANCE_DETAIL.BDSOURCE
  is '��Դ����';
comment on column BALANCE_DETAIL.BDPRIMARYMONEY
  is 'ԭ�����';
comment on column BALANCE_DETAIL.BDDISCOUNTSMONEY
  is '���ý��';
comment on column BALANCE_DETAIL.BDCHARGEMONEY
  is '�����';
comment on column BALANCE_DETAIL.TESTA
  is '�����ֶ�1';
comment on column BALANCE_DETAIL.TESTB
  is '�����ֶ�2';
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
  is '�������ͱ�';
comment on column BILLTYPE.ID
  is '���ͱ��';
comment on column BILLTYPE.SOTYPE
  is '��������';
comment on column BILLTYPE.ENNAME
  is '��Ӧ�����������ݱ�';
comment on column BILLTYPE.DETAILTABLE
  is '�ñ����ϸ��';
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
  is '���ݺ���';
comment on column BUYER.TIME
  is '�ֿ�id';
comment on column BUYER.SUPPLIERNAME
  is '��Ӧ��id������';
comment on column BUYER.STATE
  is '����0δ���/1���/2����';
comment on column BUYER.MONEYTYPE
  is '�ұ� 0RMR';
comment on column BUYER.TAXSTATE
  is '�Ƿ�˰0��˰/1����˰';
comment on column BUYER.RATE
  is '����';
comment on column BUYER.DELIVER
  is '�ͻ���ַ';
comment on column BUYER.TOUCHING
  is '�Ƶ���Ա';
comment on column BUYER.SECTION
  is '��������';
comment on column BUYER.CHECKPEOPLE
  is '������Ա';
comment on column BUYER.REMARK
  is '��ע';
comment on column BUYER.COLUMNSTATE
  is '�����ݵ�״̬ 0����/1ɾ��';
comment on column BUYER.CHECKSTATE
  is '���״̬0���/1δ���';
comment on column BUYER.COLUMN1
  is '�����ֶ�1';
comment on column BUYER.COLUMN2
  is '�����ֶ�2';
comment on column BUYER.COLUMN3
  is '�����ֶ�3';
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
  is '���ݺ���';
comment on column BUYERSON.LINE
  is '�к�';
comment on column BUYERSON.FID
  is '�����ݺ�';
comment on column BUYERSON.WID
  is '���Ϻ�';
comment on column BUYERSON.FROMID
  is '��Դ����';
comment on column BUYERSON.FROMTYPE
  is '��Դ����';
comment on column BUYERSON.PRICE
  is '˰ǰ���';
comment on column BUYERSON.NUM
  is '����';
comment on column BUYERSON.TIME
  is '����ʱ��';
comment on column BUYERSON.NOTNUM
  is 'δ�����';
comment on column BUYERSON.MONEY
  is '����';
comment on column BUYERSON.TARIFFMONEY
  is '˰��';
comment on column BUYERSON.MONEYTARIFF
  is '��˰���';
comment on column BUYERSON.GIFT
  is '�Ƿ�Ϊ����Ʒ0����Ʒ,1��Ʒ';
comment on column BUYERSON.REMARK
  is '��ע';
comment on column BUYERSON.COLUMNSTATE
  is '�����ݵ�״̬ 0����/1ɾ��';
comment on column BUYERSON.COLUMN1
  is '�����ֶ�1';
comment on column BUYERSON.COLUMN2
  is '�����ֶ�2';
comment on column BUYERSON.COLUMN3
  is '�����ֶ�3';
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
  is '�̵㵥����';
comment on column CHECK1.PDNUMBERS
  is '�̵��';
comment on column CHECK1.PDWAREHOUSE
  is '�̵�ֿ��ţ����� ';
comment on column CHECK1.PDDATE
  is '��������';
comment on column CHECK1.PDPERSONNEL
  is '�̵���Ա��ţ�����';
comment on column CHECK1.PDZDPERSONNEL
  is '�Ƶ���Ա';
comment on column CHECK1.PDDEPARTMENT
  is '�������ű�ţ�����';
comment on column CHECK1.PDRECHECKNUMBER
  is '	������Ա';
comment on column CHECK1.PDCOLUMN1
  is '�Զ�����һ';
comment on column CHECK1.PDCOLUMN2
  is '�Զ�������';
comment on column CHECK1.PDREMARK
  is '��ע';
comment on column CHECK1.PDEXAMINESTATUS
  is '���״̬��0�������1��δ��ˣ�';
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
  is '��������趨';
comment on column MATTERTYPE.MATTERTYPEID
  is '���ͱ��';
comment on column MATTERTYPE.TYPE
  is '����';
comment on column MATTERTYPE.ENAME
  is 'Ӣ������';
comment on column MATTERTYPE.SAVECOURSE
  is '�����Ŀ';
comment on column MATTERTYPE.SALESPROCEED
  is '���������Ŀ';
comment on column MATTERTYPE.SALESCOST
  is '���۳ɱ���Ŀ';
comment on column MATTERTYPE.REMARK
  is '��ע';
comment on column MATTERTYPE.STATUS
  is '״̬';
comment on column MATTERTYPE.PREPARE1
  is 'Ԥ����1';
comment on column MATTERTYPE.PREPARE2
  is 'Ԥ����2';
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
  is '��Ӧ�������';
comment on column T_SUPPLIERTYPE.SUPTYPENAME
  is '�������';
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
  is '�ұ��';
comment on column COINTYPE.ID
  is '���ͱ��';
comment on column COINTYPE.CNAME
  is '��������';
comment on column COINTYPE.PAITIES
  is '����';
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
  is '���ű�';
comment on column DEPARTMENT.DEPARTMENTID
  is '���ű��';
comment on column DEPARTMENT.DEPARTMENTCN_NAME
  is '��������';
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
  is '�����';
comment on column NATION.NATIONID
  is '������';
comment on column NATION.NATIONCN_NAME
  is '��������';
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
  is '������';
comment on column NATIONALITY.NATIONALITYID
  is '�������';
comment on column NATIONALITY.NATIONALITYCN_NAME
  is '��������';
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
  is 'ѧ����';
comment on column RECORD_OF_FORMAL_SCHOOLING.ROFSID
  is 'ѧ�����';
comment on column RECORD_OF_FORMAL_SCHOOLING.ROFSCN_NAME
  is 'ѧ������';
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
  is '��Ա���ļ���';
comment on column STAFF_MASTER_FILE.STAFFID
  is '��Ա���';
comment on column STAFF_MASTER_FILE.PWD
  is '����';
comment on column STAFF_MASTER_FILE.DEPARTMENTID
  is '�������ţ����';
comment on column STAFF_MASTER_FILE.STAFFNAME
  is '��Ա����';
comment on column STAFF_MASTER_FILE.SEX
  is '�Ա�';
comment on column STAFF_MASTER_FILE.STAFFEN_NAME
  is 'Ӣ������';
comment on column STAFF_MASTER_FILE.IDCARD
  is '���֤����';
comment on column STAFF_MASTER_FILE.BIRTHDAY
  is '��������';
comment on column STAFF_MASTER_FILE.POLITICS_STATUS
  is '������ò';
comment on column STAFF_MASTER_FILE.MARRIAGE_STATUS
  is '����״��';
comment on column STAFF_MASTER_FILE.INDUCTION_DATE
  is '��ְ����';
comment on column STAFF_MASTER_FILE.BLOOD_GROUP
  is 'Ѫ��';
comment on column STAFF_MASTER_FILE.REGULAR_WORKER_DATE
  is 'ת������';
comment on column STAFF_MASTER_FILE.NATIVE_PLACE
  is '����';
comment on column STAFF_MASTER_FILE.QUALIFYING_PERIOD
  is '�����ڳ�';
comment on column STAFF_MASTER_FILE.NATIONALITY
  is '���������';
comment on column STAFF_MASTER_FILE.LEAVE_OFFICE_DATE
  is '��ְ����';
comment on column STAFF_MASTER_FILE.NATION
  is '���壬���';
comment on column STAFF_MASTER_FILE.TECHNICAL_TITLE
  is '����ְ��';
comment on column STAFF_MASTER_FILE.CN_DUTIES
  is '����ְ��';
comment on column STAFF_MASTER_FILE.EN_DUTIES
  is 'Ӣ��ְ��';
comment on column STAFF_MASTER_FILE.LINKPOSTCODE
  is '��ϵ�ʱ�';
comment on column STAFF_MASTER_FILE.LINKADDRESS
  is '��ϵ��ַ';
comment on column STAFF_MASTER_FILE.LINKPHONE
  is '��ϵ�绰';
comment on column STAFF_MASTER_FILE.PHONE
  is '�ƶ��绰';
comment on column STAFF_MASTER_FILE.HIGHEST_EDUCATION
  is '���ѧ�������';
comment on column STAFF_MASTER_FILE.EXPIRATION_DATE
  is '��������';
comment on column STAFF_MASTER_FILE.BACHELOR_DEGREE
  is 'ѧλ';
comment on column STAFF_MASTER_FILE.ARRIVAL_DATE
  is '�뾳����';
comment on column STAFF_MASTER_FILE.GRADUATE
  is '��ҵѧУ';
comment on column STAFF_MASTER_FILE.PASSPORT_NUMBER
  is '���պ���';
comment on column STAFF_MASTER_FILE.COLLEGE_MAJOR
  is '��ѧרҵ';
comment on column STAFF_MASTER_FILE.PACT_START_DATE
  is '��ͬ��ʼ����';
comment on column STAFF_MASTER_FILE.EXPERIENCES_DATE
  is '��������';
comment on column STAFF_MASTER_FILE.EMAIL
  is '��������';
comment on column STAFF_MASTER_FILE.CONTRACT_PERIOD
  is '��ͬ�ڣ�����';
comment on column STAFF_MASTER_FILE.NOW_PHONE
  is '�ֵ绰';
comment on column STAFF_MASTER_FILE.DOMICILE_PHONE
  is '�����绰';
comment on column STAFF_MASTER_FILE.NOW_ADDRESS
  is '�ֵ�ַ';
comment on column STAFF_MASTER_FILE.HOME_PHONE
  is '��ͥ�绰';
comment on column STAFF_MASTER_FILE.HOME_ADDRESS
  is '�ֵ�ַ';
comment on column STAFF_MASTER_FILE.REMARK
  is '��ע';
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
  PAYTERM         VARCHAR2(50) default '����',
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
  is '��Ӧ�̱��';
comment on column T_SUPPLIERMASTER.SUPTYPEID
  is '�����';
comment on column T_SUPPLIERMASTER.ADDRESSNAME
  is '��������';
comment on column T_SUPPLIERMASTER.CURRENCYID
  is '�ұ���';
comment on column T_SUPPLIERMASTER.PURCHASEMAN
  is '�ɹ���Ա���';
comment on column T_SUPPLIERMASTER.SURPLUSMONEY
  is 'ʣ����';
comment on column T_SUPPLIERMASTER.PAYTERM
  is '��������';
comment on column T_SUPPLIERMASTER.CREDITRAT
  is '���õȼ�';
comment on column T_SUPPLIERMASTER.STARTADVRECV
  is '�ڳ�Ԥ����';
comment on column T_SUPPLIERMASTER.STARTRECEIVABLE
  is '�ڳ�Ӧ����';
comment on column T_SUPPLIERMASTER.CURADVRECV
  is '��ĩԤ����';
comment on column T_SUPPLIERMASTER.CURRECEIVABLE
  is '��ĩӦ����';
comment on column T_SUPPLIERMASTER.PRICEOFTAX
  is '�����Ƿ�˰';
comment on column T_SUPPLIERMASTER.AMOUNTQUOTA
  is '�˿���';
comment on column T_SUPPLIERMASTER.COLUMNONE
  is '�����ֶ�1';
comment on column T_SUPPLIERMASTER.COLUMNTWO
  is '�����ֶ�2';
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
  is '�������ļ�';
comment on column MATTERINFO.MATTERID
  is '���ϱ��';
comment on column MATTERINFO.MATTERNAME
  is '��������';
comment on column MATTERINFO.MATTERTYPEID
  is '���������';
comment on column MATTERINFO.SAVE
  is '������λ';
comment on column MATTERINFO.MODELS
  is '����ͺ�';
comment on column MATTERINFO.SUGGESTPRICE
  is '�����ۼ�';
comment on column MATTERINFO.ASELL
  is '�ۼ�A';
comment on column MATTERINFO.BSELL
  is '�ۼ�B';
comment on column MATTERINFO.CSELL
  is '�ۼ�C';
comment on column MATTERINFO.DSELL
  is '�ۼ�D';
comment on column MATTERINFO.ESELL
  is '�ۼ�E';
comment on column MATTERINFO.STANDARDBID
  is '��׼����';
comment on column MATTERINFO.MONEYTYPE
  is '�ұ���';
comment on column MATTERINFO.BIAOCB
  is '��׼�ɱ���';
comment on column MATTERINFO.TAXSTATE
  is '�����Ƿ�˰';
comment on column MATTERINFO.MATTERREMARK
  is '����˵��';
comment on column MATTERINFO.SHUILV
  is '˰��';
comment on column MATTERINFO.ALOCAIGOU
  is '�ɹ���ǰ��';
comment on column MATTERINFO.SALESERID
  is '����Ӧ��';
comment on column MATTERINFO.ANQUSAVE
  is '��ȫ����';
comment on column MATTERINFO.BSUMCOST
  is '�ڳ�������';
comment on column MATTERINFO.AVGCOST
  is 'ƽ���ɱ�';
comment on column MATTERINFO.COST
  is '��׼�ɱ�';
comment on column MATTERINFO.STARTSCOST
  is '�ڳ��ܳɱ�';
comment on column MATTERINFO.STATUS
  is '״̬';
comment on column MATTERINFO.PREPARE1
  is 'Ԥ����1';
comment on column MATTERINFO.PREPARE2
  is 'Ԥ����2';
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
  is '�̵㵥���';
comment on column CHECKS.PDNUMBERS
  is '�̵��';
comment on column CHECKS.PDLINE
  is '�к� ';
comment on column CHECKS.PDMATERIALID
  is '���ϱ��';
comment on column CHECKS.PDMATERIALNAME
  is '��������';
comment on column CHECKS.PDMATERIALTYPE
  is '����ͺ�';
comment on column CHECKS.PDPAPERNUMBER
  is '��������';
comment on column CHECKS.PDNUMBER
  is '�̵�����';
comment on column CHECKS.PDLOSSPROFITNUMBERS
  is 'ӯ������';
comment on column CHECKS.PDPRICE
  is '����';
comment on column CHECKS.PDLOSSPROFITMONEY
  is '���ӯ��';
comment on column CHECKS.PDCAUSE
  is 'ԭ��';
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
  is '�����';
comment on column CLIENT_CATEGORY.CATEGORYNC
  is '�������';
comment on column CLIENT_CATEGORY.REMARKS
  is '��ע';
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
  is '�ͻ��ı��';
comment on column CLIENT.CUSTOMERRECEIVABLEBELONGING
  is '�ͻ����˿����';
comment on column CLIENT.CUSTOMERNAME
  is '�ͻ�������';
comment on column CLIENT.CUSTOMERCLASSID
  is '�ͻ����ı��(���)';
comment on column CLIENT.CUSTOMERSIMPLENAME
  is '�ͻ��ļ��';
comment on column CLIENT.CUSTOMERADDRESSID
  is '�ͻ��ĵ�ַId';
comment on column CLIENT.CUSTOMERCURRENCY
  is '�ͻ��ıұ�';
comment on column CLIENT.CUSTOMERFUNCTIONARY
  is '�ͻ��ĸ�����';
comment on column CLIENT.PERSONNELID
  is 'ҵ��Ǽ���Ա(���)';
comment on column CLIENT.CUSTOMERCONTACT
  is '�ͻ�����ϵ��';
comment on column CLIENT.CUSTOMERPHONE
  is '�ͻ�����ϵ�绰';
comment on column CLIENT.CUSTOMERAMOUNT
  is ' �ͻ����ʱ���';
comment on column CLIENT.CUSTOMERTRADE
  is ' �ͻ�����ҵ';
comment on column CLIENT.CUSTOMERSMAIL
  is ' �ͻ�������';
comment on column CLIENT.CUSTOMERBANKACCOUNT
  is ' �ͻ������п���';
comment on column CLIENT.CUSTOMERBANKNAME
  is ' �ͻ��Ŀ�������';
comment on column CLIENT.CUSTOMERPORTRAITURE
  is '�ͻ��Ĵ���';
comment on column CLIENT.CUSTOMERSELLLEVEL
  is ' �ͻ������۵ȼ�(0 �ǽ����ۼ�1 ���ۼ�A2 ���ۼ� B3  ,�ۼ� C)�Զ����ȼ����������ѽ��';
comment on column CLIENT.CUSTOMERTAX
  is ' �����Ƿ�˰(0 ��˰ 1 ����˰)';
comment on column CLIENT.CUSTOMERCREATEDATE
  is ' �ͻ��Ĵ�������';
comment on column CLIENT.CUSTOMERRECEIVABLELIMIT
  is '�˿�Ķ��';
comment on column CLIENT.CUSTOMERSURPLUSLIMIT
  is '�ͻ�ʣ����';
comment on column CLIENT.CUSTOMERADVANCESRECEIVED
  is ' Ԥ�տ�';
comment on column CLIENT.CUSTOMERACCOUNTDUE
  is ' Ӧ�տ�';
comment on column CLIENT.CUSTOMERREMARK
  is ' �ͻ���ע';
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
  is '���ݱ��';
comment on column PURCHASE.SDATE
  is '��������';
comment on column PURCHASE.STYPE
  is '��̯��ʽ';
comment on column PURCHASE.SMONEY
  is '��̯���';
comment on column PURCHASE.TOUCHING
  is '�Ƶ���Ա';
comment on column PURCHASE.ACCOUNT
  is '������Ա';
comment on column PURCHASE.CHECKSTATUS
  is '����״̬';
comment on column PURCHASE.DEMO1
  is 'Ԥ���ֶ�1';
comment on column PURCHASE.DEMO2
  is 'Ԥ���ֶ�2';
comment on column PURCHASE.DEMO3
  is 'Ԥ���ֶ�3';
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
  is '���ñ��';
comment on column COSTDETAIL.PID
  is '�к�';
comment on column COSTDETAIL.CLOUD
  is '����id';
comment on column COSTDETAIL.COSTNAME
  is '��������';
comment on column COSTDETAIL.CURRENCY
  is '�ұ�';
comment on column COSTDETAIL.EXCHANGERARATE
  is '����';
comment on column COSTDETAIL.MONEY
  is '���';
comment on column COSTDETAIL.STANDARDCOIN
  is '��λ��';
comment on column COSTDETAIL.CHECKSTATUS
  is '����״̬';
comment on column COSTDETAIL.DEMO1
  is 'Ԥ���ֶ�1';
comment on column COSTDETAIL.DEMO2
  is 'Ԥ���ֶ�2';
comment on column COSTDETAIL.DEMO3
  is 'Ԥ���ֶ�3';
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
  is '�ͻ��˿���ϸ��';
comment on column CUSTOMERWITHMONEYDETAIL.BILLNO
  is '�������ͱ��';
comment on column CUSTOMERWITHMONEYDETAIL.BILLTYPEID
  is '����';
comment on column CUSTOMERWITHMONEYDETAIL.DATEANDTIME
  is 'ʱ��';
comment on column CUSTOMERWITHMONEYDETAIL.CUSID
  is '�ͻ����';
comment on column CUSTOMERWITHMONEYDETAIL.SOURCEMONEY
  is 'ԭ�����';
comment on column CUSTOMERWITHMONEYDETAIL.LEFTGETMONEY
  is '���н��';
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
  is '���ݺ���';
comment on column ENQUIRY.TIME
  is '�ֿ�id';
comment on column ENQUIRY.SUPPLIERNAME
  is '��Ӧ��id������';
comment on column ENQUIRY.TAXSTATE
  is '�Ƿ�˰0��˰/1����˰';
comment on column ENQUIRY.RATE
  is '����';
comment on column ENQUIRY.DELIVER
  is '�ͻ���ַ';
comment on column ENQUIRY.TOUCHING
  is '�Ƶ���Ա';
comment on column ENQUIRY.SECTION
  is '��������';
comment on column ENQUIRY.CHECKPEOPLE
  is '������Ա';
comment on column ENQUIRY.REMARK
  is '��ע';
comment on column ENQUIRY.CHECKSTATE
  is '���״̬0���/1δ���';
comment on column ENQUIRY.COLUMNSTATE
  is '�����ݵ�״̬ 0����/1ɾ��';
comment on column ENQUIRY.COLUMN1
  is '�����ֶ�1';
comment on column ENQUIRY.COLUMN2
  is '�����ֶ�2';
comment on column ENQUIRY.COLUMN3
  is '�����ֶ�3';
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
  is '���ݺ���';
comment on column ENQUIRYSON.LINE
  is '�к�';
comment on column ENQUIRYSON.FID
  is '�����ݺ�';
comment on column ENQUIRYSON.WID
  is '���Ϻ�';
comment on column ENQUIRYSON.FROMID
  is '��Դ����';
comment on column ENQUIRYSON.FROMTYPE
  is '��Դ����';
comment on column ENQUIRYSON.PRICE
  is '˰ǰ���';
comment on column ENQUIRYSON.NUM
  is '����';
comment on column ENQUIRYSON.TIME
  is '����ʱ��';
comment on column ENQUIRYSON.NOTNUM
  is 'δ�����';
comment on column ENQUIRYSON.MONEY
  is '����';
comment on column ENQUIRYSON.TARIFFMONEY
  is '˰��';
comment on column ENQUIRYSON.MONEYTARIFF
  is '��˰���';
comment on column ENQUIRYSON.GIFT
  is '�Ƿ�Ϊ����Ʒ0����Ʒ,1��Ʒ';
comment on column ENQUIRYSON.REMARK
  is '��ע';
comment on column ENQUIRYSON.COLUMNSTATE
  is '�����ݵ�״̬ 0����/1ɾ��';
comment on column ENQUIRYSON.COLUMN1
  is '�����ֶ�1';
comment on column ENQUIRYSON.COLUMN2
  is '�����ֶ�2';
comment on column ENQUIRYSON.COLUMN3
  is '�����ֶ�3';
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
  is '���ݺ�';
comment on column ENQUIRYSONS.LINE
  is '�к�';
comment on column ENQUIRYSONS.FID
  is '�ܱ�id';
comment on column ENQUIRYSONS.WID
  is '����id';
comment on column ENQUIRYSONS.FROMID
  is '��Դ����';
comment on column ENQUIRYSONS.FROMTYPE
  is '��Դ����';
comment on column ENQUIRYSONS.PRICE
  is '�ۿ�ǰ����';
comment on column ENQUIRYSONS.NUM
  is '����';
comment on column ENQUIRYSONS.MONEY
  is '���';
comment on column ENQUIRYSONS.TARIFF
  is '˰��';
comment on column ENQUIRYSONS.TARIFFMONEY
  is '˰��';
comment on column ENQUIRYSONS.MONEYTARIFF
  is '��˰���';
comment on column ENQUIRYSONS.GIFT
  is '��Ʒ0����Ʒ/1��Ʒ';
comment on column ENQUIRYSONS.REMARK
  is '��¼��ע';
comment on column ENQUIRYSONS.COLUMN1
  is '�����ֶ�1';
comment on column ENQUIRYSONS.COLUMN2
  is '�����ֶ�2';
comment on column ENQUIRYSONS.COLUMN3
  is '�����ֶ�3';
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
  is 'Ԥ�տ��';
comment on column ESTIMATEMONEYBILL.ID
  is '���ݱ��';
comment on column ESTIMATEMONEYBILL.DATEANDTIME
  is '����ʱ��';
comment on column ESTIMATEMONEYBILL.CUSID
  is '�ͻ����';
comment on column ESTIMATEMONEYBILL.COINTYPE
  is '�ұ�';
comment on column ESTIMATEMONEYBILL.OVERTIME
  is '��ֹ����';
comment on column ESTIMATEMONEYBILL.PAITIES
  is '����';
comment on column ESTIMATEMONEYBILL.TRANSFER
  is 'ת�˷�ʽ';
comment on column ESTIMATEMONEYBILL.DRAFT
  is '��Ʊ��ʽ';
comment on column ESTIMATEMONEYBILL.OTHERWAY
  is '������ʽ';
comment on column ESTIMATEMONEYBILL.REMARK
  is '��ע';
comment on column ESTIMATEMONEYBILL.DANDNAME
  is '���ű��-����';
comment on column ESTIMATEMONEYBILL.CANDNAME
  is '����˱��-����';
comment on column ESTIMATEMONEYBILL.MANDNAME
  is '�Ƶ��˱��-����';
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
  is 'Ԥ�տ��ϸ��';
comment on column ESTIMATEMONEYBILLDETAIL.ID
  is '������';
comment on column ESTIMATEMONEYBILLDETAIL.LINENO
  is '�к�';
comment on column ESTIMATEMONEYBILLDETAIL.BILLTYPEID
  is '��Դ����';
comment on column ESTIMATEMONEYBILLDETAIL.BILLNO
  is 'ժҪ';
comment on column ESTIMATEMONEYBILLDETAIL.ESTIMATEMONEY
  is 'Ԥ�ս��';
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
  is '�ֿ��';
comment on column REPERTORYASSERT.REPERTORYID
  is '�ֿ���';
comment on column REPERTORYASSERT.REPERTORYNAME
  is '�ֿ�����';
comment on column REPERTORYASSERT.REPERTORYCN_SHORT
  is '�ֿ���';
comment on column REPERTORYASSERT.LINKMAN
  is '��ϵ��';
comment on column REPERTORYASSERT.PHONE
  is '��ϵ�绰';
comment on column REPERTORYASSERT.LINKADDRESS
  is '��ϵ��ַ';
comment on column REPERTORYASSERT.REPERTORYADDRESS
  is '�ֿ��ַ';
comment on column REPERTORYASSERT.REMARK
  is '��ע';
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
  is '�ֿ����˱�';
comment on column MATTERWITHDEPOT.MATTERWITHDEPOTID
  is '���';
comment on column MATTERWITHDEPOT.DEPOTID
  is '�ֿ���';
comment on column MATTERWITHDEPOT.MATTERID
  is '���ϱ��';
comment on column MATTERWITHDEPOT.MATTERNUMBER
  is '����';
comment on column MATTERWITHDEPOT.MATTERMONEY
  is '���';
comment on column MATTERWITHDEPOT.MATTERPRICE
  is '����';
comment on column MATTERWITHDEPOT.STATUS
  is '״̬';
comment on column MATTERWITHDEPOT.PREPARE1
  is 'Ԥ����1';
comment on column MATTERWITHDEPOT.PREPARE2
  is 'Ԥ����2';
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
  is '����������';
comment on column MOVESTORAGE.MSENO
  is '���ݱ��';
comment on column MOVESTORAGE.MSEDATE
  is '��������';
comment on column MOVESTORAGE.MSEOUTSTORAGE
  is '�����ֿ���';
comment on column MOVESTORAGE.MSEINSERTSTOR
  is '����ֿ���';
comment on column MOVESTORAGE.MSEEMPLOYEE
  is '�Ƶ���Ա';
comment on column MOVESTORAGE.MESAUDITINGEMP
  is '������Ա';
comment on column MOVESTORAGE.MESREMARK
  is '��ע';
comment on column MOVESTORAGE.MESSTATUS
  is '���״̬';
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
  is '��������ϸ��';
comment on column MOVEDETAILS.MSENO
  is '���ݱ��';
comment on column MOVEDETAILS.LINEMARK
  is '�к�';
comment on column MOVEDETAILS.MDSMATERIELTYPE
  is '���ϱ��';
comment on column MOVEDETAILS.MDSMATERIELNAME
  is '��������';
comment on column MOVEDETAILS.MDSMATERIELSPECS
  is '���Ϲ��';
comment on column MOVEDETAILS.MDSMATERIELUNIT
  is '��λ';
comment on column MOVEDETAILS.MDSMATERIELNUM
  is '����';
comment on column MOVEDETAILS.MDSREMARK
  is '��¼��ע';
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
  is '�������ϸ��';
comment on column OUTGOINGDETAIL.LINENUMBER
  is '�к�';
comment on column OUTGOINGDETAIL.BILLNO
  is '����ⵥ��';
comment on column OUTGOINGDETAIL.DEPOT
  is '�ֿ�id';
comment on column OUTGOINGDETAIL.BILLDATE
  is '�����ʱ��';
comment on column OUTGOINGDETAIL.REMARKS
  is '��ע';
comment on column OUTGOINGDETAIL.TYPE
  is '����';
comment on column OUTGOINGDETAIL.QUANTITY
  is '������';
comment on column OUTGOINGDETAIL.MONEY
  is '�ܽ��';
comment on column OUTGOINGDETAIL.STATUS
  is '״̬';
comment on column OUTGOINGDETAIL.PREPARE1
  is 'Ԥ����1';
comment on column OUTGOINGDETAIL.PREPARE2
  is 'Ԥ����2';
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
  is '�ɹ��빺������';
comment on column PURCHASEREQUEST.QGBILLNUMBER
  is '���ݺ�';
comment on column PURCHASEREQUEST.QGTYPE
  is '�빺���ͱ��,����';
comment on column PURCHASEREQUEST.QGDATE
  is '�빺����';
comment on column PURCHASEREQUEST.QGBILLSTATE
  is '������0���ѽ᰸,1��δ�᰸,2��ʧЧ��';
comment on column PURCHASEREQUEST.QGPERSONNEL
  is '�빺��Ա���,����';
comment on column PURCHASEREQUEST.QGZDPERSONNEL
  is '�Ƶ���Ա';
comment on column PURCHASEREQUEST.QGDEPARTMENT
  is '�빺���ű��,����';
comment on column PURCHASEREQUEST.QGFHDEPARTMENT
  is '������Ա';
comment on column PURCHASEREQUEST.QGHEAD
  is '��ͷ����';
comment on column PURCHASEREQUEST.QGCOLUMN1
  is '�Զ�����һ';
comment on column PURCHASEREQUEST.QGEND
  is '��β����';
comment on column PURCHASEREQUEST.QGCOLUMN2
  is '�Զ�������';
comment on column PURCHASEREQUEST.QGREMARK
  is '��ע';
comment on column PURCHASEREQUEST.QGEXAMINESTATUS
  is '���״̬(0�������,1��δ���)';
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
  is '�ɹ��빺�����';
comment on column PURCHASEREQUESTS.QGBILLNUMBERS
  is '���ݺ�';
comment on column PURCHASEREQUESTS.QGLINE
  is '�к�';
comment on column PURCHASEREQUESTS.QGMATERIALID
  is '���ϱ��';
comment on column PURCHASEREQUESTS.QGMATERIALNAME
  is '��������';
comment on column PURCHASEREQUESTS.QGMATERIALTYPE
  is '����ͺ�';
comment on column PURCHASEREQUESTS.QGUNIT
  is '��λ';
comment on column PURCHASEREQUESTS.QGNUMBER
  is '����';
comment on column PURCHASEREQUESTS.QGSTANDARDJJ
  is '��׼����';
comment on column PURCHASEREQUESTS.QGSTANDARDJJJE
  is '��׼���۽��';
comment on column PURCHASEREQUESTS.QGCURRENCY
  is '�ұ�';
comment on column PURCHASEREQUESTS.QGPRICE
  is '����';
comment on column PURCHASEREQUESTS.QGJJMONEY
  is '���۽��';
comment on column PURCHASEREQUESTS.QGNEEDDATE
  is '��������';
comment on column PURCHASEREQUESTS.QGSUGGESTDATE
  is '����ɹ�����';
comment on column PURCHASEREQUESTS.QGTYPEREMARK
  is '���౸ע';
comment on column PURCHASEREQUESTS.QGSOURCEBILL
  is '��Դ����';
comment on column PURCHASEREQUESTS.QGSOURCENUMBERS
  is '��Դ����';
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
  is '���ݺ���';
comment on column PUTSTORAGE.STORAGEID
  is '�ֿ�id';
comment on column PUTSTORAGE.SUPPLIERNAME
  is '��Ӧ��id������';
comment on column PUTSTORAGE.TIME
  is '����ʱ��';
comment on column PUTSTORAGE.SUPPLIERADDRESS
  is '��Ӧ�̵�ַ';
comment on column PUTSTORAGE.STATE
  is '����0δ���/1���/2����';
comment on column PUTSTORAGE.TYPE
  is '�ɹ���������';
comment on column PUTSTORAGE.MONEYTYPE
  is '�ұ� 0RMR';
comment on column PUTSTORAGE.TAXSTATE
  is '�Ƿ�˰0��˰/1����˰';
comment on column PUTSTORAGE.RATE
  is '����';
comment on column PUTSTORAGE.DELIVER
  is '�ͻ���ַ';
comment on column PUTSTORAGE.TOUCHING
  is '�Ƶ���Ա';
comment on column PUTSTORAGE.SECTION
  is '��������';
comment on column PUTSTORAGE.CHECKPEOPLE
  is '������Ա';
comment on column PUTSTORAGE.REMARK
  is '��ע';
comment on column PUTSTORAGE.CHECKSTATE
  is '���״̬0���/1δ���';
comment on column PUTSTORAGE.COLUMN1
  is '�����ֶ�1';
comment on column PUTSTORAGE.COLUMN2
  is '�����ֶ�2';
comment on column PUTSTORAGE.COLUMN3
  is '�����ֶ�3';
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
  is '���۱�������';
comment on column SELLQUOTE.BILLID
  is '���ݱ��';
comment on column SELLQUOTE.BILLDATE
  is '��������';
comment on column SELLQUOTE.CLIID
  is '�ͻ����';
comment on column SELLQUOTE.CLINAME
  is '�ͻ�����';
comment on column SELLQUOTE.CLIPLACEID
  is '��ַ���';
comment on column SELLQUOTE.CLIPLACE
  is '��ַ';
comment on column SELLQUOTE.PRICEWHETHERTAX
  is '�����Ƿ�˰';
comment on column SELLQUOTE.EFFECTDATE
  is '��Ч����';
comment on column SELLQUOTE.BBID
  is '�ұ���';
comment on column SELLQUOTE.BBEXCHANGE_RATE
  is '����';
comment on column SELLQUOTE.REMARK
  is '��ע';
comment on column SELLQUOTE.MAKEEMPNAME
  is '�Ƶ���Ա';
comment on column SELLQUOTE.AUDITINGEMPNAME
  is '������Ա';
comment on column SELLQUOTE.EMPNAME
  is 'ҵ����Ա';
comment on column SELLQUOTE.DEPID
  is '���ű��';
comment on column SELLQUOTE.DEPNAME
  is '��������';
comment on column SELLQUOTE.CHECKSTATUS
  is '���״̬';
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
  is '���۱�������';
comment on column QUOTEDETAIOLS.BILLID
  is '���ݱ��';
comment on column QUOTEDETAIOLS.LINEMARK
  is '�к�';
comment on column QUOTEDETAIOLS.MATID
  is '���ϱ��';
comment on column QUOTEDETAIOLS.MATNAME
  is '��������';
comment on column QUOTEDETAIOLS.MATSPEC
  is '����ͺ�';
comment on column QUOTEDETAIOLS.MATUNIT
  is '��λ����';
comment on column QUOTEDETAIOLS.NUMS
  is '����';
comment on column QUOTEDETAIOLS.AGIOAGOPRICE
  is '�ۿ�ǰ��';
comment on column QUOTEDETAIOLS.AGIO
  is '����';
comment on column QUOTEDETAIOLS.PRICE
  is '����';
comment on column QUOTEDETAIOLS.CESS
  is '˰��';
comment on column QUOTEDETAIOLS.TAXMONEY
  is '˰��';
comment on column QUOTEDETAIOLS.INTAXMONEY
  is '��˰���';
comment on column QUOTEDETAIOLS.MONEY
  is '���';
comment on column QUOTEDETAIOLS.IFPRESENT
  is '�Ƿ���Ʒ';
comment on column QUOTEDETAIOLS.FMARK
  is '��¼��ע';
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
  is '���۶�������';
comment on column SALEORDER.ID
  is '���۶������';
comment on column SALEORDER.CUSID
  is '�ͻ����';
comment on column SALEORDER.TOADDRESS
  is '����ַ-��ַ';
comment on column SALEORDER.SALETYPE
  is '��������';
comment on column SALEORDER.ISTAX
  is '�Ƿ�˰';
comment on column SALEORDER.ORDERSTATUS
  is '����״̬';
comment on column SALEORDER.ORDERTIME
  is '����ʱ��';
comment on column SALEORDER.COINTYPE
  is '�ұ�';
comment on column SALEORDER.PAITIES
  is '����';
comment on column SALEORDER.WANDNAME
  is 'ҵ����Ա���-����';
comment on column SALEORDER.DANDNAME
  is '���ű��-����';
comment on column SALEORDER.CANDNAME
  is '����˱��-����';
comment on column SALEORDER.MANDNAME
  is '�Ƶ��˱��-����';
comment on column SALEORDER.CHECKSTATUS
  is '���״̬';
comment on column SALEORDER.REMARK
  is '��ע';
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
  is '���۶��������';
comment on column SALEORDERDETAIL.SOID
  is '���۶������';
comment on column SALEORDERDETAIL.LINENO
  is '�к�';
comment on column SALEORDERDETAIL.MID
  is '���ϱ��';
comment on column SALEORDERDETAIL.MNAME
  is '��������';
comment on column SALEORDERDETAIL.STANDARD
  is '���Ϲ��';
comment on column SALEORDERDETAIL.UNITID
  is '��λ���';
comment on column SALEORDERDETAIL.UNITNAME
  is '��λ����';
comment on column SALEORDERDETAIL.NUM
  is '����';
comment on column SALEORDERDETAIL.BEFOREDISCOUNT
  is '��ǰ����';
comment on column SALEORDERDETAIL.DISCOUNT
  is '����';
comment on column SALEORDERDETAIL.PRICE
  is '����';
comment on column SALEORDERDETAIL.TOTALPRICE
  is '���';
comment on column SALEORDERDETAIL.TAXRATE
  is '˰��';
comment on column SALEORDERDETAIL.TOTALTAX
  is '˰��';
comment on column SALEORDERDETAIL.TOTALMONEY
  is '��˰���';
comment on column SALEORDERDETAIL.BEFOREOUT
  is '�ڳ�����';
comment on column SALEORDERDETAIL.ESTIMATEDATE
  is 'Ԥ������';
comment on column SALEORDERDETAIL.LEFTNUM
  is 'δ������';
comment on column SALEORDERDETAIL.ISGIFT
  is '�Ƿ���Ʒ';
comment on column SALEORDERDETAIL.FROMBILLTYPE
  is '��Դ����';
comment on column SALEORDERDETAIL.FROMBILLID
  is '��Դ����';
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
  is '���۳����';
comment on column SALESCARGO.SALEID
  is '���ݱ��';
comment on column SALESCARGO.SALEDATE
  is '��������';
comment on column SALESCARGO.CID
  is '�ͻ����';
comment on column SALESCARGO.DEPOTID
  is '�ֿ���';
comment on column SALESCARGO.ADDRESSID
  is '�ͻ���ַ';
comment on column SALESCARGO.GOLDID
  is '�ұ���';
comment on column SALESCARGO.TAX
  is '�Ƿ�˰';
comment on column SALESCARGO.YWID
  is 'ҵ����Ա���';
comment on column SALESCARGO.ZDID
  is '�Ƶ���Ա���';
comment on column SALESCARGO.SSID
  is '�������ű��';
comment on column SALESCARGO.FHID
  is '������Ա���';
comment on column SALESCARGO.STATUS
  is '״̬';
comment on column SALESCARGO.PREPARE1
  is 'Ԥ����1';
comment on column SALESCARGO.PREPARE2
  is 'Ԥ����2';
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
  is '���۳�����ϸ';
comment on column SALESCARGODETAIL.DETAILID
  is '����';
comment on column SALESCARGODETAIL.SALEID
  is '������';
comment on column SALESCARGODETAIL.MATTERID
  is '���ϱ��';
comment on column SALESCARGODETAIL.REBATEPRICE
  is '�ۿ�ǰ����';
comment on column SALESCARGODETAIL.BOKENNUMBER
  is '����';
comment on column SALESCARGODETAIL.UNITPRICE
  is '����';
comment on column SALESCARGODETAIL.MONEY
  is '���';
comment on column SALESCARGODETAIL.TAXRATE
  is '˰��';
comment on column SALESCARGODETAIL.TAXAMOUNT
  is '˰��';
comment on column SALESCARGODETAIL.TAXMONEY
  is '��˰���';
comment on column SALESCARGODETAIL.GIFT
  is '��Ʒ';
comment on column SALESCARGODETAIL.REMARKS
  is '��¼��ע';
comment on column SALESCARGODETAIL.SOURCEBILL
  is '��Դ����';
comment on column SALESCARGODETAIL.SOURCEID
  is '��Դ����';
comment on column SALESCARGODETAIL.STATUS
  is '״̬';
comment on column SALESCARGODETAIL.PREPARE1
  is 'Ԥ����1';
comment on column SALESCARGODETAIL.PREPARE2
  is 'Ԥ����2';
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
  is '�˻������';
comment on column SALES_RETURN.CLIENTID
  is '�ͻ����';
comment on column SALES_RETURN.REJECTEDDATE
  is '��������';
comment on column SALES_RETURN.ADDRESS
  is '�ͻ���ַ';
comment on column SALES_RETURN.TAX
  is '�Ƿ�˰(1��˰��2����˰)';
comment on column SALES_RETURN.REPOSITORY
  is '�Ƿ��������(1�ǣ�2��)';
comment on column SALES_RETURN.CURRENCY
  is '�ұ�';
comment on column SALES_RETURN.WAREHOUSEID
  is '�ֿ�id';
comment on column SALES_RETURN.STAFFID
  is 'ҵ����Աid���ɸ�����,�۶�����ȡ��';
comment on column SALES_RETURN.DEPARTMENTID
  is '�Ƶ���Աid';
comment on column SALES_RETURN.COMPOSITEID
  is '������Աid';
comment on column SALES_RETURN.STATE
  is '״̬���Ƿ���ˣ�';
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
  is '�˻�����';
comment on column SALES_RETURN_DETAILED.LINE
  is '�к�';
comment on column SALES_RETURN_DETAILED.PRODID
  is '���ϱ��';
comment on column SALES_RETURN_DETAILED.PRODNAME
  is '��������';
comment on column SALES_RETURN_DETAILED.PRODSIZE
  is '����ͺ�';
comment on column SALES_RETURN_DETAILED.SUNIT
  is '��λ����';
comment on column SALES_RETURN_DETAILED.SQUANTITY
  is '����';
comment on column SALES_RETURN_DETAILED.OIDPRICE
  is '�ۿ�ǰ����';
comment on column SALES_RETURN_DETAILED.DISCOUNT
  is '����';
comment on column SALES_RETURN_DETAILED.PRICE
  is '����';
comment on column SALES_RETURN_DETAILED.AMOUNT
  is '  ���';
comment on column SALES_RETURN_DETAILED.TAXRATE
  is '˰��';
comment on column SALES_RETURN_DETAILED.TAXAMT
  is '˰��';
comment on column SALES_RETURN_DETAILED.AMOUNTWITHTAX
  is '��˰���';
comment on column SALES_RETURN_DETAILED.ITEMREMARK
  is '��¼��ע';
comment on column SALES_RETURN_DETAILED.TRANTYPE
  is '��Դ����';
comment on column SALES_RETURN_DETAILED.FROMNO
  is '��Դ����';
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
  is '�ɹ���ⵥ��';
comment on column SHAREDETAIL.PID
  is '�к�';
comment on column SHAREDETAIL.CLOUD
  is '����id';
comment on column SHAREDETAIL.MATERIAL
  is '���ϱ��';
comment on column SHAREDETAIL.SNAME
  is '��������';
comment on column SHAREDETAIL.MODEL
  is '����ͺ�';
comment on column SHAREDETAIL.SMONEY
  is '���';
comment on column SHAREDETAIL.NUMBERS
  is '�ɹ����';
comment on column SHAREDETAIL.SPRICE
  is '����';
comment on column SHAREDETAIL.SWEIGHT
  is '����';
comment on column SHAREDETAIL.SVOLUME
  is '�Ļ�';
comment on column SHAREDETAIL.SHARES
  is '��̯���';
comment on column SHAREDETAIL.CHECKSTATUS
  is '����״̬';
comment on column SHAREDETAIL.DEMO1
  is 'Ԥ���ֶ�1';
comment on column SHAREDETAIL.DEMO2
  is 'Ԥ���ֶ�2';
comment on column SHAREDETAIL.DEMO3
  is 'Ԥ���ֶ�3';
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
  is 'Ӧ�ճ���';
comment on column SHOULDGETMONEYBILL.ID
  is '���ݱ��';
comment on column SHOULDGETMONEYBILL.DATEANDTIME
  is '����ʱ��';
comment on column SHOULDGETMONEYBILL.CUSID
  is '�ͻ����';
comment on column SHOULDGETMONEYBILL.COINTYPE
  is '�ұ�';
comment on column SHOULDGETMONEYBILL.OVERTIME
  is '��ֹ����';
comment on column SHOULDGETMONEYBILL.DISCOUNT
  is '�ۿ���';
comment on column SHOULDGETMONEYBILL.PAITIES
  is '����';
comment on column SHOULDGETMONEYBILL.TRANSFER
  is 'ת�˷�ʽ';
comment on column SHOULDGETMONEYBILL.DRAFT
  is '��Ʊ��ʽ';
comment on column SHOULDGETMONEYBILL.OTHERWAY
  is '������ʽ';
comment on column SHOULDGETMONEYBILL.DANDNAME
  is '���ű��-����';
comment on column SHOULDGETMONEYBILL.CANDNAME
  is '����˱��-����';
comment on column SHOULDGETMONEYBILL.MANDNAME
  is '�Ƶ��˱��-����';
comment on column SHOULDGETMONEYBILL.REMARK
  is '��ע';
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
  is 'Ӧ�ճ�Ԥ����ϸ��';
comment on column SHOULDESTIMATEBILLDETAIL.EMID
  is '���ݱ��';
comment on column SHOULDESTIMATEBILLDETAIL.LINENO
  is '�к�';
comment on column SHOULDESTIMATEBILLDETAIL.BILLTYPEID
  is '��Դ����';
comment on column SHOULDESTIMATEBILLDETAIL.BILLNO
  is '��Դ����';
comment on column SHOULDESTIMATEBILLDETAIL.ESTIMATENO
  is 'Ԥ�տ��';
comment on column SHOULDESTIMATEBILLDETAIL.LEFTMONEY
  is 'Ԥ�����';
comment on column SHOULDESTIMATEBILLDETAIL.USEMONEY
  is 'ʹ�ý��';
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
  is 'Ӧ�ճ�������ϸ��';
comment on column SHOULDGETMONEYBILLDETAIL.CONTNETID
  is '���ݱ��';
comment on column SHOULDGETMONEYBILLDETAIL.LINENO
  is '�к�';
comment on column SHOULDGETMONEYBILLDETAIL.BILLTYPEID
  is '��Դ����';
comment on column SHOULDGETMONEYBILLDETAIL.BILLNO
  is '��Դ����';
comment on column SHOULDGETMONEYBILLDETAIL.BILLDATE
  is 'ԭ������';
comment on column SHOULDGETMONEYBILLDETAIL.CANDNAME
  is '�ͻ����-�ͻ�����';
comment on column SHOULDGETMONEYBILLDETAIL.DANDNAME
  is '���ű��-��������';
comment on column SHOULDGETMONEYBILLDETAIL.HANDNAME
  is 'ҵ��Ա���-ҵ��Ա����';
comment on column SHOULDGETMONEYBILLDETAIL.CTYPEANDNAME
  is '�ұ���-�ұ�-����';
comment on column SHOULDGETMONEYBILLDETAIL.SOURCEMONEY
  is 'ԭ�����';
comment on column SHOULDGETMONEYBILLDETAIL.DISCOUNTMONEY
  is '���ý��';
comment on column SHOULDGETMONEYBILLDETAIL.USEMONEY
  is '�����';
comment on column SHOULDGETMONEYBILLDETAIL.USESMONEY
  is '��ֽ��';
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
  is '���۵�����';
comment on column TIAOJIADANZHUBIAO.BILLNO
  is '���ݺ���';
comment on column TIAOJIADANZHUBIAO.ADJUSTDATE
  is '��������';
comment on column TIAOJIADANZHUBIAO.MAKER
  is '�Ƶ���Ա';
comment on column TIAOJIADANZHUBIAO.PERMITTER
  is '������Ա';
comment on column TIAOJIADANZHUBIAO.AUDITSTATUS
  is '���״̬';
comment on column TIAOJIADANZHUBIAO.WHMEMO
  is '��ע';
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
  is '���۵����';
comment on column TIAOJIADANXIANGBIAO.SERNO
  is '����';
comment on column TIAOJIADANXIANGBIAO.BILLNO
  is '�����������';
comment on column TIAOJIADANXIANGBIAO.PRODID
  is '��Ʒ���';
comment on column TIAOJIADANXIANGBIAO.PRODNAME
  is '��Ʒ����';
comment on column TIAOJIADANXIANGBIAO.PRODSIZE
  is '����ͺ�';
comment on column TIAOJIADANXIANGBIAO.UNIT
  is '��λ';
comment on column TIAOJIADANXIANGBIAO.CURQTY
  is '�����';
comment on column TIAOJIADANXIANGBIAO.LCOSTAVG
  is 'ƽ���ɱ�';
comment on column TIAOJIADANXIANGBIAO.PRICE
  is '����';
comment on column TIAOJIADANXIANGBIAO.AMOUNT
  is '���۽��';
comment on column TIAOJIADANXIANGBIAO.ITEMREMARK
  is '��¼��ע';
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
  is '���۵����ͱ�';
comment on column TIAOZHENGFANGSHILEIXINGBIAO.LID
  is '����id';
comment on column TIAOZHENGFANGSHILEIXINGBIAO.BADIUSTSTYLE
  is '������ʽ';
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
  is '���ݺ���';
comment on column T_CGTHDETAIL.LINEID
  is '�к�';
comment on column T_CGTHDETAIL.MATTERID
  is '���ϱ��';
comment on column T_CGTHDETAIL.QUANTUM
  is '����';
comment on column T_CGTHDETAIL.UNITPRICE
  is '����';
comment on column T_CGTHDETAIL.SUMMONEY
  is '������*������';
comment on column T_CGTHDETAIL.TAXRATE
  is '˰��';
comment on column T_CGTHDETAIL.TAXMONEY
  is '˰��';
comment on column T_CGTHDETAIL.SUMTAX
  is '��˰���';
comment on column T_CGTHDETAIL.REMARK
  is '��¼��ע';
comment on column T_CGTHDETAIL.SUPPLIERID
  is '��Ӧ�̱��';
comment on column T_CGTHDETAIL.PAYMENTDATE
  is '��������';
comment on column T_CGTHDETAIL.PAYMENTTERM
  is '��������';
comment on column T_CGTHDETAIL.TRANTYPE
  is '��Դ����';
comment on column T_CGTHDETAIL.FROMNO
  is '��Դ����';
comment on column T_CGTHDETAIL.COLUMNONE
  is '�����ֶ�1';
comment on column T_CGTHDETAIL.COLUMNTWO
  is '�����ֶ�2';
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
  is '���ݺ���';
comment on column T_CGTHMASTER.T_CGTHDATE
  is '��������';
comment on column T_CGTHMASTER.T_GYSID
  is '��Ӧ�̱��(fk)';
comment on column T_CGTHMASTER.WAREHOUSEID
  is '�ֿ���';
comment on column T_CGTHMASTER.SALESMAN
  is '�ɹ���Ա��ţ��ɹ���Ա';
comment on column T_CGTHMASTER.DEPARTMENTID
  is '���ű�ţ���������';
comment on column T_CGTHMASTER.CURRENCYID
  is '�ұ��ţ��ұ�����';
comment on column T_CGTHMASTER.TOUCHPERSON
  is '�Ƶ���ţ��Ƶ���Ա';
comment on column T_CGTHMASTER.CHECKPERSON
  is '������Ա��ţ�������Ա';
comment on column T_CGTHMASTER.BOOLPUT
  is '�Ƿ��������';
comment on column T_CGTHMASTER.BOOLTAX
  is '�����Ƿ�˰';
comment on column T_CGTHMASTER.COLUMNONE
  is '�����ֶ�1';
comment on column T_CGTHMASTER.COLUMNTWO
  is '�����ֶ�2';
comment on column T_CGTHMASTER.PERMITTER
  is '���״̬';
comment on column T_CGTHMASTER.EXCHRATE
  is '����';
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
  is '������λ��';
comment on column UNIT_OF_MEASURE.UNITID
  is '��λ���';
comment on column UNIT_OF_MEASURE.UNITCN_NAME
  is '��λ����';
comment on column UNIT_OF_MEASURE.REMARK
  is '��ע';
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
values (1, '���۶�����', 'saleorder', 'saleorderdetail');
insert into BILLTYPE (ID, SOTYPE, ENNAME, DETAILTABLE)
values (2, '�ɹ��빺��', 'purchaserequests', null);
insert into BILLTYPE (ID, SOTYPE, ENNAME, DETAILTABLE)
values (3, '�ɹ�������', 'buyer', null);
insert into BILLTYPE (ID, SOTYPE, ENNAME, DETAILTABLE)
values (4, '�ɹ�ѯ�۵�', 'enquiry', null);
insert into BILLTYPE (ID, SOTYPE, ENNAME, DETAILTABLE)
values (5, 'Ԥ�������', 'advance_host', null);
insert into BILLTYPE (ID, SOTYPE, ENNAME, DETAILTABLE)
values (6, 'Ӧ��������', 'balance_host', null);
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
values ('01', '��Ҫ��Ӧ��');
insert into T_SUPPLIERTYPE (SUPTYPEID, SUPTYPENAME)
values ('02', 'һ�㹩Ӧ��');
insert into T_SUPPLIERTYPE (SUPTYPEID, SUPTYPENAME)
values ('03', 'ί�⳧');
insert into T_SUPPLIERTYPE (SUPTYPEID, SUPTYPENAME)
values ('04', '������Ӧ��');
commit;
prompt 4 records loaded
prompt Loading COINTYPE...
insert into COINTYPE (ID, CNAME, PAITIES)
values ('1', '�����', 1);
commit;
prompt 1 records loaded
prompt Loading DEPARTMENT...
insert into DEPARTMENT (DEPARTMENTID, DEPARTMENTCN_NAME, STANDBY_1, STANDBY_2)
values ('201806121', '����', null, null);
insert into DEPARTMENT (DEPARTMENTID, DEPARTMENTCN_NAME, STANDBY_1, STANDBY_2)
values ('201806122', 'ֱ����', null, null);
commit;
prompt 2 records loaded
prompt Loading NATION...
insert into NATION (NATIONID, NATIONCN_NAME)
values ('201806121', '��');
insert into NATION (NATIONID, NATIONCN_NAME)
values ('201806122', '��');
commit;
prompt 2 records loaded
prompt Loading NATIONALITY...
insert into NATIONALITY (NATIONALITYID, NATIONALITYCN_NAME)
values ('201806121', '������');
insert into NATIONALITY (NATIONALITYID, NATIONALITYCN_NAME)
values ('201806122', '������');
commit;
prompt 2 records loaded
prompt Loading RECORD_OF_FORMAL_SCHOOLING...
insert into RECORD_OF_FORMAL_SCHOOLING (ROFSID, ROFSCN_NAME)
values ('201806121', '��ר');
insert into RECORD_OF_FORMAL_SCHOOLING (ROFSID, ROFSCN_NAME)
values ('201806122', '����');
commit;
prompt 2 records loaded
prompt Loading STAFF_MASTER_FILE...
insert into STAFF_MASTER_FILE (STAFFID, PWD, DEPARTMENTID, STAFFNAME, SEX, STAFFEN_NAME, IDCARD, BIRTHDAY, POLITICS_STATUS, MARRIAGE_STATUS, INDUCTION_DATE, BLOOD_GROUP, REGULAR_WORKER_DATE, NATIVE_PLACE, QUALIFYING_PERIOD, NATIONALITY, LEAVE_OFFICE_DATE, NATION, TECHNICAL_TITLE, CN_DUTIES, EN_DUTIES, LINKPOSTCODE, LINKADDRESS, LINKPHONE, PHONE, HIGHEST_EDUCATION, EXPIRATION_DATE, BACHELOR_DEGREE, ARRIVAL_DATE, GRADUATE, PASSPORT_NUMBER, COLLEGE_MAJOR, PACT_START_DATE, EXPERIENCES_DATE, EMAIL, CONTRACT_PERIOD, NOW_PHONE, DOMICILE_PHONE, NOW_ADDRESS, HOME_PHONE, HOME_ADDRESS, REMARK, STANDBY_1, STANDBY_2)
values ('201806121', '123', '201806121', '����', '��', null, '4302015612616541', to_date('25-01-1990', 'dd-mm-yyyy'), '��Ա', 0, to_date('15-02-2015', 'dd-mm-yyyy'), 'O', to_date('23-09-2015', 'dd-mm-yyyy'), null, '2��', '201806121', to_date('06-06-2018', 'dd-mm-yyyy'), '201806121', null, null, null, null, '���޺�����', '123456789', '123456789', '201806121', to_date('12-08-2017', 'dd-mm-yyyy'), '�о���', null, '���Ϲ�ҵ��ѧ', '164984', 'IT', to_date('12-12-2016', 'dd-mm-yyyy'), null, '46549846@163.com', null, '123456789', '123456789', '��������', '4564654', '������ɼ�', null, null, null);
insert into STAFF_MASTER_FILE (STAFFID, PWD, DEPARTMENTID, STAFFNAME, SEX, STAFFEN_NAME, IDCARD, BIRTHDAY, POLITICS_STATUS, MARRIAGE_STATUS, INDUCTION_DATE, BLOOD_GROUP, REGULAR_WORKER_DATE, NATIVE_PLACE, QUALIFYING_PERIOD, NATIONALITY, LEAVE_OFFICE_DATE, NATION, TECHNICAL_TITLE, CN_DUTIES, EN_DUTIES, LINKPOSTCODE, LINKADDRESS, LINKPHONE, PHONE, HIGHEST_EDUCATION, EXPIRATION_DATE, BACHELOR_DEGREE, ARRIVAL_DATE, GRADUATE, PASSPORT_NUMBER, COLLEGE_MAJOR, PACT_START_DATE, EXPERIENCES_DATE, EMAIL, CONTRACT_PERIOD, NOW_PHONE, DOMICILE_PHONE, NOW_ADDRESS, HOME_PHONE, HOME_ADDRESS, REMARK, STANDBY_1, STANDBY_2)
values ('201806122', '123', '201806122', '����', 'Ů', null, '4302015612616541', to_date('25-01-1990', 'dd-mm-yyyy'), '��Ա', 0, to_date('15-02-2015', 'dd-mm-yyyy'), 'AB', to_date('23-09-2015', 'dd-mm-yyyy'), null, '2��', '201806122', to_date('06-06-2018', 'dd-mm-yyyy'), '201806122', null, null, null, null, '��ɳ��´��', '123456789', '123456789', '201806122', to_date('12-08-2017', 'dd-mm-yyyy'), '˶ʿ', null, '������ѧ', '164984', 'IT', to_date('12-12-2016', 'dd-mm-yyyy'), null, '46549846@163.com', null, '123456789', '123456789', '���ϳ�ɳ', '2412441', '��������', null, null, null);
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
values ('201806121', '�Ϻ��ֿ�', '�Ϻ���', '����', '123456789', '���޺�����', '�ֶ����ֶ�·', null);
insert into REPERTORYASSERT (REPERTORYID, REPERTORYNAME, REPERTORYCN_SHORT, LINKMAN, PHONE, LINKADDRESS, REPERTORYADDRESS, REMARK)
values ('201806122', '�����ֿ�', '������', '����', '987654321', '����ʯ����', '�йش��й�·', null);
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
values (1, '������');
insert into TIAOZHENGFANGSHILEIXINGBIAO (LID, BADIUSTSTYLE)
values (2, '�����');
commit;
prompt 2 records loaded
prompt Loading T_CGTHDETAIL...
prompt Table is empty
prompt Loading T_CGTHMASTER...
prompt Table is empty
prompt Loading UNIT_OF_MEASURE...
insert into UNIT_OF_MEASURE (UNITID, UNITCN_NAME, REMARK)
values ('201806121', '��', null);
insert into UNIT_OF_MEASURE (UNITID, UNITCN_NAME, REMARK)
values ('201806122', '��', null);
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
