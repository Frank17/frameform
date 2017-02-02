package franksite.demo.servlet;

import java.io.IOException;
import java.io.Writer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import franksite.demo.model.ResponseResult;

/**
 * Servlet implementation class FormSubmit
 */
public class FormSubmit extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 在这里处理页面的POST请求
		
		// 如我们验证用户名是否为username，用户密码明文是否为123456
		
		// 若验证成功，我们需要返回一个JSON字符串，供客户端解析
		
		request.setCharacterEncoding("utf-8");
		response.setHeader("ContentType", "text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		
		// 获取用户名
		String username = request.getParameter("username");
		
		String password = request.getParameter("password");
		
		ResponseResult body = new ResponseResult();
		
		// 避免空异常
		if (null == username) {
			body.setStatus(false);
			body.setMessage("Username is not allowed empty!");
		} else if (null == password) {
			body.setStatus(false);
			body.setMessage("Username is not allowed empty!");
		} else if (!username.equals("username")) {
			body.setStatus(false);
			body.setMessage("Error username");
		} else if (!password.equals("123456")) {
			body.setStatus(false);
			body.setMessage("Error password");
		} else {
			body.setStatus(true);
			body.setMessage("Passed!");
		}
		
		ObjectMapper oj = new ObjectMapper();
		
		// 构建返回实体
		Writer out = response.getWriter();
		out.write(oj.writeValueAsString(body));
		out.close();
	}

}
