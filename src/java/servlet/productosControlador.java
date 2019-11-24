/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;


import daoimp.productoDAOIMP;
import dto.productoDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author parisbastian
 */
public class productosControlador extends HttpServlet {

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
               productoDTO producto = new productoDTO();
                productoDAOIMP pro = new productoDAOIMP();
               
        if (request.getParameter("agregarProducto") != null){
                 int idCategoria = Integer.parseInt(request.getParameter("selCat"));
                 String nombre = request.getParameter("txtNombre").trim();
                 String marca = request.getParameter("txtMarca").trim();
                 int pCompra = Integer.parseInt(request.getParameter("numCompra"));
                 int pVenta = Integer.parseInt(request.getParameter("numVenta"));
                
                 //cambiar el codigo de barra:
                 String codigoBarra = "sda";
                 int stock = Integer.parseInt(request.getParameter("numStock"));
                 int stockCri = Integer.parseInt(request.getParameter("numStockCri"));
                 String descripcion = request.getParameter("txtDescripcion").trim();
                 java.util.Date datex = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("fechaVen"));
                 java.sql.Date sqlDate = new java.sql.Date(datex.getTime()); 
                
                        producto.setDescripcion(descripcion);
                        producto.setIdfamilia(idCategoria);
                        producto.setNombre(nombre);
                        producto.setMarca(marca);
                        producto.setPreciocompra(pCompra);
                        producto.setPrecioventa(pVenta);
                        producto.setFechavencimiento(sqlDate);
                        producto.setCodigobarra(codigoBarra);
                        producto.setStock(stock);
                        producto.setStockcritico(stockCri);
                        System.out.println(sqlDate);
                        System.out.println(nombre+" pc:"+pCompra+" pv:"+pVenta+" idcate:"+idCategoria+" marca:"+marca+" codbarra:"+codigoBarra+" descripcion:"+descripcion+" sto:"+stock+"stoc: "+stockCri);
                        pro.agregar(producto);
                           request.setAttribute("mensaje", "Producto Agregado Correctamente");

            }else if (request.getParameter("eliminarProducto") != null){
                
                        int id = Integer.parseInt(request.getParameter("numId"));
                        pro.eliminar(id);
                        request.setAttribute("mensaje", "Producto Eliminado Correctamente");

            
            } else if (request.getParameter("editarCategoria") != null){
                
                    String nombre = request.getParameter("txtNombre").trim();
                    int pCompra = Integer.parseInt(request.getParameter("numCompra"));
                    int pVenta = Integer.parseInt(request.getParameter("numVenta"));
                    int idCategoria = Integer.parseInt(request.getParameter("selCat"));
                    String marca = request.getParameter("txtMarca").trim();
                     java.util.Date datex = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("fechaVen"));
                     java.sql.Date sqlDate = new java.sql.Date(datex.getTime()); 
                     //cambiar el codigo de barra:
                    String codigoBarra = "sda";
                     String descripcion = request.getParameter("txtDescripcion").trim(); 
                    int stock = Integer.parseInt(request.getParameter("numStock"));
                    int stockCri = Integer.parseInt(request.getParameter("numStockCri"));
                    int numId=Integer.parseInt(request.getParameter("numId"));
                    System.out.println(numId);
                 pro.actualizar(nombre,pCompra,pVenta,idCategoria,marca,sqlDate,codigoBarra,descripcion,stock,stockCri,numId);
                     request.setAttribute("mensaje", "Producto Editado Correctamente");
            
            }
        
           request.getRequestDispatcher("/paginas/admin/adminProductos.jsp").forward(request, response);
           
        } catch (ParseException ex) {
            Logger.getLogger(productosControlador.class.getName()).log(Level.SEVERE, null, ex);
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
