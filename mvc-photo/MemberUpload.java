package cs.dit.member;

import java.io.File;
import java.io.IOException;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import cs.dit.member.MemberServiceImple;

@WebServlet("*.do")
@MultipartConfig(
	
)

public class MemberUpload extends HttpServlet {
	private static final long serialVersionUID = 1L; 

	private String photo = "";
	private String filePath = "";
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String contentType = request.getContentType();
		String viewPage = "";
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/")+1, uri.lastIndexOf(".do"));
		
		if(com!=null && com.equals("insertForm")) {
			viewPage = "WEB-INF/view/insertForm.jsp";
			
		}else if(com!=null && com.equals("insert")) {
			if(contentType!=null && contentType.toLowerCase().startsWith("multipart/")) {
				uploadfile(request,response);
			}
			MemberService ms = new MemberServiceImple();
			ms.insertPro(request, response);
			viewPage = "WEB-INF/view/list.jsp";
			
		}else if(com!=null && com.equals("index")) {
			viewPage="/WEB-INF/view/index.jsp";
		}
		else if(com!=null && com.equals("list")) {
			MemberService ms = new MemberServiceImple();
			ms.listPro(request, response);
			viewPage = "WEB-INF/view/list.jsp";
			
		}else if(com!=null && com.equals("get")) {
			MemberService ms = new MemberServiceImple();
			ms.getPro(request, response);
			viewPage = "WEB-INF/view/updateForm.jsp";
			
		}else if(com!=null && com.equals("update")) {
			MemberService ms = new MemberServiceImple();
			ms.updatePro(request, response);
			viewPage = "WEB-INF/view/list.jsp";
			
		}else if(com!=null && com.equals("delete")) {
			MemberService ms = new MemberServiceImple();
			ms.deletePro(request, response);
			viewPage = "WEB-INF/view/list.jsp";
		}
		RequestDispatcher rd = request.getRequestDispatcher(viewPage);
		rd.forward(request, response);
		
	}
	
	private void uploadfile(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String dir = request.getServletContext().getRealPath("/photos");
		
		File f = new File(dir);
		if(!f.exists()) {
			f.mkdirs();
		}
		
		Collection<Part> parts = request.getParts();

		for(Part p : parts) {
			if(p.getHeader("Content-Disposition").contains("filename=")) {

				if(p.getSize()>0) {
					photo = p.getSubmittedFileName();
					filePath = dir + File.separator + photo;
					p.write(filePath);
					p.delete();
				}
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}