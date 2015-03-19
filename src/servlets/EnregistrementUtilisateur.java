package servlets;

import java.io.IOException;
import java.rmi.Naming;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Utilisateur;

import rmi.DatabaseInterface;

/**
 * Servlet implementation class EnregistrementUtilisateur
 */
@WebServlet("/enregister_utilisateur")
public class EnregistrementUtilisateur extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EnregistrementUtilisateur() {
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
			String nomUtil = request.getParameter("nomUtilisateur");
			String motPasse = request.getParameter("motPasse");
			String nomService = "rmi://localhost:1099/Database";
			DatabaseInterface dao = (DatabaseInterface) Naming.lookup(nomService);
			Utilisateur u = new Utilisateur();
			u.setEstAdmin(false);
			u.setNomUtilisateur(nomUtil);
			u.setMotPasse(motPasse);
			dao.createUtilisateur(u);
			Notice notice = new Notice("success", "Vous avez vous enregistré avec succès. Connectez vous, svp:");
			request.setAttribute("notice", notice);
			getServletContext().getRequestDispatcher("/sign_in.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
