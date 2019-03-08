package swust.interceptor;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

public class CheckLoginInterceptor extends MethodFilterInterceptor {
	// 自定义拦截器
	@Override
	protected String doIntercept(ActionInvocation invocation) throws Exception {
		ActionContext ctx = invocation.getInvocationContext();
		Object obj1 = ctx.getSession().get("session_employee");
		if (obj1 == null) {
			HttpServletRequest request = (HttpServletRequest) ctx
					.get(ServletActionContext.HTTP_REQUEST);
			request.setAttribute("msg", "请先登录后再进行操作！");
			return "login";
		} else {
			// invocation.invoke() 就是通知struts2接着干下面的事情,退出了你自己编写的这个interceptor
			return invocation.invoke();
		}
	}
}
