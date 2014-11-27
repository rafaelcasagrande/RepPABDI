/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLET;

import DAO.UnidadeDAO;
import POJO.Contato;
import POJO.Funcionario;
import POJO.Logradouro;
import POJO.Unidade;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ServletCadastrarUnidade extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        boolean resultado = false;
        
        String nomeUnidade = request.getParameter("nomeUnidade");
        String telefoneUnidade = request.getParameter("telefoneUnidade");
        String telefoneAltUnidade = request.getParameter("telefoneAltUnidade");
        String celularUnidade = request.getParameter("celularUnidade");
        String emailUnidade = request.getParameter("emailUnidade");
        String numeroUnidade = request.getParameter("numeroUnidade");
        int codigoLogradouro = Integer.parseInt(request.getParameter("codigoLogradouro"));
        
        Logradouro logradouro = new Logradouro();
        logradouro.setLogradouroCodigo(codigoLogradouro);
        
        Contato contato = new Contato();
        contato.setContatoCelular(celularUnidade);
        contato.setContatoEmail(emailUnidade);
        contato.setContatoTelefone(telefoneUnidade);
        contato.setContatoTelefoneAlternativo(telefoneAltUnidade);
        
        Unidade unidade = new Unidade();
        unidade.setUnidadeNome(nomeUnidade);
        unidade.setUnidadeNumeroLogradouro(numeroUnidade);
       
        unidade.setContato(contato);
        unidade.setLogradouro(logradouro);
        
        UnidadeDAO unidadeDao = new UnidadeDAO();
        resultado = unidadeDao.adicionarUnidade(unidade);
        
        RequestDispatcher rs = request.getRequestDispatcher("CadastroUnidade.jsp");
        
        Unidade unidade2 = new Unidade();
        
        request.setAttribute("unidade", unidade2);
        
        rs.forward(request, response);
        
    }
}
