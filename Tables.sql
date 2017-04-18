USE taogc;
-- 管理员表
CREATE TABLE t_systemuser(
	`t_id` INT PRIMARY KEY AUTO_INCREMENT COMMENT '编号',
	`t_user` VARCHAR(20) NOT NULL COMMENT '账号',
	`t_name` VARCHAR(20) NOT NULL COMMENT '管理员名字',
	`t_mobilphone` VARCHAR(15) COMMENT '联系电话',
	`t_status` VARCHAR(20) NOT NULL COMMENT '状态：启用/禁用',
	`t_createtime` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '创建时间',
	`t_password` VARCHAR(50) NOT NULL COMMENT '密码'
)ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT '管理员表';
SELECT * FROM t_systemuser
-- 城市表
CREATE TABLE city(
	`city_id` INT PRIMARY KEY AUTO_INCREMENT COMMENT '编号',
	`city_name` VARCHAR(50) COMMENT '城市名称'
)ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT '城市表';

-- 区县表
CREATE TABLE district(
	`district_id` INT PRIMARY KEY AUTO_INCREMENT COMMENT '编号',
	`city_id` INT COMMENT '城市编号',
	`district_name` VARCHAR(50) COMMENT '区县名称'
)ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT '区县表';

-- 子域表
CREATE TABLE child_domain(
	`child_domain_id` INT PRIMARY KEY AUTO_INCREMENT COMMENT '子域编号',
	`district_id` INT NOT NULL COMMENT '区县编号',
	`child_domain_name` VARCHAR(20) NOT NULL COMMENT '子域名称'
)ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT '子域表';

SELECT * FROM city a LEFT JOIN district b ON a.`city_id`=b.`city_id`
-- 业主放盘表
CREATE TABLE Owner_building(
	`Owner_building_id` INT PRIMARY KEY AUTO_INCREMENT COMMENT '编号',
	`Owner_building_type` VARCHAR(10) NOT NULL COMMENT '类型 出售/出租',
	`Owner_building_buildingname` VARCHAR(50) COMMENT '楼盘名称',
	`Owner_building_name` VARCHAR(100) NOT NULL COMMENT '大厦名称',
	`Owner_building_number` VARCHAR(30) NOT NULL COMMENT '楼层+房号 12层-8号',
	`Owner_building_mi` FLOAT NOT NULL COMMENT '建筑面积',
	`Owner_building_price` FLOAT NOT NULL COMMENT '出租/出售价格',
	`Owner_building_linkman` VARCHAR(30) NOT NULL COMMENT '联系人',
	`Owner_building_phone` VARCHAR(20) NOT NULL COMMENT '联系电话',
	`Owner_building_time` TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '提交时间',
	`Owner_building_state` VARCHAR(20) COMMENT '状态'
)ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT '业主放盘表';

-- 地铁表
CREATE TABLE metro(
	`metro_id` INT PRIMARY KEY AUTO_INCREMENT COMMENT '地铁编号',
	`metro_name` VARCHAR(20) NOT NULL COMMENT '地铁名'
)ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT '地铁表';

-- 地铁站表
CREATE TABLE metro_station(
	`metro_station_id` INT PRIMARY KEY AUTO_INCREMENT COMMENT '地铁站编号',
	`metro_id` INT NOT NULL COMMENT '地铁编号',
	`metro_station_name` VARCHAR(50) NOT NULL COMMENT '地铁站名'
)ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT '地铁站表';
	
-- 区域表
CREATE TABLE region(
	`region_id` INT PRIMARY KEY AUTO_INCREMENT COMMENT '区域编号',
	`district_id` INT COMMENT '区县编号',
	`region_name` VARCHAR(20) NOT NULL COMMENT '区域名称',
	`region_Abbreviation` VARCHAR(10) COMMENT '区域简称'
)ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT '区域表';

-- 子域表
CREATE TABLE child_domain(
	`child_domain_id` INT PRIMARY KEY AUTO_INCREMENT COMMENT '子域编号',
	`region_id` INT NOT NULL COMMENT '区域编号',
	`child_domain_name` VARCHAR(20) NOT NULL COMMENT '子域名称'
)ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT '子域表';

-- 区域表-地铁站关系表
CREATE TABLE region_metro_station(
	`rms_id` INT PRIMARY KEY AUTO_INCREMENT COMMENT '关系编号',
	`region_id` INT NOT NULL COMMENT '区域编号',
	`metro_station_id`  INT NOT NULL COMMENT '地铁站编号'
)ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT '区域表-地铁站关系表';

-- 委托找房表
CREATE TABLE find_house(
	`find_house_id` INT PRIMARY KEY AUTO_INCREMENT COMMENT '委托找房编号',
	`find_house_company_name` VARCHAR(50) COMMENT '公司名称',
	`find_house_type` VARCHAR(20) NOT NULL COMMENT '房源类型 求租\求售',
	`find_house_city` VARCHAR(40) COMMENT '城市',
	`find_house_district` VARCHAR(100) COMMENT '区域',
	`find_house_trade_area` VARCHAR(50) COMMENT '商圈',
	`find_house_acreage` FLOAT NOT NULL COMMENT '期望面积',
	`find_house_price` FLOAT  NOT NULL COMMENT '期望价格',
	`find_house_name` VARCHAR(50) NOT NULL COMMENT '联系人',
	`find_house_phone` VARCHAR(20) NOT NULL COMMENT '联系电话',
	`find_house_time` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '提交时间',
	`find_house_state` VARCHAR(20) COMMENT '状态'
)ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT '委托找房表';

-- 委托找房-区域关联表
CREATE TABLE find_house_region(
	`fhr_id` INT PRIMARY KEY AUTO_INCREMENT COMMENT '编号',
	`find_house_id` INT NOT NULL COMMENT '委托找房编号',
	`child_domain_id` INT NOT NULL COMMENT '子域编号'
)ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT '委托找房-区域关联表';
	
-- 物业表
CREATE TABLE property(
	`property_id` INT PRIMARY KEY AUTO_INCREMENT COMMENT '编号',
	`property_type` VARCHAR(30) COMMENT '物业类型',
	`property_describe` VARCHAR(200) COMMENT '类型描述',
	`property_state` VARCHAR(10) DEFAULT '未上线' NOT NULL COMMENT '状态：未上线 or 已上线',
	`property_userName` VARCHAR(20) COMMENT '更新人',
 	`property_time` TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间'
)ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT '物业表';

-- 商圈表
CREATE TABLE `trade_area`(
	`trade_area_id` INT PRIMARY KEY AUTO_INCREMENT COMMENT '编号',
	`district_id` INT COMMENT '区县编号',
	`trade_area_name` VARCHAR(50) COMMENT '商圈名称',
	`trade_area_text` VARCHAR(200) COMMENT '商圈介绍',
	`trade_area_ishot` VARCHAR(4) DEFAULT '否' COMMENT '热门推荐',
	`trade_area_sort` INT COMMENT '排序',
	`trade_area_state` VARCHAR(10) DEFAULT '未上线' COMMENT '状态：未上线 or 已上线',
	`trade_area_username` VARCHAR(50) COMMENT '更新人',
	`trade_area_time` TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
	`trade_area_img` VARCHAR(200) COMMENT '商圈预览图url'
)ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT '商圈表';

-- 楼盘表
CREATE TABLE building(
	`building_id` INT PRIMARY KEY AUTO_INCREMENT COMMENT '编号',
	`trade_area_id` INT NOT NULL COMMENT '商圈编号',
	`child_domain_id` INT COMMENT '子域编号',
	`property_id` INT COMMENT '物业编号',
	`building_name` VARCHAR(50) NOT NULL COMMENT '楼盘名称',
	`building_addr` VARCHAR(100) NOT NULL COMMENT '楼盘地址',
	`building_rent` VARCHAR(20) COMMENT '租金范围',
	`building_price` FLOAT COMMENT '售价',
	`building_year` VARCHAR(20) COMMENT '建筑年代',
	`building_car` INT COMMENT '停车位',
	`building_car_money` FLOAT COMMENT '停车费用',
	`building_floor` VARCHAR(100) COMMENT '栋数+楼层数',
	`building_houseNum` INT COMMENT '下属房源数',
	`building_property` VARCHAR(50) COMMENT '物业公司',
	`building_property_money` FLOAT COMMENT '物业费用',
	`building_developers` VARCHAR(50) COMMENT '开发商',
	`building_repairtime` TIMESTAMP COMMENT '竣工时间',
	`building_acreage` FLOAT COMMENT '总建筑面积',
	`building_level` VARCHAR(20) COMMENT '级别',
	`building_traffic` VARCHAR(500) COMMENT '交通状况',
	`building_isHot` VARCHAR(10) DEFAULT '否' COMMENT '是否热门',
	`building_state` VARCHAR(10) DEFAULT '未上线' NOT NULL COMMENT '状态：未上线 or 已上线',
	`building_userName` VARCHAR(20) COMMENT '更新人',
	`building_time` TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
	`building_sort` INT COMMENT '排序',
	`longitude` VARCHAR(20) COMMENT '经度',
	`latitude` VARCHAR(20) COMMENT '纬度',
	`SEO_title` VARCHAR(100) COMMENT 'SEO标题',
	`SEO_describe` VARCHAR(200) COMMENT 'SEO页面描述',
	`SEO_keyword` VARCHAR(100) COMMENT 'SEO关键字',
	`building_abridgeName` VARCHAR(10) COMMENT '楼盘名称缩写'
)ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT '楼盘表';
SELECT * FROM building
-- 楼盘图片表
CREATE TABLE building_picture(
	`building_picture_id` INT PRIMARY KEY AUTO_INCREMENT COMMENT '编号',
	`building_id` INT NOT NULL COMMENT '楼盘编号',
	`building_picture_addr` VARCHAR(200) NOT NULL COMMENT '图片地址',
	`building_picture_type` VARCHAR(20) COMMENT '图片类型'
)ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT '楼盘图片表';

-- 房源表
CREATE TABLE house(
	`house_id` INT PRIMARY KEY AUTO_INCREMENT COMMENT '编号',
	`building_id` INT COMMENT '楼盘编号',
	`child_domain_id` INT COMMENT '子域编号',
	`house_name` VARCHAR(100) NOT NULL COMMENT '名称',
	`house_money` FLOAT NOT NULL COMMENT '价格',
	`house_type` VARCHAR(20) NOT NULL COMMENT '户型',
	`house_mi` INT NOT NULL COMMENT '面积',
	`house_num` VARCHAR(20) NOT NULL COMMENT '楼层+房号',
	`house_orientation` VARCHAR(10) COMMENT '朝向',
	`house_decoration_type` VARCHAR(20) COMMENT '装修类型',
	`house_address` VARCHAR(100) COMMENT '地址',
	`house_intime` VARCHAR(20) COMMENT '入住时间',
	`house_linkman` VARCHAR(20) COMMENT '联系人',
	`house_phone` VARCHAR(20) COMMENT '联系电话',
	`house_sale_state` VARCHAR(20) COMMENT '销售状态',
	`house_style` VARCHAR(20) COMMENT '房源类型',
	`house_ishot` VARCHAR(20) DEFAULT '否' COMMENT '是否热门',
	`house_state` VARCHAR(20) DEFAULT '未上线' NOT NULL COMMENT '状态：未上线 or 已上线',
	`longitude` VARCHAR(20) COMMENT '经度',
	`latitude` VARCHAR(20) COMMENT '纬度',
	`house_userName` VARCHAR(20) COMMENT '更新人',
	`house_time` TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
	`SEO_title` VARCHAR(100) COMMENT 'SEO标题',
	`SEO_describe` VARCHAR(200) COMMENT 'SEO页面描述',
	`SEO_keyword` VARCHAR(100) COMMENT 'SEO关键字'
)ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT '房屋表';
SELECT * FROM house
-- 房源图片表
CREATE TABLE house_picture(
	`house_picture_id` INT PRIMARY KEY AUTO_INCREMENT COMMENT '房屋图片编号',
	`house_id` INT NOT NULL COMMENT '编号',
	`house_picture_addr` VARCHAR(200) NOT NULL COMMENT '图片地址',
	`house_picture_type` VARCHAR(20) COMMENT '图片类型'
)ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT '房源图片表';

-- 热门推荐表
CREATE TABLE recommend(
	`recommend_id` INT PRIMARY KEY AUTO_INCREMENT COMMENT '热门推荐编号',
	`recommended_id` INT NOT NULL COMMENT '被推荐者编号',
	`recommend_cityName` VARCHAR(20) COMMENT '城市名称',
	`recommend_districtName` VARCHAR(20) COMMENT '区县名称',
	``house`` VARCHAR(100) COMMENT '商圈名称',
	`recommend_building_name` VARCHAR(100) COMMENT '楼盘名称',
	`recommend_house_name` VARCHAR(100) COMMENT '房源名称',
	`recommend_type` VARCHAR(20) COMMENT '推荐类别:房源，楼盘',
	`recommend_state` VARCHAR(20) DEFAULT '未上线' NOT NULL COMMENT '状态：未上线 or 已上线',
	`recommend_userName` VARCHAR(20) COMMENT '更新人',
	`recommend_time` TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间'
)ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT '热门推荐表';
SELECT * FROM recommend
-- 房源配套设施表
CREATE TABLE supporting_facilities(
	`supporting_facilities_id` INT PRIMARY KEY AUTO_INCREMENT COMMENT '编号',
	`supporting_facilities_name` VARCHAR(20) NOT NULL COMMENT '名称',
	`supporting_facilities_addr` VARCHAR(200) COMMENT '图标地址',
	`supporting_facilities_state` VARCHAR(10) DEFAULT '未上线' COMMENT '状态：已上线/未上线',
	`supporting_facilities_userName` VARCHAR(20) COMMENT '修改人',	
	`supporting_facilities_time` TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间'
)ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT '房源配套设施表';
SELECT * FROM supporting_facilities;
-- 房源表-配套设施表关系表
CREATE TABLE house_supporting_facilities(
	`hsf_id` INT PRIMARY KEY AUTO_INCREMENT COMMENT '编号',
	`supporting_facilities_id` INT NOT NULL COMMENT '配套设施编号',
	`house_id` INT NOT NULL COMMENT '房源编号'
)ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT '房源表-配套设施表关系表';
DELETE FROM house_supporting_facilities WHERE house_id IN(1)
SELECT
  a.`supporting_facilities_id`,a.`house_id`,b.`supporting_facilities_name`
FROM
  house_supporting_facilities a
  LEFT JOIN supporting_facilities b
    ON a.`supporting_facilities_id` = b.`supporting_facilities_id` WHERE a.`house_id`=13
-- 房源特色表
CREATE TABLE house_feature(
	`house_feature_id` INT PRIMARY KEY AUTO_INCREMENT COMMENT '编号',
	`house_feature_name` VARCHAR(20) NOT NULL COMMENT '名称'
)ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT '房源特色表';

-- 房源表-特色表关系表
CREATE TABLE house_house_feature(
	`hhf_id` INT PRIMARY KEY AUTO_INCREMENT COMMENT '编号',
	`house_feature_id` INT NOT NULL COMMENT '特色编号',
	`house_id` INT NOT NULL COMMENT '房源编号'
)ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT '房源特色表';

-- 房源类型表
CREATE TABLE house_type(
	`house_type_id` INT PRIMARY KEY AUTO_INCREMENT COMMENT '编号',
	`house_type_name` VARCHAR(50) NOT NULL COMMENT '名称'
)ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT '房源类型表';

-- 房源-房源类型关系表
CREATE TABLE house_house_type(
	`hht_id` INT PRIMARY KEY AUTO_INCREMENT COMMENT '编号',
	`house_type_id` INT NOT NULL COMMENT '类型编号',
	`house_id` INT NOT NULL COMMENT '房源编号'
)ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT '房源-房源类型关系表';


-- 用户端首页banner表
CREATE TABLE t_indexbanner(
	`t_id` INT PRIMARY KEY AUTO_INCREMENT COMMENT '编号',
	`t_url` VARCHAR(200) COMMENT '路径',
	`t_title` VARCHAR(50) COMMENT '标题',
	`t_picture` VARCHAR(200) COMMENT '图片',
	`t_sort` INT NOT NULL COMMENT '排序',
	`t_status` VARCHAR(20) COMMENT '状态'
)ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT '用户端首页banner表';


-- 购房知识表
CREATE TABLE knowledge(
	`knowledge_id` INT PRIMARY KEY AUTO_INCREMENT COMMENT '编号',
	`knowledge_table` VARCHAR(200) NOT NULL COMMENT '标题',
	`knowledge_url` VARCHAR(200) NOT NULL COMMENT '页面url',
	`knowledge_miurl` VARCHAR(200) COMMENT '小图url',
	`knowledge_describe` VARCHAR(100) COMMENT '描述',
	`knowledge_state` VARCHAR(10) DEFAULT '未上线' COMMENT '状态：已上线/未上线',
	`knowledge_userName` VARCHAR(20) COMMENT '修改人',	
	`knowledge_time` TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间'
)ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT '购房知识表';

-- 行业动态表
CREATE TABLE information(
	`information_id` INT PRIMARY KEY AUTO_INCREMENT COMMENT '编号',
	`information_name` VARCHAR(200) NOT NULL COMMENT '标题',
	`information_url` VARCHAR(200) NOT NULL COMMENT '页面url',
	`information_miurl` VARCHAR(200) COMMENT '小图url',
	`information_describe` VARCHAR(100) COMMENT '描述',
	`information_state` VARCHAR(10) DEFAULT '未上线' COMMENT '状态：已上线/未上线',
	`information_userName` VARCHAR(20) COMMENT '修改人',	
	`information_time` TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间'
)ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT '行业动态表';

-- 文章源表
CREATE TABLE article_source(
	`article_source_id` INT PRIMARY KEY AUTO_INCREMENT COMMENT '编号',
	`article_source_title` VARCHAR(100) COMMENT '标题',
	`article_source_keyword` VARCHAR(40) COMMENT '关键字',
	`article_source_source` VARCHAR(20) COMMENT '来源',
	`article_source_userName` VARCHAR(20) COMMENT '修改人',	
	`article_source_time` TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
	`SEO_title` VARCHAR(100) COMMENT 'SEO标题',
	`SEO_describe` VARCHAR(200) COMMENT 'SEO页面描述',
	`SEO_keyword` VARCHAR(100) COMMENT 'SEO关键字'
)ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT '文章源表';

-- 面积表
CREATE TABLE acreage(
	`acreage_id` INT PRIMARY KEY AUTO_INCREMENT COMMENT '编号',
	`acreage_value` VARCHAR(50) NOT NULL COMMENT '面积值'
)ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT '面积表，用于搜索时候的列表值';