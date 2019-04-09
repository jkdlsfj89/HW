#完成任务用户登录
#创建用户表huawei_denglu
CERATE TABLE huawei_denglu(
    id INT PRIMARY KEY AUTO_INCREMENT,
    uname VARCHAR(25),
    upwd VARCHAR(32)
);
INSERT INTO huawei_denglu
VALUES(null,"tom",md5("123"))


