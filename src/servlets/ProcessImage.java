package servlets;

import java.io.IOException;
import java.rmi.Naming;
import java.rmi.NotBoundException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rmi.DatabaseInterface;

/**
 * Servlet implementation class ProcessImage
 */
@WebServlet("/images/*")
public class ProcessImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProcessImage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String nomService = "rmi://localhost:1099/Database";
		DatabaseInterface obj;
		try {
			obj = (DatabaseInterface) Naming.lookup(nomService);
			String id = request.getPathInfo().substring(1);
			try {
				byte[] content = obj.getImage(id);
				System.out.println("#####CONTEÚD: " + content);
				response.setContentType(getServletContext().getMimeType(id));
			    response.setContentLength(content.length);
			    response.getOutputStream().write(content);
			} catch(Exception e) {
				e.printStackTrace();
			}
		} catch (NotBoundException e1) {
			e1.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
