
package SERVLET;

import DAO.CargoDAO;
import DAO.EnderecoDao;
import DAO.FuncionarioDAO;
import DAO.UnidadeDAO;
import POJO.Cargo;
import POJO.Contato;
import POJO.Funcionario;
import POJO.Logradouro;
import POJO.Pessoa;
import POJO.Unidade;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author rafael
 */
public class ServletListarEnderecoPessoa extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        SimpleDateFormat formatoData = new SimpleDateFormat("dd/MM/yyyy");
        
        String pessoaNome = request.getParameter("txtPessoaNome");
        String pessoaSobrenome = request.getParameter("txtPessoaSobrenome");
        String pessoaCpf = request.getParameter("txtPessoaCpf");
        String pessoaDataNascimento = request.getParameter("txtPessoaDataNascimento");
        String contatoTelefone = request.getParameter("txtContatoTelefone");
        String contatoTelefoneAlt = request.getParameter("txtContatoTelefoneAlternativo");
        String contatoCelular = request.getParameter("txtContatoCelular");
        String contatoEmail = request.getParameter("txtContatoEmail");
        String funcionarioDataAdmissao = request.getParameter("txtFuncionarioDataAdmissao");
        String pessoaNumeroLogradouro = request.getParameter("txtPessoaNumeroLogradouro");
        String pessoaCep = request.getParameter("txtPessoaLogradouroCep");
        String codigoCargo = request.getParameter("cbxFuncionarioCargo");
        String codigoUnidade = request.getParameter("cbxFuncionarioUnidade");
        String pagina = request.getParameter("pagina");
        
        String codigoPessoa = request.getParameter("txtPessoaCodigo");
        String codigoFuncionario = request.getParameter("txtFuncionarioCodigo");
        String codigoContato = request.getParameter("txtContatoCodigo");
        if(codigoPessoa == null)
        {
            codigoPessoa = "0";
            codigoFuncionario = "0";
            codigoContato = "0";
        }
        
        Date dataNascimento = null;
        Date dataAdmissao = null;
        try
        {
            dataNascimento = formatoData.parse(pessoaDataNascimento);
            dataAdmissao = formatoData.parse(funcionarioDataAdmissao);
        }
        catch(ParseException e)
        {
            e.printStackTrace();
        }
        
        Pessoa pessoa = new Pessoa();
        pessoa.setPessoaCpf(pessoaCpf);
        
        
        if(!pessoaDataNascimento.equals(""))
            pessoa.setPessoaDataNascimento(dataNascimento);
        
        pessoa.setPessoaCodigo(Integer.parseInt(codigoPessoa));
        pessoa.setPessoaNome(pessoaNome);
        pessoa.setPessoaNumeroLogradouro(pessoaNumeroLogradouro);
        pessoa.setPessoaSobrenome(pessoaSobrenome);
        
        Funcionario funcionario = new Funcionario();
        funcionario.setFuncionarioCodigo(Integer.parseInt(codigoFuncionario));
        
        if(!funcionarioDataAdmissao.equals(""))
            funcionario.setFuncionarioDataAdmissao(dataAdmissao);
                
        Contato contato = new Contato();
        contato.setContatoCelular(contatoCelular);
        contato.setContatoEmail(contatoEmail);
        contato.setContatoTelefone(contatoTelefone);
        contato.setContatoTelefoneAlternativo(contatoTelefoneAlt);
        contato.setContatoCodigo(Integer.parseInt(codigoContato));
        
        EnderecoDao enderecoDao = new EnderecoDao();
        Logradouro logradouro = new Logradouro();
        
        logradouro = enderecoDao.consultarEndereco(pessoaCep);

        pessoa.setContato(contato);
        funcionario.setPessoa(pessoa);
        pessoa.setLogradouro(logradouro);

        RequestDispatcher rd = request.getRequestDispatcher(pagina);

        List<Cargo> cargos = new LinkedList<Cargo>();
        List<Unidade> unidades = new LinkedList<Unidade>();
        
        CargoDAO cargoDao = new CargoDAO();
        UnidadeDAO unidadeDao = new UnidadeDAO();
        
        cargos = cargoDao.listarCargo();
        unidades = unidadeDao.listarUnidade();

        
        FuncionarioDAO funcionarioDao = new FuncionarioDAO();
        
        List<Object> funcionarios = new LinkedList<Object>();
        
        funcionarios = funcionarioDao.listarPessoa();
        
        request.setAttribute("funcionarios", funcionarios);
        request.setAttribute("cargos", cargos);
        request.setAttribute("unidades", unidades);
        request.setAttribute("funcionario", funcionario);
        request.setAttribute("pessoaDataNascimento", pessoaDataNascimento);
        request.setAttribute("funcionarioDataAdmissao", funcionarioDataAdmissao);
        
        rd.forward(request, response);       
    }
}
