package service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entities.User;
import connexion.Connexion;
import dao.IDao;

public class UserService implements IDao<User>{

	@Override
	public boolean create(User o) {
		String sql = "insert into user values (null, ?, ?)";
		try {
			PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
			ps.setString(1, o.getUsername());
			ps.setString(2, o.getPassword());
			if (ps.executeUpdate() == 1) {
				return true;
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean delete(User o) {
		String sql = "delete from user where id  = ?";
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
	public boolean update(User o) {
		String sql = "update user set username  = ?, password = ? where id  = ?";
        try {
            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
            ps.setString(1, o.getUsername());
			ps.setString(2, o.getPassword());
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
	public User findById(int id) {
		//Section section = null;
        String sql = "select * from user where id  = ?";
        try {
            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new User(rs.getInt("id"), rs.getString("username"), rs.getString("password"));
            }

        } catch (SQLException e) {
            System.out.println("findById " + e.getMessage());
        }
		return null;
	}

	@Override
	public List<User> findAll() {
		List<User> sections = new ArrayList<User>();

        String sql = "select * from user";
        try {
            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);;
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                sections.add(new User(rs.getInt("id"), rs.getString("username"), rs.getString("password")));
            }

        } catch (SQLException e) {
            System.out.println("findAll " + e.getMessage());
        }
        return sections;
	}
	
	public boolean validate(User o) {
		
		boolean status = false;
		
		String sql = "select * from user where username = ? and password = ?";
		
		try {
            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
            ps.setString(1, o.getUsername());
			ps.setString(2, o.getPassword());
            ResultSet rs = ps.executeQuery();
            status = rs.next();
        } catch (SQLException e) {
            System.out.println("validate : erreur sql : " + e.getMessage());
        }
		return status;		
	}

}
