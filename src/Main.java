import java.sql.*;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter JDBC URL (e.g., jdbc:mysql://localhost:3306/auction): ");
        String URL = sc.nextLine();
        System.out.print("Enter DB Username: ");
        String UserName = sc.nextLine();
        System.out.print("Enter DB Password: ");
        String Password = sc.nextLine();
        try {
            DBConnector dbConnector = new DBConnector(URL,UserName,Password);
            Connection conn = dbConnector.getConnection();
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
