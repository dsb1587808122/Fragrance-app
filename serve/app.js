// 加载Express模块
const express = require('express');

//加载MD5模块
// const md5 = require('md5');

// 加载CORS模块
const cors = require('cors');

// 加载body-parser模块
const bodyParser = require('body-parser');

// 加载MySQL模块
const mysql = require('mysql');

// 创建MySQL连接池
const pool = mysql.createPool({
    // 数据库服务器的地址
    host: '127.0.0.1',
    // 数据库服务器的端口号
    port: 3306,
    // 数据库用户的用户名
    user: 'root',
    // 数据库用户的密码
    password: '',
    // 数据库名称
    database: 'wine',
    // 编码方式
    charset: 'utf8',
    // 最大连接数
    connectionLimit: 20
});



// 创建WEB服务器实例
const server = express();

// 托管静态资源
server.use(express.static('./public'));
// 将CORS作为Server的中间件
server.use(cors({
    origin: ['http://localhost:8080', 'http://127.0.0.1:8080']
}));

//将bodyParser作为Server的中间件
server.use(bodyParser.urlencoded({
    extended: false
}));

// 注冊
server.post('/register', (req, res) => {
    //获取用户名和密码
    let username = req.body.username;
    let password = req.body.password;
    //查找用户是否存在
    let sql = 'SELECT COUNT(uid) AS count FROM wine_user WHERE username=?';
    pool.query(sql, [username], (error, results) => {
        if (error) throw error;
        //如果用户不存在,则插入记录
        if (results[0].count == 0) {
            sql = 'INSERT INTO wine_user(username,password) VALUES(?,?)';
            pool.query(sql, [username, password], (error, results) => {
                if (error) throw error;
                res.send({ message: '注册成功', code: 1 });
            })
        } else { //否则产生合理的错误提示
            res.send({ message: '用户已存在', code: 0 });
        }
    })
});

// 轮播图
server.get("/carousel", (req, res) => {
    let sql = "select src from wine_carousel"
    pool.query(sql, (err, result) => {
        if (err) throw err;

        res.send({ result: result });
        // console.log(result);
    })
})

//用户登录的接口
server.post('/login', (req, res) => {
    //获取用户名和密码
    let username = req.body.username;
    let password = req.body.password;
    let avatar = req.body.avatar;
    //以用户名和密码为条件进行查找
    let sql = 'SELECT uid,username,avatar FROM wine_user WHERE username=? AND password=?';
    pool.query(sql, [username, password, avatar], (error, results) => {
        if (error) throw error;
        if (results.length == 0) {
            res.send({ message: '登录失败', code: 0 });
        } else {
            res.send({ message: '登录成功', code: 1, userInfo: results[0] });
        }
    });

});
// 商品首页
server.get("/index", (req, res) => {
    let sql = "SELECT * FROM wine_perfumes";
    pool.query(sql, (err, results) => {
        if (err) throw err;
        let xiaofenlei = req.query.id;
        // console.log(xiaofenlei);
        let sql = "SELECT * FROM wine_perfumes WHERE id=?";
        pool.query(sql, [xiaofenlei], (err, result) => {
            if (err) throw err;
            let a = result;
            res.send({ message: '查询成功', code: 1, results: results, a: a });
            // console.log(results, a);
        })
        // console.log(results);
    })
});

// 商品详情
server.get("/details", (req, res) => {
    let uid = req.query.uid;
    console.log(uid);
    // SQL查询
    let sql = "SELECT * FROM wine_perfumes WHERE uid=?";
    pool.query(sql, [uid], (error, results) => {
        if (error) throw error;
        res.send({ message: "查询成功", code: 200, results: results[0] });
    })
});

// 查询商品列表
server.get("/list", (req, res) => {
    let id = req.query.id;
    let sql = "SELECT * FROM wine_perfumes WHERE id=?";
    pool.query(sql, [id], (error, results) => {
        if (error) throw error;
        res.send({ message: "查询成功", code: 200, results: results });
    })
})
// 查询指定分类下包含的商品数据
server.get("/productcard", (req, res) => {
    let fid = req.query.fid;
    console.log(fid);
    // 查询特定记录的SQL语句
    let sql = 'SELECT fid,f.fenlei,fsrc FROM fenlei AS f INNER JOIN wine_perfumes ON id WHERE fid=?';
    // 执行SQL语句
    pool.query(sql, [fid], (error, results) => {
        if (error) throw error;
        res.send({ code: 200, message: "查询成功", result: results[0] });
        console.log(results);
    });
})
//分类
server.get("/fenlei", (req, res) => {
    let sql = "select * from fenlei"
    pool.query(sql, (err, results) => {
        if (err) throw err;
        res.send({ results: results })
    })
})

// console.log('server....')
server.listen(3000);