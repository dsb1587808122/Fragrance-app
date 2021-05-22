SET NAMES UTF8;
-- 先丢弃数据库 wine 如果存在的话
DROP DATABASE IF EXISTS wine;
-- 再创建数据库 wine 并设置默认的Unicode码为utf8
CREATE DATABASE wine CHARSET=UTF8;
-- 进入wine数据库
USE wine;
-- 先丢弃保存用户数据的表wine_user,如果存在的话
DROP TABLE IF EXISTS wine_user;
-- 再创建用户数据的表
CREATE TABLE wine_user(
  uid INT  PRIMARY KEY AUTO_INCREMENT,
  username VARCHAR(30) NOT NULL UNIQUE KEY,
  password VARCHAR(32) NOT NULL,
  avatar VARCHAR(50) NOT NULL DEFAULT "http://127.0.0.1:3000/img/avatar/defult.jpg",
  user_name VARCHAR(32) NOT NULL ,
  gender INT
);

-- 插入用户数据到用户数据表
INSERT INTO wine_user VALUES
(1,'ezreal','12345678','http://127.0.0.1:3000/img/avatar/ezreal.jpg','伊泽瑞尔','1'),
(2,'lakesi','12345678','http://127.0.0.1:3000/img/avatar/lax.jpg','拉克丝','0'),
(3,'jinkesi','12345678','http://127.0.0.1:3000/img/avatar/jnx.jpg','金克丝','0'),
(4,'jiakesi','12345678','http://127.0.0.1:3000/img/avatar/jax.jpg','贾克丝','1');

-- 轮播图
CREATE TABLE wine_carousel(
        uid INT PRIMARY KEY AUTO_INCREMENT,
        src VARCHAR(128)
);
INSERT INTO wine_carousel VALUES
(NULL,"http://127.0.0.1:3000/img/carousel/1.jpg"),
(NULL,"http://127.0.0.1:3000/img/carousel/2.jpg"),
(NULL,"http://127.0.0.1:3000/img/carousel/3.jpg"),
(NULL,"http://127.0.0.1:3000/img/carousel/4.jpg"),
(NULL,"http://127.0.0.1:3000/img/carousel/5.jpg"),
(NULL,"http://127.0.0.1:3000/img/carousel/6.jpg"),
(NULL,"http://127.0.0.1:3000/img/carousel/7.jpg"),
(NULL,"http://127.0.0.1:3000/img/carousel/8.jpg");

-- 所有的商品需要的數據  包括詳情頁 首頁 列表頁 分類 評價 參數 
CREATE TABLE wine_perfumes(
  uid INT PRIMARY KEY AUTO_INCREMENT,   #商品的編號
  ptitle VARCHAR(50),                   #商品的標題
  ename VARCHAR(32),                    #商品的英文名
  sku  VARCHAR(8),                      #商品的SKU
  pguige VARCHAR(8),                    #商品的規格
  pprice DECIMAL(10,2),                 #商品的價格
  fenlei VARCHAR(32),                   #商品的分類
  id INT,
  pcount VARCHAR(128),                  #商品的數量
  psrc VARCHAR(128),                    #商品的展示圖片
  details_pic1 VARCHAR(128),            #商品的詳情頁圖片1
  details_pic2 VARCHAR(128),            #商品的詳情頁圖片2
  details_pic3 VARCHAR(128),            #商品的詳情頁圖片3
  details_pic4 VARCHAR(128),            #商品的詳情頁圖片4
  details_pic5 VARCHAR(128),            #商品的詳情頁圖片5
  details_pic6 VARCHAR(128)             #商品的詳情頁圖片6
);
INSERT INTO wine_perfumes VALUES
(NULL,"ISSEY MIYAKE 三宅一生 一生之水女士淡香水 EDT 100ml","L'EAU D'ISSEY; EDT SPRAY 3.3 OZ","121717","100ml",44.79,"香水香氛",0,"1","http://127.0.0.1:3000/img/details/isseymiyake/1_1.jpg","http://127.0.0.1:3000/img/details/isseymiyake/__01.jpg","http://127.0.0.1:3000/img/details/isseymiyake/__02.jpg","http://127.0.0.1:3000/img/details/isseymiyake/__03.jpg","http://127.0.0.1:3000/img/details/isseymiyake/__04.jpg","http://127.0.0.1:3000/img/details/isseymiyake/__05.jpg","http://127.0.0.1:3000/img/details/isseymiyake/__06.jpg"),
(NULL,"LALIQUE 莱俪 墨恋男士淡香水 EDT 100ml","ENCRE NOIRE LALIQUE; EDT SPRAY 3.3 OZ","167190","100ml",31.49,"香水香氛",0,"1","http://127.0.0.1:3000/img/details/lalique/1_1.jpg","http://127.0.0.1:3000/img/details/lalique/__01.jpg","http://127.0.0.1:3000/img/details/lalique/__02.jpg","http://127.0.0.1:3000/img/details/lalique/__03.jpg","http://127.0.0.1:3000/img/details/lalique/__04.jpg","http://127.0.0.1:3000/img/details/lalique/__05.jpg","http://127.0.0.1:3000/img/details/lalique/__06.jpg"),
(NULL,"SERGE LUTENS 芦丹氏 柏林少女中性香水 EDP 50ml（新旧版本随机发货）","SERGE LUTENS LA FILLE DE BERLIN; EAU DE PARFUM SPRAY 1.6 OZ","236558","50ml",109.89,"香水香氛",0,"1","http://127.0.0.1:3000/img/details/sergelutens/1_1.jpg","http://127.0.0.1:3000/img/details/sergelutens/__01.jpg","http://127.0.0.1:3000/img/details/sergelutens/__02.jpg","http://127.0.0.1:3000/img/details/sergelutens/__03.jpg","http://127.0.0.1:3000/img/details/sergelutens/__04.jpg","http://127.0.0.1:3000/img/details/sergelutens/__05.jpg","http://127.0.0.1:3000/img/details/sergelutens/__06.jpg"),
(NULL,"【许凯/郑容和同款】HERMES 爱马仕 大地男士淡香水 EDT 100ml","TERRE D'HERMES; EDT SPRAY 3.3 OZ","146102","100ml",76.99,"香水香氛",0,"1","http://127.0.0.1:3000/img/details/hermes/1_1.jpg","http://127.0.0.1:3000/img/details/hermes/__01.jpg","http://127.0.0.1:3000/img/details/hermes/__02.jpg","http://127.0.0.1:3000/img/details/hermes/__03.jpg","http://127.0.0.1:3000/img/details/hermes/__04.jpg","http://127.0.0.1:3000/img/details/hermes/__05.jpg","http://127.0.0.1:3000/img/details/hermes/__06.jpg"),
(NULL,"MIU MIU/缪缪 玫瑰之水女士淡香水 EDT 100ML","MIU MIU L'EAU ROSEE; EDT SPRAY 1.7 OZ","313334","100ml",90.99,"香水香氛",0,"1","http://127.0.0.1:3000/img/details/miumiu/1_1.jpg","http://127.0.0.1:3000/img/details/miumiu/__01.jpg","http://127.0.0.1:3000/img/details/miumiu/__02.jpg","http://127.0.0.1:3000/img/details/miumiu/__03.jpg","http://127.0.0.1:3000/img/details/miumiu/__04.jpg","http://127.0.0.1:3000/img/details/miumiu/__05.jpg","http://127.0.0.1:3000/img/details/miumiu/__06.jpg"),
(NULL,"DAVIDOFF 大卫杜夫 冷水女士淡香水 EDT 100ml","COOL WATER; EDT SPRAY 3.4 OZ","118706","100ml",19.59,"香水香氛",0,"1","http://127.0.0.1:3000/img/details/davidoff/1_1.jpg","http://127.0.0.1:3000/img/details/davidoff/__01.jpg","http://127.0.0.1:3000/img/details/davidoff/__02.jpg","http://127.0.0.1:3000/img/details/davidoff/__03.jpg","http://127.0.0.1:3000/img/details/davidoff/__04.jpg","http://127.0.0.1:3000/img/details/davidoff/__05.jpg","http://127.0.0.1:3000/img/details/davidoff/__06.jpg"),
(NULL,"Salvatore Ferragamo 菲拉格慕 芭蕾女伶（伊人女士）女士香水 EDP 100ml","SIGNORINA; EAU DE PARFUM SPRAY 3.4 OZ","230729","100ml",37.09,"香水香氛",0,"1","http://127.0.0.1:3000/img/details/salvatoreferragamo/1_1.jpg","http://127.0.0.1:3000/img/details/salvatoreferragamo/__01.jpg","http://127.0.0.1:3000/img/details/salvatoreferragamo/__02.jpg","http://127.0.0.1:3000/img/details/salvatoreferragamo/__03.jpg","http://127.0.0.1:3000/img/details/salvatoreferragamo/__04.jpg","http://127.0.0.1:3000/img/details/salvatoreferragamo/__05.jpg","http://127.0.0.1:3000/img/details/salvatoreferragamo/__06.jpg"),
(NULL,"Elizabeth Taylor 伊丽莎白泰勒 栀子花女士香水 EDP 100ml","GARDENIA ELIZABETH TAYLOR; EAU DE PARFUM SPRAY 3.3 OZ","138863","100ml",16.09,"香水香氛",0,"1","http://127.0.0.1:3000/img/details/elizabethtaylor/1_1.jpg","http://127.0.0.1:3000/img/details/elizabethtaylor/__01.jpg","http://127.0.0.1:3000/img/details/elizabethtaylor/__02.jpg","http://127.0.0.1:3000/img/details/elizabethtaylor/__03.jpg","http://127.0.0.1:3000/img/details/elizabethtaylor/__04.jpg","http://127.0.0.1:3000/img/details/elizabethtaylor/__05.jpg","http://127.0.0.1:3000/img/details/elizabethtaylor/__06.jpg"),
(NULL,"Marc Jacobs 马克雅可布 梦幻小雏菊（雏菊之梦）女士淡香水 EDT 100ml","MARC JACOBS DAISY DREAM; EDT SPRAY 3.4 OZ","256055","100ml",48.99,"香水香氛",0,"1","http://127.0.0.1:3000/img/details/marcjacobs/1_1.jpg","http://127.0.0.1:3000/img/details/marcjacobs/__01.jpg","http://127.0.0.1:3000/img/details/marcjacobs/__02.jpg","http://127.0.0.1:3000/img/details/marcjacobs/__03.jpg","http://127.0.0.1:3000/img/details/marcjacobs/__04.jpg","http://127.0.0.1:3000/img/details/marcjacobs/__05.jpg","http://127.0.0.1:3000/img/details/marcjacobs/__06.jpg"),
(NULL,"Narciso Rodriguez 纳茜素/纳西素 她的同名女士淡香水 EDT 100ml","NARCISO RODRIGUEZ; EDT SPRAY 3.3 OZ","140434","100ml",66.49,"香水香氛",0,"1","http://127.0.0.1:3000/img/details/narciso/1_1.jpg","http://127.0.0.1:3000/img/details/narciso/__01.jpg","http://127.0.0.1:3000/img/details/narciso/__02.jpg","http://127.0.0.1:3000/img/details/narciso/__03.jpg","http://127.0.0.1:3000/img/details/narciso/__04.jpg","http://127.0.0.1:3000/img/details/narciso/__05.jpg","http://127.0.0.1:3000/img/details/narciso/__06.jpg"),
(NULL,"Narciso Rodriguez 纳茜素/纳西素 她的同名女士淡香水 EDT 50ml","NARCISO RODRIGUEZ; EAU DE PARFUM SPRAY 1.6 OZ","148467","50ml",53.89,"香水香氛",0,"1","http://127.0.0.1:3000/img/details/narciso1/1_1.jpg","http://127.0.0.1:3000/img/details/narciso1/__01.jpg","http://127.0.0.1:3000/img/details/narciso1/__02.jpg","http://127.0.0.1:3000/img/details/narciso1/__03.jpg","http://127.0.0.1:3000/img/details/narciso1/__04.jpg","http://127.0.0.1:3000/img/details/narciso1/__05.jpg","http://127.0.0.1:3000/img/details/narciso1/__06.jpg"),
(NULL,"COACH 蔻驰 New York 女士香水 EDP 30ml","COACH; EAU DE PARFUM SPRAY 1 OZ","289430","30ml",24.49,"香水香氛",0,"1","http://127.0.0.1:3000/img/details/coach1/1_1.jpg","http://127.0.0.1:3000/img/details/coach1/__01.jpg","http://127.0.0.1:3000/img/details/coach1/__02.jpg","http://127.0.0.1:3000/img/details/coach1/__03.jpg","http://127.0.0.1:3000/img/details/coach1/__04.jpg","http://127.0.0.1:3000/img/details/coach1/__05.jpg","http://127.0.0.1:3000/img/details/coach1/__06.jpg"),
(NULL,"COACH 蔻驰 水漾之花香女士香水 EDP 50ml","COACH FLORAL; EAU DE PARFUM SPRAY 1.7 OZ","308665","50ml",32.89,"香水香氛",0,"1","http://127.0.0.1:3000/img/details/coach2/1_1.jpg","http://127.0.0.1:3000/img/details/coach2/__01.jpg","http://127.0.0.1:3000/img/details/coach2/__02.jpg","http://127.0.0.1:3000/img/details/coach2/__03.jpg","http://127.0.0.1:3000/img/details/coach2/__04.jpg","http://127.0.0.1:3000/img/details/coach2/__05.jpg","http://127.0.0.1:3000/img/details/coach2/__06.jpg"),
(NULL,"COACH 蔻驰 同名款男士淡香水 EDT 40ml","COACH FOR MEN; EDT SPRAY 1.3 OZ","310742","40ml",22.39,"香水香氛",0,"1","http://127.0.0.1:3000/img/details/coach/1_1.jpg","http://127.0.0.1:3000/img/details/coach/__01.jpg","http://127.0.0.1:3000/img/details/coach/__02.jpg","http://127.0.0.1:3000/img/details/coach/__03.jpg","http://127.0.0.1:3000/img/details/coach/__04.jpg","http://127.0.0.1:3000/img/details/coach/__05.jpg","http://127.0.0.1:3000/img/details/coach/__06.jpg"),
(NULL,"COACH 蔻驰 同名款男士淡香水 EDT 100ml","COACH PLATINUM; EAU DE PARFUM SPRAY 3.3 OZ","314403","100ml",40.59,"香水香氛",0,"1","http://127.0.0.1:3000/img/details/coach/1_1.jpg","http://127.0.0.1:3000/img/details/coach/__01.jpg","http://127.0.0.1:3000/img/details/coach/__02.jpg","http://127.0.0.1:3000/img/details/coach/__03.jpg","http://127.0.0.1:3000/img/details/coach/__04.jpg","http://127.0.0.1:3000/img/details/coach/__05.jpg","http://127.0.0.1:3000/img/details/coach/__06.jpg"),
(NULL,"【卜凡同款】Versace 范思哲 经典男性淡香水 EDT 50ml","VERSACE SIGNATURE; EDT SPRAY 1.7 OZ","159889","50ml",35.69,"香水香氛",0,"1","http://127.0.0.1:3000/img/details/versace/1_1.jpg","http://127.0.0.1:3000/img/details/versace/__01.jpg","http://127.0.0.1:3000/img/details/versace/__02.jpg","http://127.0.0.1:3000/img/details/versace/__03.jpg","http://127.0.0.1:3000/img/details/versace/__04.jpg","http://127.0.0.1:3000/img/details/versace/__05.jpg","http://127.0.0.1:3000/img/details/versace/__06.jpg"),
(NULL,"【吴亦凡同款】BVLGARI 宝格丽 活力海洋（海蓝）男士淡香水 EDT 100ml","BVLGARI AQUA MARINE; EDT SPRAY 3.4 OZ","158918","100ml",48.99,"香水香氛",0,"1","http://127.0.0.1:3000/img/details/bvlgari2/1_1.jpg","http://127.0.0.1:3000/img/details/bvlgari2/__01.jpg","http://127.0.0.1:3000/img/details/bvlgari2/__02.jpg","http://127.0.0.1:3000/img/details/bvlgari2/__03.jpg","http://127.0.0.1:3000/img/details/bvlgari2/__04.jpg","http://127.0.0.1:3000/img/details/bvlgari2/__05.jpg","http://127.0.0.1:3000/img/details/bvlgari2/__06.jpg"),
(NULL,"【安吉丽娜朱莉同款】BVLGARI 宝格丽 黑茶中性淡香水 EDT 75ml","BVLGARI BLACK; EDT SPRAY 2.5 OZ","120200","75ml",46.19,"香水香氛",0,"1","http://127.0.0.1:3000/img/details/bvlgari1/1_1.jpg","http://127.0.0.1:3000/img/details/bvlgari1/__01.jpg","http://127.0.0.1:3000/img/details/bvlgari1/__02.jpg","http://127.0.0.1:3000/img/details/bvlgari1/__03.jpg","http://127.0.0.1:3000/img/details/bvlgari1/__04.jpg","http://127.0.0.1:3000/img/details/bvlgari1/__05.jpg","http://127.0.0.1:3000/img/details/bvlgari1/__06.jpg"),
(NULL,"CLARINS 娇韵诗 弹簧霜 焕颜紧致/新生紧肤晚霜50ml （适合所有肤质使用）焕颜弹力晚霜","--Clarins; night care; Extra-Firming Nuit Wrinkle Control, Regenerating Night Cream - All Skin Types --50ml/1.6oz","307699","50ml",99.39,"面部护理",1,"1","http://127.0.0.1:3000/img/details/hufu/_1.jpg",NULL,NULL,NULL,NULL,NULL,NULL),
(NULL,"SHISEIDO 资生堂 水活焕妍去角质面膜 75ml","--Shiseido; cleanser; Purifying Mask --75ml/3.2oz","291031","75ml",23.09,"面部护理",1,"1","http://127.0.0.1:3000/img/details/hufu/_2.jpg",NULL,NULL,NULL,NULL,NULL,NULL),
(NULL,"Sisley 希思黎 全能乳液 125ml","--Sisley; day care; Sisley Ecological Compound Day & Night (With Pump)--125ml/4.2oz; 02876183101","131347","125ml",172.19,"面部护理",1,"1","http://127.0.0.1:3000/img/details/hufu/_3.jpg",NULL,NULL,NULL,NULL,NULL,NULL),
(NULL,"CLARINS 娇韵诗 多效修复抗皱抗氧化日霜（适合所有肤质）50ml","--Clarins; day care; Multi-Active Day Targets Fine Lines Antioxidant Day Cream - For All Skin Types --50ml/1.6oz","288943","50ml",23.09,"面部护理",1,"1","http://127.0.0.1:3000/img/details/hufu/_4.jpg",NULL,NULL,NULL,NULL,NULL,NULL),
(NULL,"CLARINS 娇韵诗 花样年华修护紧致精华液 保湿祛痘 所有肤质适用 30ml","--Clarins; night care; Super Restorative Remodelling Serum --30ml/1oz","288506","30ml",80.49,"肌肤护理",2,"1","http://127.0.0.1:3000/img/details/hufu/_5.jpg",NULL,NULL,NULL,NULL,NULL,NULL),
(NULL,"Valmont法尔曼 冰凝金装精华乳全效修护精华紧致补水亮肤 30ml","--Valmont; night care; Elixir Des Glaciers Serum Precieux Votre Visage - Swiss Poly-Active Essence ( New Packing ) --30ml/1oz","198835","30ml",436.09,"肌肤护理",2,"1","http://127.0.0.1:3000/img/details/hufu/_6.jpg",NULL,NULL,NULL,NULL,NULL,NULL),
(NULL,"CLARINS 娇韵诗 水润丰盈唇膏 色号# 06 Fig 3.5g","Clarins; Lip Color; Joli Rouge Brillant (Perfect Shine Sheer Lipstick) - # 06 Fig --3.5g/0.12oz","179473","3.5g",23.09,"人气美妆",3,"1","http://127.0.0.1:3000/img/details/hufu/_7.jpg",NULL,NULL,NULL,NULL,NULL,NULL),
(NULL,"Sisley 希思黎 植物星灿防水眼线笔  0.3g # 1 Sparkling Black","Sisley; Brow & Liner; Phyto Khol Star Waterproof - # 1 Sparkling Black --0.3g/0.01oz","307678","0.3g",30.79,"人气美妆",3,"1","http://127.0.0.1:3000/img/details/hufu/_8.jpg",NULL,NULL,NULL,NULL,NULL,NULL),
(NULL,"YANKEE CANDLE MID SUMMER NIGHT香氛蜡烛 623g","S-YANKEE CANDLE; MID SUMMER NIGHT SCENTED LARGE JAR 22 OZ","275390","623g",23.79,"香薰蜡烛",4,"1","http://127.0.0.1:3000/img/details/hufu/_9.jpg",NULL,NULL,NULL,NULL,NULL,NULL),
(NULL,"Exceptional Parfums 创世香氛 锥形玻璃瓶装蜡烛 苹果木香味 1个","-APPLE WOOD - LIMITED EDITION; APPLE WOOD SCENTED 6 OZ TAPERED GLASS JAR CANDLE.","209946",NULL,12.59,"香薰蜡烛",4,"1","http://127.0.0.1:3000/img/details/hufu/_10.jpg",NULL,NULL,NULL,NULL,NULL,NULL),
(NULL,"LORENZO VILLORESI 威劳瑞希 马黛茶中性淡香水 EDT 50ml","LORENZO VILLORESI FIRENZE YERBAMATE; EDT SPRAY 1.6 OZ","282416","50ml",65.09,"新品上线",5,"1","http://127.0.0.1:3000/img/details/hufu/_11.jpg",NULL,NULL,NULL,NULL,NULL,NULL),
(NULL,"Gucci 古驰 罪爱纯香女士香水 EDP 90ml","GUCCI GUILTY ABSOLUTE POUR FEMME; EAU DE PARFUM SPRAY 3 OZ","306314","90ml",84.69,"新品上线",5,"1","http://127.0.0.1:3000/img/details/hufu/_12.jpg",NULL,NULL,NULL,NULL,NULL,NULL),
(NULL,"AMERICAN CREW 男士强效造型定型中等哑光发蜡 85g","----AMERICAN CREW; HC_STYLING; FORMING CREAM FOR MEDIUM HOLD AND NATURAL SHINE 3 OZ (PACKAGING MAY VARY)","131825","85g",9.79,"洗护造型",6,"1","http://127.0.0.1:3000/img/details/hufu/_13.jpg",NULL,NULL,NULL,NULL,NULL,NULL),
(NULL,"GUCCI古驰 Bloom花悦绽放女士香水套装（花悦绽放女士香水100ml+花悦绽放身体按摩油100ml+香皂100g）","GUCCI BLOOM; SET-EAU DE PARFUM SPRAY 3.3 OZ & BODY OIL 3.3 OZ & SOAP 3.5 OZ","346370",NULL,146.99,"礼盒套装",7,"1","http://127.0.0.1:3000/img/details/hufu/_14.jpg",NULL,NULL,NULL,NULL,NULL,NULL);


-- 分類
CREATE TABLE fenlei(
  fid INT,
  fenlei VARCHAR(32),
  fsrc VARCHAR(128)
);
INSERT INTO fenlei VALUES
(0,"香水香氛","http://127.0.0.1:3000/img/fenlei/xsxf.png"),
(1,"面部护理","http://127.0.0.1:3000/img/fenlei/mbhl.png"),
(2,"肌肤护理","http://127.0.0.1:3000/img/fenlei/jfhl.png"),
(3,"人气美妆","http://127.0.0.1:3000/img/fenlei/rqmz.png"),
(4,"香薰蜡烛","http://127.0.0.1:3000/img/fenlei/xxlz.png"),
(5,"新品上线","http://127.0.0.1:3000/img/fenlei/xpsx.png"),
(6,"洗护造型","http://127.0.0.1:3000/img/fenlei/xhzx.png"),
(7,"礼盒套装","http://127.0.0.1:3000/img/fenlei/lhtz.png");