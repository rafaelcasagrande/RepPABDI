/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLET;

import DAO.CargoDAO;
import DAO.FuncionarioDAO;
import DAO.UnidadeDAO;
import POJO.Cargo;
import POJO.Funcionario;
import POJO.Unidade;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ServletListarFuncionario extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        FuncionarioDAO funcionarioDao = new FuncionarioDAO();
        
        List<Object> funcionarios = new LinkedList<Object>();
        
        funcionarios = funcionarioDao.listarPessoa();
        
        RequestDispatcher rs = request.getRequestDispatcher("ConsultaFuncionario.jsp");
        

        List<Cargo> cargos = new LinkedList<Cargo>();
        List<Unidade> unidades = new LinkedList<Unidade>();
        
        CargoDAO cargoDao = new CargoDAO();
        UnidadeDAO unidadeDao = new UnidadeDAO();
        
        cargos = cargoDao.listarCargo();
        unidades = unidadeDao.listarUnidade();

        
        
        
        
        request.setAttribute("cargos", cargos);
        request.setAttribute("unidades", unidades);
        request.setAttribute("funcionarios", funcionarios);
        
        rs.forward(request, response);
    }
}
