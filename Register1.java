/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package user;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Nandani
 */
@MultipartConfig
public class Register1 extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
        
            //getting all the incoming details from the request..
            String DBID=request.getParameter("Patient_DBId");
            String InternalID=request.getParameter("Patient_InternalId");
            String name=request.getParameter("Patient_Name");
            String Number=request.getParameter("Patient_ContactNumber");
            String Email=request.getParameter("Patient_ContactEmail");
            String Occupation=request.getParameter("Patient_Occupation");
            String Id=request.getParameter("Patient_IdNumber");
            String gender=request.getParameter("gender");
            String pdate=request.getParameter("pdate");
            Part part=request.getPart("image");
            String filename = part.getSubmittedFileName();
//            out.println(filename);
            
//            out.println(DBID);
//            out.println(InternalID);
//            out.println(name);
//            out.println(Number);
//            out.println(Email);
//            out.println(Occupation);
//            out.println(Id);
//            out.println(gender);
//            out.println(pdate);
            
            //creating connection...
            try{
                Thread.sleep(3000);
                
                Class.forName("com.mysql.cj.jdbc.Driver");
                
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/newpatientdb","root","nandani");
                //query
                String q="insert into patient_information(Patient_DBId,Patient_InternalId,Patient_Name,Patient_ContactNumber,Patient_ContactEmail,Patient_Occupation,Patient_IdNumber,gender,pdate,imageName) values(?,?,?,?,?,?,?,?,?,?)";
                
                PreparedStatement pstmt=con.prepareStatement(q);
                pstmt.setString(1, DBID);
                pstmt.setString(2, InternalID);
                pstmt.setString(3, name);
                pstmt.setString(4, Number);
                pstmt.setString(5, Email);
                pstmt.setString(6, Occupation);
                pstmt.setString(7, Id);
                pstmt.setString(8, gender);
                pstmt.setString(9, pdate);
               pstmt.setString(10, filename);
                
               pstmt.executeUpdate();
                 //upload.
                 InputStream is=part.getInputStream();
                 byte []data = new byte[is.available()];
                 
                 is.read(data);
                 String path=request.getRealPath("/")+"img"+File.separator+filename;
//                 out.println(path);
                 
                 FileOutputStream fos=new FileOutputStream(path);
                 fos.write(data);
                 fos.close();
                 
                out.println("done");
                
            }catch(Exception e){
                e.printStackTrace();
                out.println("error");
                
            }
            
            //query...................
            
            
            //...........
     
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
