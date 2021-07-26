package edu.poly.common;

import java.util.List;

import edu.poly.dao.FavoriteDao;
import edu.poly.model.Favorite;
import edu.poly.model.Video;



public class FavoriteService {
	static FavoriteDao favoriteDAO = new FavoriteDao();

	public void like(Favorite favoriteModal) {
		favoriteDAO.insert(favoriteModal);
	}

	public static void unlike(Favorite favoriteModal) {
		favoriteDAO.delete(favoriteModal);
	}

	public List<Favorite> findAllVideoIdByUserId(int id) {
		return favoriteDAO.findAllVideoIdByUserId(id);
	}

	public List<Video> findAllByUserId(String id) {
		return favoriteDAO.findAllByUserId(id);
	}

	public static Favorite findOneByUserIdAndVideoId(String userId, String videoId) {
		return favoriteDAO.findOneByUserIdAndVideoId(userId, videoId);
	}
}
