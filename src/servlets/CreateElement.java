package servlets;

import java.io.IOException;
import java.io.InputStream;
import java.rmi.Naming;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.io.IOUtils;

import beans.Element;

import rmi.DatabaseInterface;


/**
 * Servlet implementation class CreateElement
 */
@WebServlet("/createElement")
@MultipartConfig(maxFileSize = 16177215)
public class CreateElement extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateElement() {
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
			String nom = request.getParameter("nomElement");
			String type = request.getParameter("typeElement");
			
			System.out.println("######");
			System.out.println(nom);
			System.out.println(type);
			System.out.println("######");
			
			InputStream inputStream = null;
			
			Part filePart = request.getPart("image");
			System.out.println(filePart);
			if (filePart != null) {
				System.out.println("NOME ARQUIVO: " + filePart.getName());
				System.out.println("TAMANHO ARQUIVO: " + filePart.getSize());
				System.out.println("TIPO ARQUIVO: " + filePart.getContentType());
				
				inputStream = filePart.getInputStream();
			}
			
			System.out.println(inputStream);
			
			String nomService = "rmi://localhost:1099/Database";
			DatabaseInterface db = (DatabaseInterface) Naming.lookup(nomService);
			
			Element el = new Element();

			el.setNom(nom);
			el.setType(type);
			el.setImage(IOUtils.toByteArray(inputStream));
			db.createElement(el);
			Notice notice = new Notice("success", "Vous avez enregistré un element avec succès.");
			request.setAttribute("notice", notice);
			getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);	
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

}
