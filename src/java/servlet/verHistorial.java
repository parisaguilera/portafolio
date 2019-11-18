package servlet;

import daoimp.clienteDAOIMP;
import daoimp.pagoFiadoDAOIMP;
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
public class verHistorial extends HttpServlet {

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
            //servlet compartido: deudas.jsp y verHistorial.jsp
            
            //setieando el IMP para acceder a sus metodos
            pagoFiadoDAOIMP fiado = new pagoFiadoDAOIMP();
            clienteDAOIMP cliente = new clienteDAOIMP();

            //este boton esta en la vista de deudas.jsp
          if (request.getParameter("verInforme") != null){
              
            //valores para desplegar una vista limpia
            String total = request.getParameter("numTotal");
            String rut = request.getParameter("txtRut");
            int idDeuda = Integer.parseInt(request.getParameter("numDeuda"));
            
            //Listamos lo que tengamos en fiado dependiendo el ID del pagofiado
            ArrayList<pagoFiadoDTO> fiados = fiado.listarTodos(idDeuda);
            request.setAttribute("fiados", fiados);
            request.setAttribute("total", total);
            request.setAttribute("idDeuda", idDeuda);
            request.setAttribute("rut", rut);
            request.getRequestDispatcher("/paginas/verHistorial.jsp").forward(request, response);
             
            //este boton esta en la vista verHistorial.jsp
          }else if(request.getParameter("abonar") != null){
              //<- Parametros para mantener el flujo
              String total = request.getParameter("numTotal");
              String rut = request.getParameter("txtRut");
              //->
              
              //<- Parametros para validar que esta abonando lo correcto.
              int abono = Integer.parseInt(request.getParameter("numAbono"));
              int diferencia = Integer.parseInt(request.getParameter("numDiferencia"));
              //->
              //si la diferencia es igual al abono ENTONCES ESTA BIEN
              if(diferencia==abono){
                  //<-Parametros para insertar el abono
                    pagoFiadoDTO pagofiado = new pagoFiadoDTO();
                    int idDeuda = Integer.parseInt(request.getParameter("numIdpago"));
                    pagofiado.setIdpagofiado(idDeuda);
                    pagofiado.setIdcliente(Integer.parseInt(request.getParameter("numIdCliente")));                    
                    pagofiado.setAbono(abono);
                    //la DATE esta en el metodo pagofiadoDAOIMP...
                    //-->ahora llamamos al metodo para Agregar el abono declarado al principio
                    fiado.agregar(pagofiado);
                    //-> set lista para desplegar el nuevo campo agregado
                     ArrayList<pagoFiadoDTO> fiados = fiado.listarTodos(idDeuda);     
                     //-> mandamos los datos por request.
                        request.setAttribute("fiados", fiados);
                        request.setAttribute("total", total);
                        request.setAttribute("idDeuda", idDeuda);
                        request.setAttribute("rut", rut);
                        request.setAttribute("mensaje", "Deuda Saldada");
                        request.getRequestDispatcher("/paginas/verHistorial.jsp").forward(request, response);
                        //System.out.println("DEUDA SALDADA");
              //si solo esta abonando:
              }else if(diferencia>abono){
                  //<-Parametros para insertar el abono
                    pagoFiadoDTO pagofiado = new pagoFiadoDTO();
                    int idDeuda = Integer.parseInt(request.getParameter("numIdpago"));
                    pagofiado.setIdpagofiado(idDeuda);
                    pagofiado.setIdcliente(Integer.parseInt(request.getParameter("numIdCliente")));                    
                    pagofiado.setAbono(abono);
                    //la DATE esta en el metodo pagofiadoDAOIMP...
                    //-->ahora llamamos al metodo para Agregar el abono declarado al principio
                    fiado.agregar(pagofiado);
                    //-> set lista para desplegar el nuevo campo agregado
                     ArrayList<pagoFiadoDTO> fiados = fiado.listarTodos(idDeuda);
                     //-> Actualizamos la boleta del cliente ya que esta pagada
                     //set mensaje->
                     String mensaje= "Te faltan: "+(diferencia-abono);
                        request.setAttribute("fiados", fiados);
                        request.setAttribute("total", total);
                        request.setAttribute("idDeuda", idDeuda);
                        request.setAttribute("rut", rut);
                        request.setAttribute("mensaje", mensaje);
                        request.getRequestDispatcher("/paginas/verHistorial.jsp").forward(request, response);
                
              }        
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
