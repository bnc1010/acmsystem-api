# acmsystem-api

  后台框架：SpringMVC + Spring + MyBatis<br>
  数据库：mysql
  
  
  数据库设计：
  honor模块：
  
  members:
  ```
  {
     id,
     name,
     grade,
     classname
  }
  ```
  
  team:
  ```cpp
  {
     id,
     name_cn,
     name_en,
     m_1,
     m_2,
     m_3
  }
  ```
  
  honor:
  ```
  {
     id,
     teamId,
     cname,
     ctype,
     ctime,
     result,
     pic_id
  }
  cname: name of the contest(eg:2019CCPC秦皇岛站)
  ctype: 0:WF,1:ICPC,2:CCPC,3:省赛,4:others(cccc,蓝桥等)
  ctime: time of the contest
  result: -x:the rank of the WF is x, 1:1st, 2:2nd, 3:3rd, 4:gold, 5:silver 6:bronze 7:iron
  pic_id: id of photo from table picture
  ```
  
  
  picture:
  ```
  {
    id,
    path
  }  
  
  path:图片存储路径
  ```
