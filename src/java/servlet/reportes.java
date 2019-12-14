/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import daoimp.boletaDAOIMP;
import daoimp.pagoFiadoDAOIMP;
import daoimp.productoDAOIMP;
import dto.boletaDTO;
import dto.pagoFiadoDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author parisbastian
 */
public class reportes extends HttpServlet {

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
        
          if(request.getParameter("estado") != null){
              
          boletaDAOIMP boleta = new boletaDAOIMP();
          productoDAOIMP producto = new productoDAOIMP();
          String rut = request.getParameter("deudas");
          int estado = Integer.parseInt(request.getParameter("deudas"));
          
          ArrayList<boletaDTO> bol = boleta.listarTodosTodosAceptados(rut);
          
              System.out.println(bol.size());
              
          response.setContentType("application/vnd.ms-excel");
                    response.setHeader("Content-disposition", "filename=deudas-"+rut+"-general"+".xls");
                       PrintWriter out = response.getWriter();
                    out.println("Folio Boleta\tNombre Producto\tCantidad\tTotal");
                    int total =0;
                    try {
                       for (boletaDTO dto : bol) {
                           String nombrePro=producto.idproductotonombre(dto.getIdproducto());
                           
                           out.println("00"+dto.getIdboleta()+"\t"+nombrePro+"\t"+dto.getCantidad()+"\t$"+dto.getTotal());
                           total += dto.getTotal();
                       }
                      out.println("\t"+"\tTotal:"+"\t$"+total);
        } finally{
            out.close();
        }
          
            }else if (request.getParameter("deudas") != null){
                    String rut = request.getParameter("deudas");
                    int idBoleta =Integer.parseInt(request.getParameter("idBoleta"));
                    
                    boletaDAOIMP boleta = new boletaDAOIMP();
                    productoDAOIMP producto = new productoDAOIMP();
                   
                    ArrayList<boletaDTO> bol = boleta.listarTodosporIDBOLETA(idBoleta);
                    
                    response.setContentType("application/vnd.ms-excel");
                    response.setHeader("Content-disposition", "filename=deudas-"+rut+"-00"+idBoleta+".xls");

                    PrintWriter out = response.getWriter();
                    out.println("Folio Boleta\tNombre Producto\tCantidad\tTotal");
                    int total =0;
                    try {
                       for (boletaDTO dto : bol) {
                           String nombrePro=producto.idproductotonombre(dto.getIdproducto());
                           
                           out.println("00"+dto.getIdboleta()+"\t"+nombrePro+"\t"+dto.getCantidad()+"\t$"+dto.getTotal());
                           total += dto.getTotal();
                       }
                      out.println("\t"+"\tTotal:"+"\t$"+total);
        } finally{
            out.close();
        }
    }
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
