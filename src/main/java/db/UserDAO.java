    package db;

    import java.sql.*;
    import model.User;
    import util.DBUtil; // Import DBUtil

    public class UserDAO {
        // Remove the direct JDBC URL, username, password fields as DBUtil handles them

        private Connection getConnection() throws SQLException {
            // Use DBUtil to get the connection
            return DBUtil.getConnection();
        }

        public boolean register(User user) {
            String sql = "INSERT INTO users (name, email, password) VALUES (?, ?, ?)";
            try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, user.getName());
                stmt.setString(2, user.getEmail());
                stmt.setString(3, user.getPassword()); // Password hashing will be added in Step 5
                return stmt.executeUpdate() > 0;
            } catch (SQLException e) { // Catch SQLException specifically
                e.printStackTrace();
                return false;
            }
        }

        public boolean login(String email, String password) {
            String sql = "SELECT * FROM users WHERE email = ? AND password = ?";
            try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, email);
                stmt.setString(2, password); // Password hashing will be added in Step 5
                ResultSet rs = stmt.executeQuery();
                return rs.next();
            } catch (SQLException e) { // Catch SQLException specifically
                e.printStackTrace();
                return false;
            }
        }

        public int getUserIdByEmail(String email) {
            String sql = "SELECT id FROM users WHERE email = ?";
            try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, email);
                ResultSet rs = stmt.executeQuery();
                if (rs.next()) return rs.getInt("id");
            } catch (SQLException e) { // Catch SQLException specifically
                e.printStackTrace();
            }
            return -1;
        }
    }
    