package model.bo;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.bean.Music;
import model.dao.MusicDAO;

public class MusicBO {

	private MusicDAO musicDAO;

	// Constructor
	public MusicBO() {
		musicDAO = new MusicDAO(); // Khởi tạo DAO để truy cập cơ sở dữ liệu
	}

	// Phương thức lấy danh sách music
	public ArrayList<Music> getMusicsByUsername(String _username) {
		return musicDAO.getMusicsByUsername(_username); 
	}
	public ArrayList<Music> getMusicByFieldAndUsername(String searchField,String searchValue,String username){
		return musicDAO.getMusicByFieldAndUsername(searchField,searchValue,username);
	}
	public Music getMusicByID(int id) {
		return musicDAO.getgetMusicByID(id);
	}
	  public boolean updateMusic(Music music) {
		  return musicDAO.updateMusic(music);
	  }
	  public boolean deleteMusic(String id) {
		  return musicDAO.deleteMusic(id);
	  }
	  public boolean createMusic(Music music) throws SQLException {
		  return musicDAO.createMusic(music);
	  }
	  public List<Music> getMusicsByArtist(String artistName) {
		  return musicDAO.getMusicsByArtist(artistName);
	  }
	  public List<Music> searchMusic(String keyword) throws SQLException {
		  return musicDAO.searchMusic(keyword);
	  }
	  public List<Music> getAllMusic() {
		  return musicDAO.getAllMusic();
	  }
}
