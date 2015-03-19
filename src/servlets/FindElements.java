package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.rmi.Naming;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rmi.DatabaseInterface;
import beans.Element;

import com.google.gson.Gson;

/**
 * Servlet implementation class FindElements
 */
@WebServlet("/findElements")
public class FindElements extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindElements() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String type = request.getParameter("type");
			System.out.println(type);
			String nomService = "rmi://localhost:1099/Database";
			DatabaseInterface db = (DatabaseInterface) Naming.lookup(nomService);
			ArrayList<Element> elements = db.findElementByType(type);
			response.setContentType("application/JSON");
			final String param = request.getParameter("term");
			final List<String> result = new ArrayList<String>();
			for (Element element : elements) {
				if (element.getNom().toLowerCase().startsWith(param.toLowerCase())) {
					result.add(element.getNom());
				}
			}
			Gson gson = new Gson();
			String json = gson.toJson(result);
			PrintWriter out = response.getWriter();
			out.print(json);
			out.flush();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
