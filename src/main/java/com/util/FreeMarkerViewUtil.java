package com.util;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.Date;
import java.util.Locale;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.support.RequestContextUtils;
import org.springframework.web.servlet.view.freemarker.FreeMarkerView;

import com.model.Article;

import freemarker.core.ParseException;
import freemarker.template.Configuration;
import freemarker.template.MalformedTemplateNameException;
import freemarker.template.SimpleHash;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import freemarker.template.TemplateNotFoundException;

public class FreeMarkerViewUtil extends FreeMarkerView {
    @Override
    protected void doRender(Map<String, Object> model, HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        // Expose model to JSP tags (as request attributes).
        exposeModelAsRequestAttributes(model, request);
        // Expose all standard FreeMarker hash models.
        SimpleHash fmModel = buildTemplateModel(model, request, response);

        if (logger.isDebugEnabled()) {
            logger.debug("Rendering FreeMarker 模版 [" + getUrl() + "] in FreeMarkerView '" + getBeanName() + "'");
        }
        // Grab the locale-specific version of the template.
        Locale locale = RequestContextUtils.getLocale(request);

        /*
         * 默认生成静态文件,除非在编写ModelAndView时指定CREATE_HTML = false, 这样对静态文件生成的粒度控制更细一点
         * 例如：ModelAndView mav = new ModelAndView("search");
         * mav.addObject("CREATE_HTML", false);
         */
        if (Boolean.FALSE.equals(model.get("CREATE_HTML"))) {
            processTemplate(getTemplate(locale), fmModel, response);
        } else {
            createHTML(getTemplate(locale), fmModel, request, response);
        }
    }

    public void createHTML(Template template, SimpleHash model, HttpServletRequest request,
            HttpServletResponse response) throws IOException, TemplateException, ServletException {
        // 站点根目录的绝对路径
        String basePath = request.getSession().getServletContext().getRealPath("/");
        String requestHTML = this.getRequestHTML(request);
        // 静态页面绝对路径
        String htmlPath = basePath + requestHTML;
        System.out.println("静态页面绝对路径===========>>:"+htmlPath);
        File htmlFile = new File(htmlPath);
        if (!htmlFile.getParentFile().exists()) {
            htmlFile.getParentFile().mkdirs();
        }
        if (!htmlFile.exists()) {
            htmlFile.createNewFile();
        }
        Writer out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(htmlFile), "UTF-8"));
        // 处理模版
        template.process(model, out);
        out.flush();
        out.close();
        /* 将请求转发到生成的htm文件 */
        request.getRequestDispatcher(requestHTML).forward(request, response);
    }

    /**
     * 计算要生成的静态文件相对路径 因为大家在调试的时候一般在Tomcat的webapps下面新建站点目录的，
     * 但在实际应用时直接布署到ROOT目录里面,这里要保证路径的一致性。
     * 
     * @param request
     *            HttpServletRequest
     * @return /目录/*.htm
     */
    private String getRequestHTML(HttpServletRequest request) {
        // web应用名称,部署在ROOT目录时为空
        String contextPath = request.getContextPath();
        // web应用/目录/文件.do
        String requestURI = request.getRequestURI();
        // basePath里面已经有了web应用名称，所以直接把它replace掉，以免重复
        requestURI = requestURI.replaceFirst(contextPath, "");
        // 将.do改为.html,稍后将请求转发到此html文件
        requestURI = requestURI.substring(0, requestURI.indexOf(".")) + ".html"; 
        return requestURI;
    }
    
    public static void main(String[] args) throws TemplateException{
    	
    	 FileWriter out = null;
         try {
             // 通过FreeMarker的Confuguration读取相应的模板文件
             Configuration configuration = new Configuration(Configuration.VERSION_2_3_23);
             // 设置模板路径
             configuration.setClassForTemplateLoading(Article.class, "/WEB-INF/view/content");
             // 设置默认字体
             configuration.setDefaultEncoding("utf-8");

             // 获取模板
             Template template = configuration.getTemplate("article.ftl");
             //设置模型
             Article user = new Article("hahhfa", new Date(), "hahah", "hahah","hahhahff");
             
             //设置输出文件
             File file = new File("e:/html/result.html");
             if(!file.exists()) {
                 file.createNewFile();
             }
             //设置输出流
             out = new FileWriter(file);
             //模板输出静态文件
             template.process(user, out);
         } catch (TemplateNotFoundException e) {
             e.printStackTrace();
         } catch (MalformedTemplateNameException e) {
             e.printStackTrace();
         } catch (ParseException e) {
             e.printStackTrace();
         } catch (IOException e) {
             e.printStackTrace();
         } catch (TemplateException e) {
             e.printStackTrace();
         } finally {
             if(null != out) {
                 try {
                     out.close();
                 } catch (IOException e) {
                     e.printStackTrace();
                 }
             }
         }
    }
}