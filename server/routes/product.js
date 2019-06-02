const express=require('express');
const pool=require('../pool');
let router=express.Router();

// 1.keyWords 关键字查询
router.get('/kwords',(req,res)=>{
  let kwords=req.query.kwords;
  let sql=`select*from cwr_laptop where detail like "%${kwords}%"`
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    res.send(result)
  })
})

// 2./list
router.get('/list',(req,res)=>{
  let kind=req.query.kind;
  let sql='select*from cwr_laptop where kind=?';
  pool.query(sql,[kind],(err,result)=>{
    if(err) throw err;
    res.send(result)
  })
})

// 3./price
router.get('/price',(req,res)=>{
  let minPrice=req.query.minPrice;
  let maxPrice=req.query.maxPrice;
  !minPrice?minPrice=0:parseInt(minPrice);
  !maxPrice?maxPrice=99999:parseInt(maxPrice);
  let sql='select*from cwr_laptop where price between ? and ?';
  pool.query(sql,[minPrice,maxPrice],(err,result)=>{
    if(err) throw err;
    res.send(result)
  })
})

// 4.1 /default
router.get('/default',(req,res)=>{
  let sql='select*from cwr_laptop';
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    res.send(result);
  })
})

// 4.2 /asc
router.get('/asc',(req,res)=>{
  let sql='select*from cwr_laptop order by price asc';
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    res.send(result);
  })
})

// 4.3 /desc
router.get('/desc',(req,res)=>{
  let sql='select*from cwr_laptop order by price desc';
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    res.send(result);
  })
})

// 5.1 /sex
router.get('/sex',(req,res)=>{
  let sex=req.query.sex;
  console.log(sex);
  sex=='男'?sex=1:sex=0;
  let sql='select*from cwr_laptop where sex=?';
  pool.query(sql,[sex],(err,result)=>{
    if(err) throw err;
    res.send(result)
  })
})

// 6./size 
router.get('/size',(req,res)=>{
  let size=req.query.size;
  let sql='select*from cwr_laptop where size=?';
  pool.query(sql,[size],(err,result)=>{
    if(err) throw err;
    res.send(result);
  })
})

// 7./brand
router.get('/brand',(req,res)=>{
  let brand=req.query.brand;
  let sql='select*from cwr_laptop where brand=?';
  pool.query(sql,[brand],(err,result)=>{
    if(err) throw err;
    res.send(result)
  })
})

// 8./color
router.get('/color',(req,res)=>{
  let color=req.query.color;
  let sql='select*from cwr_laptop where color=?';
  pool.query(sql,[color],(err,result)=>{
    if(err) throw err;
    res.send(result);
  })
})

module.exports=router;