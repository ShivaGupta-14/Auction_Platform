import java.sql.*;

public class AuctionService {
    private Connection conn;

    public AuctionService(Connection conn) {
        this.conn = conn;
    }

    //Current highest bid per item
    public void getCurrentHighestBidPerItem() {
        try {
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT item_id, MAX(bid_amount) AS highest_bid FROM bids GROUP BY item_id");
            while (rs.next()) {
                System.out.println("Item ID: " + rs.getInt("item_id") + " | Highest Bid: " + rs.getDouble("highest_bid"));
            }
        } catch (SQLException e) {
            System.out.println("Database error: " + e.getMessage());
        }
    }

    //List all active auctions ending within 1 hour
    public void listActiveAuctionsEndingSoon() {
        try {
            PreparedStatement stmt = conn.prepareStatement(
                "SELECT * FROM auctions WHERE end_time BETWEEN NOW() AND DATE_ADD(NOW(), INTERVAL 1 HOUR) AND status = 'ACTIVE'"
            );
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                System.out.println("Auction: " + rs.getString("auction_name") + " | Ends At: " + rs.getTimestamp("end_time"));
            }
        } catch (SQLException e) {
            System.out.println("Error fetching active auctions: " + e.getMessage());
        }
    }

    //Winning bidders for completed auctions
    public void findWinningBidders() {
        try {
            String sql =
                "SELECT wb.item_id, b.bidder_id, b.bid_amount " +
                "FROM winning_bids wb " + 
                "JOIN bids b ON wb.bid_id = b.bid_id " + 
                "JOIN items i ON wb.item_id = i.item_id " + 
                "WHERE i.status = 'EXPIRED'";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                System.out.println("Item ID: " + rs.getInt("item_id") + " | Winning User: " + rs.getInt("bidder_id") + " | Winning Bid: " + rs.getDouble("bid_amount"));
            }
        } catch (SQLException e) {
            System.out.println("Error fetching winning bidders: " + e.getMessage());
        }
    }

    //Bidding history for a specific item
    public void showBiddingHistory(int itemId) {
        try {
            PreparedStatement stmt = conn.prepareStatement(
                "SELECT * FROM bids WHERE item_id = ? ORDER BY timestamp DESC"
            );
            stmt.setInt(1, itemId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                System.out.println("User: " + rs.getInt("bidder_id") + " | Amount: " + rs.getDouble("bid_amount") +" | Time: " + rs.getTimestamp("timestamp"));
            }
        } catch (SQLException e) {
            System.out.println("Error fetching bidding history: " + e.getMessage());
        }
    }

    //Total bids placed by a user in a period
    public void computeTotalBidsByUserInPeriod(int userId, String from, String to) {
        try {
            PreparedStatement stmt = conn.prepareStatement(
                "SELECT COUNT(*) AS total_bids FROM bids WHERE bidder_id = ? AND timestamp BETWEEN ? AND ?"
            );
            stmt.setInt(1, userId);
            stmt.setString(2, from);
            stmt.setString(3, to);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                System.out.println("User ID: " + userId + " | Total Bids from " + from + " to " + to + ": " + rs.getInt("total_bids"));
            }
        } catch (SQLException e) {
            System.out.println("Error computing total bids: " + e.getMessage());
        }
    }
}





//excutequery -> read || excuteUpdate-> write