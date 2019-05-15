SET NAMES UTF8;
DROP DATABASE IF EXISTS cwr;
CREATE DATABASE cwr CHARSET=UTF8;
USE cwr;

/**************************** 1. PC *******************************/
/* 用户信息 */
CREATE TABLE cwr_user(
  uid INT PRIMARY KEY AUTO_INCREMENT, 
  uname VARCHAR(32),           #用户账号
  upwd VARCHAR(32),            #用户密码
  email VARCHAR(64),           #用户邮箱
  phone VARCHAR(16),           #用户号码
  user_name VARCHAR(32),       #真实姓名
  gender INT                  #用户性别  0-女  1-男
);

/** 首页轮播广告商品 **/
CREATE TABLE cwr_index_carousel(
  cid INT PRIMARY KEY AUTO_INCREMENT, 
  img VARCHAR(128),            #图片路径
  title VARCHAR(64)           #标题
);

/*** 首页商品 ***/
CREATE TABLE cwr_index_product(
  pid INT PRIMARY KEY AUTO_INCREMENT, 
  img VARCHAR(128),            #图片路径
  brand VARCHAR(64),           #品牌
  detail VARCHAR(128),         #商品详情
  price DECIMAL(10, 2)         #商品价格
);

/**** 首页图片 ****/
CREATE TABLE cwr_index_pic(
  iid INT PRIMARY KEY AUTO_INCREMENT, 
  iid_id INT,                  #图片编号
  img VARCHAR(128),            #图片路径
  title VARCHAR(64)           #标题
);

/***** 服装商品 *****/
CREATE TABLE cwr_laptop(
  lid INT PRIMARY KEY AUTO_INCREMENT, 
  lid_id INT,                  #图片编号
  img VARCHAR(128),            #图片路径
  detail VARCHAR(128),         #商品详情
  price DECIMAL(10, 2),         #价格
  sex INT,                     #性别
  size VARCHAR(32),            #尺码
  brand VARCHAR(128),          #品牌
  color VARCHAR(64),           #颜色
  kind VARCHAR(32),            #种类
  spec_one VARCHAR(32),        #规格1
  spec_two VARCHAR(32),        #规格2
  spec_three VARCHAR(32),      #规格3
  spec_four VARCHAR(32),       #规格4
  promise VARCHAR(32),         #承诺
  details VARCHAR(256),        #商品描述
  brand_img VARCHAR(128),      #品牌图片
  products VARCHAR(512)       #品牌介绍
);

/****** 详情页商品图片 sm md lg ******/
CREATE TABLE cwr_laptop_pic(
  did INT PRIMARY KEY AUTO_INCREMENT, 
  did_id INT,                  #图片编号
  sm VARCHAR(128),             #小图片路径
  md VARCHAR(128),             #中图片路径
  lg VARCHAR(128)              #大图片路径
);

/************ 超级管理员 **************/
/* 管理员账号 */ 
CREATE TABLE cwr_admin(
  aid INT PRIMARY KEY AUTO_INCREMENT,                   
  aname VARCHAR(32),         #管理员用户名
  apwd VARCHAR(128)          #管理员密码
);

/** 管理员权限列表 **/
CREATE TABLE cwr_privilege(
  pid INT PRIMARY KEY AUTO_INCREMENT,                    
  title VARCHAR(32),                                     #权限名称                            
  url VARCHAR(128),                                      #权限路劲
  parentId INT DEFAULT NULL,                             #权限编号
  FOREIGN KEY(parentId) REFERENCES cwr_privilege(pid)    
);

/*** 管理员权限 ***/
CREATE TABLE cwr_admin_privilege(
  apid INT PRIMARY KEY AUTO_INCREMENT, 
  adminId INT,                                           #管理员编号
  privilegeId INT,                                       #管理员范围
  FOREIGN KEY(adminId) REFERENCES cwr_admin(aid), 
  FOREIGN KEY(privilegeId) REFERENCES cwr_privilege(pid)
);

/*********** 数据插入 ***********/
/* 用户信息 */
INSERT INTO cwr_user VALUES
(NULL, '13371919982', password('123456'), '690245843@qq.com', '13371919982', '吴普祥', '1'), 
(NULL, '17317860585', password('123456'), '151718178@qq.com', '17317860585', '肖晨晨', '0');

/** 首页轮播广告商品 **/
INSERT INTO cwr_index_carousel VALUES
(NULL, 'http://127.0.0.1:3000/img/index_img/banner1.png', '轮播广告商品1'), 
(NULL, 'http://127.0.0.1:3000/img/index_img/banner2.png', '轮播广告商品2'), 
(NULL, 'http://127.0.0.1:3000/img/index_img/banner3.png', '轮播广告商品3'), 
(NULL, 'http://127.0.0.1:3000/img/index_img/banner4.png', '轮播广告商品4');

/*** 首页商品 ***/
INSERT INTO cwr_index_product VALUES
(NULL, 'http://127.0.0.1:3000/img/index_img/0065000_17817447.jpeg', 'FENDI', 'Fantastic,  Fresh,  Surf', 1349), 
(NULL, 'http://127.0.0.1:3000/img/index_img/0065030_17817645.jpeg', 'FENDI', 'Fantastic Summer', 1899), 
(NULL, 'http://127.0.0.1:3000/img/index_img/0065009_17817585.jpeg', 'FENDI', 'Cherry Print Frill Sleeve Dress Pink', 2149), 
(NULL, 'http://127.0.0.1:3000/img/index_img/0065021_17817621.jpeg', 'FENDI', 'T-Shirt Navy', 1419), 
(NULL, 'http://127.0.0.1:3000/img/index_img/1524035963972656.jpg', 'myk+', 'myk+多功能百洁清洁布4片装（2款）', 88), 
(NULL, 'http://127.0.0.1:3000/img/index_img/1524036209654722.jpg', 'myk+', 'myk+进口多功能洗涤剂980ml', 118), 
(NULL, 'http://127.0.0.1:3000/img/index_img/1524036074245412.jpg', 'myk+', 'myk+进口复合酵素洗衣液980ml', 168);


/**** 首页图片 ****/
INSERT INTO cwr_index_pic VALUES
(NULL, 1, 'http://127.0.0.1:3000/img/index_img/1520256675490531.jpg', '带来初春第一抹假日清新色'), 
(NULL, 1, 'http://127.0.0.1:3000/img/index_img/1520257058130385.jpg', 'BANDY BUTTON'), 
(NULL, 1, 'http://127.0.0.1:3000/img/index_img/1520257111669781.jpg', 'HUNTER'), 
(NULL, 2, 'http://127.0.0.1:3000/img/index_img/1520256996462955.jpg', '将运动休闲带入高奢殿堂'), 
(NULL, 2, 'http://127.0.0.1:3000/img/index_img/1520257169039234.jpg', 'FINGER IN THE NOSE'), 
(NULL, 2, 'http://127.0.0.1:3000/img/index_img/1520257256436201.jpg', 'REPOSE AMS'), 
(NULL, 3, 'http://127.0.0.1:3000/img/index_img/15204008239225.png', null), 
(NULL, 3, 'http://127.0.0.1:3000/img/index_img/1520400723402869.png', null), 
(NULL, 3, 'http://127.0.0.1:3000/img/index_img/1520406442493190.png', null), 
(NULL, 3, 'http://127.0.0.1:3000/img/index_img/1520400838951781.png', null), 
(NULL, 3, 'http://127.0.0.1:3000/img/index_img/1520400745373408.png', null), 
(NULL, 3, 'http://127.0.0.1:3000/img/index_img/1520400793042948.png', null), 
(NULL, 3, 'http://127.0.0.1:3000/img/index_img/1520400775764361.png', null), 
(NULL, 4, 'http://127.0.0.1:3000/img/index_img/newAppLoad.jpg', 'IOS/Android APP下'), 
(NULL, 4, 'http://127.0.0.1:3000/img/index_img/newWeiXin.jpg', '微信公众号');

/***** 服装商品 *****/
INSERT INTO cwr_laptop VALUES
(NULL, 1, 'http://127.0.0.1:3000/img/laptop_img/1554709969869651.jpg', '浅绿色竹影马甲', 1280, 1, '7岁', 'AMELIE WANG', '浅绿色', '上衣', '5 YEAR', '6 YEAR', '7 YEAR', '8 YEAR', '英国直邮(满499包邮)', '真丝织锦缎', 'http://127.0.0.1:3000/img/detail_img/brand_img/1545120690386604.jpg', 'Amelie Wang 主营新中式亲子服饰设计与定制。品牌强调产品设计和人文情调。以新中式为核心，体现工艺整合时尚、传统中不乏细节，呈现多元素的视觉美感，是国内领先的新中式儿童服饰设计师品牌。品牌一直秉承Keep Tradition Alive的理念，重新定义着装意识，结合传统与摩登，树立新中式行走的新时尚。'), 
(NULL, 1, 'http://127.0.0.1:3000/img/laptop_img/1554709940647885.jpg', '酒红色酒红双鱼短袖', 980, 1, '7岁', 'AMELIE WANG', '酒红色', '上衣', '5 YEAR', '6 YEAR', '7 YEAR', '8 YEAR', '英国直邮(满499包邮)', '真丝织锦缎', 'http://127.0.0.1:3000/img/detail_img/brand_img/1545120690386604.jpg', 'Amelie Wang 主营新中式亲子服饰设计与定制。品牌强调产品设计和人文情调。以新中式为核心，体现工艺整合时尚、传统中不乏细节，呈现多元素的视觉美感，是国内领先的新中式儿童服饰设计师品牌。品牌一直秉承Keep Tradition Alive的理念，重新定义着装意识，结合传统与摩登，树立新中式行走的新时尚。'), 
(NULL, 1, 'http://127.0.0.1:3000/img/laptop_img/1554711017733390.jpg', '黄色鎏光中式短袖', 798, 0, '7岁', 'AMELIE WANG', '黄色', '上衣', '5 YEAR', '6 YEAR', '7 YEAR', '8 YEAR', '英国直邮(满499包邮)', '真丝织锦缎', 'http://127.0.0.1:3000/img/detail_img/brand_img/1545120690386604.jpg', 'Amelie Wang 主营新中式亲子服饰设计与定制。品牌强调产品设计和人文情调。以新中式为核心，体现工艺整合时尚、传统中不乏细节，呈现多元素的视觉美感，是国内领先的新中式儿童服饰设计师品牌。品牌一直秉承Keep Tradition Alive的理念，重新定义着装意识，结合传统与摩登，树立新中式行走的新时尚。'), 
(NULL, 1, 'http://127.0.0.1:3000/img/laptop_img/1554709918455937.jpg', '酒红色福禄鱼马甲', 1180, 1, '7岁', 'AMELIE WANG', '酒红色', '上衣', '5 YEAR', '6 YEAR', '7 YEAR', '8 YEAR', '英国直邮(满499包邮)', '真丝织锦缎', 'http://127.0.0.1:3000/img/detail_img/brand_img/1545120690386604.jpg', 'Amelie Wang 主营新中式亲子服饰设计与定制。品牌强调产品设计和人文情调。以新中式为核心，体现工艺整合时尚、传统中不乏细节，呈现多元素的视觉美感，是国内领先的新中式儿童服饰设计师品牌。品牌一直秉承Keep Tradition Alive的理念，重新定义着装意识，结合传统与摩登，树立新中式行走的新时尚。'), 
(NULL, 1, 'http://127.0.0.1:3000/img/laptop_img/1554704109610101.jpg', '蓝色箐岑华苑马甲', 1980, 0, '6岁', 'AMELIE WANG', '蓝色', '上衣', '5 YEAR', '6 YEAR', '7 YEAR', '8 YEAR', '英国直邮(满499包邮)', '真丝织锦缎', 'http://127.0.0.1:3000/img/detail_img/brand_img/1545120690386604.jpg', 'Amelie Wang 主营新中式亲子服饰设计与定制。品牌强调产品设计和人文情调。以新中式为核心，体现工艺整合时尚、传统中不乏细节，呈现多元素的视觉美感，是国内领先的新中式儿童服饰设计师品牌。品牌一直秉承Keep Tradition Alive的理念，重新定义着装意识，结合传统与摩登，树立新中式行走的新时尚。'), 
(NULL, 1, 'http://127.0.0.1:3000/img/laptop_img/1554281718936552.jpg', '白色短袖T恤', 489, 1, '7岁', 'KARL LAGERFELD KIDS', '白色', '上衣', '5 YEAR', '6 YEAR', '7 YEAR', '8 YEAR', '英国直邮(满499包邮)', 'Flip flops with embossed logo and Choupette inrubber,  Made in China', 'http://127.0.0.1:3000/img/detail_img/brand_img/1510724812207177.jpg', '设计师KARL LAGERFELD拓展其品牌童装线为孩子们提供专属的时装，无论是鲜艳的色彩，搞怪的图案或是极具时髦感的设计在这里都可以找到。'), 
(NULL, 2, 'http://127.0.0.1:3000/img/laptop_img/1554281632371432.jpg', '白色拉链卫衣', 1129, 1, '8岁', 'KARL LAGERFELD KIDS', '白色', '外套', '5 YEAR', '6 YEAR', '7 YEAR', '8 YEAR', '英国直邮(满499包邮)', 'Flip flops with embossed logo and Choupette inrubber,  Made in China', 'http://127.0.0.1:3000/img/detail_img/brand_img/1510724812207177.jpg', '设计师KARL LAGERFELD拓展其品牌童装线为孩子们提供专属的时装，无论是鲜艳的色彩，搞怪的图案或是极具时髦感的设计在这里都可以找到。'), 
(NULL, 2, 'http://127.0.0.1:3000/img/laptop_img/1554281679198606.jpg', '黑色拉链卫衣', 779, 1, '8岁', 'KARL LAGERFELD KIDS', '黑色', '外套', '5 YEAR', '6 YEAR', '7 YEAR', '8 YEAR', '英国直邮(满499包邮)', 'Flip flops with embossed logo and Choupette inrubber,  Made in China', 'http://127.0.0.1:3000/img/detail_img/brand_img/1510724812207177.jpg', '设计师KARL LAGERFELD拓展其品牌童装线为孩子们提供专属的时装，无论是鲜艳的色彩，搞怪的图案或是极具时髦感的设计在这里都可以找到。'), 
(NULL, 2, 'http://127.0.0.1:3000/img/laptop_img/1553741449514327.jpg', '深蓝色防水外套大衣', 529, 0, '7岁', 'BILLIEBLUSH', '深蓝色', '外套', '5 YEAR', '6 YEAR', '7 YEAR', '8 YEAR', '英国直邮(满499包邮)', 'white with zip front fastening Hood,  Made in China', 'http://127.0.0.1:3000/img/detail_img/brand_img/1510718602975800.jpg', 'BILLIEBLUSH创建于2013年，品牌由法国设计团队精心打造，时髦，甜美浪漫且俏皮可爱是它的特点。BILLIEBLUSH系列中包含了适合小女孩各种不同场合穿着的服装，配饰，细节上的设计总能带来惊喜。'), 
(NULL, 2, 'http://127.0.0.1:3000/img/laptop_img/1553741845331288.jpg', '粉红色防水外套大衣', 529, 0, '8岁', 'BILLIEBLUSH', '粉红色', '外套', '5 YEAR', '6 YEAR', '7 YEAR', '8 YEAR', '英国直邮(满499包邮)', 'white with zip front fastening Hood,  Made in China', 'http://127.0.0.1:3000/img/detail_img/brand_img/1510718602975800.jpg', 'BILLIEBLUSH创建于2013年，品牌由法国设计团队精心打造，时髦，甜美浪漫且俏皮可爱是它的特点。BILLIEBLUSH系列中包含了适合小女孩各种不同场合穿着的服装，配饰，细节上的设计总能带来惊喜。'), 
(NULL, 2, 'http://127.0.0.1:3000/img/laptop_img/1553747321152363.jpg', '白色防水外套大衣', 429, 0, '6岁', 'BILLIEBLUSH', '白色', '外套', '5 YEAR', '6 YEAR', '7 YEAR', '8 YEAR', '英国直邮(满499包邮)', 'white with zip front fastening Hood,  Made in China', 'http://127.0.0.1:3000/img/detail_img/brand_img/1510718602975800.jpg', 'BILLIEBLUSH创建于2013年，品牌由法国设计团队精心打造，时髦，甜美浪漫且俏皮可爱是它的特点。BILLIEBLUSH系列中包含了适合小女孩各种不同场合穿着的服装，配饰，细节上的设计总能带来惊喜。'), 
(NULL, 3, 'http://127.0.0.1:3000/img/laptop_img/1554709833893937.jpg', '绿色绿蕊连衣裙', 1980, 0, '7岁', 'AMELIE WANG', '浅绿色', '裙子', '5 YEAR', '6 YEAR', '7 YEAR', '8 YEAR', '英国直邮(满499包邮)', '真丝织锦缎', 'http://127.0.0.1:3000/img/detail_img/brand_img/1545120690386604.jpg', 'Amelie Wang 主营新中式亲子服饰设计与定制。品牌强调产品设计和人文情调。以新中式为核心，体现工艺整合时尚、传统中不乏细节，呈现多元素的视觉美感，是国内领先的新中式儿童服饰设计师品牌。品牌一直秉承Keep Tradition Alive的理念，重新定义着装意识，结合传统与摩登，树立新中式行走的新时尚。'), 
(NULL, 3, 'http://127.0.0.1:3000/img/laptop_img/1554709895774685.jpg', '红色红妆连衣裙', 880, 0, '6岁', 'AMELIE WANG', '红色', '裙子', '5 YEAR', '6 YEAR', '7 YEAR', '8 YEAR', '英国直邮(满499包邮)', '真丝织锦缎', 'http://127.0.0.1:3000/img/detail_img/brand_img/1545120690386604.jpg', 'Amelie Wang 主营新中式亲子服饰设计与定制。品牌强调产品设计和人文情调。以新中式为核心，体现工艺整合时尚、传统中不乏细节，呈现多元素的视觉美感，是国内领先的新中式儿童服饰设计师品牌。品牌一直秉承Keep Tradition Alive的理念，重新定义着装意识，结合传统与摩登，树立新中式行走的新时尚。'), 
(NULL, 3, 'http://127.0.0.1:3000/img/laptop_img/1554704480087823.jpg', '酒红色鸿韵连衣裙', 1980, 0, '8岁', 'AMELIE WANG', '酒红色', '裙子', '5 YEAR', '6 YEAR', '7 YEAR', '8 YEAR', '英国直邮(满499包邮)', '真丝织锦缎', 'http://127.0.0.1:3000/img/detail_img/brand_img/1545120690386604.jpg', 'Amelie Wang 主营新中式亲子服饰设计与定制。品牌强调产品设计和人文情调。以新中式为核心，体现工艺整合时尚、传统中不乏细节，呈现多元素的视觉美感，是国内领先的新中式儿童服饰设计师品牌。品牌一直秉承Keep Tradition Alive的理念，重新定义着装意识，结合传统与摩登，树立新中式行走的新时尚。'),
(NULL, 3, 'http://127.0.0.1:3000/img/laptop_img/1554704081228664.jpg', '黄色金缕梅竹连衣裙', 1180, 0, '8岁', 'AMELIE WANG', '黄色', '裙子', '5 YEAR', '6 YEAR', '7 YEAR', '8 YEAR', '英国直邮(满499包邮)', '真丝织锦缎', 'http://127.0.0.1:3000/img/detail_img/brand_img/1545120690386604.jpg', 'Amelie Wang 主营新中式亲子服饰设计与定制。品牌强调产品设计和人文情调。以新中式为核心，体现工艺整合时尚、传统中不乏细节，呈现多元素的视觉美感，是国内领先的新中式儿童服饰设计师品牌。品牌一直秉承Keep Tradition Alive的理念，重新定义着装意识，结合传统与摩登，树立新中式行走的新时尚。'),
(NULL, 3, 'http://127.0.0.1:3000/img/laptop_img/1554704056008843.jpg', '橘粉色静姝连衣裙', 1998, 0, '7岁', 'AMELIE WANG', '粉色', '裙子', '5 YEAR', '6 YEAR', '7 YEAR', '8 YEAR', '英国直邮(满499包邮)', '真丝织锦缎', 'http://127.0.0.1:3000/img/detail_img/brand_img/1545120690386604.jpg', 'Amelie Wang 主营新中式亲子服饰设计与定制。品牌强调产品设计和人文情调。以新中式为核心，体现工艺整合时尚、传统中不乏细节，呈现多元素的视觉美感，是国内领先的新中式儿童服饰设计师品牌。品牌一直秉承Keep Tradition Alive的理念，重新定义着装意识，结合传统与摩登，树立新中式行走的新时尚。'),
(NULL, 3, 'http://127.0.0.1:3000/img/laptop_img/1554704036033123.jpg', '红色旻蔓酒红单连衣裙', 1580, 0, '6岁', 'AMELIE WANG', '红色', '裙子', '5 YEAR', '6 YEAR', '7 YEAR', '8 YEAR', '英国直邮(满499包邮)', '真丝织锦缎', 'http://127.0.0.1:3000/img/detail_img/brand_img/1545120690386604.jpg', 'Amelie Wang 主营新中式亲子服饰设计与定制。品牌强调产品设计和人文情调。以新中式为核心，体现工艺整合时尚、传统中不乏细节，呈现多元素的视觉美感，是国内领先的新中式儿童服饰设计师品牌。品牌一直秉承Keep Tradition Alive的理念，重新定义着装意识，结合传统与摩登，树立新中式行走的新时尚。'),
(NULL, 4, 'http://127.0.0.1:3000/img/laptop_img/1550646248602683.jpg', '黑色双排扣西装', 5969, 1, '8岁', 'BALMAIN', '黑色', '礼服', '5 YEAR', '6 YEAR', '7 YEAR', '8 YEAR', '英国直邮(满499包邮)', '材质：面料：38% 亚麻 38%棉 13%锦纶 里衬：100%锦纶,  阿尔巴尼亚制造。', 'http://127.0.0.1:3000/img/detail_img/brand_img/1545373955740610.png', 'BALMAIN是来自法国的奢华童装，以设计师标志性的纯色系设计辅以个性酷感装饰闻名，童装设计延续了将成装的迷人魅力，以孩子们喜爱的颜色做配色，创造出独特而高级的时髦服饰，正在童装界崭露头角。'), 
(NULL, 4, 'http://127.0.0.1:3000/img/laptop_img/1546925594576956.jpg', '黑色女孩西装外套', 715, 0, '5岁', 'JUNIOR GAULTIER', '黑色', '礼服', '5 YEAR', '6 YEAR', '7 YEAR', '8 YEAR', '英国直邮(满499包邮)', null, 'http://127.0.0.1:3000/img/detail_img/brand_img/1512372026226787.jpg', 'JUNIOR GAULTIER的童装有着显著的品牌特征，为适龄儿童提供充满个性且非常时尚的服饰，无论你是哪种风格，都可以在这里找到适合自己的单品。'), 
(NULL, 5, 'http://127.0.0.1:3000/img/laptop_img/155470998177493.jpg', '果木绿果木绿裤子', 680, 0, '5岁', 'AMELIE WANG', '浅绿色', '裤装', '5 YEAR', '6 YEAR', '7 YEAR', '8 YEAR', '英国直邮(满499包邮)', '真丝织锦缎', 'http://127.0.0.1:3000/img/detail_img/brand_img/1545120690386604.jpg', 'Amelie Wang 主营新中式亲子服饰设计与定制。品牌强调产品设计和人文情调。以新中式为核心，体现工艺整合时尚、传统中不乏细节，呈现多元素的视觉美感，是国内领先的新中式儿童服饰设计师品牌。品牌一直秉承Keep Tradition Alive的理念，重新定义着装意识，结合传统与摩登，树立新中式行走的新时尚。'), 
(NULL, 5, 'http://127.0.0.1:3000/img/laptop_img/1553840598631115.jpg', '蓝色飞马图案棕色裤子', 499, 1, '6岁', 'MINI RODINI', '蓝色', '裤装', '5 YEAR', '6 YEAR', '7 YEAR', '8 YEAR', '英国直邮(满499包邮)', 'BA festive brown body in 100 % GOTS certified organic cotton in a lustrous woven quality printed with blue pegasuses,  Made in India', 'http://127.0.0.1:3000/img/detail_img/brand_img/1510732197087315.jpg', '瑞典品牌MINI RODINI由设计师Cassandra Rhodin成立于2006年，通过有趣而充满活力的插图表达出孩子们的心声。品牌一直保持其高品质，同时注重企业社会责任，使它成为一个十分理想和令人满意的品牌。'), 
(NULL, 5, 'http://127.0.0.1:3000/img/laptop_img/1553840626635795.jpg', '粉红色飞马图案蓝色裤子', 599, 0, '5岁', 'MINI RODINI', '粉红色', '裤装', '5 YEAR', '6 YEAR', '7 YEAR', '8 YEAR', '英国直邮(满499包邮)', 'BA festive brown body in 100 % GOTS certified organic cotton in a lustrous woven quality printed with blue pegasuses,  Made in India', 'http://127.0.0.1:3000/img/detail_img/brand_img/1510732197087315.jpg', '瑞典品牌MINI RODINI由设计师Cassandra Rhodin成立于2006年，通过有趣而充满活力的插图表达出孩子们的心声。品牌一直保持其高品质，同时注重企业社会责任，使它成为一个十分理想和令人满意的品牌。'), 
(NULL, 5, 'http://127.0.0.1:3000/img/laptop_img/1553841367274459.jpg', '黑色复古风格运动裤', 499, 1, '5岁', 'MINI RODINI', '黑色', '裤装', '5 YEAR', '6 YEAR', '7 YEAR', '8 YEAR', '英国直邮(满499包邮)', 'BA festive brown body in 100 % GOTS certified organic cotton in a lustrous woven quality printed with blue pegasuses,  Made in India', 'http://127.0.0.1:3000/img/detail_img/brand_img/1510732197087315.jpg', '瑞典品牌MINI RODINI由设计师Cassandra Rhodin成立于2006年，通过有趣而充满活力的插图表达出孩子们的心声。品牌一直保持其高品质，同时注重企业社会责任，使它成为一个十分理想和令人满意的品牌。'), 
(NULL, 5, 'http://127.0.0.1:3000/img/laptop_img/1553841397066223.jpg', '黄色复古风格运动裤', 449, 1, '5岁', 'MINI RODINI', '黄色', '裤装', '5 YEAR', '6 YEAR', '7 YEAR', '8 YEAR', '英国直邮(满499包邮)', 'BA festive brown body in 100 % GOTS certified organic cotton in a lustrous woven quality printed with blue pegasuses,  Made in India', 'http://127.0.0.1:3000/img/detail_img/brand_img/1510732197087315.jpg', '瑞典品牌MINI RODINI由设计师Cassandra Rhodin成立于2006年，通过有趣而充满活力的插图表达出孩子们的心声。品牌一直保持其高品质，同时注重企业社会责任，使它成为一个十分理想和令人满意的品牌。'), 
(NULL, 5, 'http://127.0.0.1:3000/img/laptop_img/1553841566416930.jpg', '绿色运动裤', 439, 1, '5岁', 'MINI RODINI', '绿色', '裤装', '5 YEAR', '6 YEAR', '7 YEAR', '8 YEAR', '英国直邮(满499包邮)', 'BA festive brown body in 100 % GOTS certified organic cotton in a lustrous woven quality printed with blue pegasuses,  Made in India', 'http://127.0.0.1:3000/img/detail_img/brand_img/1510732197087315.jpg', '瑞典品牌MINI RODINI由设计师Cassandra Rhodin成立于2006年，通过有趣而充满活力的插图表达出孩子们的心声。品牌一直保持其高品质，同时注重企业社会责任，使它成为一个十分理想和令人满意的品牌。'), 
(NULL, 6, 'http://127.0.0.1:3000/img/laptop_img/1554282531597163.jpg', '人字拖', 289, 0, '6岁', 'KARL LAGERFELD KIDS', '黑色', '童鞋', '5 YEAR', '6 YEAR', '7 YEAR', '8 YEAR', '英国直邮(满499包邮)', 'Flip flops with embossed logo and Choupette inrubber,  Made in China', 'http://127.0.0.1:3000/img/detail_img/brand_img/1510724812207177.jpg', '设计师KARL LAGERFELD拓展其品牌童装线为孩子们提供专属的时装，无论是鲜艳的色彩，搞怪的图案或是极具时髦感的设计在这里都可以找到。'), 
(NULL, 6, 'http://127.0.0.1:3000/img/laptop_img/1554282598604807.jpg', '条纹帆布鞋', 539, 0, '7岁', 'KARL LAGERFELD KIDS', '黑色', '童鞋', '5 YEAR', '6 YEAR', '7 YEAR', '8 YEAR', '英国直邮(满499包邮)', 'Flip flops with embossed logo and Choupette inrubber,  Made in China', 'http://127.0.0.1:3000/img/detail_img/brand_img/1510724812207177.jpg', '设计师KARL LAGERFELD拓展其品牌童装线为孩子们提供专属的时装，无论是鲜艳的色彩，搞怪的图案或是极具时髦感的设计在这里都可以找到。'), 
(NULL, 6, 'http://127.0.0.1:3000/img/laptop_img/1553656096798545.jpg', '黑色logo拖鞋', 389, 1, '8岁', 'KARL LAGERFELD KIDS', '黑色', '童鞋', '5 YEAR', '6 YEAR', '7 YEAR', '8 YEAR', '英国直邮(满499包邮)', 'Flip flops with embossed logo and Choupette inrubber,  Made in China', 'http://127.0.0.1:3000/img/detail_img/brand_img/1510724812207177.jpg', '设计师KARL LAGERFELD拓展其品牌童装线为孩子们提供专属的时装，无论是鲜艳的色彩，搞怪的图案或是极具时髦感的设计在这里都可以找到。'), 
(NULL, 6, 'http://127.0.0.1:3000/img/laptop_img/15535662089557.jpg', '金色蝴蝶结凉鞋', 2105, 0, '8岁', 'CHLOE', '金色', '童鞋', '5 YEAR', '6 YEAR', '7 YEAR', '8 YEAR', '英国直邮(满499包邮)', 'Sandales en cuir de chËvre irisÈ,  doublure etpropretÈ en cuir de chËvre,  semelle en cuir et gomme,  MADE IN SPAIN', 'http://127.0.0.1:3000/img/detail_img/brand_img/1530676765194632.jpg', 'CHLOE是著名的法国时装和奢侈品品牌，拥有简洁实用美观的现代成衣理念，以创新柔美的设计风格闻名于时装界。其童装延续了成人女装设计的风格，以精致的面料，打造出柔软舒适而富有浪漫都市气息的穿着风格，在这里可以找到适合各种节日，特殊场合的完美搭配。'), 
(NULL, 6, 'http://127.0.0.1:3000/img/laptop_img/155356633287488.jpg', '金色蝴蝶结凉鞋', 2033, 0, '6岁', 'CHLOE', '金色', '童鞋', '5 YEAR', '6 YEAR', '7 YEAR', '8 YEAR', '英国直邮(满499包邮)', 'Sandales en cuir de chËvre irisÈ,  doublure etpropretÈ en cuir de chËvre,  semelle en cuir et gomme,  MADE IN SPAIN', 'http://127.0.0.1:3000/img/detail_img/brand_img/1530676765194632.jpg', 'CHLOE是著名的法国时装和奢侈品品牌，拥有简洁实用美观的现代成衣理念，以创新柔美的设计风格闻名于时装界。其童装延续了成人女装设计的风格，以精致的面料，打造出柔软舒适而富有浪漫都市气息的穿着风格，在这里可以找到适合各种节日，特殊场合的完美搭配。'), 
(NULL, 6, 'http://127.0.0.1:3000/img/laptop_img/1553238472129488.jpg', '粉色羊皮鞋', 1933, 0, '6岁', 'CHLOE', '粉色', '童鞋', '5 YEAR', '6 YEAR', '7 YEAR', '8 YEAR', '英国直邮(满499包邮)', 'Sandales en cuir de chËvre irisÈ,  doublure etpropretÈ en cuir de chËvre,  semelle en cuir et gomme,  MADE IN SPAIN', 'http://127.0.0.1:3000/img/detail_img/brand_img/1530676765194632.jpg', 'CHLOE是著名的法国时装和奢侈品品牌，拥有简洁实用美观的现代成衣理念，以创新柔美的设计风格闻名于时装界。其童装延续了成人女装设计的风格，以精致的面料，打造出柔软舒适而富有浪漫都市气息的穿着风格，在这里可以找到适合各种节日，特殊场合的完美搭配。'), 
(NULL, 7, 'http://127.0.0.1:3000/img/laptop_img/1548384408489590.jpg', '羽翼系列仿水晶女士耳钉 60468744-NY0', 439, 0, null, 'GIVENCHY ACCESSORIES', null, '女士', null, null, null, 'One Size', '英国直邮(满499包邮)', null, 'http://127.0.0.1:3000/img/detail_img/brand_img/1554867066290920.jpeg', 'Givenchy/纪梵希-配饰'), 
(NULL, 7, 'http://127.0.0.1:3000/img/laptop_img/1548412839453568.jpg', '精灵系列甜美女士耳坠 60484319-887', 439, 0, null, 'GIVENCHY ACCESSORIES', null, '女士', null, null, null, 'One Size', '英国直邮(满499包邮)', null, 'http://127.0.0.1:3000/img/detail_img/brand_img/1554867066290920.jpeg', 'Givenchy/纪梵希-配饰'), 
(NULL, 7, 'http://127.0.0.1:3000/img/laptop_img/1548578829505761.jpg', '花蕾系列仿水晶女士耳钉 60491563-887', 399, 0, null, 'GIVENCHY ACCESSORIES', null, '女士', null, null, null, 'One Size', '英国直邮(满499包邮)', null, 'http://127.0.0.1:3000/img/detail_img/brand_img/1554867066290920.jpeg', 'Givenchy/纪梵希-配饰'), 
(NULL, 7, 'http://127.0.0.1:3000/img/laptop_img/1548660174647521.jpg', '花蕾系列仿水晶银色女士耳环 60491560-NY0', 419, 0, null, 'GIVENCHY ACCESSORIES', null, '女士', null, null, null, 'One Size', '英国直邮(满499包邮)', null, 'http://127.0.0.1:3000/img/detail_img/brand_img/1554867066290920.jpeg', 'Givenchy/纪梵希-配饰'), 
(NULL, 7, 'http://127.0.0.1:3000/img/laptop_img/1548660918517688.jpg', '花蕾系列仿水晶金色女士耳环 60491561-887', 419, 0, null, 'GIVENCHY ACCESSORIES', null, '女士', null, null, null, 'One Size', '英国直邮(满499包邮)', null, 'http://127.0.0.1:3000/img/detail_img/brand_img/1554867066290920.jpeg', 'Givenchy/纪梵希-配饰'), 
(NULL, 7, 'http://127.0.0.1:3000/img/laptop_img/1548584009113845.jpg', '经典款金色五角星仿水晶耳环 60491582-887', 510, 0, null, 'GIVENCHY ACCESSORIES', null, '女士', null, null, null, 'One Size', '英国直邮(满499包邮)', null, 'http://127.0.0.1:3000/img/detail_img/brand_img/1554867066290920.jpeg', 'Givenchy/纪梵希-配饰'), 
(NULL, 8, 'http://127.0.0.1:3000/img/laptop_img/1554876204850522.png', 'Drink in the Box薄荷绿 355ml', 108, null, null, 'DRINK IN THE BOX', null, '护肤家具', null, null, null, 'One Size', '英国直邮(满499包邮)', null, 'http://127.0.0.1:3000/img/detail_img/brand_img/1554899359463827.png', 'Drink in the Box果汁杯，来自加拿大糖果色“外壳”的独特方形水杯，打破传统的圆形水杯造型，独特的方形设计与众不同，更便于把握。独特的按键开启和吸管设计，配以各种靓丽的果冻色，装上牛奶，或是水，或是果汁，走到哪儿都是一道风景。Drink in the Box样式活泼可爱，能让孩子充分享受健康喝水乐趣的果汁杯！'), 
(NULL, 8, 'http://127.0.0.1:3000/img/laptop_img/1554876293532549.jpg', 'Drink in the Box紫色 355ml', 108, null, null, 'DRINK IN THE BOX', null, '护肤家具', null, null, null, 'One Size', '英国直邮(满499包邮)', null, 'http://127.0.0.1:3000/img/detail_img/brand_img/1554899359463827.png', 'Drink in the Box果汁杯，来自加拿大糖果色“外壳”的独特方形水杯，打破传统的圆形水杯造型，独特的方形设计与众不同，更便于把握。独特的按键开启和吸管设计，配以各种靓丽的果冻色，装上牛奶，或是水，或是果汁，走到哪儿都是一道风景。Drink in the Box样式活泼可爱，能让孩子充分享受健康喝水乐趣的果汁杯！'), 
(NULL, 8, 'http://127.0.0.1:3000/img/laptop_img/1554876453872607.jpg', 'Drink in the Box粉色 355ml', 108, null, null, 'DRINK IN THE BOX', null, '护肤家具', null, null, null, 'One Size', '英国直邮(满499包邮)', null, 'http://127.0.0.1:3000/img/detail_img/brand_img/1554899359463827.png', 'Drink in the Box果汁杯，来自加拿大糖果色“外壳”的独特方形水杯，打破传统的圆形水杯造型，独特的方形设计与众不同，更便于把握。独特的按键开启和吸管设计，配以各种靓丽的果冻色，装上牛奶，或是水，或是果汁，走到哪儿都是一道风景。Drink in the Box样式活泼可爱，能让孩子充分享受健康喝水乐趣的果汁杯！'), 
(NULL, 9, 'http://127.0.0.1:3000/img/laptop_img/1557145772512423.jpg', '成人椰子香草味有机洗手液', 168, null, null, 'MANTIS 麦恩缇斯', null, '儿童用品', null, null, null, '253ML', '英国直邮(满499包邮)', null, 'http://127.0.0.1:3000/img/detail_img/brand_img/1554629854367516.png', '麦恩缇斯专注于有机知识理念的传播，坚持做有机 环保的实践者，以关爱地球生态、关注人类健康为核心理念，面向普通大众推广有机生活概念，并致 力将高品质有机产品带给每一个家庭。 所有产品均原产自于美国，并且均获得美国农业协会的USDA有 机认证。'),
(NULL, 9, 'http://127.0.0.1:3000/img/laptop_img/1557146341584872.jpg', '成人薰衣草味有机洗手液', 168, null, null, 'MANTIS 麦恩缇斯', null, '儿童用品', null, null, null, '253ML', '英国直邮(满499包邮)', null, 'http://127.0.0.1:3000/img/detail_img/brand_img/1554629854367516.png', '麦恩缇斯专注于有机知识理念的传播，坚持做有机 环保的实践者，以关爱地球生态、关注人类健康为核心理念，面向普通大众推广有机生活概念，并致 力将高品质有机产品带给每一个家庭。 所有产品均原产自于美国，并且均获得美国农业协会的USDA有 机认证。'), 
(NULL, 9, 'http://127.0.0.1:3000/img/laptop_img/1557146714349662.jpg', '成人葡萄柚味有机洗手液', 168, null, null, 'MANTIS 麦恩缇斯', null, '儿童用品', null, null, null, '253ML', '英国直邮(满499包邮)', null, 'http://127.0.0.1:3000/img/detail_img/brand_img/1554629854367516.png', '麦恩缇斯专注于有机知识理念的传播，坚持做有机 环保的实践者，以关爱地球生态、关注人类健康为核心理念，面向普通大众推广有机生活概念，并致 力将高品质有机产品带给每一个家庭。 所有产品均原产自于美国，并且均获得美国农业协会的USDA有 机认证。'),
(NULL, 9, 'http://127.0.0.1:3000/img/laptop_img/1557146940195493.jpg', '儿童椰子香草味有机洗手液', 168, null, null, 'MANTIS 麦恩缇斯', null, '儿童用品', null, null, null, '218ML', '英国直邮(满499包邮)', null, 'http://127.0.0.1:3000/img/detail_img/brand_img/1554629854367516.png', '麦恩缇斯专注于有机知识理念的传播，坚持做有机 环保的实践者，以关爱地球生态、关注人类健康为核心理念，面向普通大众推广有机生活概念，并致 力将高品质有机产品带给每一个家庭。 所有产品均原产自于美国，并且均获得美国农业协会的USDA有 机认证。'), 
(NULL, 9, 'http://127.0.0.1:3000/img/laptop_img/1557147132045193.jpg', '儿童香橙味有机洗手液', 168, null, null, 'MANTIS 麦恩缇斯', null, '儿童用品', null, null, null, '218ML', '英国直邮(满499包邮)', null, 'http://127.0.0.1:3000/img/detail_img/brand_img/1554629854367516.png', '麦恩缇斯专注于有机知识理念的传播，坚持做有机 环保的实践者，以关爱地球生态、关注人类健康为核心理念，面向普通大众推广有机生活概念，并致 力将高品质有机产品带给每一个家庭。 所有产品均原产自于美国，并且均获得美国农业协会的USDA有 机认证。'), 
(NULL, 9, 'http://127.0.0.1:3000/img/laptop_img/1557147360868122.jpg', '儿童葡萄柚味有机洗手液', 168, null, null, 'MANTIS 麦恩缇斯', null, '儿童用品', null, null, null, '218ML', '英国直邮(满499包邮)', null, 'http://127.0.0.1:3000/img/detail_img/brand_img/1554629854367516.png', '麦恩缇斯专注于有机知识理念的传播，坚持做有机 环保的实践者，以关爱地球生态、关注人类健康为核心理念，面向普通大众推广有机生活概念，并致 力将高品质有机产品带给每一个家庭。 所有产品均原产自于美国，并且均获得美国农业协会的USDA有 机认证。'),
(NULL, 10, 'http://127.0.0.1:3000/img/laptop_img/1557390680737432.jpg', '英国爱他美奶粉1段4x800g', 677, null, null, 'APTAMIL', null, '英国超市', null, null, null, '4x800g', '英国直邮(满499包邮)', null, 'http://127.0.0.1:3000/img_detail_img/brand_img/1557371964182585.jpg', '爱他美是英国销量第一的婴幼儿奶粉，因其最接近母乳的成分，成为许多英国家庭医生(GP)推荐的第一品牌奶粉。英国爱他美属于德国美乐宝Milupa公司，目前归属于法国达能集团旗下，是全球婴幼儿配方奶粉的最大的提供商之一，公司的战略遍及全球，除了英国爱他美，我们常见的还有德国爱他美、意大利爱他美、新西兰爱他美等等，需要知道的是他们都来自同一个集团，不同国家销售的奶粉奶源不同而已，配方也大体相似。英国爱他美奶粉分普通婴幼儿配方奶粉及特殊配方奶粉'),
(NULL, 10, 'http://127.0.0.1:3000/img/laptop_img/1557390680602238.jpg', '英国爱他美奶粉2段4x800g', 677, null, null, 'APTAMIL', null, '英国超市', null, null, null, '4x800g', '英国直邮(满499包邮)', null, 'http://127.0.0.1:3000/img_detail_img/brand_img/1557371964182585.jpg', '爱他美是英国销量第一的婴幼儿奶粉，因其最接近母乳的成分，成为许多英国家庭医生(GP)推荐的第一品牌奶粉。英国爱他美属于德国美乐宝Milupa公司，目前归属于法国达能集团旗下，是全球婴幼儿配方奶粉的最大的提供商之一，公司的战略遍及全球，除了英国爱他美，我们常见的还有德国爱他美、意大利爱他美、新西兰爱他美等等，需要知道的是他们都来自同一个集团，不同国家销售的奶粉奶源不同而已，配方也大体相似。英国爱他美奶粉分普通婴幼儿配方奶粉及特殊配方奶粉'),
(NULL, 10, 'http://127.0.0.1:3000/img/laptop_img/1557390681318780.jpg', '英国爱他美奶粉3段4x800g', 629, null, null, 'APTAMIL', null, '英国超市', null, null, null, '4x800g', '英国直邮(满499包邮)', null, 'http://127.0.0.1:3000/img_detail_img/brand_img/1557371964182585.jpg', '爱他美是英国销量第一的婴幼儿奶粉，因其最接近母乳的成分，成为许多英国家庭医生(GP)推荐的第一品牌奶粉。英国爱他美属于德国美乐宝Milupa公司，目前归属于法国达能集团旗下，是全球婴幼儿配方奶粉的最大的提供商之一，公司的战略遍及全球，除了英国爱他美，我们常见的还有德国爱他美、意大利爱他美、新西兰爱他美等等，需要知道的是他们都来自同一个集团，不同国家销售的奶粉奶源不同而已，配方也大体相似。英国爱他美奶粉分普通婴幼儿配方奶粉及特殊配方奶粉'),
(NULL, 10, 'http://127.0.0.1:3000/img/laptop_img/1557390681456182.jpg', '英国爱他美奶粉4段4x800g', 629, null, null, 'APTAMIL', null, '英国超市', null, null, null, '4x800g', '英国直邮(满499包邮)', null, 'http://127.0.0.1:3000/img_detail_img/brand_img/1557371964182585.jpg', '爱他美是英国销量第一的婴幼儿奶粉，因其最接近母乳的成分，成为许多英国家庭医生(GP)推荐的第一品牌奶粉。英国爱他美属于德国美乐宝Milupa公司，目前归属于法国达能集团旗下，是全球婴幼儿配方奶粉的最大的提供商之一，公司的战略遍及全球，除了英国爱他美，我们常见的还有德国爱他美、意大利爱他美、新西兰爱他美等等，需要知道的是他们都来自同一个集团，不同国家销售的奶粉奶源不同而已，配方也大体相似。英国爱他美奶粉分普通婴幼儿配方奶粉及特殊配方奶粉'),
(NULL, 11, 'http://127.0.0.1:3000/img/detail_img/like/0056673_babies-face-cream.jpeg', '挚爱保湿面霜', 458, null, null, 'BONPOINT', null, '护肤家具', null, null, null, 'One Size', '英国直邮(满499包邮)', null, null, null), 
(NULL, 11, 'http://127.0.0.1:3000/img/detail_img/like/1539155704413113.jpg', '可拆卸帽短款羽绒服', 299, null, null, 'WORLD OF WORDS', null, '上衣', null, null, null, 'One Size', '英国直邮(满499包邮)', null, null, null), 
(NULL, 11, 'http://127.0.0.1:3000/img/detail_img/like/1553759023387590.jpg', '挚爱保湿面霜（国外预售 限量1000）', 489, null, null, 'BONPOINT', null, '护肤家具', null, null, null, 'One Size', '英国直邮(满499包邮)', null, null, null), 
(NULL, 11, 'http://127.0.0.1:3000/img/detail_img/like/1521446060340527.jpg', '淡紫色冰激凌印花T恤裙', 249, null, null, 'STELLA MCCARTNEY KIDS', null, '裙子', null, null, null, 'One Size', '英国直邮(满499包邮)', null, null, null);


/****** 详情页商品图片 sm md lg ******/
INSERT INTO cwr_laptop_pic VALUES
(NULL, 1, 'http://127.0.0.1:3000/img/detail_img/sm/1554709969869652.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1554709969869652.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1554709969869652.jpg'), 
(NULL, 1, 'http://127.0.0.1:3000/img/detail_img/sm/1554709969869401.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1554709969869401.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1554709969869401.jpg'),
(NULL, 1, 'http://127.0.0.1:3000/img/detail_img/sm/1554709969880328.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1554709969880328.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1554709969880328.jpg'),
(NULL, 2, 'http://127.0.0.1:3000/img/detail_img/sm/1554709940647885.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1554709940647885.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1554709940647885.jpg'), 
(NULL, 2, 'http://127.0.0.1:3000/img/detail_img/sm/1554709940647829.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1554709940647829.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1554709940647829.jpg'),
(NULL, 2, 'http://127.0.0.1:3000/img/detail_img/sm/1554709940649956.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1554709940649956.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1554709940649956.jpg'),
(NULL, 3, 'http://127.0.0.1:3000/img/detail_img/sm/1554711017733390.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1554711017733390.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1554711017733390.jpg'),
(NULL, 4, 'http://127.0.0.1:3000/img/detail_img/sm/1554709918455937.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1554709918455937.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1554709918455937.jpg'),
(NULL, 4, 'http://127.0.0.1:3000/img/detail_img/sm/1554709918455863.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1554709918455863.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1554709918455863.jpg'),
(NULL, 4, 'http://127.0.0.1:3000/img/detail_img/sm/1554709918456764.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1554709918456764.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1554709918456764.jpg'),
(NULL, 5, 'http://127.0.0.1:3000/img/detail_img/sm/1554704109610101.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1554704109610101.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1554704109610101.jpg'),
(NULL, 5, 'http://127.0.0.1:3000/img/detail_img/sm/1554704109621823.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1554704109621823.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1554704109621823.jpg'),
(NULL, 5, 'http://127.0.0.1:3000/img/detail_img/sm/1554704109609855.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1554704109609855.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1554704109609855.jpg'),
(NULL, 6, 'http://127.0.0.1:3000/img/detail_img/sm/1554281718936552.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1554281718936552.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1554281718936552.jpg'),
(NULL, 6, 'http://127.0.0.1:3000/img/detail_img/sm/1554281724763651.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1554281724763651.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1554281724763651.jpg'),
(NULL, 7, 'http://127.0.0.1:3000/img/detail_img/sm/1554281632371432.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1554281632371432.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1554281632371432.jpg'),
(NULL, 7, 'http://127.0.0.1:3000/img/detail_img/sm/1554281636810842.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1554281636810842.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1554281636810842.jpg'),
(NULL, 7, 'http://127.0.0.1:3000/img/detail_img/sm/1554281643304933.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1554281643304933.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1554281643304933.jpg'),
(NULL, 8, 'http://127.0.0.1:3000/img/detail_img/sm/1554281679198606.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1554281679198606.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1554281679198606.jpg'),
(NULL, 8, 'http://127.0.0.1:3000/img/detail_img/sm/1554281683770372.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1554281683770372.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1554281683770372.jpg'),
(NULL, 8, 'http://127.0.0.1:3000/img/detail_img/sm/1554281690024826.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1554281690024826.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1554281690024826.jpg'),
(NULL, 8, 'http://127.0.0.1:3000/img/detail_img/sm/1554281694544454.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1554281694544454.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1554281694544454.jpg'),
(NULL, 9, 'http://127.0.0.1:3000/img/detail_img/sm/1553741449514327.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1553741449514327.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1553741449514327.jpg'),
(NULL, 9, 'http://127.0.0.1:3000/img/detail_img/sm/1553741455028102.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1553741455028102.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1553741455028102.jpg'),
(NULL, 10, 'http://127.0.0.1:3000/img/detail_img/sm/1553741845331288.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1553741845331288.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1553741845331288.jpg'),
(NULL, 10, 'http://127.0.0.1:3000/img/detail_img/sm/1553741850886493.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1553741850886493.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1553741850886493.jpg'),
(NULL, 11, 'http://127.0.0.1:3000/img/detail_img/sm/1553747321152363.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1553747321152363.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1553747321152363.jpg'),
(NULL, 12, 'http://127.0.0.1:3000/img/detail_img/sm/1554709833893937.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1554709833893937.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1554709833893937.jpg'),
(NULL, 12, 'http://127.0.0.1:3000/img/detail_img/sm/1554709833893763.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1554709833893763.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1554709833893763.jpg'),
(NULL, 13, 'http://127.0.0.1:3000/img/detail_img/sm/1554709895774685.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1554709895774685.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1554709895774685.jpg'),
(NULL, 13, 'http://127.0.0.1:3000/img/detail_img/sm/1554709791178209.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1554709791178209.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1554709791178209.jpg'),
(NULL, 13, 'http://127.0.0.1:3000/img/detail_img/sm/1554709791179814.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1554709791179814.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1554709791179814.jpg'),
(NULL, 14, 'http://127.0.0.1:3000/img/detail_img/sm/1554704480087823.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1554704480087823.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1554704480087823.jpg'),
(NULL, 14, 'http://127.0.0.1:3000/img/detail_img/sm/1554704480087445.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1554704480087445.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1554704480087445.jpg'),
(NULL, 14, 'http://127.0.0.1:3000/img/detail_img/sm/1554704480087478.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1554704480087478.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1554704480087478.jpg'),
(NULL, 15, 'http://127.0.0.1:3000/img/detail_img/sm/1554704081228664.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1554704081228664.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1554704081228664.jpg'),
(NULL, 15, 'http://127.0.0.1:3000/img/detail_img/sm/155470408122892.jpg', 'http://127.0.0.1:3000/img/detail_img/md/155470408122892.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/155470408122892.jpg'),
(NULL, 15, 'http://127.0.0.1:3000/img/detail_img/sm/1554704081228549.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1554704081228549.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1554704081228549.jpg'),
(NULL, 16, 'http://127.0.0.1:3000/img/detail_img/sm/1554704056008843.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1554704056008843.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1554704056008843.jpg'),
(NULL, 16, 'http://127.0.0.1:3000/img/detail_img/sm/1554704056008429.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1554704056008429.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1554704056008429.jpg'),
(NULL, 16, 'http://127.0.0.1:3000/img/detail_img/sm/1554704056008472.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1554704056008472.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1554704056008472.jpg'),
(NULL, 17, 'http://127.0.0.1:3000/img/detail_img/sm/1554704036033123.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1554704036033123.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1554704036033123.jpg'),
(NULL, 17, 'http://127.0.0.1:3000/img/detail_img/sm/1554704036033974.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1554704036033974.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1554704036033974.jpg'),
(NULL, 17, 'http://127.0.0.1:3000/img/detail_img/sm/1554704036033417.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1554704036033417.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1554704036033417.jpg'),
(NULL, 18, 'http://127.0.0.1:3000/img/detail_img/sm/1550646248602683.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1550646248602683.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1550646248602683.jpg'),
(NULL, 18, 'http://127.0.0.1:3000/img/detail_img/sm/1550646248602958.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1550646248602958.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1550646248602958.jpg'),
(NULL, 18, 'http://127.0.0.1:3000/img/detail_img/sm/1550646248602604.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1550646248602604.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1550646248602604.jpg'),
(NULL, 19, 'http://127.0.0.1:3000/img/detail_img/sm/1546925594576956.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1546925594576956.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1546925594576956.jpg'),
(NULL, 19, 'http://127.0.0.1:3000/img/detail_img/sm/1546925594576615.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1546925594576615.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1546925594576615.jpg'),
(NULL, 20, 'http://127.0.0.1:3000/img/detail_img/sm/155470998177493.jpg', 'http://127.0.0.1:3000/img/detail_img/md/155470998177493.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/155470998177493.jpg'),
(NULL, 20, 'http://127.0.0.1:3000/img/detail_img/sm/1554709981774399.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1554709981774399.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1554709981774399.jpg'),
(NULL, 20, 'http://127.0.0.1:3000/img/detail_img/sm/1554709981774264.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1554709981774264.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1554709981774264.jpg'),
(NULL, 21, 'http://127.0.0.1:3000/img/detail_img/sm/1553840598631115.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1553840598631115.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1553840598631115.jpg'),
(NULL, 21, 'http://127.0.0.1:3000/img/detail_img/sm/1553840603918933.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1553840603918933.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1553840603918933.jpg'),
(NULL, 21, 'http://127.0.0.1:3000/img/detail_img/sm/1553840607712437.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1553840607712437.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1553840607712437.jpg'),
(NULL, 22, 'http://127.0.0.1:3000/img/detail_img/sm/1553840626635795.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1553840626635795.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1553840626635795.jpg'),
(NULL, 22, 'http://127.0.0.1:3000/img/detail_img/sm/1553840631130973.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1553840631130973.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1553840631130973.jpg'),
(NULL, 23, 'http://127.0.0.1:3000/img/detail_img/sm/1553841367274459.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1553841367274459.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1553841367274459.jpg'),
(NULL, 23, 'http://127.0.0.1:3000/img/detail_img/sm/155384137190643.jpg', 'http://127.0.0.1:3000/img/detail_img/md/155384137190643.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/155384137190643.jpg'),
(NULL, 23, 'http://127.0.0.1:3000/img/detail_img/sm/1553841376799875.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1553841376799875.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1553841376799875.jpg'),
(NULL, 24, 'http://127.0.0.1:3000/img/detail_img/sm/1553841397066223.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1553841397066223.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1553841397066223.jpg'),
(NULL, 24, 'http://127.0.0.1:3000/img/detail_img/sm/1553841400826826.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1553841400826826.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1553841400826826.jpg'),
(NULL, 24, 'http://127.0.0.1:3000/img/detail_img/sm/1553841404804603.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1553841404804603.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1553841404804603.jpg'),
(NULL, 25, 'http://127.0.0.1:3000/img/detail_img/sm/1553841566416930.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1553841566416930.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1553841566416930.jpg'),
(NULL, 25, 'http://127.0.0.1:3000/img/detail_img/sm/1553841570199719.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1553841570199719.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1553841570199719.jpg'),
(NULL, 25, 'http://127.0.0.1:3000/img/detail_img/sm/1553841573938920.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1553841573938920.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1553841573938920.jpg'),
(NULL, 26, 'http://127.0.0.1:3000/img/detail_img/sm/1554282531597163.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1554282531597163.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1554282531597163.jpg'),
(NULL, 26, 'http://127.0.0.1:3000/img/detail_img/sm/1554282540920928.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1554282540920928.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1554282540920928.jpg'),
(NULL, 26, 'http://127.0.0.1:3000/img/detail_img/sm/1554282545810641.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1554282545810641.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1554282545810641.jpg'),
(NULL, 26, 'http://127.0.0.1:3000/img/detail_img/sm/1554282550451520.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1554282550451520.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1554282550451520.jpg'),
(NULL, 27, 'http://127.0.0.1:3000/img/detail_img/sm/1554282598604807.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1554282598604807.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1554282598604807.jpg'),
(NULL, 27, 'http://127.0.0.1:3000/img/detail_img/sm/1554282609842872.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1554282609842872.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1554282609842872.jpg'),
(NULL, 27, 'http://127.0.0.1:3000/img/detail_img/sm/1554282617753617.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1554282617753617.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1554282617753617.jpg'),
(NULL, 27, 'http://127.0.0.1:3000/img/detail_img/sm/1554282629380630.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1554282629380630.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1554282629380630.jpg'),
(NULL, 28, 'http://127.0.0.1:3000/img/detail_img/sm/1556721605276533.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1556721605276533.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1556721605276533.jpg'),
(NULL, 28, 'http://127.0.0.1:3000/img/detail_img/sm/1553656096798545.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1553656096798545.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1553656096798545.jpg'),
(NULL, 28, 'http://127.0.0.1:3000/img/detail_img/sm/155365610570333.jpg', 'http://127.0.0.1:3000/img/detail_img/md/155365610570333.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/155365610570333.jpg'),
(NULL, 28, 'http://127.0.0.1:3000/img/detail_img/sm/1553656110192272.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1553656110192272.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1553656110192272.jpg'),
(NULL, 29, 'http://127.0.0.1:3000/img/detail_img/sm/15535662089557.jpg', 'http://127.0.0.1:3000/img/detail_img/md/15535662089557.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/15535662089557.jpg'),
(NULL, 29, 'http://127.0.0.1:3000/img/detail_img/sm/1553239000802877.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1553239000802877.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1553239000802877.jpg'),
(NULL, 29, 'http://127.0.0.1:3000/img/detail_img/sm/1553566184089320.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1553566184089320.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1553566184089320.jpg'),
(NULL, 29, 'http://127.0.0.1:3000/img/detail_img/sm/1553566176400143.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1553566176400143.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1553566176400143.jpg'),
(NULL, 29, 'http://127.0.0.1:3000/img/detail_img/sm/1553566190445230.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1553566190445230.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1553566190445230.jpg'),
(NULL, 30, 'http://127.0.0.1:3000/img/detail_img/sm/155356633287488.jpg', 'http://127.0.0.1:3000/img/detail_img/md/155356633287488.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/155356633287488.jpg'),
(NULL, 30, 'http://127.0.0.1:3000/img/detail_img/sm/1553238595154308.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1553238595154308.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1553238595154308.jpg'),
(NULL, 30, 'http://127.0.0.1:3000/img/detail_img/sm/1553566337386348.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1553566337386348.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1553566337386348.jpg'),
(NULL, 30, 'http://127.0.0.1:3000/img/detail_img/sm/155356634265311.jpg', 'http://127.0.0.1:3000/img/detail_img/md/155356634265311.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/155356634265311.jpg'),
(NULL, 31, 'http://127.0.0.1:3000/img/detail_img/sm/1553238472129488.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1553238472129488.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1553238472129488.jpg'),
(NULL, 31, 'http://127.0.0.1:3000/img/detail_img/sm/1553566368545964.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1553566368545964.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1553566368545964.jpg'),
(NULL, 31, 'http://127.0.0.1:3000/img/detail_img/sm/155356637337755.jpg', 'http://127.0.0.1:3000/img/detail_img/md/155356637337755.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/155356637337755.jpg'),
(NULL, 32, 'http://127.0.0.1:3000/img/detail_img/sm/1548384408489590.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1548384408489590.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1548384408489590.jpg'),
(NULL, 32, 'http://127.0.0.1:3000/img/detail_img/sm/1548384408490466.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1548384408490466.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1548384408490466.jpg'),
(NULL, 32, 'http://127.0.0.1:3000/img/detail_img/sm/1548384408489174.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1548384408489174.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1548384408489174.jpg'),
(NULL, 32, 'http://127.0.0.1:3000/img/detail_img/sm/154838440848835.jpg', 'http://127.0.0.1:3000/img/detail_img/md/154838440848835.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/154838440848835.jpg'),
(NULL, 33, 'http://127.0.0.1:3000/img/detail_img/sm/1548412839453568.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1548412839453568.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1548412839453568.jpg'),
(NULL, 33, 'http://127.0.0.1:3000/img/detail_img/sm/1548412839453655.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1548412839453655.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1548412839453655.jpg'),
(NULL, 33, 'http://127.0.0.1:3000/img/detail_img/sm/1548412839453252.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1548412839453252.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1548412839453252.jpg'),
(NULL, 33, 'http://127.0.0.1:3000/img/detail_img/sm/1548412839453603.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1548412839453603.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1548412839453603.jpg'),
(NULL, 34, 'http://127.0.0.1:3000/img/detail_img/sm/1548578829505761.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1548578829505761.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1548578829505761.jpg'),
(NULL, 34, 'http://127.0.0.1:3000/img/detail_img/sm/1548578829498525.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1548578829498525.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1548578829498525.jpg'),
(NULL, 34, 'http://127.0.0.1:3000/img/detail_img/sm/1548578829505489.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1548578829505489.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1548578829505489.jpg'),
(NULL, 34, 'http://127.0.0.1:3000/img/detail_img/sm/1548578829504600.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1548578829504600.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1548578829504600.jpg'),
(NULL, 35, 'http://127.0.0.1:3000/img/detail_img/sm/1548660174647521.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1548660174647521.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1548660174647521.jpg'),
(NULL, 35, 'http://127.0.0.1:3000/img/detail_img/sm/1548660174647323.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1548660174647323.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1548660174647323.jpg'),
(NULL, 35, 'http://127.0.0.1:3000/img/detail_img/sm/1548660174653251.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1548660174653251.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1548660174653251.jpg'),
(NULL, 35, 'http://127.0.0.1:3000/img/detail_img/sm/1548660174647296.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1548660174647296.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1548660174647296.jpg'),
(NULL, 36, 'http://127.0.0.1:3000/img/detail_img/sm/1548660918517688.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1548660918517688.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1548660918517688.jpg'),
(NULL, 36, 'http://127.0.0.1:3000/img/detail_img/sm/1548660918523210.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1548660918523210.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1548660918523210.jpg'),
(NULL, 36, 'http://127.0.0.1:3000/img/detail_img/sm/1548660918559644.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1548660918559644.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1548660918559644.jpg'),
(NULL, 36, 'http://127.0.0.1:3000/img/detail_img/sm/1548660918501763.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1548660918501763.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1548660918501763.jpg'),
(NULL, 37, 'http://127.0.0.1:3000/img/detail_img/sm/1548584009113845.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1548584009113845.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1548584009113845.jpg'),
(NULL, 37, 'http://127.0.0.1:3000/img/detail_img/sm/1548584009118987.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1548584009118987.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1548584009118987.jpg'),
(NULL, 37, 'http://127.0.0.1:3000/img/detail_img/sm/1548584009118203.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1548584009118203.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1548584009118203.jpg'),
(NULL, 37, 'http://127.0.0.1:3000/img/detail_img/sm/1548584009099309.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1548584009099309.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1548584009099309.jpg'),
(NULL, 38, 'http://127.0.0.1:3000/img/detail_img/sm/155489266363856.jpg', 'http://127.0.0.1:3000/img/detail_img/md/155489266363856.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/155489266363856.jpg'),
(NULL, 38, 'http://127.0.0.1:3000/img/detail_img/sm/1554892748486309.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1554892748486309.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1554892748486309.jpg'),
(NULL, 39, 'http://127.0.0.1:3000/img/detail_img/sm/1554892987298719.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1554892987298719.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1554892987298719.jpg'),
(NULL, 39, 'http://127.0.0.1:3000/img/detail_img/sm/1554892717264987.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1554892717264987.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1554892717264987.jpg'),
(NULL, 40, 'http://127.0.0.1:3000/img/detail_img/sm/1554893023807455.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1554893023807455.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1554893023807455.jpg'),
(NULL, 40, 'http://127.0.0.1:3000/img/detail_img/sm/1554893033138756.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1554893033138756.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1554893033138756.jpg'),
(NULL, 41, 'http://127.0.0.1:3000/img/detail_img/sm/1557145772512423.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1557145772512423.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1557145772512423.jpg'),
(NULL, 41, 'http://127.0.0.1:3000/img/detail_img/sm/1557145803575676.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1557145803575676.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1557145803575676.jpg'),
(NULL, 42, 'http://127.0.0.1:3000/img/detail_img/sm/1557146341584872.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1557146341584872.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1557146341584872.jpg'),
(NULL, 42, 'http://127.0.0.1:3000/img/detail_img/sm/1557146341584197.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1557146341584197.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1557146341584197.jpg'),
(NULL, 43, 'http://127.0.0.1:3000/img/detail_img/sm/1557146714349662.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1557146714349662.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1557146714349662.jpg'),
(NULL, 43, 'http://127.0.0.1:3000/img/detail_img/sm/1557146758104871.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1557146758104871.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1557146758104871.jpg'),
(NULL, 44, 'http://127.0.0.1:3000/img/detail_img/sm/1557146940195493.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1557146940195493.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1557146940195493.jpg'),
(NULL, 44, 'http://127.0.0.1:3000/img/detail_img/sm/1557146940195976.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1557146940195976.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1557146940195976.jpg'),
(NULL, 45, 'http://127.0.0.1:3000/img/detail_img/sm/1557147132045193.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1557147132045193.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1557147132045193.jpg'),
(NULL, 45, 'http://127.0.0.1:3000/img/detail_img/sm/1557147132045528.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1557147132045528.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1557147132045528.jpg'),
(NULL, 46, 'http://127.0.0.1:3000/img/detail_img/sm/1557147360868122.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1557147360868122.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1557147360868122.jpg'),
(NULL, 46, 'http://127.0.0.1:3000/img/detail_img/sm/1557147360868787.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1557147360868787.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1557147360868787.jpg'),
(NULL, 47, 'http://127.0.0.1:3000/img/detail_img/sm/1557390680737432.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1557390680737432.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1557390680737432.jpg'),
(NULL, 48, 'http://127.0.0.1:3000/img/detail_img/sm/1557390680602238.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1557390680602238.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1557390680602238.jpg'),
(NULL, 49, 'http://127.0.0.1:3000/img/detail_img/sm/1557390681318780.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1557390681318780.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1557390681318780.jpg'),
(NULL, 50, 'http://127.0.0.1:3000/img/detail_img/sm/1557390681456182.jpg', 'http://127.0.0.1:3000/img/detail_img/md/1557390681456182.jpg', 'http://127.0.0.1:3000/img/detail_img/lg/1557390681456182.jpg');



/************** 超级管理员插入数据 **************/
/* 管理眼账号 */
INSERT INTO cwr_admin VALUES
(10, 'king', password('123456')), 
(20, 'tom', password('123456')), 
(30, 'mary', password('123456'));

/** 管理员权限列表 **/
INSERT INTO cwr_privilege VALUES
(1, '商品管理', NULL, NULL), 
(2, '添加商品', '/admin/product/add', 1), 
(3, '删除商品', '/admin/product/delete', 1), 
(4, '修改商品', '/admin/product/update', 1), 
(5, '商品列表', '/admin/product/list', 1), 
(6, '用户管理', NULL, NULL), 
(7, '删除用户', '/admin/user/delete', 6), 
(8, '修改用户', '/admin/user/update', 6), 
(9, '用户列表', '/admin/user/list', 6), 
(10, '订单管理', NULL, NULL), 
(11, '订单列表', '/admin/order/list', 10), 
(12, '搜索订单', '/admin/order/search', 10);


/*** 管理员权限 ***/
INSERT INTO cwr_admin_privilege VALUES
(NULL, 10, 1), 
(NULL, 10, 2), 
(NULL, 10, 3), 
(NULL, 10, 4), 
(NULL, 10, 5), 
(NULL, 10, 6), 
(NULL, 10, 7), 
(NULL, 10, 8), 
(NULL, 10, 9), 
(NULL, 20, 1), 
(NULL, 20, 2), 
(NULL, 20, 3), 
(NULL, 20, 4), 
(NULL, 20, 5), 
(NULL, 30, 1), 
(NULL, 30, 5), 
(NULL, 30, 6), 
(NULL, 30, 9);



/**************************** 2. APP *******************************/
/* 新闻列表 */
CREATE TABLE cwr_news(
  nid INT PRIMARY KEY AUTO_INCREMENT, 
  title VARCHAR(64),           #新闻标题
  author VARCHAR(32),          #新闻作者
  click  INT,                  #阅读量
  addTime VARCHAR(32),         #发布时间
  detail VARCHAR(65535),       #新闻详情
  img VARCHAR(128)             #图片路径
);

/** 图文分享 **/
CREATE TABLE cwr_imgText(
  iid INT PRIMARY KEY AUTO_INCREMENT,
  all_id INT,                  #全部
  iid_id INT,                  #分类id
  title VARCHAR(64),           #新闻标题
  detail VARCHAR(65535),       #新闻详情
  img VARCHAR(128)             #图片路径
);


/*********** 数据插入 ***********/
/* 新闻列表 */
INSERT INTO cwr_news VALUES
(NULL, '歌力思2019年一季度净利润增长11.00% 去年大涨近21%', '孕婴童', 501, '2019/5/5 13:06:00', '<p style="text-indent:2em;">2019年4月29日晚间，中国本土高端女装品牌ELLASSAY母公司深圳歌力思服饰股份有限公司（以下简称“歌力思”）发布了2019年一季度业绩报告。</p><p style="text-indent:2em;">据财报显示可知，歌力思期内实现营业收入6.23亿元，同比增长8.32%；实现归属上市公司股东的净利润录得8916.32万元，同比大涨11.00%，已连续十个季度保持双位数增长。</p><p style="text-indent:2em;">对此，歌力思董事长夏国新表示到，获得如此可喜的业绩是主要得益于对品牌持续增加的研发投入以及集团层面的协同共享。</p><p style="text-align: center;"><img style="width:100%;" src="http://127.0.0.1:3000/img/news_img/b85a50f3d37a8b3132a0370e12dec438.jpg" alt="歌力思2019年一季度净利润增长11.00% 去年大涨近21% "></p><p style="text-indent:2em;">同时，歌力思2019年一季度投入的研发费用同比提升23.42%，与公司刚披露的2018年报中研发费用持续提升，达到近8000万元。</p><p style="text-indent:2em;">据了解，截至2019年3月末，IRO在中国区开设有15家门店，全部为直营店。</p><p style="text-indent:2em;">报告期内，IRO品牌在国内发展迅猛，业绩增长迅速，在中国大陆区域营收达1680.81万元，同比大涨270.74%。</p><p style="text-indent:2em;">夏国新还透露到，公司将持续物色新品牌，丰富品牌组合，将公司打造成为具有国际竞争力的高级时装品牌集团。</p><p style="text-indent:2em;">此外，得益于多品牌战略的实施，歌力思于2018年的营业收入同比增长18.66%至24.36亿元，实现归属于上市公司股东的净利润则大涨20.74%至3.65亿元，毛利率为68.21%。</p><p style="text-indent:2em;">其中，歌力思旗下核心品牌ELLASSAY营业收入增长4.32%至10.04亿元，今年将新增30家门店；Laurèl营业收入则录得1.11亿元，上涨14.05%。</p><p style="text-indent:2em;">及Ed Hardy营业收入达4.98亿元，增长14.16%；IRO营业收入为5.67亿元；VIVIENNE TAM营业收入为997万元。</p><p style="text-align: center;"><img style="width:100%;" src="http://127.0.0.1:3000/img/news_img/5fa3e8095e4db86193ef50da0e5bc911.jpg" alt="歌力思2019年一季度净利润增长11.00% 去年大涨近21% "></p><p style="text-indent:2em;">据悉，相较于上市之初，歌力思三年间归属于上市公司股东的净利润从1.59亿元大幅增长至3.65亿元，三年复合增长率高达31.92%。</p><p style="text-indent:2em;">此次，歌力思也初次进行大比例分红，拟每10股派5.25元，共计派发现金红利1.75亿元。</p><p style="text-indent:2em;">值得一提的是，歌力思旗下主力品牌ELLASSAY女装也于2018年度初次登上了高端女装市场综合占有率的冠军宝座。</p>', 'http://127.0.0.1:3000/img/news_img/b85a50f3d37a8b3132a0370e12dec438.jpg'),
(NULL, '世界上很舒服的鞋”的Allbirds落地三里屯太古里', '孕婴童', 235, '2019/5/5 13:09:00', '<p style="text-indent:2em;">近日，被《时代》杂志称为“世界上舒服的鞋”的Allbirds&nbsp;落地三里屯太古里（专题阅读），这是其在北京的首店。</p><p style="text-indent:2em;">据资料显示，Allbirds 于 2014 年在美国旧金山创立，以羊毛运动鞋出名。其推出的鞋款以不用穿袜子的舒适性和可持续的环保理念为卖点，迄今只推出过两种鞋型——跑步鞋（runner）、懒人鞋（lounger）。</p><p style="text-indent:2em;">据了解，Allbirds的鞋之所以被《时代》杂志称为“世界上舒服的鞋”，原因就在于号称采用了直径为12.5微米的极细新西兰美利奴羊毛，鞋底则采用泡沫橡胶材料。</p><p style="text-indent:2em;">官方称穿上它就不用穿袜子，并且可以丢进洗衣机里直接清洗。</p><p style="text-indent:2em;">或许Allbirds对于国内消费者来说还比较陌生，不过其在美国科技圈和时尚圈可以说是备受追捧。</p><p style="text-indent:2em;">由于Allbirds 的创业地在硅谷，所以Allbirds先在硅谷的圈子流行起来，并且在开售短短一年就受到硅谷IT精英们的疯狂喜爱，后开始在硅谷人士以外的圈子流行。</p><p style="text-indent:2em;">据报道，美国电视人 Gayle King 曾给她的好朋友奥普拉送了一双 Allbirds 的羊毛 Runner 作为生日礼物；新西兰总理 Jacinda Ardern 在国事访问中，赠予澳大利亚总理 Malcolm Turnbull 和他的妻子各一双。</p><p style="text-indent:2em;">就连奥斯卡金像奖得主莱昂纳多·迪卡普里奥（Leonardo DiCaprio）也在去年宣布投资Allbirds。</p><p style="text-indent:2em;">Allbirds 于今年正式进入中国市场，并计划年底前开设三家门店。除北京这家店之外，在上海兴业太古汇的店铺是该品牌的亚洲首店，除此之外将陆续进入成都等城市。</p><p style="text-indent:2em;">他们也与阿里巴巴达成了合作，Allbirds天猫旗舰店现已上线。</p><p style="text-indent:2em;">“自2016年成立以来，我们就将打开中国市场视为发展目标之一。</p><p style="text-indent:2em;">Allbirds专注于为全球消费者提供更加舒适和环保的鞋履单品，进入中国意味着我们向这一目标迈近了极为重要的一步。” Allbirds联合创始人兼CEO Tim如是说。</p>', 'http://127.0.0.1:3000/img/news_img/803a8ed9cc80172391c26444bce4ffef.jpg'),
(NULL, '2019年4月涤纶长丝大事件回顾：涤丝行情先扬后抑', '第一时间', 2058, '2019/5/5 13:08:00', '<p style="text-indent:2em;">成本面影响下，4月涤纶长丝市场先扬后抑。</p><p style="text-indent:2em;">事件：4月7日，麦寮六轻工业区台化芳香烃三厂发生爆炸</p><p style="text-indent:2em;">此次爆炸事件系液化石油气（LPG）管线去乙丁烷塔破裂所引起，然PX装置受其牵连，勒令关停。相应的PTA现货成交价格大幅拉涨，加之PTA装置检修集中，期现货不断上扬，成本端支撑下，涤纶长丝企业报价纷纷提涨，市场成交重心上移。下游织造企业在买涨情绪带动下，纷纷补仓，涤丝产销火爆，交易日内平均产销近400%，个别高端在800%、1400%附近。</p><p style="text-indent:2em;">事件：4月中旬围绕PTA装置是否检修，成为市场之谜</p><p style="text-indent:2em;">据了解4-5月PTA装置检修集中，然PTA加工费持续攀升，升至1600元/吨附近，高利润使得PTA装置检修存在诸多不确定因素。而福海创450万吨的装置是否检修，能否如期检修成为市场热议的话题。对涤纶长丝而言，如果检修落实，PTA仍有一定利好支撑，反之，PTA市场存下行风险，失去成本端支撑，涤丝也难逃阴跌格局。</p><p style="text-indent:2em;">事件：4月22日，媒体宣布美国即将宣布终止对伊朗石油进口的制裁赦免的消息，国际油价应声大涨</p><p style="text-indent:2em;">美国可能终止对伊朗石油进口的制裁豁免为油市供应面带来一定利好支撑，加之中国经济数据向好提振需求面，后期油价走势依旧偏多。短期给予聚酯原料市场一定利好支撑，然需求跟进乏力，且原油与聚酯联动性不强，油价大涨对涤丝市场影响不大。而伴随嘉兴逸鹏25万吨聚酯装置投产、荣盛30万吨的装置检修即将结束，涤丝市场供应增多，下游织造企业悲观预期加重，刚需购进，涤丝库存增加。</p><p style="text-indent:2em;">事件： 五一节前优惠促销，去库存需求迫切</p><p style="text-indent:2em;">目前由于PTA加工费偏高，行业利润多集中在上游原料，聚酯企业利润尚可，下游织造利润压缩，反抗情绪较高。近期原料也相应的小幅下调，以安慰下游用户情绪，然下游用户并不买账，织造企业刚需购进，而涤丝企业多满负荷运行，致使多数涤丝企业库存累积增加2-3天。临近五一假期，企业去库存化需求迫切，纷纷开启促销模式，部分企业报盘下调100-200元/吨，多数企业报价稳定，实单优惠100-400元/吨不等。下游织造企业后市预期依然偏悲观，适度补仓，涤丝产销较前期有所提升，然而并没有达到企业心里预期，个别企业去库存化效果显著，多数企业库存压力犹存。据了解，目前POY库存多在13-15天，FDY库存多在17-20天，DTY库存多在25-28天。</p>', 'http://127.0.0.1:3000/img/news_img/19222fbcc82a5fcbf2ef0de5e68672aa.jpg'),
(NULL, '如何能穿出“泫雅风”？', '第一时间', 3058, '2019/5/5 13:30:00', '<p style="text-indent:2em;">不管是在小红书、微博还是微信朋友圈，几乎每天都能看到“泫雅风“这样的关键词。可是这样的风格到底有什么精髓呢？浏览了泫雅今年ins上po出的照片，我发现她的流行关键其实1980s的复古风。</p><p style="text-indent:2em;">想要模仿这样的风格抓住几个关键词就能轻松get啦！</p><p style="text-align: center;"><img style="width:100%;" src="http://127.0.0.1:3000/img/news_img/ef899dfc3207a844a3bb745971c8470f.jpg" alt=""><img style="width:100%;" src="http://127.0.0.1:3000/img/news_img/c9728c3c9be7a015741872d5fb59c305.jpg" alt=""></p><p style="text-indent:2em;">Blouse在80年代，每个走在时尚前沿的姑娘衣橱里都会有一件女人味十足的Blouse。比起刻板的男士衬衫，Blouse多了浮夸的袖管和华丽的面料，更加浪漫仙气，简直就是为甜美系女孩的量身定制。</p><p style="text-align: center;"><img style="width:100%;" src="http://127.0.0.1:3000/img/news_img/2a4ce5a1a9f613964383ca89c5079a5c.jpg" alt=""></p><p style="text-indent:2em;">格纹图案格纹图案在80年代的欧美时尚圈普及度非常高，把它印在服饰单品上后，整个人都蒙上了一层绅士淑女的滤镜。</p><p style="text-align: center;"><img style="width:100%;" src="http://127.0.0.1:3000/img/news_img/d832e997ec80704da0d4e4674b13e6ac.jpg" alt=""></p><p style="text-align: center;"><img style="width:100%;" src="http://127.0.0.1:3000/img/news_img/99e1e88f149bafee16793f37ff4e1627.jpg" alt=""></p><p style="text-indent:2em;">廓形西装80年代的姑娘们是很有主见想法的，她们的潮流可以说是先锋性的。</p><p style="text-indent:2em;">垫肩的大廓型设计也是那个年代的流行重点，随着摇滚乐的风靡，大家的穿搭方式也是越来越自由狂野。</p><p style="text-align: center;"><img style="width:100%;" src="http://127.0.0.1:3000/img/news_img/6d39a6c2d50009339e4dd1d42ffd238f.jpg" alt=""></p><p style="text-align: center;"><img style="width:100%;" src="http://127.0.0.1:3000/img/news_img/5e2c7638104e0bb3dbf83640b14c91ac.jpg" alt=""></p><p style="text-indent:2em;">珍珠元素珍珠是不可缺少的复古时尚要素之一，在八九十年代，许多姑娘们都喜欢把它戴在脖子和耳间，这也是优雅高贵的象征。</p>', 'http://127.0.0.1:3000/img/news_img/7d5817bd6e5d065750decf4ea6271489.jpg'),
(NULL, 'Chanel是不是需要一位品牌变革推动者？', '第一时间', 1058, '2019/5/5 13:20:00', '<p style="text-indent:2em;">Chanel 刚刚落幕的 2020 度假系列发布会，并不寻常。巴黎大皇宫比以往更安静空旷，空间也好像更大，在“威尼斯”或“圣特罗佩”等城市标牌的下方，排列着单行木长凳，地面铺开清冷的灰色混凝土。</p><p style="text-indent:2em;">发布会开始前，嘉宾们在楼上吃了早餐，场景就像是《东方列车》（Orient Express）里的餐车。早餐后人们走下“列车”，走上“月台”，翘首以盼 Virginie Viard 执掌的品牌首秀，本季灵感源自旅行。</p><p style="text-indent:2em;">Karl Lagerfeld 曾凭借自己的愿景，将这个快被遗忘的经典老牌，打造成全球最受追捧“超级奢侈品牌”。他去世后，Chanel 任命前工作室负责人 Virginie Viard 接棒，要的就是保持连贯性。</p><p style="text-indent:2em;">发布会开始前，Chanel 时装部门总裁 Bruno Pavlovsky 称，Viard 的设计手法“和以前一样，但又不一样。”</p><p style="text-indent:2em;">“她了解 Chanel 的里里外外，”他说，“她曾经是左膀，也是右臂，现在她准备好了，要书写 Chanel 历史的新篇章。”</p><p style="text-indent:2em;">当然了，现在 Viard 作为 Chanel 艺术总监展示首个系列，没人会觉得她会出来表现自己（她还婉拒了所有媒体的采访。）但无论是 Chanel，还是整个产业，所有人都在努力适应这个“后 Lagerfeld 时代”的时装世界。但对于那个最关键的问题，她的这场发布会并没能答好这道题：这究竟是一个开始……还是一个结尾？</p><p style="text-indent:2em;">负责任的讲，Viard 确实需要时间好好定义她执掌的 Chanel 是什么样。此前已有信源表示，Lagerfeld 去世前就对本季系列的创意概念有所安排。今天这场发布会，我们确实看得到这位时装大师惯常的成功配方：色彩感（蜡笔色调与黑色），还有对衍缝、仿羔羊呢、箱型夹克等时装屋经典元素的新鲜演绎。</p><p style="text-indent:2em;">Viard 甚至用最后几个带有僵直白色衣领的终场造型，向难忘的 Lagerfeld 形象致敬。终场模特身穿的后背系带镂空黑色长裙，拉到近乎笔直的长发，颜色白得也很像 Lagerfeld 。</p><p style="text-indent:2em;">但其中也有难以令人忽视的元素，象征了某种告别。全系列最强的几件单品，包括那些印花紧身裤和皮革连体衣，带有某种古董衣的吸引力。但在更多地方，Viard 用的是具有明显当代风格的廓形和面料（比如从缝线裁开至高高飞扬的机车夹克皮短裤，还有分层印花连身裙），配上类似巨大的 Flap Bag、Mod 少年派头的漆皮靴子等趣怪配饰，把一切“ Chanel 化”。已经在高街上流行起来的膨胀廓形裙裤，或许要算本季发布会最响亮的宣言，从皮革到简单棉布有各种版本。</p><p style="text-indent:2em;">接下来 7 月举办的高级定制系列发布会，才是 Viard 真正意义上的首秀，可能才更令人期待。但 Chanel 应该拥有的未来，是个什么样？</p><p style="text-indent:2em;">根据伯恩斯坦（Bernstein）奢侈品调研部负责人 Luca Solca 的说法，今日的奢侈品市场主要被两股力量不断重塑，一是数字化科技的颠覆，二是驱动行业销售总额的中国消费者的迅速成熟。再有就是 Instagram 瀑布流般的刷新速度，衣柜里早就码好各家奢侈品牌经典单品的消费者数量也在急速膨胀，如此的求快求新前所未见，各家时装公司也因此背负前所未有的创新压力。</p><p style="text-indent:2em;">如今，Chanel 依旧是世界上最令人垂涎的奢侈品牌，也没有人承担得起在飞速变化的市场保持静止所造成的后果。尽管品牌销售额不断增长，Chanel 在 Lagerfeld 任内的最后几年也开始有些蒙了灰。尽管这家品牌的优势依旧明显，但 Chanel 不管是时装系列、营销手法还是店铺现在确实也需要更新了。</p><p style="text-indent:2em;">但如果 Chanel 需要改革焕新，颠覆程度比肩 Alessandro Michele 执掌下 Gucci 的变革，肯定不是答案。话虽如此，Viard 最终也一定要推动品牌前进，或是将掌舵大权转交他人。</p><p style="text-indent:2em;">对她来说，Lagerfeld 走后留给品牌的这个空缺实在太大。业内人士围绕 Phoebe Philo 的讨论还在继续，毕竟不少人将她视为这一代的 Coco Chanel 。</p>', 'http://127.0.0.1:3000/img/news_img/51385ce8dbef85591ddeb51582068a48.jpg'),
(NULL, 'CONVERSE Chuck Taylor 70s推出蓝色单宁面料有几款', '第一时间', 1558, '2019/5/5 12:39:00', '<p style="text-indent:2em;">单宁面料的球鞋，一直都很受大家的欢迎。最近新作频频的 CONVERSE Chuck Taylor 70s 也以 “Blue Denim” 为主题给大家带来了两款新球鞋。这次的 CONVERSE Chuck Taylor 70s 包含了高低帮两款，蓝色牛仔材质的鞋面配上白色的车线和 logo 印花，经典复古，同时又耐磨耐看。细细比较下来，低帮款的蓝色要比高帮款浅一些。不过，就像蓝色的牛仔裤一样，两款球鞋都会随着穿着时间而颜色变淡，呈现出一种别有味道的质感。高低帮两款分别售价为 90 美元和 85 美元，将会陆续登陆 CONVERSE 的线上线下店铺，感兴趣的朋友可以关注一下。</p><p style="text-align: center;"><img style="width:100%;" src="http://127.0.0.1:3000/img/news_img/7f210bc687e864377d8ea447dacb5cda.jpg" alt=""></p><p style="text-align: center;"><img style="width:100%;" src="http://127.0.0.1:3000/img/news_img/7da1e1e32c1e6e680f61041a3467bf03.jpg" alt=""></p><p style="text-align: center;"><img style="width:100%;" src="http://127.0.0.1:3000/img/news_img/d063e89413528a5240bfbccfa3004bac.jpg" alt=""></p><p style="text-align: center;"><img style="width:100%;" src="http://127.0.0.1:3000/img/news_img/ef3c00be6d69ead23eec67a202ccdc68.jpg" alt=""></p>', 'http://127.0.0.1:3000/img/news_img/c77f4c532fe3c50810a25c442b20ac34.jpg'),
(NULL, '潘玮柏成为Timberland亚太区品牌代言人', '姚婷', 1358, '2019/1/29 14:42:00', '<p style="text-indent:2em;">除了贩售产品这项「基础使命」外，近年来越来越多品牌争相肩负起一定的社会责任，尤其是在关乎每个人的环境保护方面的努力。这些品牌当中就包括享誉全球的休闲户外服装鞋履品牌Timberland。</p><p style="text-indent:2em;">Timberland不仅致力于打造适宜城市出行的服装和鞋履产品，同时鼓励品牌爱好者走向户外，携手共进，让世界变得更美好，为此，品牌先后付诸了不少实际行动。譬如从 2001 年开始携手日本非盈利机构 Green Network 前往内蒙古参与科尔沁植树计划，截至目前，Timberland 已经在中国地区种植了逾 260 万棵树木，而于全球范围内种植的树木多达 970 万棵。</p><p style="text-align: center;"><img style="width:100%;" src="http://127.0.0.1:3000/img/news_img/f74295b9-41c1-4d77-9be0-25c01f1618d8.jpg"></p><p style="text-indent:2em;">在以身作则积极倡导环境保护之外，Timberland 的可持续发展理念也需要依托明星的影响力进行更快速、广泛地传播。此番 Timberland 正式宣布，亚洲歌手、演员兼企业家潘玮柏成为 2019 年亚太区品牌代言人。</p><p style="text-indent:2em;">这一任命不仅因潘玮柏在音乐、娱乐及时尚等领域所展现出的创作才华，而成为亚洲地区最受欢迎及深受时尚界喜爱的男艺人之一，也因其长期以来对公益活动和环境的可持续发展所作出的贡献，令品牌和公众印象深刻。</p><p style="text-indent:2em;">据世界服装鞋帽网了解，潘玮柏在 2019 年 Timberland 的「Nature Needs Heroes」广告中极力传达了 Timberland「携手共进，让世界变得更美好」理念。广告片体现出的核心原则便是呼吁大家立即采取行动保护环境。</p><p style="text-align: center;"><img style="width:100%;" src="http://127.0.0.1:3000/img/news_img/d0ee1db8-36ac-4eb7-8416-2a3970eaeacc.jpg" title="11.jpg"></p><p style="text-align: center;"><img style="width:100%;" src="http://127.0.0.1:3000/img/news_img/2d9011b5-27ca-414e-b4d0-dfb3a62424b7.jpg" title="22.jpg"></p><p style="text-indent:2em;">在与 Timberland 和品牌其他 Heroes 合作的过程中，潘玮柏将带头坚持可持续发展的理念，并代表亚洲地区推广「Nature Needs Heroes」的活动，鼓励和倡导粉丝们追随自己的脚步，并将环保理念带向更广泛的地区。</p><p style="text-indent:2em;">除了早先在伦敦时装周预览 Christopher RÆBURN 与 Timberland 合作的 2019 秋冬联名系列外，潘玮柏更参观了位于伦敦 Hackney 的 RÆBURN 工作室，设计师本人向他展示了与 Timberland 的合作过程中如何平衡时尚元素和环保理念。</p><p style="text-indent:2em;">接下来，潘玮柏将于 4 月带着这些环保理念，亲身参与到 Timberland 和 Green Network 的内蒙古科尔沁植树计划中，以减少沙尘暴带来的广泛威胁，同时扩大科尔沁沙漠植树造林项目的影响力。</p><p style="text-indent:2em;">另外，潘玮柏将继续参与在亚洲举办的 2019 年「Nature Needs Heroes」媒体发布会，并将于现场向媒体和公众介绍 Timberland 采用的可回收材料，如 ReBOTL™、可回收橡胶及聚酯材料所生产的全新鞋履及服饰系列。</p><p style="text-indent:2em;">ReBOTL™ 是一种专利材料，含有至少 40% 的可回收 PET 材质(一种用于制作矿泉水水瓶的塑料)，将被运用到 Timberland 的产品及配饰中。据悉，从 2009 年起，Timberland 在制作鞋履中所使用的可回收 PET 量等同于 3.1 亿个塑料瓶。</p><p style="text-indent:2em;">潘玮柏在自己职业生涯与公益事业中的投入与 Timberland 引以为豪的品牌理念相吻合，相信此次他的加入将会进一步唤醒公众对社会环保的责任以及此领域发展的关注。</p><p style="text-indent:2em;">更多精彩报道，请关注世界服装鞋帽网。</p>', 'http://127.0.0.1:3000/img/news_img/d0ee1db8-36ac-4eb7-8416-2a3970eaeacc.jpg'),
(NULL, '市场竞争极为严峻：H&M和zara能够比过同行们依靠的是什么', '第一时间', 1358, '2019/4/27 11:34:00', '<p style="text-indent:2em;">作为快时尚代表品牌，Zara和H&amp;M向来以速度取胜——每当四大时装周吹起某股风潮后，人们很快就能在它们的专卖店里找到与之相近、甚至一模一样的单品。</p><p style="text-indent:2em;">对此，去年《华尔街日报》曾有一篇报道，讲述Zara出品的一件大衣，从设计出稿、生产及物流交付到第五大道旗舰店的整个过程仅需25天。</p><p style="text-indent:2em;">但眼下，根据高盛最新调研结果显示，Zara和H&amp;M的速度纪录已经被其他快时尚品牌打破了。</p><p style="text-indent:2em;">该报告称，包括ASOS、Boohoo在内的时尚品牌，从构思、设计、生产到上新所需要的时间都短于Zara和H&amp;M。高盛就供应链耗时和销售增幅两项变量进行研究，结果发现“时间就是金钱”——两家品牌高速运转的优势成功转化为营收增幅，因为一旦品牌能够快速响应市场需求，意味着它能够对库存制定出做合理安排，减少滞销状况的发生几率。</p><p style="text-indent:2em;">日本快时尚代表优衣库近来也把赌注押到速度上，其创始人柳井正接受采访时声称公司计划将设计到出货间的时长压缩至13天。“我们必须即刻推出顾客急着想买的衣服，这也是迅销得名的原因。”他补充说。</p><p style="text-indent:2em;">ASOS速度快得吓人——每周上新单品高达4500件。就在几天前，它提高了新一财年业绩增长预期：从25%-30%至30%-35%。</p><p style="text-indent:2em;">Boohoo亦是如此，这家不久前向Nasty Gal提出收购邀约的线上时尚公司每天推出近100款单品。法国巴黎银行分析师Simon Bowler发现，Boohoo从设计至上新总共花费的时间在一至两周内，几乎只有Zara的一半，“他们只要一周就能推出别家品牌下一季准备销售的新品。”至于那些喜新厌旧的千禧一代，只要打开电脑。花上十几二十英镑就能买下一件棒球衫或是连衣裙。</p><p style="text-indent:2em;">根据Boohoo公布的最新财报，公司预计今年同比增幅有望达到50%。尽管品牌名字听上去还挺耳生，可它的股价去年增长势头明显，公司市值已经超过5亿美元。</p><p style="text-indent:2em;">这两家公司的电商性质为品牌高速运转做足铺垫，与此同时，它们又躲过了实体店饱和风险。而对比早期在全球各地疯狂开店的Zara和H&amp;M，如今则在逐步转型，因为门店吸金能力与日俱减。就拿H&amp;M为例，它每年凭着10%-15%的扩张速度，开出了4300家门店，也让公司主席成为全瑞典最富有的人，可随着线下销售增幅放缓，老一代快时尚品牌一面减慢实体店铺开张速度，一面加大线上电商投入。</p><p style="text-indent:2em;">意识到自己的落后，H&amp;M最近决定投资供应链。以求控制生产成本，最终以具有竞争力的售价出现在市面上，目前，品牌五分之四的生产线都位于亚洲，但它正在考虑转移至更接近欧洲大陆的生产地，例如土耳其。“这样的话，货品运送至欧洲市场的时间就会大大缩短。”H&amp;M首席执行官Karl-Johan Persson接受路透社采访时说道。</p><p style="text-indent:2em;">从H&amp;M第一财季数字来看，其税后营收和利润双双低于预期。法国兴业银行（Societe Generale）分析师Anne Critchlow强调，集团库存同比上升了30%。为此，H&amp;M目前正在调整供应链系统以提升对于天气、市场环境等因素的反应灵活度。同样有此决定的还有J.C. Penney和Gap。为加快速度，这两家时尚品牌不约而同地减少了自己对于亚洲地区生产力的依赖度——Gap部分生产线已经转移至加勒比地区，设计流程也得到了简化，例如必要时公司会在24小时内确定设计稿并进入生产阶段。</p><p style="text-indent:2em;">不管是努力尝试即秀即买的奢侈品牌，还是不断优化供应链与物流的快时尚品牌，现在都在不停地加速，但这真的会是件好事吗？</p>', 'http://127.0.0.1:3000/img/news_img/e03a8c4657a074a29e8750dba0de5b86.jpg'),
(NULL, '朗姿2019年一季度营收7.2亿 净利润同比下降12.54％', '第一时间', 1358, '2019/4/29 20:11:00', '<p style="text-indent: 2em;">4月26日，朗姿发布2019年一季度报告，实现营业收入7.218亿元，同比增长11.78%；归属于上市公司股东的净利润5277万元，同比下降12.54%。</p><p style="text-indent: 2em;">对于业绩的变动，朗姿在公告中表示，预计负债较期初减少91.08%，主要是医美板块上一年末计提的部分预计负债，本期冲销所致；税金及附加较去年同期增长75.21%，主要是女装板块由于应交增值税增加相应附加税增加所致;资产减值损失较去年同期增长188.3%，主要是子公司阿卡邦新增存货跌价准备及坏账准备所致；所得税费用较去年同期增长72.25%，主要是子公司朗姿时尚出售L&amp;P部分股权在本期缴纳所得税所致;经营活动产生的现金流量净额较去年同期增长88.66%，主要是销售收款增加所致。</p><p style="text-indent: 2em;">作为一家女装研发、生产企业，朗姿旗下拥有朗姿、莫佐、莱茵、玛丽、JIGOTT、liaalancy、FABIANA FILIPPI、DeWL、Agabang等品牌。</p>', 'http://127.0.0.1:3000/img/news_img/2ec60eb48e7db8469f43890f409b61e0.jpg'),
(NULL, '什么造就了歌莉娅女装近年快速上位?', '焦艳玲', 1358, '2019/3/29 18:36:00', '<p style="text-align:center"><img style="width:100%;" src="http://127.0.0.1:3000/img/news_img/b17c66bd-36ea-4274-87be-e3416a00bd83.jpg"></p><p style="text-indent:2em;"><strong>GLORIA歌莉娅女装</strong>一直以<strong>“旅行就是活出美丽”</strong>深入人心，<strong>今年夏季第39站——澳大利亚袋鼠岛</strong>如约而至。小编本着深度探秘歌莉娅袋鼠岛之旅的心情，走访了其位于广州的总部，却发现品牌内部正悄悄实践的<strong>“诚衣时尚美学”</strong>有着更多故事。</p><p style="text-indent:2em;">访谈中，歌莉娅负责人分享了<strong>“诚衣”</strong>的理念：选用高品质面料，以诚实的定价销售，不在价格上打埋伏，客人只需要考虑是否喜欢，要告诉消费者“好的品质没有那么贵”。这种策略打动了很多懂品质有要求的消费者，加上非常吸睛的“绿野星踪”独创门店形象，令歌莉娅的业绩在去年异军突起，跻身自带人流的品牌行列。</p><p style="text-indent:2em;">“诚衣”理念除了高品质与性价比， 还在幕后的各环节落地，“诚衣时尚美学”的贯彻使产品和品牌的质感都逐步得到了升值。</p><p style="text-indent:2em;"></p><p style="text-indent:2em;"><strong>“诚”就匠心</strong></p><p style="text-indent:2em;"><strong>歌莉娅 x 研发总监金善泳(Kim sun young)</strong></p><p style="text-indent:2em;">歌莉娅的研发团队由拥有多个国际奢侈品品牌设计及管理经验的金善泳(Kim sun young)领军，把在版型上的研发工艺、剪裁技术和执行上的专注与匠心带到团队中，以工艺为高品质面料增值。</p><p style="text-indent:2em;">版型廓形是呈现歌莉娅时尚美学的重要一环，金善泳老师在专访中提到 “用诚心做好衣，是最自然的事”。</p><p style="text-align: center"><img style="width:100%;" src="http://127.0.0.1:3000/img/news_img/31072b40-2d48-4ebc-aa37-eeca0e53e88e.jpg"></p><p style="text-align: center;"><span style="color: rgb(127, 127, 127);"><strong>金善泳(Kim sun young)GLORIA歌莉娅研发总监</strong></span></p><p style="text-indent:2em;">连衣裙是歌莉娅品牌的王牌之一，今年歌莉娅的货架上新增了拉条工艺的连衣裙，这是在高定服饰才会使用到的剪裁方式，以人手仔细对位，达到拉条裁片间准确无误的缝合，来优化人体比例、修身显瘦，使连衣裙呈现高级的精致感。</p><p style="text-align: center;"><img style="width:100%;" src="http://127.0.0.1:3000/img/news_img/2d8d6b04-557c-4d56-8845-f1efde8bbdc3.jpg"></p><p style="text-align: center;"><span style="color: rgb(127, 127, 127);"><strong>GLORIA歌莉娅拉条工艺连衣裙</strong></span></p><p style="text-indent:2em;">让小编感兴趣的还有 “黑科技”压褶连衣裙，三宅一生就是以压褶设计独步天下，而歌莉娅最独到之处在于连衣裙从胸线到腰部线条流畅，合身塑形而不绷紧，与其他品牌容易松垮的压褶形成明显区别。本季，歌莉娅在压褶裙的升级设计中，还加入了潮流的渐变元素以及蕾丝款式，感觉把这门“黑科技”完全驾驭了。</p><p style="text-align: center;"><img style="width:100%;" src="http://127.0.0.1:3000/img/news_img/ac664aa0-b22d-4a12-bfd2-c058729fbeaa.jpg"></p><p style="text-align: center;"><span style="color: rgb(127, 127, 127);"><strong>GLORIA歌莉娅“黑科技”压褶连衣裙系列</strong></span></p><p style="text-indent:2em;"></p><p style="text-indent:2em;"><strong>心“诚”则“灵”</strong></p><p style="text-indent:2em;"><strong>　　歌莉娅 x 艺术家/设计师Meiyi</strong></p><p style="text-indent:2em;">为给消费者带来更国际化的设计，歌莉娅一直保持着与国际团队的合作。艺术家/设计师Meiyi历年来屡获国际殊荣，她不止在创作及商业上取得平衡，更以“设计无界限”的信念，不断追求设计的多元化和整体性。</p><p style="text-indent:2em;">2019年夏季，GLORIA by Meiyi系列满载袋鼠岛独特自然魅力带来的灵感设计，连艺术家本人也在企划中说道：“在袋鼠岛的大自然获取灵感，心诚则灵。”</p><p style="text-align: center;"><img style="width:100%;" src="http://127.0.0.1:3000/img/news_img/55844c73-198d-4c8c-8586-de91835357aa.jpg"></p><p style="text-align: center;"><span style="color: rgb(127, 127, 127);"><strong>艺术家/设计师 Meiyi</strong></span></p><p style="text-indent:2em;">海波浪半裙以灵动的手法勾勒出Vivonne Bay 的起伏海浪，面料渗合金线，模拟阳光下千百万化、闪闪生光的水面;尤加利叶和桉树花卉图案，升腾着生命力与自然趣味;Meiyi系列充满了巧妙的功能设计，还有上下里外多元互搭性，让小编也被种草了!</p><p style="text-align:center"><img style="width:100%;" src="http://127.0.0.1:3000/img/news_img/0c489bbf-9767-4827-83af-60cecea06de5.jpg"></p><p style="text-align: center"><img style="width:100%;" src="http://127.0.0.1:3000/img/news_img/0a448c28-fb30-47b1-b963-243a640cf778.jpg"></p><p style="text-indent:2em;">歌莉娅今年夏季的主打面料是真丝与醋酸，其中醋酸Acetate是高档服装常用面料，真丝衣物的舒适和高级感也不用再多说，款式时尚得体，再看看挂在衣服上的吊牌……逐渐体会到“诚衣”理念为何能打动消费者。</p><p style="text-align: center;"><img style="width:100%;" src="http://127.0.0.1:3000/img/news_img/33d2cb9a-71f6-428e-915e-8c84b7756710.jpg"></p><p style="text-align: center"><img style="width:100%;" src="http://127.0.0.1:3000/img/news_img/f3e47475-b1b8-4dcb-a459-7c3fbbded32e.jpg"></p><p style="text-align: center;"><span style="color: rgb(127, 127, 127);"><strong>GLORIA歌莉娅真丝连衣裙系列</strong></span></p><p style="text-indent:2em;"><strong>心“诚”自然美</strong></p><p style="text-indent:2em;"><strong>日本顶尖时尚摄影师伊藤彰紀 x 维密天使Willow Hand</strong></p><p style="text-indent:2em;">这次走访当然不会漏了歌莉娅环球之旅的大片，翻阅2019年春夏季刊，维密天使Willow Hand在日本顶尖时尚摄影师伊藤彰纪的镜头下，生动地捕捉到歌莉娅服饰与袋鼠岛的自然和时尚融合的美妙瞬间。超模完全放松的眼神和姿态好像都在告诉读者她很享受身上的衣服和所处的环境。</p><p style="text-indent:2em;">歌莉娅品牌负责人还特别提到， 摄影师和模特虽然在各自的领域都是有名气的人物，却没有一点架子， 与工作团队沟通真诚务实，都是诚心爱生活、爱工作的人，因此作品也是满满的自然美。</p><p style="text-align:center"><img style="width:100%;" src="http://127.0.0.1:3000/img/news_img/bb91284e-5a16-417c-8f8b-c0677ce33e40.jpg"></p><p style="text-indent:2em;">匠心技术加持高品质面料，时尚优雅的款式搭配如此诚实的定价，在小编看来这就是歌莉娅践行的“诚衣时尚美学”。快速上位的歌莉娅与其他案例的不同之处在于她不是靠噱头或策划的事件，而是靠实践一套理念，低调实在地打动消费者。</p><p style="text-indent:2em;">2019年的歌莉娅，值得继续关注!</p>', 'http://127.0.0.1:3000/img/news_img/6b1d7b16-522d-4c83-88c5-e02543a30f5c.jpg');

/** 图文分享 **/
INSERT INTO cwr_imgText VALUES
(NULL, 0, 1,'歌力思2019年一季度净利润增长11.00% 去年大涨近21%', '2019年4月29日晚间，中国本土高端女装品牌ELLASSAY母公司深圳歌力思服饰股份有限公司（以下简称“歌力思”）发布了2019年一季度业绩报告。', 'http://127.0.0.1:3000/img/news_img/b85a50f3d37a8b3132a0370e12dec438.jpg'),
(NULL, 0, 1,'世界上很舒服的鞋”的Allbirds落地三里屯太古里', '近日，被《时代》杂志称为“世界上舒服的鞋”的Allbirds&nbsp;落地三里屯太古里（专题阅读），这是其在北京的首店', 'http://127.0.0.1:3000/img/news_img/803a8ed9cc80172391c26444bce4ffef.jpg'),
(NULL, 0, 2,'2019年4月涤纶长丝大事件回顾：涤丝行情先扬后抑', '事件：4月7日，麦寮六轻工业区台化芳香烃三厂发生爆炸，此次爆炸事件系液化石油气（LPG）管线去乙丁烷塔破裂所引起，然PX装置受其牵连，勒令关停。', 'http://127.0.0.1:3000/img/news_img/19222fbcc82a5fcbf2ef0de5e68672aa.jpg'),
(NULL, 0, 2,'如何能穿出“泫雅风”？', '不管是在小红书、微博还是微信朋友圈，几乎每天都能看到“泫雅风“这样的关键词。可是这样的风格到底有什么精髓呢？', 'http://127.0.0.1:3000/img/news_img/7d5817bd6e5d065750decf4ea6271489.jpg'),
(NULL, 0, 3,'Chanel是不是需要一位品牌变革推动者？', 'Chanel 刚刚落幕的 2020 度假系列发布会，并不寻常。巴黎大皇宫比以往更安静空旷，空间也好像更大。', 'http://127.0.0.1:3000/img/news_img/51385ce8dbef85591ddeb51582068a48.jpg'),
(NULL, 0, 3,'CONVERSE Chuck Taylor 70s推出蓝色单宁面料有几款', '单宁面料的球鞋，一直都很受大家的欢迎。最近新作频频的 CONVERSE Chuck Taylor 70s 也以 “Blue Denim” 为主题给大家带来了两款新球鞋。', 'http://127.0.0.1:3000/img/news_img/c77f4c532fe3c50810a25c442b20ac34.jpg'),
(NULL, 0, 4,'潘玮柏成为Timberland亚太区品牌代言人', '近年来越来越多品牌争相肩负起一定的社会责任，尤其是在关乎每个人的环境保护方面的努力。这些品牌当中就包括享誉全球的休闲户外服装鞋履品牌Timberland。', 'http://127.0.0.1:3000/img/news_img/d0ee1db8-36ac-4eb7-8416-2a3970eaeacc.jpg'),
(NULL, 0, 4,'市场竞争极为严峻：H&M和zara能够比过同行们依靠的是什么', '作为快时尚代表品牌，Zara和H&amp;M向来以速度取胜——每当四大时装周吹起某股风潮后，人们很快就能在它们的专卖店里找到与之相近、甚至一模一样的单品。', 'http://127.0.0.1:3000/img/news_img/e03a8c4657a074a29e8750dba0de5b86.jpg'),
(NULL, 0, 5,'朗姿2019年一季度营收7.2亿 净利润同比下降12.54％', '4月26日，朗姿发布2019年一季度报告，实现营业收入7.218亿元，同比增长11.78%；归属于上市公司股东的净利润5277万元，同比下降12.54%。', 'http://127.0.0.1:3000/img/news_img/2ec60eb48e7db8469f43890f409b61e0.jpg'),
(NULL, 0, 5,'什么造就了歌莉娅女装近年快速上位？', '连衣裙是歌莉娅品牌的王牌之一，今年歌莉娅的货架上新增了拉条工艺的连衣裙，来优化人体比例、修身显瘦，使连衣裙呈现高级的精致感。', 'http://127.0.0.1:3000/img/news_img/6b1d7b16-522d-4c83-88c5-e02543a30f5c.jpg');
