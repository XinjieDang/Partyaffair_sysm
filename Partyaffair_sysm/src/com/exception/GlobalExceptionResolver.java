package com.exception;

import com.alibaba.fastjson.JSON;
import com.base.ResultInfo;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


/**
 * /全局异常统一处理
 * 方法返回值：
 * 视图
 * json
 * 判断方法返回值：
 * 判断方法上是否设置了@ResponseBody注解，如果设置了表示返回json,否则返回视图
 */
@Component
public class GlobalExceptionResolver implements HandlerExceptionResolver {
    @Override
    public ModelAndView resolveException(HttpServletRequest httpServletRequest,
                                         HttpServletResponse httpServletResponse,
                                         Object handler, Exception e) {
        //默认异常处理
        ModelAndView modelAndView = new ModelAndView();
        //设置视图
        modelAndView.setViewName("error");
        //设置错误信息
        modelAndView.addObject("msg", "系统异常，请重试！");

        //验证Handler参数类型
        if (handler instanceof HandlerMethod) {
            //类型转换
            HandlerMethod handlerMethod = (HandlerMethod) handler;
            //判断方法上是否设置@ResponseBody注解（如果设置了则返回ResponseBody对象，否则返回null)
            ResponseBody responseBody = handlerMethod.getMethod().getDeclaredAnnotation(ResponseBody.class);
            //判断ResponseBody 对象是否为空
            if (responseBody == null) {
                /*
                返回视图
                 */
                //判断自定义异常
                if (e instanceof ParamsException) {
                    ParamsException p = new ParamsException();
                    modelAndView.addObject("code", p.getCode());
                    modelAndView.addObject("msg", p.getMsg());
                }
                return modelAndView;
            } else {
                /*
                返回json
                 */
                //准备resultInfo对象
                ResultInfo resultInfo = new ResultInfo();
                resultInfo.setCode(500);
                resultInfo.setMsg("系统异常!");
                //判断自定义异常
                if (e instanceof ParamsException) {
                    ParamsException p = new ParamsException();
                    modelAndView.addObject("code", p.getCode());
                    modelAndView.addObject("msg", p.getMsg());
                }
                //设置响应类型和编码格式
                httpServletResponse.setContentType("application/json;charset=UTF-8");

                try {
                    //得到字符输出流
                    PrintWriter out = httpServletResponse.getWriter();
                    //将resultInfo对象转为json字符串
                    String json = JSON.toJSONString(resultInfo);
                    //输出字符串
                    out.write(json);
                    //刷新流
                    out.flush();
                    //关闭
                    out.close();

                } catch (IOException ex) {
                    ex.printStackTrace();
                }
                return null;
            }

        }
        return modelAndView;
    }
}
