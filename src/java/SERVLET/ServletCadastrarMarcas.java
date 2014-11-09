

package SERVLET;

import POJO.Marca;
import DAO.MarcaDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletCadastrarMarcas extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String nomeMarca = request.getParameter("txtMarcaNome");
        
        boolean resultado = false;
        
        Marca marca = new Marca();
        
        marca.setMarcaNome(nomeMarca);
        
        MarcaDAO marcaDao = new MarcaDAO();
        
        resultado = marcaDao.adicionarMarca(marca);
        
        if(resultado)
        {
            System.out.println("Cadastro realizado com sucesso");
        }
        else
        {
            System.out.println("Falha em realizar o cadastro");
        }
    }
}
