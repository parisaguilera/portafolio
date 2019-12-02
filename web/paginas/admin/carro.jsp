<% 
out.print(request.getParameter("id"));
    %>
<div class="row mt-5">
                        <fieldset class="border p-2 col-12 text-center sinLados">
                        <legend  class="w-auto modalFont">Carro</legend>
                           <table class="table table-bordered">
                                
                                <thead>
                                    <tr>
                                        <th class="headTableText">Nombre Producto</th>
                                        <th class="headTableText">Stock</th>
                                        <th class="headTableText">Cantidad</th>  
                                        <th class="headTableText">Precio Unitario</th>
                                        <th class="headTableText">Precio Total</th>
                                    </tr>
                                </thead>
                                </thead>
                                <tbody>

                                        <tr class="redaccion">
                                            <td class="bodyTableText">Tableta gráfica Wacom Intuos Pro Creative Pen Tablet (Medium), Multi-Touch, USB, Bluetooth 4.2</td>
                                            <th class="headTableText">Stock</th>
                                            <td class="bodyTableText"> <input type="number" name="numCan" class="cantidad"></td> 
                                            <td class="bodyTableText">$2323</td>
                                            <td class="bodyTableText">$2323</td>
                          
                                        </tr>
                                        <tr class="redaccion">
                                            <td colspan="3"></td>
                                            <td class="headTableText">TOTAL:</td> 
                                            <td class="headTableText">$2323</td>
                                        </tr>
                                 
                                </tbody>
                            </table>
                        </fieldset>
                           
                      </div>

                <div class="row mt-5">
                    <div class="col text-right">
                                <input type="submit" name="finalizarVenta" value="Registrar Venta" class="btn-success rounded-pill finalizarVenta">
                    </div>
                </div>