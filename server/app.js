// 1.加载mysql express模块
const mysql=require("mysql");
const express=require("express");
// 1.1 引入摸块cors
const cors=require("cors");
// 2  创建连接池
var pool=mysql.createPool({
    host:"127.0.0.1",
    password:"",
    user:"root",
    database:"huawei",
	connectionLimit:20
});
//创建连接池
var server=express();
// 1.2配置允许访问列:指定允许哪个端口跨域访问服务器
server.use(cors({
	origin:["http://127.0.0.1:3000","http://localhost:3000"],
	credentials:true
}));
//静态资源托管
server.use(express.static("public"));
const bodyParser=require("body-parser");
server.use(bodyParser.urlencoded({
	extended:false
}))
// 4.express对象绑定监听端口3000
server.listen(3000);

//功能1
//1.用户get   请求路径denglu
//2.获取两个参数uname和upwd
//3.创建spl语句
//4.执行sql
//5.获取数据库返回结果
//6.返回客户数据
server.get("/denglu",(req,res)=>{
	var uname=req.query.uname;
	var upwd=req.query.upwd;
	if(!uname){
		res.send("用户名不存在");
		return;
	};
	if(!upwd){
		res.send("用户密码不存在");
		return;
	}
	var sql="select id from huawei_denglu where uname=? and upwd=md5(?)"
	pool.query(sql,[uname,upwd],(err,result)=>{
		if(err) throw err;
		if(result.length>0){
			res.send("登录成功")
		}else{
			res.send("用户名或者密码错误")
		}
	})
})

//功能2:::添加一个用户
server.get("/zhuce",(req,res)=>{
	var name=req.query.uname;
	var pwd=req.query.upwd;
	var email=req.query.uemail;
	var phone=req.query.uphone;
	var user_name=req.query.uuser_name;
	var gender=req.query.ugender;
	var sql="INSERT INTO huawei_user VALUES(null,?,?,?,?,?,?)";
	pool.query(sql,[name,pwd,email,phone,user_name,gender],(err,result)=>{
		if(err) throw err;
		console.log(result);
		res.send({code:1,msg:"添加成功"});
	})
})

//功能3:huawei_phone图片
server.get("/index",(req,res)=>{
	var sql="select * from huawei_phone";
	pool.query(sql,(err,result)=>{
		if(err) throw err;
		res.writeHead(200,{
			"Access-Control-Allow-Origin":"*"
		});
		res.write(JSON.stringify(result));
		res.end()
	})
})

// 一楼下的3个商品 huawei_yl_x
server.get("/index1",(req,res)=>{
	var sql="select * from huawei_yl_x";
	pool.query(sql,(err,result)=>{
		if(err) throw err;
		res.writeHead(200,{
			"Access-Control-Allow-Origin":"*"
		});
		res.write(JSON.stringify(result));
		res.end()
	})
})

// 二楼下的左个商品 huawei_el_z
server.get("/index2",(req,res)=>{
	var sql="select * from huawei_el_z";
	pool.query(sql,(err,result)=>{
		if(err) throw err;
		res.writeHead(200,{
			"Access-Control-Allow-Origin":"*"
		});
		res.write(JSON.stringify(result));
		res.end()
	})
})
server.get("/index3",(req,res)=>{
	var sql="select * from huawei_er_y";
	pool.query(sql,(err,result)=>{
		if(err) throw err;
		res.writeHead(200,{
			"Access-Control-Allow-Origin":"*"
		});
		res.write(JSON.stringify(result));
		res.end()
	})
})