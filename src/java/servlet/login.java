/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import daoimp.usuarioDAOIMP;

import dto.productoDTO;
import dto.productospedidoDTO;
import dto.usuarioDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author parisbastian
 */
public class login extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession sesion = request.getSession();
            
            String user= request.getParameter("txtUsuario").trim();
            String pass = request.getParameter("txtContrasena").trim();
            
           
            if (new usuarioDAOIMP().existe(user)) {
                
                if (new usuarioDAOIMP().validarUsuario(user, pass)) {
                    usuarioDTO usuario = new usuarioDAOIMP().leerUsuario(user);
                    ArrayList<productoDTO> lista = new ArrayList<productoDTO>();
                    ArrayList<productospedidoDTO> listaOrden = new ArrayList<productospedidoDTO>();
                    sesion.setAttribute("usuario", usuario);
                    sesion.setAttribute("carrito", lista);
                    sesion.setAttribute("listaOrden", listaOrden);
                    System.out.println("LOGIN EXITOSO");
                    System.out.println(lista.size());
                    request.getRequestDispatcher("paginas/admin/administracion.jsp").forward(request, response);
                   

                } else {
                    System.out.println("Contraseña invalida");
                    request.setAttribute("mensaje", "Contraseña invalida");
                    request.getRequestDispatcher("/paginas/login.jsp").forward(request, response);
                }

           } else {
                System.out.println("USER NO EXISTE");
                request.setAttribute("mensaje", "Usuario no existe");
                request.getRequestDispatcher("/paginas/login.jsp").forward(request, response);
            }
        }

    }
    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
