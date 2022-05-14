package kr.book.mapper;

import java.util.List;

import kr.book.entity.Book;

public interface BookMapper {

	public List<Book> bookList();

	public List<Book> bookListAjax();



}
