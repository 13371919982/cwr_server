const express=require('express');
const pool=require('../pool');
let router=express.Router();

// 1.keyWords 关键字查询
router.get('/keyWords',(req,res)=>{
  let kws=req.query.kws;
  let sql=`select * from cwr_laptop where detail like "%${kws}%"`
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    if(result.length>0)
      res.send(result)
    else
      res.send('1');
  })
})

// 2.kind 分类 
router.get('/list',(req,res)=>{
  let kind=req.query.kind;
  let sql='select*from cwr_laptop where kind=?';
  pool.query(sql,[kind],(err,result)=>{
    if(err) throw err;
    res.send(result);
  })
})

// 3.price 价格
router.get('/price',(req,res)=>{
  let min_price=req.query.min_price;
  let max_price=req.query.max_price;
  !min_price?min_price=0:parseInt(min_price);
  !max_price?max_price=99999:parseInt(max_price);
  let sql='select*from cwr_laptop where price between ? and ?';
  pool.query(sql,[min_price,max_price],(err,result)=>{
    if(err) throw err;
    if(result.length>0)
      res.send(result);
    else
      res.send('1');
  })
})

// 4.1 rankDefault 默认排序
router.get('/default',(req,res)=>{
  let sql='select*from cwr_laptop';
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    res.send(result);
  })
})

// 4.2 rankAsc 从低到高 升序
router.get('/asc',(req,res)=>{
  let sql='select*from cwr_laptop order by price asc';
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    res.send(result);
  })
})

// 4.3 rankDesc 从高到低 降序
router.get('/desc',(req,res)=>{
  let sql='select*from cwr_laptop order by price desc';
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    res.send(result);
  })
})

// 5.1 sexMan 男 // 5.2 sexWoman 女
router.get('/sex',(req,res)=>{
  let sex=req.query.sex;
  sex=='男'?sex=1:sex=0;
  let sql='select*from cwr_laptop where sex=?';
  pool.query(sql,[sex],(err,result)=>{
    if(err) throw err;
    res.send(result)
  })
})

// 6.size 尺码
router.get('/size',(req,res)=>{
  let size=req.query.size;
  let sql='select*from cwr_laptop where size=?';
  pool.query(sql,[size],(err,result)=>{
    if(err) throw err;
    res.send(result);
  })
})

// 7.brand 品牌
router.get('/brand',(req,res)=>{
  let brand=req.query.brand;
  let sql='select*from cwr_laptop where brand=?';
  pool.query(sql,[brand],(err,result)=>{
    if(err) throw err;
    res.send(result);
  })
})

// 8.color 颜色
router.get('/color',(req,res)=>{
  let color=req.query.color;
  let sql='select*from cwr_laptop where color=?';
  pool.query(sql,[color],(err,result)=>{
    if(err) throw err;
    res.send(result);
  })
})

module.exports=router;