import java.sql.*;

public class Main {
    public static void main(String[] args) {
        try {
            
            Connection conn = DBConnector.getConnection();
            AuctionService service = new AuctionService(conn);

            service.getCurrentHighestBidPerItem();
            service.listActiveAuctionsEndingSoon();
            service.findWinningBidders();
            service.showBiddingHistory(1);
            service.computeTotalBidsByUserInPeriod(2, "2023-01-01", "2023-12-31");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
