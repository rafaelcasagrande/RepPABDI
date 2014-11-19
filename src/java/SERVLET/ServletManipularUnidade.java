/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLET;

import DAO.UnidadeDAO;
import POJO.Contato;
import POJO.Logradouro;
import POJO.Unidade;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ServletManipularUnidade extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        UnidadeDAO unidadeDao = new UnidadeDAO();
        boolean resultado = false;
        
        int codigoUnidade = Integer.parseInt(request.getParameter("codigoUnidade"));
        int codigoContato =  Integer.parseInt(request.getParameter("codigoContato"));      
        
        String acao = request.getParameter("acao");
        
        Unidade unidade = new Unidade();
        unidade.setUnidadeCodigo(codigoUnidade);

        Contato contato = new Contato();
        contato.setContatoCodigo(codigoContato);

        if(acao.equals("excluir"))
        {
            unidade.setContato(contato);
            
            resultado = unidadeDao.exluirUnidade(unidade);
        }
        else if(acao.equals("alterar"))
        {
            int res = 0;
            
            int codigoLogradouro = Integer.parseInt(request.getParameter("codigoLogradouro"));   
            String nomeUnidade = request.getParameter("nomeUnidade");
            String telefoneUnidade = request.getParameter("telefoneUnidade");
            String telefoneAltUnidade = request.getParameter("telefoneAltUnidade");
            String celularUnidade = request.getParameter("celularUnidade");
            String emailUnidade = request.getParameter("emailUnidade");
            String numeroUnidade = request.getParameter("numeroUnidade");
            
            Logradouro logradouro = new Logradouro();
            logradouro.setLogradouroCodigo(codigoLogradouro);
            
            unidade.setUnidadeNome(nomeUnidade);
            unidade.setUnidadeNumeroLogradouro(numeroUnidade);
            
            contato.setContatoTelefone(telefoneUnidade);
            contato.setContatoTelefoneAlternativo(telefoneAltUnidade);
            contato.setContatoCelular(celularUnidade);
            contato.setContatoEmail(emailUnidade);
            
            unidade.setContato(contato);
            unidade.setLogradouro(logradouro);
            
            res = unidadeDao.alterarUnidade(unidade);
            
        }
        
        RequestDispatcher rs = request.getRequestDispatcher("ServletListarUnidade");

        unidade = new Unidade();
        
        request.setAttribute("unidade", unidade);
        
        rs.forward(request, response);
        
    }
}
