package kr.book.bshop;

import java.io.IOException;	
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.book.entity.Book;
import kr.book.mapper.BookMapper;

@Controller
public class BookController {

	@Autowired
	private BookMapper bookMapper;

	@RequestMapping("/bookList.do")
	public String bookList(Model model) {
		List<Book> list =  bookMapper.bookList();
		model.addAttribute("list", list);
		return "bookList"; // -> WEB-INF/views/boardList.jsp
	}
	
	@RequestMapping("/bookListAjax.do")
	public @ResponseBody List<Book> bookListAjax() {
		List<Book> list =  bookMapper.bookListAjax();
		return list;
	}


}