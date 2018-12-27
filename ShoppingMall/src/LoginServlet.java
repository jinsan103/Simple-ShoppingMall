import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Enter Login servlet");//서블렛에 들어왔는지 확인
		HttpSession session = request.getSession();
		String id = request.getParameter("id");//전송된 id

		String pwd = request.getParameter("pwd");
		System.out.println("pwd:" + pwd);

		session.setAttribute("id", id);
		session.setAttribute("pwd", pwd);

		String login_suc = "";
		if (id.equals("admin")) {
			System.out.println("admin 진입");
			login_suc = "Admin.jsp";//관리자페이지
		} else {
			login_suc = "LoginMain.jsp";//로그인페이지
		}
		System.out.println(login_suc);
		response.sendRedirect(login_suc);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
