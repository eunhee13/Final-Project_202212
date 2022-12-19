DROP TABLE "MA_EMP" CASCADE CONSTRAINTS;
DROP TABLE "MA_CODE_EMP" CASCADE CONSTRAINTS;
DROP TABLE "MA_DEPT" CASCADE CONSTRAINTS;
DROP TABLE "MA_JIKUP" CASCADE CONSTRAINTS;
DROP TABLE "MA_EMP_PRIVATE" CASCADE CONSTRAINTS;
DROP TABLE "MA_USER" CASCADE CONSTRAINTS;
DROP TABLE "HR_CALCPAY" CASCADE CONSTRAINTS;
DROP TABLE "MA_BOARD" CASCADE CONSTRAINTS;
DROP TABLE "MA_RE_BOARD" CASCADE CONSTRAINTS;
DROP TABLE "HR_PAYREPORT" CASCADE CONSTRAINTS;
DROP TABLE "HR_PAYLIST" CASCADE CONSTRAINTS;
DROP TABLE "HR_PCALCPAY" CASCADE CONSTRAINTS;
DROP TABLE "HR_DCALCPAY" CASCADE CONSTRAINTS;


  -- ������� ���̺� ���� : MA_EMP
CREATE TABLE MA_EMP
    ( NO_EMP        varchar2(20)
    , NM_EMP        VARCHAR2(20)   NOT NULL
    , ENTER_DATE    DATE           NOT NULL
    , BIRTH_DATE    DATE           NOT NULL
    , RETIRE_DATE   DATE
    , CD_EMP        VARCHAR2(20)   DEFAULT '001' NOT NULL
    , CD_DEPT       VARCHAR2(20)   NOT NULL
    , CD_JIK        VARCHAR2(20)   NOT NULL
    , PRIMARY KEY(NO_EMP) );



-- ���������ڵ� ���̺� ���� : MA_CODE_EMP
CREATE TABLE MA_CODE_EMP
    (    CD_EMP     VARCHAR2(20)    DEFAULT '001'
    , NM_CD_EMP     VARCHAR2(20)    NOT NULL
    , PRIMARY KEY (CD_EMP) );



-- �μ��ڵ� ���̺� ���� : MA_DEPT
CREATE TABLE MA_DEPT
    (CD_DEPT    VARCHAR2(20)
    , NM_DEPT   VARCHAR2(30)    NOT NULL
    , PRIMARY KEY (CD_DEPT) );



-- �����ڵ� ���̺� ���� : MA_JIKUP
CREATE TABLE MA_JIKUP
    (CD_JIK     VARCHAR2(20)
    , NM_JIK    VARCHAR2(30)    NOT NULL
    , PRIMARY KEY(CD_JIK)   );


-- �������� ���̺� ���� : MA_EMP_PRIVATE
CREATE TABLE MA_EMP_PRIVATE
    ( NO_EMP  varchar2(20)             NOT NULL
    , EMAIL     VARCHAR2(50)
    , NM_ADDR   VARCHAR2(200)
    , PHONE     VARCHAR2(50)     NOT NULL
    , NO_RES    VARCHAR2(20)     NOT NULL
    , FOREIGN KEY(NO_EMP)   REFERENCES MA_EMP (NO_EMP)  );


-- ��������� ���̺� ���� : MA_USER
CREATE TABLE MA_USER
    (NO_EMP varchar2(20)               NOT NULL
    , USER_ID   VARCHAR2(50)    NOT NULL
    , USER_PWD  VARCHAR2(50)    NOT NULL

    , FOREIGN KEY(NO_EMP) REFERENCES MA_EMP (NO_EMP)    );


-- �޿����� ���̺� ���� : HR_CALCPAY
CREATE TABLE HR_CALCPAY
    (NO_EMP varchar2(20)                NOT NULL
    , YM    VARCHAR2(20)          NOT NULL
    , CD_PAY VARCHAR2(20)         NOT NULL
    , AM_TOTPAY NUMBER
    , CD_DEDUCT     VARCHAR2(20)  NOT NULL
    , AM_TOTDEDUCT  NUMBER
    , FOREIGN KEY(NO_EMP) REFERENCES MA_EMP (NO_EMP)    );

-- �������� ���̺�  ���� : MA_BOARD
CREATE TABLE MA_BOARD
    (B_NO   NUMBER
    , NO_EMP    varchar2(20)          NOT NULL
    , SUBJECT   VARCHAR2(50)    NOT NULL
    , CONTENT VARCHAR2(3000)
    , REG_DATE  DATE    DEFAULT SYSDATE NOT NULL
    , READCOUNT NUMBER          NOT NULL
    , PRINT_NO NUMBER           NOT NULL
    , PRIMARY KEY (B_NO)
    , FOREIGN KEY(NO_EMP) REFERENCES MA_EMP (NO_EMP) );


-- �������� ��� ���� ���̺� ���� : MA_RE_BOARD
CREATE TABLE MA_RE_BOARD
    (B_NO   NUMBER                 NOT NULL
    , NO_EMP    varchar2(20)              NOT NULL
    , CONTENT   VARCHAR2(3000)     NOT NULL
    , REG_DATE  DATE    DEFAULT SYSDATE  NOT NULL
    , PRINT_LEVEL   NUMBER NOT NULL
    , FOREIGN KEY(B_NO) REFERENCES MA_BOARD(B_NO)
    , FOREIGN KEY(NO_EMP)  REFERENCES MA_EMP(NO_EMP)    );


-- ������� ���̺� ���� : HR_PAYREPORT
CREATE TABLE HR_PAYREPORT
    (CD_PAYREPORT   VARCHAR2(50)    NOT NULL
    , NM_PAYREPORT  VARCHAR2(50)    NOT NULL    );


-- �޿��⺻���� ���̺� ���� : HR_PAYLIST
CREATE TABLE HR_PAYLIST
    (NO_EMP varchar2(20)                   NOT NULL
    , PAY_PER_HOUR      NUMBER
    , PAY_PER_DAY      NUMBER
    , PAY_PER_MONTH      NUMBER
    , PAY_PER_YEAR      NUMBER
    , FOREIGN KEY (NO_EMP) REFERENCES MA_EMP (NO_EMP)   );



-- �����׸� ���̺� ���� : HR_PCALCPAY
CREATE TABLE HR_PCALCPAY
    ( NO_EMP varchar2(20)  NOT NULL
    , YM VARCHAR2(20)       NOT NULL
    , CD_PAY01 VARCHAR2(20)
    , CD_PAY02 VARCHAR2(20)
    , CD_PAY03 VARCHAR2(20)
    , CD_PAY04 VARCHAR2(20)
     , NM_PAY01 VARCHAR2(50)
     , NM_PAY02 VARCHAR2(50)
     , NM_PAY03 VARCHAR2(50)
     , NM_PAY04 VARCHAR2(50)
    , AM_PAY01  NUMBER
    , AM_PAY02  NUMBER
    , AM_PAY03  NUMBER
    , AM_PAY04  NUMBER );

-- �����׸� ���̺� ���� : HR_DCALCPAY
CREATE TABLE HR_DCALCPAY
    ( NO_EMP varchar2(20)  NOT NULL
    , YM VARCHAR2(20)       NOT NULL
    , CD_DEDUCT01 VARCHAR2(20)
    , CD_DEDUCT02 VARCHAR2(20)
    , CD_DEDUCT03 VARCHAR2(20)
    , CD_DEDUCT04 VARCHAR2(20)
     , NM_DEDUCT01 VARCHAR2(50)
     , NM_DEDUCT02 VARCHAR2(50)
     , NM_DEDUCT03 VARCHAR2(50)
     , NM_DEDUCT04 VARCHAR2(50)
    , AM_DEDUCT01  NUMBER
    , AM_DEDUCT02  NUMBER
    , AM_DEDUCT03  NUMBER
    , AM_DEDUCT04  NUMBER );



-- MA_EMP ���̺� FK ���� : CD_EMP(FK)
ALTER TABLE MA_EMP
ADD CONSTRAINT FK_MA_EMP_01 FOREIGN KEY (CD_EMP)
REFERENCES MA_CODE_EMP (CD_EMP) ;



-- MA_EMP ���̺� FK ���� : CD_DEPT(FK)
ALTER TABLE MA_EMP
ADD CONSTRAINT FK_MA_EMP_02 FOREIGN KEY (CD_DEPT)
REFERENCES MA_DEPT (CD_DEPT) ;

-- MA_EMP ���̺� FK ���� : CD_JIK(FK)
ALTER TABLE MA_EMP
ADD CONSTRAINT FK_MA_EMP_03 FOREIGN KEY (CD_JIK)
REFERENCES MA_JIKUP (CD_JIK) ;





-- HR_CALCPAY ���̺��� YM �÷� PK�� ����
ALTER TABLE HR_CALCPAY ADD PRIMARY KEY (YM);


-- HR_PCALCPAY, HR_DCLACPAY ���̺��� YM�� FK�� ����, HR_CALCPAY ����
ALTER TABLE HR_PCALCPAY
ADD CONSTRAINT FK_HR_PCALCPAY_01 FOREIGN KEY (YM)
REFERENCES HR_CALCPAY (YM);

ALTER TABLE HR_DCALCPAY
ADD CONSTRAINT FK_HR_DCALCPAY_01 FOREIGN KEY (YM)
REFERENCES HR_CALCPAY (YM);

ALTER TABLE HR_PCALCPAY
ADD CONSTRAINT FK_HR_PCALCPAY_02 FOREIGN KEY (NO_EMP)
REFERENCES
 MA_EMP(NO_EMP) ;

ALTER TABLE HR_DCALCPAY
ADD CONSTRAINT FK_HR_DCALCPAY_02 FOREIGN KEY (NO_EMP)
REFERENCES MA_EMP (NO_EMP) ;

--------------------------------------------
-- �׽�Ʈ ������ �μ�Ʈ
---------------------------------------------
    insert into ma_dept values ('001', '�λ��');
insert into ma_jikup values ('001', '����');
insert into ma_code_emp values ('001', '�׽�Ʈ');

insert into ma_emp values ('system', 'system',sysdate,sysdate,null, '001','001','001');

 insert into ma_emp values ('erp001', '��ö��',sysdate,sysdate,null, '001','001','001');

   insert into ma_emp_private values (  'erp001','erperp_test@gmail.com','����� ���۱� īī������Ʈ 102-102','010-1234-1234','9010101231234');

insert into ma_user values (  'system', 'system','123');

  insert into ma_user values (  'erp001', 'abc','123');

  commit;

--------------------------------------------
-- �����ü���� �����̺� ����
---------------------------------------------

select e.*, u.*
from ma_emp e join ma_user u
on e.no_emp = u.no_emp;

create view test_01 as
select e.no_emp, e.nm_emp, e.enter_date, e.birth_date, e.retire_date, e.cd_emp, e.cd_dept, e.cd_jik
, u.user_id, u.user_pwd
from ma_emp e join ma_user u
on e.no_emp = u.no_emp;

create view ma_emp_tmp as
select t1.no_emp, t1.nm_emp, t1.enter_date, t1.birth_date, t1.retire_date, t1.cd_emp, t1.cd_dept, t1.cd_jik
, t1.user_id, t1.user_pwd, ep.email, ep.nm_addr, ep.phone, ep.no_res
from test_01 t1 join ma_emp_private ep
on t1.no_emp = ep.no_emp ;
