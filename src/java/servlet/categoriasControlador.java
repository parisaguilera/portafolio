/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import daoimp.familiaProductoDAOIMP;
import dto.familiaProductoDTO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author parisbastian
 */
public class categoriasControlador extends HttpServlet {

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
            //order: Agregar -> eliminar -> editar
            familiaProductoDTO familia = new familiaProductoDTO();
           //->Agregar categorias:
            if (request.getParameter("agregarCategoria") != null){
                
                 String nombre= request.getParameter("txtNombre").trim();
                 String medida = request.getParameter("selMedida");
                    //validamos si existe el nombre de la categoria
                    if(new familiaProductoDAOIMP().existe(nombre)){
                        request.setAttribute("mensaje", "El nombre de la Categoria ya existe");
                        request.getRequestDispatcher("paginas/admin/categorias.jsp").forward(request, response);
                    }else{//sino, agregamos normal      
                        familia.setNombre(nombre);
                        familia.setMedida(medida);
                        new familiaProductoDAOIMP().agregar(familia);
                        request.setAttribute("mensaje", "Categoria Agregada Correctamente");
                        request.getRequestDispatcher("/paginas/admin/categorias.jsp").forward(request, response);
                    }
            } else if (request.getParameter("eliminarCategoria") != null){
                
                        int id = Integer.parseInt(request.getParameter("numId"));
                        new familiaProductoDAOIMP().eliminar(id);
                        System.out.println("paseporaqui");
                        request.setAttribute("mensaje", "Categoria Eliminada Correctamente");
                        request.getRequestDispatcher("/paginas/admin/categorias.jsp").forward(request, response);
            
            } else if (request.getParameter("editarCategoria") != null){
                
                int id = Integer.parseInt(request.getParameter("numId"));
                 String nombre= request.getParameter("txtNombre").trim();
                 String medida = request.getParameter("selMedida");
                        new familiaProductoDAOIMP().actualizar(id,nombre,medida);
                        request.setAttribute("mensaje", "Categoria Editada Correctamente");
                        request.getRequestDispatcher("/paginas/admin/categorias.jsp").forward(request, response);
            
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
