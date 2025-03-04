package com.company.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.company.dao.mvc001DAO;
import com.company.dto.mvc001DTO;

/**
 * Servlet implementation class MemberController
 */
@WebServlet("*.do")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        String contextPath = request.getContextPath();
        String command = uri.substring(contextPath.length());
		mvc001DAO mdao = new mvc001DAO();
        String view = null;
        
    	try {
            switch (command) {
                case "/index.do":
                    view = "/index.jsp";
                    break;
                case "/register.do":
            		String username = request.getParameter("username");
            		int age = Integer.parseInt(request.getParameter("age"));
            		
            		mvc001DTO mdto = new mvc001DTO(username, age);
            		mdao.mvc001Insert(mdto);

            		request.setAttribute("member",mdto);
                    view = "/result.jsp";
                	break;
                case "/list.do":
                    request.setAttribute("mvclist", mdao.getmvc001List());
                    view = "/list.jsp";
                	break;
                    
                default:
                    response.sendRedirect("index.do");
                    return;
            }
            
            if (view != null) {
                request.getRequestDispatcher(view).forward(request, response);
            } else {
                response.sendRedirect("index.do");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error/500.jsp");
        }
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
