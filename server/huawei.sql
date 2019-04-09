SET NAMES UTF8;
DROP DATABASE IF EXISTS huawei;
CREATE DATABASE huawei CHARSET=UTF8;
USE huawei;

/**用户信息**/
CREATE TABLE huawei_user(
  Uid INT PRIMARY KEY AUTO_INCREMENT,
  Uname VARCHAR(12),
  Upwd VARCHAR(12),
  Uemail VARCHAR(18),
  Uphone VARCHAR(18),
  Uuser_name VARCHAR(8),
  Ugender BOOL #0-女 1-男
);

/*插入数据*/
INSERT INTO huawei_user VALUES
(NULL,'tom1','123','123@qq.com','1500000000001','杰克',1),
(NULL,'tom2','123','123@qq.com','1500000000002','杰克',0)
(NULL,'tom3','123','123@qq.com','1500000000003','杰克',0)
(NULL,'tom4','123','123@qq.com','1500000000004','杰克',1);


/**用户订单**/
CREATE TABLE user_dingd(
  Ddid INT PRIMARY KEY AUTO_INCREMENT,
  Dingd_id INT,           #订单id
  Dchanp_id INT,           #产品id
  Dcount INT,              #产品数量
  Dstatus INT,             #订单状态  1-等待付款  2-等待发货  3-运输中  4-已签收  5-已取消
  Dorder_time BIGINT,      #下单时间
  Dpay_time BIGINT,        #付款时间
  Ddeliver_time BIGINT,    #发货时间
  Dreceived_time BIGINT    #签收时间
);

/**华为登录**/
CREATE TABLE huawei_denglu(
    id INT PRIMARY KEY AUTO_INCREMENT,
    uname VARCHAR(25),
    upwd VARCHAR(32)
);
INSERT INTO huawei_denglu VALUES
(null,"tom",md5("123"));

/**一楼上边4张手机图片**/
CREATE TABLE huawei_phone(
  Pid INT PRIMARY KEY AUTO_INCREMENT,
  img VARCHAR(250),      #图片
  name VARCHAR(250),      #大标题
  title VARCHAR(250),     #详情
  price DECIMAL(10,2)     #价格
)
INSERT INTO huawei_phone VALUES
(null,'image/mate 20.png','比啊','好好',"19.5");

/*一楼下的3个商品*/
CREATE TABLE huawei_yl_x(
  Pid INT PRIMARY KEY AUTO_INCREMENT,
  img VARCHAR(250),        #图片
  uname VARCHAR(250),       #大标题
  title VARCHAR(250),       #详情
  price DECIMAL(10,2)       #价格
)
INSERT INTO huawei_yl_x VALUES
(null,"../image/biao.png","HUAWEI WATCH<br>GT","稀缺货源 限量发售","1488");

/*二楼左边1个商品*/
CREATE TABLE huawei_el_z(
  Pid INT PRIMARY KEY AUTO_INCREMENT,
  img VARCHAR(250),      #图片
  uname VARCHAR(250),      #大标题
  title VARCHAR(250),     #详情
  price DECIMAL(10,2)     #价格
)
INSERT INTO huawei_phone VALUES
(null,'image/mate 20.png','比啊','好好',"19.5");

/*二楼右边的五个商品*/
CREATE TABLE huawei_er_y(
  Pid INT PRIMARY KEY AUTO_INCREMENT,
  img VARCHAR(250),        #大图片
  s_img VARCHAR(250),      #小图片
  uname VARCHAR(250),       #大标题
  price DECIMAL(10,2)       #价格
)
INSERT INTO huawei_er_y VALUES
(null,"../image/9 plus.png","../image/xinpin.png","华为畅享9 Plus","1499");
/*详情页*/
CREATE TABLE huawei_el_z(
  Pid INT PRIMARY KEY AUTO_INCREMENT,
  uname VARCHAR(250),     #大标题
  title VARCHAR(250),      #详情
  price DECIMAL(10,2),     #价格 
)