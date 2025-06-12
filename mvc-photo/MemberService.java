package cs.dit.member;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface MemberService {
	public abstract void insertPro(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException;
	public abstract void updatePro(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException;
	public abstract void listPro(HttpServletRequest request, HttpServletResponse response);
	public abstract void deletePro(HttpServletRequest request, HttpServletResponse response);
	public abstract void getPro(HttpServletRequest request, HttpServletResponse response);
}
