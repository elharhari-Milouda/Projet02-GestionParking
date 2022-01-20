package service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entities.Place;
import entities.User;
import connexion.Connexion;
import dao.IDao;

public class PlaceService implements IDao<Place> {

	@Override
	public boolean create(Place o) {
		String sql = "insert into place values (null, ?, ?, ?, ?)";
		try {
			PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
			ps.setInt(1, o.getNumero());
			ps.setString(2, o.getEtat());
			ps.setString(3, o.getType());
			ps.setInt(4, o.getSection());
			if (ps.executeUpdate() == 1) {
				return true;
			}
		} catch (SQLException e) {
			System.out.println("create : erreur sql : " + e.getMessage());
		}
		return false;
	}

	@Override
	public boolean delete(Place o) {
		String sql = "delete from place where id  = ?";
		try {
			PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
			ps.setInt(1, o.getId());
			if (ps.executeUpdate() == 1) {
				return true;
			}
		} catch (SQLException e) {
			System.out.println("delete : erreur sql : " + e.getMessage());

		}
		return false;
	}

	@Override
	public boolean update(Place o) {
		String sql = "update place set numero  = ?, etat  = ?, type  = ?, section  = ? where id  = ?";
		try {
			PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
			ps.setInt(1, o.getNumero());
			ps.setString(2, o.getEtat());
			ps.setString(3, o.getType());
			ps.setInt(4, o.getSection());
			ps.setInt(5, o.getId());
			if (ps.executeUpdate() == 1) {
				return true;
			}
		} catch (SQLException e) {
			System.out.println("update : erreur sql : " + e.getMessage());

		}
		return false;
	}

	@Override
	public Place findById(int id) {
		// Place place = null;
		String sql = "select * from place where id  = ?";
		try {
			PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				return new Place(rs.getInt("id"), rs.getInt("numero"), rs.getString("etat"), rs.getString("type"),
						rs.getInt("section"));
			}

		} catch (SQLException e) {
			System.out.println("findById " + e.getMessage());
		}
		return null;
	}

	@Override
	public List<Place> findAll() {
		List<Place> sections = new ArrayList<Place>();

		String sql = "select * from place";
		try {
			PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
			;
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				sections.add(new Place(rs.getInt("id"), rs.getInt("numero"), rs.getString("etat"), rs.getString("type"),
						rs.getInt("section")));
			}

		} catch (SQLException e) {
			System.out.println("findAll " + e.getMessage());
		}
		return sections;
	}

	public boolean findByNumeroSection(int numero, int section) {
		// Section section = null;
		String sql = "select * from place where numero = ? and section = ?";
		try {
			PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
			ps.setInt(1, numero);
			ps.setInt(2, section);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				return true;
			}

		} catch (SQLException e) {
			System.out.println("findByNum " + e.getMessage());
		}
		return false;
	}

	public Place findByNum(int numero) {
		// Section section = null;
		String sql = "select * from place where numero = ?";
		try {
			PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
			ps.setInt(1, numero);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				return new Place(rs.getInt("id"), rs.getInt("numero"), rs.getString("etat"), rs.getString("type"),
						rs.getInt("section"));
			}

		} catch (SQLException e) {
			System.out.println("findByNum " + e.getMessage());
		}
		return null;
	}

}
