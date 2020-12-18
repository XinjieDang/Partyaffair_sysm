# Partyaffair_sysm
### 1、数据库设计

```mysql

-- 创建Partyaffair_sysm数据库
create database partyaffair_sysm
DEFAULT CHARSET utf8

-- 创建用户表 

create table t_user
(
 id int(15) PRIMARY KEY NOT NULL auto_increment,
 u_name VARCHAR(50) NOT NULL,
 u_password VARCHAR(100) NOT NULL,
 t_name VARCHAR(50) NOT NULL
 );
 --创建组织表

 create table t_organize
 (
	 or_id int (15) PRIMARY KEY NOT NULL auto_increment,
	 number varchar(50) NOT NULL,
	 branchame varchar(50) NOT NULL,
	 address  varchar(50) NOT NULL,
	 phone varchar(50) NOT NULL,
   personliable varchar(50) NOT NULL
	 );
	 
	 --创建发展结果表
	 create table t_developresult
	 (
	     res_id int (15) PRIMARY KEY NOT NULL auto_increment,
		 ask_id int (15),
		 audit varchar(50) NOT NULL,
		 devresult varchar(50) NOT NULL,
		 approved varchar(50) NOT NULL,
		 cre_time date
	 );
	 --创建申请记录表
	 create table t_Apprecord
	 (
	     ask_id int (15) PRIMARY KEY NOT NULL auto_increment,
		 ask_number varchar(50) NOT NULL,
		 stu_id int (15) ,
		 currents  varchar(50),
		 askdev varchar(50),
		 cre_time  date,
		 reviewer varchar(50) NOT NULL,
		 askstatus varchar(50) NOT NULL
		 
	 );
	 --创建学生表
	 create table t_student
	 (
	       stu_id  int (15) PRIMARY KEY NOT NULL auto_increment,
			stu_number varchar(50) NOT NULL,
			sname varchar(50) ,
			gender varchar(50) ,
			nation  varchar(50) NOT NULL,
			birthday date,
			idcard  varchar(50) NOT NULL,
			natives varchar(50) NOT NULL,
			address  varchar(50),
			phone varchar(50),
			education varchar(50),
			familyorign varchar(50),
			or_id  int (15)
	 );
	 
 //发展结果记录数据项显示
 发展id  申请编号  学号 姓名  审核结果 发展结果 审批人  时间
 
 select dev.res_id,ask.askid,s.stu_number,s.sname,dev.audit,dev.devresult,dev.cre_time
 from t_developresult as dev,t_Apprecord as ask,t_student as t where dev.ask_id=ask.ask_id and ask.stu_id=s.stu_id
	 
 
```

### 2、全局异常处理（JSON与视图)

#### 2.1返回数据的VO对象

```java 
import lombok.Data;
@Data
public class ResultDTO<T> {
    private Integer code;
    private String msg;
    private T body;
 
    private ResultDTO(Integer code, String msg, T body) {
        this.code = code;
        this.msg = msg;
        this.body = body;
    }
 
    public static <T> ResultDTO success(T body){
        return success(200,"成功",body);
    }
 
    public static ResultDTO success(Integer code, String msg){
        return success(code,msg,null);
    }
 
    public static ResultDTO fail(String msg){
        return success(500,msg);
    }
    
   	public static <T> ResultDTO success(Integer code, String msg, T body){
		return new ResultDTO(code,msg,body);
	}
}
```

#### 2.2全局异常处理拦截器

```java
//判断返回的是视图或者是 json对象
public class SgccExceptionResolver implements HandlerExceptionResolver {

    private Logger logger = Logger.getLogger(this.getClass());

    public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler,
            Exception ex) {
        logger.info("==============Exception Start 000000=============");
        if (ex instanceof BaseException) {
            logger.debug(ex, ex);
        }else {
            logger.error(ex, ex);
        }
        logger.info("==============Exception End 000000=============");
        if (NetworkUtil.isAjax(request)) {
            String msg = null;
            String code = null;
            String detail = null;
            if (ex instanceof BaseException) {
                msg = ((BaseException) ex).getErrorMsg();
                code = ((BaseException) ex).getErrorCode();
                detail = ((BaseException) ex).getMsgDetail();
            }else {
                FSTErrorCode fc = FSTErrorCode.SYS_ERROR_000000;
                msg = fc.getErrorMsg();
                code = fc.getErrorCode();
                detail = fc.getMsgDetail();
            }
            try {
                Map<String, Object> map = new HashMap<String, Object>();
                map.put("msg", msg);
                map.put("code", code);
                map.put("detail", detail);
                JSONObject json = JSONObject.fromObject(map);
                response.setContentType("text/html;charset=utf-8");
                response.getWriter().print(json);
            }catch (IOException e) {
                e.printStackTrace();
            }
            return null;
        }else {
            ModelAndView mv = new ModelAndView();
            mv.setViewName("error/error");
            mv.addObject("exception", ex.toString().replaceAll("\n", "<br/>"));
            return mv;
        }
    }    
    
}
```

### 3、添加页面下拉框的值使用ajax绑定值

#### 3.1、jquery代码

```javascript
function BuildSelectBox(url, par, sel) {
 $(sel).empty();
 $.getJSON(url, { id: par }, function (json, textStatus) {
  for (var i = json.length - 1; i >= 0; i--) {
   $(sel).prepend('<option value="' + json[i].Id + '">' + json[i].Name + '</option>')
  };
  $(sel).prepend('<option value="0">请选择</option>')
 });
}
```

-----

