# 党务管理系统

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
 t_name VARCHAR(50) NOT NULL,
 u_email VARCHAR(50) NOT NULL
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
	 
	 --创建新闻表
	 create table t_news
	 (
	       news_id  int (15) PRIMARY KEY NOT NULL auto_increment,
			title varchar(50) NOT NULL,
			author varchar(50) ,
			cre_time date,
			content  varchar(50) NOT NULL,
			images  varchar(255) NOT NULL,
	 );
	 
	 
	 
 //发展结果记录数据项显示 三表查询 发展id  申请编号  学号 姓名  审核结果 发展结果 审批人  时间
 select dev.res_id,ask.askid,s.stu_number,s.sname,dev.audit,dev.devresult,dev.cre_time
 from t_developresult as dev,t_Apprecord as ask,t_student as t where   dev.ask_id=ask.ask_id and ask.stu_id=s.stu_id
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
//方式一

  function BuildSelectBox(url, par, sel) {
   $(sel).empty();
   $.getJSON(url, { id: par }, function (json, textStatus) {
    for (var i = json.length - 1; i >= 0; i--) {
   $(sel).prepend('<option value="' + json[i].Id + '">' + json[i].Name + '</option>')
  };
  $(sel).prepend('<option value="0">请选择</option>')
 });
}


  //方式二、页面一加载，获取所属组织数据，绑定到下拉框
    $(function (){
        $.ajax({
            type: "post",
            url: "${pageContext.request.contextPath}/student/getOrganize",
            success:function(data){
                // alert("测试发送数据成功！")
                console.log(data.result);
                var data=data.result;
                $.each(data,function (index,item){
                    $("#select-organize").append(
                        "<option value="+item.or_id+">"+item.branchame+"</option>"
                    );
                });
            },

        });
    });

```

### 4、关联查询方式

#### 4.1 第一种 设置要关联的类为自己的私有属性

```java
   //1、学生实体关联组织实体，在学生实体里加一个组织实体为自己的私有熟悉

    private String gender;
    private String nation;
    private String birthday;
    private String idcard;
    private String natives;//籍贯
    private String address;
    private String phone;
    private String education;
    private String familyorign;
    private Integer or_id;
    private Organize organize;


//2、在服务层 通过or_id 组织id 关联，查询出组织的信息
    @Override
    public void querys(Student student, Model model) {
        //查询学生的信息，student!=null 条件查询，否则查询所有,
        //通过学生对象的or_id 赋值给组织对象的or_id,查到这个组织的名字
        List<Student> list=studentDao.querys(student);
        int size=list.size();
        List<Student> new_list=new ArrayList<>();
        for(int i=0;i<size;i++){
            Student data=list.get(i);
            System.out.println(data.getOr_id());
            Organize organize=organizeDao.findOrganizeByid(data.getOr_id());
            System.out.println(organize.getBranchame());
            data.setOrganize(organize);
            new_list.add(i,data);
        }
        //存到域
        model.addAttribute("list",new_list);
    }

//3、视图页展示 通过list.organize.branchame 可以直接得到组织的名称
                    <th>${list.stu_id}</th>
                    <th>${list.stu_number}</th>
                    <th>${list.sname}</th>
                    <th>${list.organize.branchame}</th>
                    <th>${list.gender}</th>
                    <th>${list.nation}</th>
                    <th>${list.birthday}</th>
                    <th>${list.idcard}</th>
                    <th>${list.natives}</th>
                    <th>${list.address}</th>
                    <th>${list.phone}</th>
                    <th>${list.education}</th>
                    <th>${list.familyorign}</th>

```

#### 4.1.1调试的图片

![](C:/Users/Ryan/Desktop/党务管理系统/QQ图片20201210141904.png)

#### 4.2第二种通过写sql语句表关联查询，查询的结果通过第三个bean 对象绑定

```java
//1、sql 语句  申请表和发展结果表 左外连接 得到的结果通过 DevResult bean对象接收，

<select id="queryResult" resultType="com.pojo.DevResult">
      select dev.res_id,ask.ask_number,dev.audit,dev.devresult,dev.approved ,dev.cre_time from t_developresult dev
 LEFT join t_apprecord ask on dev.ask_id=ask.ask_id

        <where>
            <if test="audit!=null and audit!=''">
                and audit=#{audit}
            </if>
            <if test="cre_time!=null and cre_time!=''">
                and dev.cre_time =#{cre_time}
            </if>
        </where>

    </select>
                
                
//2、视图页直接显示
                       <th>${list.res_id}</th>
                        <th>${list.ask_number}</th>
                        <th>${list.audit}</th>
                        <th>${list.devresult}</th>
                        <th>${list.approved}</th>
                        <th>${list.cre_time}</th>
                
                
                
//、bean对象
 package com.pojo;

/**
 * 查询的bean对象
 --发展id 申请编号、审核结果、发展结果、审批人、时间
 */
public class DevResult {
    private Integer res_id;
    private String ask_number;
    private String audit;
    private String devresult;
    private String approved;

    @Override
    public String toString() {
        return "DevResult{" +
                "res_id=" + res_id +
                ", ask_number='" + ask_number + '\'' +
                ", audit='" + audit + '\'' +
                ", devresult='" + devresult + '\'' +
                ", approved='" + approved + '\'' +
                ", cre_time='" + cre_time + '\'' +
                '}';
    }

    public Integer getRes_id() {
        return res_id;
    }

    public void setRes_id(Integer res_id) {
        this.res_id = res_id;
    }

    public String getAsk_number() {
        return ask_number;
    }

    public void setAsk_number(String ask_number) {
        this.ask_number = ask_number;
    }

    public String getAudit() {
        return audit;
    }

    public void setAudit(String audit) {
        this.audit = audit;
    }

    public String getDevresult() {
        return devresult;
    }

    public void setDevresult(String devresult) {
        this.devresult = devresult;
    }

    public String getApproved() {
        return approved;
    }

    public void setApproved(String approved) {
        this.approved = approved;
    }

    public String getCre_time() {
        return cre_time;
    }

    public void setCre_time(String cre_time) {
        this.cre_time = cre_time;
    }

    private String cre_time;

}
```

### 5、图片上传和显示

#### 5.1显示方式数据库存路径

图片上传后，拿到图片的名字，存到数据库，显示的时候通过图片名字和路径名对应显示出来

 #### 5.2图片上传方式

前端把图片上传到表单输入框，获取到图片的信息，发送ajax 到后台处理，后台设置图片的存储路径并存到项目中，并获得图片的名称，返回给前端，前端回调函数接收到这个值，并给表单中images 这个值赋值。

```javascript
//获取文件名字
function get_file() {
    var picture = $('#picture').prop('files');
    var pictureForm = new FormData();
    pictureForm.append('picture', picture[0]);
    var fileName = "";
    console.log(picture[0])
    console.log(pictureForm)
    $.ajax({
        //请求方式
        type: "POST",
        async: false,
        //请求地址
        url: "${pageContext.request.contextPath}/news/fileUp",
        //数据，json字符串
        dataType: "text",
        contentType: false,
        processData: false,
        data: pictureForm,
        //请求成功
        success: function (data) {
            console.log(data)
            fileName = data;

        },
    });
    return fileName;
}
```

  后台处理的接口

```java
   //后台接口
@ResponseBody
    @RequestMapping(value ="fileUp")
    public String getfileUp(MultipartFile picture, HttpServletRequest request){
        System.out.println("测试....");
        String fileName=picture.getOriginalFilename();
        String realpath=request.getServletContext().getRealPath("upImages");
        File targetFile=new File(realpath,fileName);
        if(!targetFile.exists()){
            targetFile.mkdirs();
        }
        try{
            picture.transferTo(targetFile);
        }catch (Exception e){
            e.printStackTrace();
        }
        System.out.println(fileName);
        return fileName;
    }
```

#### 5.3在spring-MVC-servlet配置文件中配置文件上传的类

```java
   <!--    配置文件上传类-->
    <bean class="org.springframework.web.multipart.commons.CommonsMultipartResolver" id="multipartResolver">
        <property name="defaultEncoding" value="UTF-8"/>
        <property name="maxUploadSize" value="540000"/>
        <!--        <property name="uploadTempDir" value="file:fileUpload/temp"/>-->
    </bean>
```

### 6、表单验证方式

jQuery Validate 插件

简介：jQuery Validate 插件为表单提供了强大的验证功能，让客户端表单验证变得更简单，同时提供了大量的定制选项，满足应用程序各种需求。该插件捆绑了一套有用的验证方法，包括 URL 和电子邮件验证，同时提供了一个用来编写用户自定义方法的 API

#### 6.1默认校验规则

![image-20201216135818371](C:/Users/Ryan/AppData/Roaming/Typora/typora-user-images/image-20201216135818371.png)

#### 6.2使用方式

将校验规则写到 JS 中

```javascript
        //验证表单数据
        $("#form1").validate({
            rules:{
                number:{
                    required:true,
                    maxlength:12,
                    digits:true,
                    minlength:6,
                },
                branchame:{
                    required:true,
                },
                address:{
                    required:true,
                },
                phone:{
                    required:true,
                    isMobile:true,
                },
                personliable:{
                    required:true,
                }
            },
        });



```

