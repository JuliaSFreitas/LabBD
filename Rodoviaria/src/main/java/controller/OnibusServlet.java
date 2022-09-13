package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Onibus;

@WebServlet("/onibus")
public class OnibusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public OnibusServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String placaParam = request.getParameter("placa"); 
		String marcaParam = request.getParameter("marca");
		String anoParam = request.getParameter("ano");
		String descricaoParam = request.getParameter("descricao");
		
		Onibus onibus = new Onibus();
		onibus.setPlaca(placaParam);
		onibus.setMarca(marcaParam);
		onibus.setAno(Integer.parseInt(anoParam));
		onibus.setDescricao(descricaoParam);
	}

}
