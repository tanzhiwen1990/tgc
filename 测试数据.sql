-- 管理员表 begin
INSERT INTO t_systemuser(t_user,t_name,t_mobilphone,t_status,t_password) VALUES
	('admin','张三','15023629468','启用','admin');
	INSERT INTO t_systemuser(t_user,t_name,t_mobilphone,t_status,t_password) VALUES
	('zhang','zhang','15023629469','禁用','zhang');
SELECT t_id,t_user,t_name,t_mobilphone,t_status,t_createtime,t_password FROM t_systemuser WHERE t_user='admin' AND t_password='admin';
-- 管理员表 end
SELECT * FROM t_systemuser;
-- 业主放盘表 begin
INSERT INTO Owner_building(Owner_building_type,Owner_building_name,Owner_building_number,Owner_building_mi,Owner_building_price,Owner_building_linkman,Owner_building_phone) VALUES
	('出售','未来大厦','12层-8号','215','5000','小智','15023629468'),
	('出租','科技大厦','14层-1~6号','315','550','小周','15023426768'),
	('出租','未来大厦','4层-2~6号','115','560','小张','15023426768'),
	('出租','创维科技大厦','14层-1~6号','315','550','小明','15023426768'),
	('出售','未来大厦','4层-1~6号','115','5600','小周','15023426768'),
	('出租','无尽大厦','17层-1~8号','355','520','何小姐','15023426768'),
	('出租','科技大厦','20层-6~10号','335','250','小周','15023426768'),
	('出售','商业大厦','8层-2~6号','305','5500','周小姐','15023426768'),
	('出租','科技大厦','6层-1~9号','415','600','王先生','15023426768'),
	('出租','天地大厦','1层-1~3号','215','750','张先生','15023426768');
INSERT INTO Owner_building(Owner_building_type,Owner_building_name,Owner_building_number,Owner_building_mi,Owner_building_price,Owner_building_linkman,Owner_building_phone) VALUES
	('出售','创维科技大厦','16层-8号','215','5000','小王王','15023629468'),
	('出租','科技大厦','17层-1~6号','315','550','小周王','15023426768'),
	('出租','未来大厦','4层-2~6号','115','560','小丽王','15023426768'),
	('出租','创维科技大厦','14层-1~6号','315','550','小明王','15023426768'),
	('出售','未来大厦','18层-1~6号','115','5600','小杰杰','15023426768'),
	('出租','创维科技大厦','40层-1~8号','355','520','何姐姐','15023426768'),
	('出租','科技大厦','30层-6~10号','335','250','小周周','15023426768'),
	('出售','商业大厦','21层-2~6号','305','5500','周周姐','15023426768'),
	('出租','科技大厦','44层-1~9号','415','600','王先生','15023426768'),
	('出租','创维科技大厦','1层-1~3号','215','750','张先生','15023426768');
-- 业主放盘表 end

SELECT * FROM Owner_building;
-- 分页查询
SELECT Owner_building_id,Owner_building_type,Owner_building_name,Owner_building_number,Owner_building_mi,Owner_building_price,Owner_building_linkman,Owner_building_phone,Owner_building_time FROM Owner_building
	WHERE Owner_building_id LIMIT 6,3;
-- 条件分页查询
SELECT Owner_building_id,Owner_building_type,Owner_building_name,Owner_building_number,Owner_building_mi,Owner_building_price,Owner_building_linkman,Owner_building_phone,Owner_building_time FROM Owner_building
	WHERE Owner_building_time>'2016-12-20 10:00:00' AND Owner_building_time<'2016-12-20 12:00:00' AND Owner_building_name='' AND Owner_building_type='';

-- 城市表begin
INSERT INTO city(city_name) VALUES('重庆'),('上海'),('北京');
-- 城市表end

-- 区县表begin
INSERT INTO district(city_id,district_name) VALUES(1,'主城区'),(2,'主城区'),(2,'浦东新区'),(3,'主城区');
INSERT INTO district(city_id,district_name) VALUES(1,'渝中区'),(1,'江北区'),(1,'南岸区'),(1,'高新区'),(1,'渝北区'),(1,'两江新区'),(1,'沙坪坝区'),(1,'九龙坡区'),(1,'大渡口区'),(1,'北碚区'),(1,'巴南区'),(1,'其他');
-- 区县表end
SELECT * FROM district
-- 子域表 begin
INSERT INTO child_domain(district_id,child_domain_name) VALUES
	(1,'解放碑'),(1,'朝天门'),(1,'两路口'),(1,'上清寺'),(1,'观音岩'),(1,'七星岗'),(1,'较场口')
	,(1,'大坪'),(1,'大溪沟'),(1,'临江门'),(1,'菜园坝'),(1,'长滨路'),(1,'嘉宾路'),(1,'化龙桥'),(1,'袁家岗');
INSERT INTO child_domain(district_id,child_domain_name) VALUES
	(2,'华新街'),(2,'观音桥'),(2,'红旗河沟'),(2,'五里店'),(2,'观音桥步行街'),(2,'欧式一条街'),(2,'江北嘴'),(2,'鲤鱼池'),(2,'北滨路'),(2,'南桥寺'),(2,'大石坝'),(2,'花卉园'),(2,'郭家沱'),(2,'鸿恩寺'),(2,'唐家沱'),(2,'寸滩');
INSERT INTO child_domain(district_id,child_domain_name) VALUES
	(3,'南坪'),(3,'南滨路'),(3,'经济技术开发区'),(3,'步行街'),(3,'南坪正街'),(3,'南坪东路'),(3,'海棠溪'),(3,'上新街'),(3,'弹子石'),(3,'罗家坝'),(3,'四公里'),(3,'五公里'),(3,'六公里'),(3,'铜元局'),(3,'南坪南路'),(3,'南坪西路'),(3,'新南湖')
	,(3,'黄桷垭'),(3,'花园路街道'),(3,'南坪街道'),(3,'南山'),(3,'南坪区府'),(3,'茶园新区'),(3,'会展中心');
INSERT INTO child_domain(district_id,child_domain_name) VALUES
	(4,'石桥铺'),(4,'二郎');
INSERT INTO child_domain(district_id,child_domain_name) VALUES
	(5,'冉家坝'),(5,'加州新牌坊'),(5,'回兴'),(5,'五黄路'),(5,'龙头寺'),(5,'北部新区'),(5,'龙溪'),(5,'空港'),(5,'两路')
	,(5,'黄泥磅'),(5,'南桥寺'),(5,'人和'),(5,'汽博中心');
INSERT INTO child_domain(district_id,child_domain_name) VALUES
	(6,'人和'),(6,'大竹林'),(6,'礼嘉'),(6,'鸳鸯'),(6,'财富中心'),(6,'两江幸福广场'),(6,'汽博中心'),(6,'经开园'),(6,'金开大道');
INSERT INTO child_domain(district_id,child_domain_name) VALUES(7,'三峡广场'),(7,'小龙坎'),(7,'天星桥'),(7,'杨公桥'),(7,'陈家湾'),(7,'沙坪坝正街'),(7,'烈士墓'),(7,'凤天大道'),(7,'覃家岗'),(7,'土湾')
	,(7,'工人村'),(7,'大学城'),(7,'马家岩'),(7,'瓷器口'),(7,'显丰大道'),(7,'汉渝路'),(7,'陈家桥'),(7,'远祖桥'),(7,'井口')
	,(7,'双碑'),(7,'沙滨路'),(7,'新桥'),(7,'劳动路'),(7,'西永');
INSERT INTO child_domain(district_id,child_domain_name) VALUES(8,'杨家坪'),(8,'石桥铺'),(8,'陈家坪'),(8,'石坪桥'),(8,'九龙园区'),(8,'谢家湾'),(8,'直港大道'),(8,'西郊路'),(8,'滩子口')
	,(8,'毛线沟'),(8,'黄桷坪'),(8,'袁家岗'),(8,'二郎'),(8,'九滨路'),(8,'高九路'),(8,'巴山'),(8,'白马凼'),(8,'中梁山新城')
	,(8,'玉清寺'),(8,'歇台子'),(8,'白市驿'),(8,'九龙镇');
INSERT INTO child_domain(district_id,child_domain_name) VALUES(9,'九宫庙'),(9,'茄子溪'),(9,'跃进村');
INSERT INTO child_domain(district_id,child_domain_name) VALUES(12,'城北新区'),(12,'城南新区'),(12,'老城区'),(12,'童家溪'),(12,'蔡家'),(12,'朝阳'),(12,'东阳')
	,(12,'李家坨'),(12,'渔洞'),(12,'界石'),(12,'一品'),(12,'龙洲湾'),(12,'花溪');
-- 子域表 end
-- 地铁表begin 
INSERT INTO metro(metro_name) VALUES
	('1号线'),('2号线'),('3号线'),('6号线');
-- 地铁表end

-- 地铁站表 begin
INSERT INTO metro_station(metro_id,metro_station_name) VALUES
	(1,'朝天门'),(1,'小什字'),(1,'较场口'),(1,'七星岗'),(1,'两路口'),(1,'鹅岭'),(1,'大坪'),(1,'石油路'),(1,'歇台子')
	,(1,'石桥铺'),(1,'高庙村'),(1,'马家岩'),(1,'小龙坎'),(1,'沙坪坝'),(1,'杨公桥'),(1,'烈士墓'),(1,'磁器口'),(1,'石井坡')
	,(1,'双碑'),(1,'赖家桥'),(1,'微电园'),(1,'陈家桥'),(1,'大学城'),(1,'尖顶坡'),(1,'团山堡'),(1,'秀湖公园'),(1,'璧山城北');
	
INSERT INTO metro_station(metro_id,metro_station_name) VALUES
	(2,'较场口'),(2,'临江门'),(2,'黄花园'),(2,'大溪沟'),(2,'曾家岩'),(2,'牛角沱'),(2,'李子坝'),(2,'佛图关'),(2,'大坪'),(2,'袁家岗'),(2,'谢家湾'),(2,'杨家坪'),(2,'动物园'),(2,'大堰村')
	,(2,'马王场'),(2,'平安站'),(2,'大渡口'),(2,'新山村'),(2,'天堂堡'),(2,'建桥'),(2,'金家湾'),(2,'刘家坝'),(2,'白居寺'),(2,'大江'),(2,'鱼洞');

INSERT INTO metro_station(metro_id,metro_station_name) VALUES
	(3,'鱼洞'),(3,'金竹'),(3,'鱼胡路'),(3,'学堂湾'),(3,'大山村'),(3,'花溪'),(3,'岔路口'),(3,'九公里'),(3,'麒龙'),(3,'八公里'),(3,'二塘'),(3,'六公里'),(3,'五公里')
	,(3,'四公里'),(3,'南坪'),(3,'工贸'),(3,'铜元局'),(3,'两路口'),(3,'牛角沱'),(3,'华新街'),(3,'观音桥'),(3,'红旗河沟'),(3,'嘉州路'),(3,'郑家院子'),(3,'唐家院子')
	,(3,'狮子坪'),(3,'重庆北站'),(3,'龙头寺'),(3,'童家院子'),(3,'金渝'),(3,'金童路'),(3,'鸳鸯'),(3,'园博园'),(3,'翠云'),(3,'长福路'),(3,'回兴'),(3,'双龙'),(3,'碧津'),(3,'江北机场');
	
INSERT INTO metro_station(metro_id,metro_station_name) VALUES
	(4,'茶园'),(4,'邱家湾'),(4,'长生桥'),(4,'刘家坪'),(4,'上新街'),(4,'小什字'),(4,'大剧院'),(4,'江北城'),(4,'五里店'),(4,'红土地'),(4,'黄泥塝'),(4,'红旗河沟')
	,(4,'花卉园'),(4,'大龙山'),(4,'冉家坝'),(4,'光电园'),(4,'大竹林'),(4,'康庄站'),(4,'九曲河'),(4,'礼嘉'),(4,'金山寺'),(4,'曹家湾'),(4,'蔡家'),(4,'向家岗'),(4,'龙凤溪')
	,(4,'状元碑'),(4,'天生'),(4,'北碚'),(4,'平场'),(4,'黄茅坪'),(4,'高义口'),(4,'国博中心'),(4,'悦来');
-- 地铁站表 end
SELECT * FROM metro;
SELECT * FROM metro_station;
SELECT * FROM metro a INNER JOIN metro_station b ON a.`metro_id`=b.`metro_id`;
	
-- 区域表 begin
INSERT INTO region(region_name,) VALUES
	('渝中区'),('江北区'),('南岸区'),('高新区'),('渝北区'),('两江新区'),('沙坪坝区'),('九龙坡区'),('大渡口区'),('其他'),('北碚区'),('巴南区');
-- 区域表 end
SELECT * FROM district
SELECT * FROM region

SELECT * FROM region;
SELECT * FROM child_domain;
SELECT * FROM region a INNER JOIN child_domain b ON a.`region_id`=b.`region_id`;

-- 委托找房 begin
INSERT INTO find_house(find_house_company_name,find_house_type,find_house_city,find_house_district,find_house_trade_area,find_house_acreage,find_house_price,find_house_name,find_house_phone,find_house_state) VALUES
	('大米科技','求售','重庆','沙坪坝区','沙坪坝商圈','200-300','6030','小张','15023629468','未查看'),
	('大米科技','求租','重庆','渝北区','渝北商圈','100-200','150','张宇','15063629568','未查看'),
	('大米科技','求租','重庆','江北区','江北商圈','250-340','200','何小姐','15536629668','未查看'),
	('大米科技','求售','重庆','沙坪坝区','沙坪坝商圈','250-330','6100','许小姐','15072629768','未查看'),
	('大米科技','求售','重庆','江北区','江北商圈','230-340','6000','张先生','15423629868','未查看'),
	('大米科技','求租','重庆','渝北区','渝北商圈','200-350','140','小宇','15023629968','未查看'),
	('大米科技','求租','重庆','江北区','江北商圈','210-300','210','李先生','15323624468','未查看'),
	('大米科技','求售','重庆','沙坪坝区','沙坪坝商圈','220-300','7000','隔壁老李','15023629668','未查看'),
	('大米科技','求售','重庆','渝北区','渝北商圈','230-300','6500','隔壁老王','15223629768','未查看'),
	('大米科技','求售','重庆','沙坪坝区','沙坪坝商圈','240-300','4400','小宇','15023629468','未查看');
SELECT * FROM find_house;
-- 委托找房 end	
-- 委托找房-区域关联表
CREATE TABLE find_house_region(
	`fhr_id` INT PRIMARY KEY AUTO_INCREMENT COMMENT '编号',
	`find_house_id` INT NOT NULL COMMENT '委托找房编号',
	`child_domain_id` INT NOT NULL COMMENT '子域编号'
)ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT '委托找房-区域关联表';
-- 委托找房-区域关联表 begin
INSERT INTO find_house_region(find_house_id,child_domain_id) VALUES
	(1,1),(1,2),(1,3),(1,4),(1,5)
	,(2,10),(2,11),(2,12),(2,13),(2,14),(3,15)
	,(3,17),(3,18),(3,19),(3,16)
	,(4,25),(4,26),(4,27),(4,28)
	,(5,34),(5,35),(5,36),(5,37)
	,(6,40),(6,41),(6,42),(6,43)
	,(7,56),(7,57)
	,(8,60),(8,61)
	,(9,82),(9,83)
	,(10,100);
-- 委托找房-区域关联表 end
CREATE TABLE child_domain(
	`child_domain_id` INT PRIMARY KEY AUTO_INCREMENT COMMENT '子域编号',
	`region_id` INT NOT NULL COMMENT '区域编号',
	`child_domain_name` VARCHAR(20) NOT NULL COMMENT '子域名称'
)ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT '子域表';
SELECT
  a.`find_house_id`,a.`find_house_type`,a.`find_house_acreage`,a.`find_house_price`,a.`find_house_company_name`,a.`find_house_name`,a.`find_house_phone`,a.`find_house_time`,a.`find_house_state`
  ,c.`child_domain_id`,c.`child_domain_name`
FROM
  find_house a
  INNER JOIN find_house_region b
    ON a.`find_house_id` = b.`find_house_id`
  INNER JOIN child_domain c
    ON b.`child_domain_id` = c.`child_domain_id`;
SELECT
  find_house_id,
  find_house_type,
  find_house_acreage,
  find_house_price,
  find_house_company_name,
  find_house_name,
  find_house_phone,
  find_house_time,
  find_house_state
FROM
  find_house
WHERE find_house_type = ''
  AND find_house_company_name LIKE '%%'
  AND find_house_time > ''
  AND find_house_time < ''
  

SELECT * FROM child_domain;
SELECT * FROM find_house;
SELECT * FROM find_house_region;

UPDATE building SET house_state='' WHERE house_id=
-- 楼盘 begin
INSERT INTO building (
  trade_area_id,  -- 商圈编号
  child_domain_id, -- 子域编号
  property_id, -- 物业编号
  building_name, -- 楼盘名称
  building_addr, -- 楼盘地址
  building_rent, -- 租金范围
  building_price, -- 售价
  building_year, -- 建筑年代
  building_car, -- 停车位
  building_car_money, -- 停车费用
  building_floor, -- 栋数+楼层数
  building_houseNum, -- 下属房源数
  building_property, -- 物业公司
  building_property_money, -- 物业费用
  building_developers, -- 开发商
  building_repairtime, -- 竣工时间
  building_acreage, -- 总建筑面积
  building_level, -- 级别
  building_traffic, -- 交通状况
  building_userName, -- 更新人
  building_time, -- 更新时间
  building_sort, -- 排序
  SEO_title, -- SEO标题
  SEO_describe, -- SEO页面描述
  SEO_keyword -- SEO关键字
)
VALUES
(1,2,19,'中迪广场','[ 九龙坡 - 杨家坪 ] 正街','99-199',5000,'2010',310,10.6,'{"栋数":[{"1栋":20},{"2栋":15},{"3栋":25}]}',20,'中途物业',11.5,'牛B开发商','2013-12-12 12:12:12',2000,'纯写字楼甲级','交通。。。。。','sysadmin','2016-12-12 12:12:12',1,'测试标题','测试内容','关键字'),
(1,15,19,'中迪广场2','[ 九龙坡 - 杨家坪 ] 正街2','99-199',5100,'2008',200,12.6,'{"栋数":[{"1栋":21}]}',25,'中途物业2',12.5,'牛B开发商','2014-12-12 12:12:12',2000,'纯写字楼甲级','交通。。。。。','sysadmin','2016-12-12 12:12:12',1,'测试标题2','测试内容2','关键字2'),
(2,17,19,'中迪广场3','[ 九龙坡 - 杨家坪 ] 正街3','99-209',5200,'2009',330,13.6,'{"栋数":[{"1栋":23},{"2栋":20}]}',26,'中途物业3',13.5,'牛B开发商','2015-12-12 12:12:12',2000,'纯写字楼甲级','交通。。。。。','sysadmin','2016-12-12 12:12:12',1,'测试标题3','测试内容3','关键字3'),
(2,18,19,'中迪广场4','[ 九龙坡 - 杨家坪 ] 正街4','99-399',5400,'2007',340,14.6,'{"栋数":[{"1栋":24},{"2栋":15},{"3栋":25}]}',27,'中途物业4',14.5,'牛B开发商','2012-08-12 12:12:12',2000,'纯写字楼甲级','交通。。。。。','sysadmin','2016-12-12 12:12:12',1,'测试标题4','测试内容4','关键字4'),
(2,19,19,'中迪广场5','[ 九龙坡 - 杨家坪 ] 正街5','99-499',5500,'2011',350,15.6,'{"栋数":[{"1栋":25},{"2栋":15},{"3栋":35}]}',28,'中途物业5',15.5,'牛B开发商','2012-04-12 12:12:12',2000,'纯写字楼甲级','交通。。。。。','sysadmin','2016-12-12 12:12:12',1,'测试标题5','测试内容5','关键字5'),
(1,20,19,'中迪广场6','[ 九龙坡 - 杨家坪 ] 正街6','99-599',5600,'2012',306,16.6,'{"栋数":[{"1栋":26},{"2栋":20},{"3栋":35}]}',29,'中途物业6',16.5,'牛B开发商','2012-10-12 12:12:12',2000,'纯写字楼甲级','交通。。。。。','sysadmin','2016-12-12 12:12:12',1,'测试标题6','测试内容6','关键字6'),
(1,21,19,'中迪广场7','[ 九龙坡 - 杨家坪 ] 正街7','99-699',5700,'2013',370,17.6,'{"栋数":[{"1栋":27},{"2栋":30},{"3栋":25}]}',23,'中途物业7',17.5,'牛B开发商','2012-12-12 12:12:12',2000,'纯写字楼甲级','交通。。。。。','sysadmin','2016-12-12 12:12:12',1,'测试标题7','测试内容7','关键字7');

SELECT * FROM building a LEFT JOIN trade_area b ON a.`trade_area_id`=b.`trade_area_id`;
SELECT
  a.trade_area_id,  
  a.building_name, 
  a.building_addr, 
  a.building_rent, 
  a.building_price, 
  a.building_year, 
  a.building_car, 
  a.building_car_money, 
  a.building_floor, 
  a.building_houseNum, 
  a.building_property, 
  a.building_property_money, 
  a.building_developers, 
  a.building_repairtime, 
  a.building_acreage, 
  a.building_level, 
  a.building_traffic, 
  a.building_userName, 
  a.building_time, 
  a.building_sort, 
  a.SEO_title, 
  a.SEO_describe, 
  a.SEO_keyword,
  b.trade_area_id,
  b.trade_area_name,
  b.trade_area_text,
  b.trade_area_ishot,
  b.trade_area_sort,
  b.trade_area_state,
  b.trade_area_username,
  b.trade_area_time,
  b.trade_area_img,
  c.`child_domain_id`,
  c.`child_domain_name`,
  d.`property_id`,
  d.`property_describe`,
  d.`property_state`,
  d.`property_time`,
  d.`property_type`,
  d.`property_userName`
FROM
  building a
  LEFT JOIN trade_area b
    ON a.`trade_area_id` = b.`trade_area_id`
  LEFT JOIN child_domain c
    ON a.`child_domain_id` = c.`child_domain_id`
  LEFT JOIN property d 
    ON a.`property_id`=d.`property_id`
  LEFT JOIN district e
    ON b.`district_id` = e.`district_id` 
  LEFT JOIN city f 
    ON e.`city_id`=f.`city_id`

-- 楼盘 end
-- 楼盘图片 begin
INSERT INTO building_picture (
  building_id,
  building_picture_addr,
  building_picture_type
)
VALUES
  (1,'static/buildingImages/1.jpg','实景图')
  ,(1,'static/buildingImages/2.jpg','实景图')
  ,(1,'static/buildingImages/3.jpg','实景图')
  ,(1,'static/buildingImages/4.jpg','实景图')
  ,(1,'static/buildingImages/5.jpg','实景图');
-- 楼盘图片 end


-- 商圈 begin
INSERT INTO trade_area(district_id,trade_area_name,trade_area_text,trade_area_sort,trade_area_state,trade_area_username,trade_area_img) VALUES
	(1,'天翼商圈1','哎哟，不错哟！1',1,'已上线','admin',''),
	(1,'渝北商圈','哎哟，不错哟！2',2,'未上线','admin',''),
	(1,'江北商圈','哎哟，不错哟！3',3,'未上线','admin',''),
	(1,'浦东商圈','哎哟，不错哟！4',4,'已上线','admin',''),
	(1,'沙坪坝商圈','哎哟，不错哟！6',5,'已上线','admin',''),
	(1,'天翼商圈6','哎哟，不错哟！7',6,'未上线','admin',''),
	(3,'商圈7','哎哟，不错哟！8',7,'未上线','admin',''),
	(3,'商圈8','哎哟，不错哟！9',8,'已上线','admin',''),
	(3,'商圈9','哎哟，不错哟！10',9,'未上线','admin',''),
	(3,'商圈10','哎哟，不错哟！11',10,'已上线','admin','');
-- 商圈表 end
SELECT * FROM trade_area a LEFT JOIN district b ON a.`district_id`=b.`district_id`;

UPDATE
  trade_area
SET
  district_id = 1,
  trade_area_name = '天翼商圈1',
  trade_area_text = '哎哟，不错哟！1',
  trade_area_ishot = '否',
  trade_area_sort = 2,
  trade_area_state = '未上线',
  trade_area_username = 'admin',
  trade_area_time = '2016-12-27 10:40:26',
  trade_area_img = 'tetsuser'
WHERE trade_area_id = 10
SELECT
  a.trade_area_id,
  a.`district_id`,
  a.trade_area_name,
  a.trade_area_text,
  a.trade_area_ishot,
  a.trade_area_sort,
  a.trade_area_state,
  a.trade_area_username,
  a.trade_area_time,
  a.trade_area_img,
  b.`city_id`,
  b.`district_id`,
  b.`district_name`,
  c.`city_id`,
  c.`city_name`
FROM
  trade_area a
  LEFT JOIN district b
    ON a.`district_id` = b.`district_id` LEFT JOIN city c ON b.`city_id`=c.`city_id` ORDER BY a.trade_area_id

SELECT * FROM city WHERE city_id=;
INSERT INTO building (
  trade_area_id,  -- 商圈编号
  building_name, -- 楼盘名称
  building_addr, -- 楼盘地址
  building_rent, -- 租金范围
  building_year, -- 建筑年代
  building_car, -- 停车位
  building_car_money, -- 停车费用
  building_property, -- 物业公司
  building_property_money, -- 物业费用
  building_developers, -- 开发商
  building_repairtime, -- 竣工时间
  building_acreage, -- 总建筑面积
  building_level, -- 级别
  building_traffic, -- 交通状况
  building_userName, -- 更新人
  building_time, -- 更新时间
  building_sort -- 排序
)
VALUES
(
  1,
  '楼盘名称',
  '楼盘地址',
  '租金范围',
  '建筑年代',
  300,
  12.5,
  '物业公司',
  12.4,
  '开发商',
  '2016-12-12 12:12:12',
  2000,
  '级别',
  '交通状况',
  'admin',
  '2016-12-12 12:12:12',
  1
);

SELECT * FROM building
SELECT * FROM house

INSERT INTO house (
  building_id,
  house_name,
  house_money,
  house_type,
  house_mi,
  house_num,
  house_orientation,
  house_decoration_type,
  house_address,
  house_intime,
  house_linkman,
  house_phone,
  house_style,
  house_userName,
  house_time
)
VALUES
  (
    1,
    '测试房源',
    '500',
    '2室1厅',
    '200',
    '12层-8号',
    '南',
    '豪华装修',
    '测试地址',
    '随时入住',
    '张先生',
    '15023629468',
    '出租',
    'admin',
    '2016-12-12 12:12:12'
  );
-- 热门推荐表 begin
INSERT INTO recommend (
  recommended_id,
  recommend_cityName,
  recommend_districtName,
  recommend_trade_areatName,
  recommend_building_name,
  recommend_house_name,
  recommend_type,
  recommend_userName
)
VALUES
  (1,'重庆','沙坪坝区','测试商圈','测试楼盘','测试房源','房源','sysadmin'),
  (1,'重庆','主城区','测试商圈1','测试楼盘','','楼盘','sysadmin'),
  (1,'重庆','沙坪坝区','测试商圈2','测试楼盘','','楼盘','sysadmin'),
  (1,'重庆','主城区','测试商圈3','测试楼盘','测试房源','房源','sysadmin'),
  (1,'重庆','主城区','测试商圈4','测试楼盘','','楼盘','admin'),
  (1,'重庆','主城区','测试商圈5','测试楼盘','测试房源','房源','admin'),
  (1,'重庆','沙坪坝区','测试商圈6','测试楼盘','测试房源','房源','sysadmin');
  -- 热门推荐表 end
SELECT * FROM house
-- 房源表 begin
INSERT INTO house (
  building_id,
  house_name,
  house_money,
  house_type,
  house_mi,
  house_num,
  house_orientation,
  house_decoration_type,
  house_address,
  house_intime,
  house_linkman,
  house_phone,
  house_style,
  house_userName,
  SEO_title,
  SEO_describe,
  SEO_keyword
)
VALUES
  (1,'测试房源','500','2室1厅','200','12层-8号','南','豪华装修','测试地址','随时入住','张先生','15023629468','出租','admin','标题','页面描述','关键字'),
  (2,'测试房源1','5000','2室2厅','210','12层-8~10号','北','豪华装修','测试地址1','随时入住','李先生','15025629468','出售','admin','标题2','页面描述2','关键字2'),
  (3,'测试房源2','200','3室3厅','320','10层-7~10号','南','豪华装修','测试地址2','随时入住','王先生','15723629468','出租','admin','标题3','页面描述3','关键字3'),
  (2,'测试房源3','5500','4室2厅','250','12-13层-8~10号','南','豪华装修','测试地址3','随时入住','赵先生','15723629468','出售','admin','标题4','页面描述4','关键字4'),
  (2,'测试房源4','4000','5室2厅','330','12层-8~10号','北','豪华装修','测试地址4','随时入住','杜先生','15523629468','出售','admin','标题5','页面描述5','关键字5'),
  (4,'测试房源5','100','4室2厅','220','14层-8~10号','北','豪华装修','测试地址5','随时入住','张先生','15423649468','出租','admin','标题6','页面描述6','关键字6'),
  (5,'测试房源6','150','3室2厅','210','15层-8~10号','东','豪华装修','测试地址6','随时入住','小先生','15323329468','出租','admin','标题7','页面描述7','关键字7'),
  (6,'测试房源7','210','2室1厅','230','17层-8~10号','南','豪华装修','测试地址7','随时入住','大先生','15213629468','出租','admin','标题8','页面描述8','关键字8'),
  (6,'测试房源8','210','2室1厅','230','16层-8~10号','南','豪华装修','测试地址9','随时入住','大先生','15213629468','出租','admin','标题8','页面描述8','关键字8'),
  (7,'测试房源9','210','2室1厅','230','12层-8~10号','南','豪华装修','测试地址8','随时入住','大先生','15213629468','出租','admin','标题8','页面描述8','关键字8'),
  (8,'测试房源10','210','2室1厅','230','12层-8~10号','南','豪华装修','测试地址10','随时入住','大先生','15213629468','出租','admin','标题8','页面描述8','关键字8');
  -- 房源表 end
SELECT
  *
FROM
  house a
  LEFT JOIN building b
    ON a.`building_id` = b.`building_id`
  LEFT JOIN trade_area c
    ON b.`trade_area_id` = c.`trade_area_id`
  LEFT JOIN child_domain d
    ON b.`child_domain_id` = d.`child_domain_id`
  LEFT JOIN property e 
    ON b.`property_id`=e.`property_id`
  LEFT JOIN district f
    ON c.`district_id` = f.`district_id` 
	WHERE 1=1 AND a.`house_state` ='已上线'
	AND f.`district_id` IN(1,2,3) -- 区域

SELECT
  *
FROM
  house a










	
	