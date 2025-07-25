package cs.dit.member;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import cs.dit.dao.MemberDAO;
import cs.dit.dto.MemberDTO;
import cs.dit.member.MemberService;

public class MemberServiceImple implements MemberService{
	private String photo = "";
	private String filePath = "";
	@Override
	public void insertPro(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String pwd = request.getParameter("pwd");
		
		
		MemberDTO dto = new MemberDTO(id, name, pwd, photo);
		MemberDAO dao = new MemberDAO();
		dao.insert(dto);
	}

	@Override
	public void updatePro(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String pwd = request.getParameter("pwd");
		photo = request.getParameter("photo");
		
		uploadfile(request,response);
		
		MemberDTO dto = new MemberDTO(id, name, pwd, photo);
		MemberDAO dao = new MemberDAO();
		dao.update(dto);
	}
	
	@Override
	public void getPro(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		MemberDTO dto = new MemberDTO();
		MemberDAO dao = new MemberDAO();
		
		dto = dao.get(id);
		request.setAttribute("dto", dto);
	}

	@Override
	public void listPro(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		MemberDAO dao = new MemberDAO();
		ArrayList<MemberDTO> dtos = dao.list();
		request.setAttribute("dtos", dtos);
	}

	@Override
	public void deletePro(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");

		MemberDAO dao = new MemberDAO();
		dao.delete(id);
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

}
