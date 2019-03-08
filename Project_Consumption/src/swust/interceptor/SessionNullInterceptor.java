package swust.interceptor;

import swust.model.Employee;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class SessionNullInterceptor extends AbstractInterceptor {
	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		Employee employee = (Employee) ActionContext.getContext().getSession()
				.get("session_employee");
		if (employee != null) {
			return invocation.invoke();
		}
		return "sessionnull";
	}
}
