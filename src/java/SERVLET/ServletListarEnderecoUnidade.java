package SERVLET;

import DAO.EnderecoDao;
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


public class ServletListarEnderecoUnidade extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String unidadeNome = request.getParameter("txtUnidadeNome");
        String unidadeTelefone = request.getParameter("txtUnidadeContatoTelefone");
        String unidadeTelefoneAlternativo = request.getParameter("txtUnidadeContatoTelefoneAlternativo");
        String unidadeCelular = request.getParameter("txtUnidadeContatoCelular");
        String unidadeEmail = request.getParameter("txtUnidadeContatoEmail");
        String unidadeNumeroLogradouro = request.getParameter("txtUnidadeNumeroLogradouro");
        String pagina = request.getParameter("pagina");
        String codigoUnidade = request.getParameter("codigoUnidade");
        String codigoContato = request.getParameter("codigoContato");

        

        Unidade unidade = new Unidade();
        unidade.setUnidadeNome(unidadeNome);
        unidade.setUnidadeNumeroLogradouro(unidadeNumeroLogradouro);
        
        
        Contato contato = new Contato();
        contato.setContatoCelular(unidadeCelular);
        contato.setContatoEmail(unidadeEmail);
        contato.setContatoTelefone(unidadeTelefone);
        contato.setContatoTelefoneAlternativo(unidadeTelefoneAlternativo);
        
        
        
        if(codigoUnidade != null)
        {
            unidade.setUnidadeCodigo(Integer.parseInt(codigoUnidade));
            contato.setContatoCodigo(Integer.parseInt(codigoContato));
        }
        
        
        unidade.setContato(contato);
        
        
        String cep = request.getParameter("txtUnidadeLogradouroCep");
        
        EnderecoDao enderecoDao = new EnderecoDao();
        
        Logradouro logradouro = new Logradouro();

        
        logradouro = enderecoDao.consultarEndereco(cep);

        RequestDispatcher rd = request.getRequestDispatcher(pagina);

        request.setAttribute("unidade", unidade);
        request.setAttribute("logradouro", logradouro);
        
        rd.forward(request, response);
    }
}
