package servlets;

import java.io.IOException;
import java.rmi.Naming;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rmi.DatabaseInterface;
import beans.Utilisateur;

/**
 * Servlet implementation class Authentification
 */
@WebServlet("/authentifier")
public class Connection extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Connection() {
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
			String nomService = "rmi://localhost:1099/Database";
			DatabaseInterface obj = (DatabaseInterface) Naming.lookup(nomService);
			String nomUtilisateur = request.getParameter("nomUtilisateur");
			String motPasse = request.getParameter("motPasse");
			Utilisateur u = new Utilisateur();
			u.setNomUtilisateur(nomUtilisateur);
			u.setMotPasse(motPasse);
			System.out.println("### TRYING TO DO AUTHENTICATION ###");
			boolean auth = obj.authentifier(u);
			System.out.println(auth);
			if (auth) {
				boolean admin = obj.authentifierAdmin(u);
				Notice notice = new Notice("success", "Vous avez connecté avec succès.");
				request.setAttribute("notice", notice);
				request.getSession().setAttribute("utilisateur", u);
				request.getSession().setAttribute("admin", admin);
				getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
			} else {
				Notice notice = new Notice("danger", "Le nom d'utilisateur ou le mot de passe ne sont pas correct.");
				request.setAttribute("notice", notice);
				getServletContext().getRequestDispatcher("/sign_in.jsp").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		
	}

}
