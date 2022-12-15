package DAO;

import entity.Blog;

import java.sql.SQLException;
import java.util.List;

public interface TungBlogDao {
	List<Blog> findAll(int start, int end);

	int getTotalBlog() throws SQLException;

    Blog findById(int blogId);
}
