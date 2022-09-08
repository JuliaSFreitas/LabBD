package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Motorista;

@WebServlet("/motorista")
public class MotoristaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MotoristaServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String codigoParam = request.getParameter("codigo"); 
		String nomeParam = request.getParameter("nome");
		String naturalidadeParam = request.getParameter("naturalidade");
	
		Motorista motorista = new Motorista();
		motorista.setCodigo(Integer.parseInt(codigoParam));
		motorista.setNome(nomeParam);
		motorista.setNaturalidade(naturalidadeParam);
		
	}

}
