package DAO;

import context.DBContext;
import entity.*;
import utils.TungUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class TungBlogDaoImpl extends DBContext implements TungBlogDao {
	@Override
	public List<Blog> findAll(int start, int end) {
		List<Blog> blogList = new ArrayList<>();
		Connection connection = null;
		PreparedStatement ps = null;
		try {
			connection = getConnection();
			StringBuilder sql = new StringBuilder();
			if (start != 0 && end != 0) {
				sql.append("SELECT * FROM ( ");
			}
			sql.append("SELECT * FROM Blog ");
			if (start != 0 && end != 0) {
				sql.append(") a WHERE a.rownumber BETWEEN ? AND ?");
			}
			ps = connection.prepareStatement(sql.toString());

			if (start != 0 && end != 0) {
				ps.setInt(1, start);
				ps.setInt(2, end);
			}
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				int blogId = rs.getInt("blog_id");
				int managerId = rs.getInt("manager_id");
				String content = rs.getString("content");
				Date time = rs.getDate("time");
				int timeRead = rs.getInt("time_read");
				int heart = rs.getInt("heart");
				int comment = rs.getInt("comment");
				String title = rs.getString("title");

				blogList.add(new Blog(blogId, managerId, content, time, timeRead, heart, comment, title));

			}
		} catch (Exception e) {
			System.out.println("err: " + e.getMessage());
		} finally {
			try {
				if (ps != null) {
					ps.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return blogList;
	}

	@Override
	public int getTotalBlog() throws SQLException {
		Connection connection = null;
		PreparedStatement ps = null;
		int totalBlog = 0;
		try {
			connection = getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT COUNT(*) as total FROM Blog ");
			ps = connection.prepareStatement(sql.toString());
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				totalBlog = rs.getInt("total");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (connection != null) {
				connection.close();
			}
			if (ps != null) {
				ps.close();
			}
		}
		return totalBlog;
	}
}
