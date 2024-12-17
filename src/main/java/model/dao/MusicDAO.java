package model.dao;

import java.util.ArrayList;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import model.bean.Music;
import model.bean.User;



public class MusicDAO {
	private Connection getConnection() throws SQLException {
		String url = "jdbc:mysql://localhost:3306/dulieu"; // Địa chỉ cơ sở dữ liệu
		String username = "root"; // Tên người dùng MySQL
		String password = ""; // Mật khẩu MySQL
		return DriverManager.getConnection(url, username, password);
	}
	public List<Music> getAllMusic() {
	    List<Music> musicList = new ArrayList<>();
	    String sql = "SELECT m.id, m.name, u.name , " +
	                 "FROM musics m " +
	                 "JOIN users u ON m.username = u.username";

	    try (Connection conn = getConnection();
	         PreparedStatement ps = conn.prepareStatement(sql);
	         ResultSet rs = ps.executeQuery()) {

	        while (rs.next()) {
	            Music music = new Music();
	            music.setiD(rs.getString("id"));
	            music.setName(rs.getString("name"));
	            music.setAuthorName(rs.getString("author_name"));
	            music.setDescription(rs.getString("description"));
	        
	            musicList.add(music);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return musicList;
	}

	public List<Music> searchMusic(String keyword) throws SQLException {
	    List<Music> musicList = new ArrayList<>();
	    String query = "SELECT m.music_id, m.name AS song_name, u.name AS artist_name, " +
	                   "u.image_url AS artist_image_url, m.image_url AS song_image_url " +
	                   "FROM musics m " +
	                   "LEFT JOIN users u ON m.user_id = u.user_id " +
	                   "WHERE m.name LIKE ? OR u.name LIKE ?";

	    try (Connection conn = getConnection();
	         PreparedStatement ps = conn.prepareStatement(query)) {
	        ps.setString(1, "%" + keyword + "%");
	        ps.setString(2, "%" + keyword + "%");

	        ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
	            Music music = new Music();
	            music.setiD(rs.getString("id"));
	            music.setName(rs.getString("name"));
	            music.setAuthorName(rs.getString("author_name"));
	     music.setDescription(rs.getString("description"));
	            musicList.add(music);
	        }
	    }
	    return musicList;
	}
	
	public ArrayList<Music> getMusicsByUsername(String _username) {
		ArrayList<Music> danhSachMusic = new ArrayList<>();
		String query = "SELECT * FROM musics where username = ?";
		try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {

			// Set the parameter in the prepared statement
			stmt.setString(1, _username);

			// Execute the query
			ResultSet rs = stmt.executeQuery();

			// Check if the result set contains a record
			while (rs.next()) {
				String name = rs.getString("name");
				String authorName = rs.getString("author_name");
				Date releasedDate = rs.getDate("released_date");
				String description = rs.getString("description");
				String id = rs.getString("id");
				Music music = new Music(name, authorName, releasedDate, description, _username, id);
				danhSachMusic.add(music);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return danhSachMusic; // Return null if no result is found or an error occurs
	}

	public ArrayList<Music> getMusicByFieldAndUsername(String searchField, String searchValue, String username) {
		ArrayList<Music> danhSachMusic = new ArrayList<>();
		String query = null;
		switch (searchField) {
		case "name":
			query = "SELECT * FROM musics WHERE name LIKE ? AND username = ?";
			break;
		case "author_name":
			query = "SELECT * FROM musics WHERE author_name LIKE ? AND username = ?";
			break;
		default:
			throw new IllegalArgumentException("Invalid field: " + searchField);
		}

		// Add % to value for pattern matching, if it's not already in the form of a
		// pattern

		searchValue = "%" + searchValue + "%";

		try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
			// Set the parameter in the prepared statement
			stmt.setString(1, searchValue);
			stmt.setString(2, username);

			// Execute the query
			ResultSet rs = stmt.executeQuery();

			// Check if the result set contains a record
			while (rs.next()) {
				String name = rs.getString("name");
				String authorName = rs.getString("author_name");
				Date releasedDate = rs.getDate("released_date");
				String description = rs.getString("description");
				String id = rs.getString("id");
				Music music = new Music(name, authorName, releasedDate, description, username, id);
				danhSachMusic.add(music);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return danhSachMusic; // Return null if no result is found or an error occurs
	}

	public Music getgetMusicByID(int _id) {
		String query = "SELECT * FROM musics WHERE id = ?";
		try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {

			// Set the parameter in the prepared statement
			stmt.setInt(1, _id);

			// Execute the query
			ResultSet rs = stmt.executeQuery();

			// Check if the result set contains a record
			if (rs.next()) {
				String name = rs.getString("name");
				String authorName = rs.getString("author_name");
				Date releasedDate = rs.getDate("released_date");
				String description = rs.getString("description");
				String username = rs.getString("username");
				String id = rs.getString("id");
				Music music = new Music(name, authorName, releasedDate, description, username, id);
				return music;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null; // Return null if no result is found or an error occurs
	}
	   public boolean updateMusic(Music music) {
	        String sql = "UPDATE musics SET name = ?, author_name = ?, description = ? WHERE id = ?";
	        try (Connection connection = getConnection();
	             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

	            // Set các giá trị vào câu lệnh SQL
	            preparedStatement.setString(1, music.getName());
	            preparedStatement.setString(2, music.getAuthorName());
	            preparedStatement.setString(3, music.getDescription());
	            preparedStatement.setString(4, music.getID());

	            // Thực thi câu lệnh
	            int rowsUpdated = preparedStatement.executeUpdate();
	            return rowsUpdated > 0; // Trả về true nếu có dòng được cập nhật
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return false; // Trả về false nếu xảy ra lỗi
	    }
	   public boolean deleteMusic(String id) {
		    String sql = "DELETE FROM musics WHERE id = ?";
		    try (Connection connection = getConnection();
		         PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

		        preparedStatement.setString(1, id);
		        int rowsDeleted = preparedStatement.executeUpdate();
		        return rowsDeleted > 0;
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		    return false;
		}
	   public boolean createMusic(Music music) throws SQLException {
		    // Cập nhật câu lệnh SQL
		    String sql = "INSERT INTO musics (name, author_name, description, released_date, username) VALUES (?, ?, ?, NOW(), ?)";
		    try (Connection connection = getConnection();
		         PreparedStatement statement = connection.prepareStatement(sql)) {

		        // Truyền các tham số cho PreparedStatement
		        statement.setString(1, music.getName());
		        statement.setString(2, music.getAuthorName());
		        statement.setString(3, music.getDescription());
		        statement.setString(4, music.getUsername());

		        // Thực hiện truy vấn
		        int rowsInserted = statement.executeUpdate();
		        return rowsInserted > 0; // Trả về true nếu thêm thành công
		    }
		}
	   public List<Music> getMusicsByArtist(String artistName) {
		    List<Music> musicList = new ArrayList<>();
		    String sql = "SELECT m.music_id, m.name AS song_name, m.image_url AS song_image, u.image_url AS artist_image " +
		                 "FROM musics m " +
		                 "JOIN users u ON m.user_id = u.user_id " +
		                 "WHERE u.name = ?";

		    try (Connection conn = getConnection();
		         PreparedStatement ps = conn.prepareStatement(sql)) {
		        ps.setString(1, artistName);
		        ResultSet rs = ps.executeQuery();

		        while (rs.next()) {
		            Music music = new Music();
		            music.setiD(rs.getString("id"));
		            music.setName(rs.getString("name")); 
		            music.setDescription(rs.getString("description"));
		            musicList.add(music);
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		    return musicList;
		}


}
