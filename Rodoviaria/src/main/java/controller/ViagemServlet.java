package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Viagem;

@WebServlet("/viagem")
public class ViagemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ViagemServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String codigoviagemParam = request.getParameter("codigoviagem"); 
		String onibusParam = request.getParameter("onibus");
		String motoristaParam = request.getParameter("motorista");
		String horasaidaParam = request.getParameter("horasaida");
		String horachegadaParam = request.getParameter("horachegada");
		String partidaParam = request.getParameter("partida");
		String destinoParam = request.getParameter("destino");
		
		Viagem viagem = new Viagem();
		viagem.setCodigoviagem(Integer.parseInt(codigoviagemParam));
		viagem.setOnibus(onibusParam);
		
	}

}
