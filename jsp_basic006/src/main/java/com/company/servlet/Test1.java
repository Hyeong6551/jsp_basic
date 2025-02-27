package com.company.servlet;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Test1
 */
@WebServlet("/Test1")
public class Test1 extends HttpServlet {
	
	//---- init ----// 		최초에  1번만 실행
	@Override
	public void init(ServletConfig config) throws ServletException {
		System.out.println("init called");
		super.init();
	}

	//---- destroy ----//	창이 꺼지면 호출
	@Override
	public void destroy() {
		System.out.println("destroy called");
		super.destroy();
	}

	//---- service ----//
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("service called");
		super.service(req, resp);
	}

	//---- doGet/doPost ----//
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("doGet called");
		super.doGet(req, resp);
	}

	@Override	// syso X
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("doPost called");
		super.doPost(req, resp);
	}

	
	
}
