    package db;

    import model.MenuItem;
    import util.DBUtil;

    import java.sql.*;
    import java.util.ArrayList;
    import java.util.List;

    public class MenuDAO {
        public List<MenuItem> getAllMenuItems() {
            List<MenuItem> items = new ArrayList<>();
            // Corrected typo: "emnu_items" to "menu_items"
            String query = "SELECT * FROM menu_items";

            try (Connection conn = DBUtil.getConnection();
                 PreparedStatement ps = conn.prepareStatement(query);
                 ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {
                    MenuItem item = new MenuItem();
                    item.setId(rs.getInt("id"));
                    item.setName(rs.getString("name"));
                    item.setCategory(rs.getString("category"));
                    item.setPrice(rs.getDouble("price"));
                    item.setImagePath(rs.getString("image_path"));
                    items.add(item);
                }

            } catch (SQLException e) { // Catch SQLException specifically
                e.printStackTrace();
            } catch (Exception e) { // Catch other potential exceptions
                e.printStackTrace();
            }

            return items;
        }
    }
    