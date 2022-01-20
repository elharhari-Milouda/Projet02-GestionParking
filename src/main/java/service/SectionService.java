package service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entities.Section;
import entities.User;
import connexion.Connexion;
import dao.IDao;

public class SectionService implements IDao<Section> {

	@Override
	public boolean create(Section o) {
		String sql = "insert into section values (null, ?)";
		try {
			PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
			ps.setString(1, o.getCode());
			if (ps.executeUpdate() == 1) {
				return true;
			}
		} catch (SQLException e) {
			System.out.println("create : erreur sql : " + e.getMessage());
		}
		return false;
	}

	@Override
	public boolean delete(Section o) {
		String sql = "delete from section where id = ?";
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
	public boolean update(Section o) {
		String sql = "update section set code  = ? where id  = ?";
		try {
			PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
			ps.setString(1, o.getCode());
			ps.setInt(2, o.getId());
			if (ps.executeUpdate() == 1) {
				return true;
			}
		} catch (SQLException e) {
			System.out.println("update : erreur sql : " + e.getMessage());

		}
		return false;
	}

	@Override
	public Section findById(int id) {
		// Section section = null;
		String sql = "select * from section where id  = ?";
		try {
			PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				return new Section(rs.getInt("id"), rs.getString("code"));
			}

		} catch (SQLException e) {
			System.out.println("findById " + e.getMessage());
		}
		return null;
	}
	
	public boolean findByCode(String code) {
		// Section section = null;
		String sql = "select * from section where code  = ?";
		try {
			PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
			ps.setString(1, code);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				return true;
			}

		} catch (SQLException e) {
			System.out.println("findById " + e.getMessage());
		}
		return false;
	}

	@Override
	public List<Section> findAll() {
		List<Section> sections = new ArrayList<Section>();

		String sql = "select * from section";
		try {
			PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
			;
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				sections.add(new Section(rs.getInt("id"), rs.getString("code")));
			}

		} catch (SQLException e) {
			System.out.println("findAll " + e.getMessage());
		}
		return sections;
	}

	

}
