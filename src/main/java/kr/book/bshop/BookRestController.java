package kr.book.bshop;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.book.entity.Book;
import kr.book.mapper.BookMapper;

@RestController
public class BookRestController {
	@Autowired
	private BookMapper bookMapper;
	
	@GetMapping("/book")
	public List<Book> bookList() {
		List<Book> list =  bookMapper.bookList();
		return list; // -> WEB-INF/views/boardList.jsp
	}
	
//	@RequestMapping("/bookListAjax.do")
//	public @ResponseBody List<Book> bookListAjax() {
//		List<Book> list =  bookMapper.bookListAjax();
//		return list;
//	}

	@PostMapping("/book")
	public void bookInsert(Book book){
		bookMapper.bookInsert(book);
	}
}
