package edu.poly.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;


import edu.poly.domain.FavoriteReport;
import edu.poly.domain.FavoriteUserReport;
import edu.poly.model.Favorite;
import edu.poly.model.User;
import edu.poly.model.Video;

public class FavoriteDao extends AbstractEntityDao<Favorite> {
	EntityManager entityManager = JpaUtils.getEntityManager();

	public FavoriteDao() {
		super(Favorite.class);
	}

	public List<FavoriteUserReport> reporFavoriteUserByVideo(String videoId) {
		String jpql = "select new edu.poly.domain.FavoriteUserReport(f.user.username,f.user.fullname,"
				+ "f.user.email,f.likeDate) from Favorite f where f.video.videoId=:videoId";
		EntityManager em = JpaUtils.getEntityManager();
		List<FavoriteUserReport> list = null;
		try {

			TypedQuery<FavoriteUserReport> query = em.createQuery(jpql, FavoriteUserReport.class);
			query.setParameter("videoId", videoId);
			list = query.getResultList();
		} finally {
			// TODO: handle exceptiond
			em.close();
		}
		return list;
	}
	public List<Favorite> findAllVideoIdByUserId(int id) {
		entityManager.clear();
		try {
			List<Favorite> list = entityManager.find(User.class, id).getFavorites();
			return list;
		} catch (Exception e) {
			return null;
		}

	}
	public List<Video> findAllByUserId(String id,int firstresult,int maxresult) {
		EntityManager em=JpaUtils.getEntityManager();
		try {
			String sql = "SELECT v.VideoId FROM Favorite v WHERE v.User.username = :username";
			TypedQuery<Video> query = entityManager.createQuery(sql, Video.class);
			query.setParameter("id", id);
			query.setFirstResult(firstresult);
			query.setMaxResults(maxresult);

		
			return query.getResultList();
		} catch (Exception e) {
			return null;
		}
	}
	
	
	public List<Video> findAllByUserId(String username) {
		EntityManager en = JpaUtils.getEntityManager();
		try {
			String jpql = "SELECT v.video FROM Favorite v WHERE v.user.username = :username";	
			TypedQuery<Video> query = en.createQuery(jpql, Video.class);
			query.setParameter("username", username);
			List<Video> list = query.getResultList();
			return list;
		} catch (Exception e) {
			return null;
		}
	}	
	
	
	public List<FavoriteReport> reporFavoriteByVideo() {
		String jpql = "select new edu.poly.domain.FavoriteReport(f.video.title,count(f),min(f.likeDate),max(f.likeDate)) "
				+ " from Favorite f group by f.video.title ";
		EntityManager em = JpaUtils.getEntityManager();
		List<FavoriteReport> list = null;
		try {
			TypedQuery<FavoriteReport> query = em.createQuery(jpql, FavoriteReport.class);
			list = query.getResultList();
		} finally {
			// TODO: handle exception
			em.close();
		}
		return list;
	}
	
	public Favorite findOneByUserIdAndVideoId(String userId, String videoId)
	{
		EntityManager em = JpaUtils.getEntityManager();
		try {
			String sql = "SELECT f FROM Favorite f WHERE f.user.username =:userId and f.video.videoId =:videoId";
			TypedQuery<Favorite> query = em.createQuery(sql,Favorite.class);
			query.setParameter("userId", userId);
			query.setParameter("videoId", videoId);
			Favorite favorite = query.getSingleResult();
			return favorite;
			
		} catch (Exception e) {
			return null;
		}
		
		
	}

	
}
