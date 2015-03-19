package servlets;

import java.io.IOException;
import java.rmi.Naming;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Element;
import beans.Menu;

import rmi.DatabaseInterface;

/**
 * Servlet implementation class createMenu
 */
@WebServlet("/createMenu")
public class CreateMenu extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateMenu() {
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
			String nom = request.getParameter("nomMenu");
			System.out.println("PARAMETRO NOME: " + nom);
			
			String entree = request.getParameter("entree");
			String plat = request.getParameter("plat");
			String dessert = request.getParameter("dessert");
			
			Menu m = new Menu();
			m.setNom(nom);
			
			Element entreeEl = new Element();
			entreeEl.setNom(entree);
			m.addElement(entreeEl);
			Element platEl = new Element();
			platEl.setNom(plat);
			m.addElement(platEl);
			Element dessertEl = new Element();
			dessertEl.setNom(dessert);
			m.addElement(dessertEl);
			
			String nomService = "rmi://localhost:1099/Database";
			DatabaseInterface db = (DatabaseInterface) Naming.lookup(nomService);
			
			db.createMenu(m);
			Notice notice = new Notice("success", "Vous avez enregistré un menu avec succès.");
			request.setAttribute("notice", notice);
			getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

}
