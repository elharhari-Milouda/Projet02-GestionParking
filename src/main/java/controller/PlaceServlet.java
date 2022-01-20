package controller;

import java.io.IOException;
import java.util.List;

import com.google.gson.Gson;

import entities.Message;
import entities.Place;
import entities.Section;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import service.PlaceService;

/**
 * Servlet implementation class PlaceServlet
 */
public class PlaceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PlaceService ps = new PlaceService();

	public PlaceServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	public void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (request.getParameter("op") != null) {
			if (request.getParameter("op").equals("load")) {
				response.setContentType("application/json");
				List<Place> places = ps.findAll();

				Gson json = new Gson();
				response.getWriter().write(json.toJson(places));

			} else if (request.getParameter("op").equals("delete")) {
				int id = Integer.parseInt(request.getParameter("id"));
				ps.delete(ps.findById(id));
				response.setContentType("application/json");
				List<Place> places = ps.findAll();
				Gson json = new Gson();
				response.getWriter().write(json.toJson(places));

			} else if (request.getParameter("op").equals("update")) {
				int id = Integer.parseInt(request.getParameter("id"));
				int numero = Integer.parseInt(request.getParameter("numero"));
				String etat = request.getParameter("etat");
				String type = request.getParameter("type");
				int section = Integer.parseInt(request.getParameter("section"));
				Place place = new Place(id, numero, etat, type, section);
				ps.update(place);
				response.setContentType("application/json");
				List<Place> places = ps.findAll();
				Gson json = new Gson();
				response.getWriter().write(json.toJson(places));

			} else if (request.getParameter("op").equals("etat")) {
				int id = Integer.parseInt(request.getParameter("id"));
				Place pl = ps.findById(id);
				if (pl.getEtat().equals("Occupee")) {
					pl.setEtat("Vide");
				} else {
					pl.setEtat("Occupee");
				}
				if(ps.update(pl)) {
				System.out.println(id);
				response.setContentType("application/json");
				List<Place> places = ps.findAll();
				Gson json = new Gson();
				response.getWriter().write(json.toJson(places));}
				

			} else if (request.getParameter("op").equals("add")) {
				
				int numero = Integer.parseInt(request.getParameter("numero"));
				String etat = request.getParameter("etat");
				String type = request.getParameter("type");
				int section = Integer.parseInt(request.getParameter("section"));
				boolean existe = ps.findByNumeroSection(numero, section);
				String content = null;
				String typee = null;
				String cssClass = null;
				if (existe) {
					content = "Place deja existe!";
					typee = "error";
					cssClass = "danger";
				} else if (!(existe)) {
					ps.create(new Place(numero, etat, type, section));
					content = "Place creee avec succes!";
					typee = "success";
					cssClass = "primary";
				}
				Message message = new Message(content, typee, cssClass);
				HttpSession s = request.getSession();
				s.setAttribute("msg", message);

				response.setContentType("application/json");
				List<Place> places = ps.findAll();

				Gson json = new Gson();
				response.getWriter().write(json.toJson(places));
				//response.sendRedirect("place.jsp");
			} else if (request.getParameter("op").equals("search")) {
				
				int numero = Integer.parseInt(request.getParameter("numero"));
				response.setContentType("application/json");
				Place places = ps.findByNum(numero);

				Gson json = new Gson();
				response.getWriter().write(json.toJson(places));
				//response.sendRedirect("place.jsp");
			}
		}
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}
}
