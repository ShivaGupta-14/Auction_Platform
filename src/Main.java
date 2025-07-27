import java.sql.*;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter JDBC URL (e.g., jdbc:mysql://localhost:3306/auction_platform): ");
        String URL = sc.nextLine();
        System.out.print("Enter DB Username: ");
        String UserName = sc.nextLine();
        System.out.print("Enter DB Password: ");
        String Password = sc.nextLine();
        try {
            DBConnector dbConnector = new DBConnector(URL,UserName,Password);
            Connection conn = dbConnector.getConnection();
            AuctionService service = new AuctionService(conn);
            String more = "y";
            while(more.toLowerCase().equals("y")){
                System.out.println("1. View Current Highest Bids");
                System.out.println("2. List Active Auctions Ending Soon");
                System.out.println("3. Show Winning Bidders");
                System.out.println("4. Show Bidding History of an Item");
                System.out.println("5. Compute Total Bids by a User in a Period");

                System.out.print("Enter choice: ");
                int choice = sc.nextInt();
                sc.nextLine();


                if (choice == 1) {
                    service.getCurrentHighestBidPerItem();
                }
                else if (choice == 2) {
                    service.listActiveAuctionsEndingSoon();
                }
                else if (choice == 3) {
                    service.findWinningBidders();
                }
                else if (choice == 4) {
                    System.out.print("Enter Item ID: ");
                    int itemId = sc.nextInt();
                    sc.nextLine();
                    service.showBiddingHistory(itemId);
                }
                else if (choice == 5) {
                    System.out.print("Enter User ID: ");
                    int userId = sc.nextInt();
                    sc.nextLine();
                    System.out.print("Enter From Date (YYYY-MM-DD): ");
                    String from = sc.nextLine();
                    System.out.print("Enter To Date (YYYY-MM-DD): ");
                    String to = sc.nextLine();
                    service.computeTotalBidsByUserInPeriod(userId, from, to);
                }
                else {
                    System.out.println("Invalid choice");
                }
                System.out.print("Do you want to continue? (y/n): ");
                more = sc.nextLine();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
