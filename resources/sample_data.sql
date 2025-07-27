INSERT INTO users (user_id, email, password, full_name, phone_number, kyc_status, status, created_at, updated_at)
VALUES 
(1, 'alice@example.com', 'pass123', 'Alice Sharma', '9876543210', 'VERIFIED', 'ACTIVE', NOW(), NOW()),
(2, 'bob@example.com', 'pass456', 'Bob Verma', '9123456789', 'PENDING', 'ACTIVE', NOW(), NOW());

INSERT INTO wallets (wallet_id, user_id, balance, status, created_at)
VALUES 
(1, 1, 5000.00, 'ACTIVE', NOW()),
(2, 2, 3000.00, 'ACTIVE', NOW());

INSERT INTO bank_accounts (bank_account_id, user_id, account_number, ifsc_code, bank_name, created_at)
VALUES 
(1, 1, '1234567890', 'HDFC0001234', 'HDFC Bank', NOW()),
(2, 2, '9876543210', 'ICIC0005678', 'ICICI Bank', NOW());

INSERT INTO items (item_id, item_name, description, start_price, reserve_price, auction_id, status, listing_fee, gross_hide_fee, created_at, updated_at)
VALUES 
(1, 'Smartphone', 'Brand new phone', 10000.00, 15000.00, NULL, 'ACTIVE', 100.00, 50.00, NOW(), NOW());

INSERT INTO auctions (auction_id, item_id, auction_name, start_time, end_time, status, created_at)
VALUES 
(1, 1, 'Smartphone Auction', NOW(), DATE_ADD(NOW(), INTERVAL 15 MINUTE), 'ACTIVE', NOW());

UPDATE items SET auction_id = 1 WHERE item_id = 1;

INSERT INTO bids (bid_id, item_id, bidder_id, bid_amount, timestamp)
VALUES 
(1, 1, 2, 11000.00, NOW());

INSERT INTO winning_bids (win_id, item_id, bid_id, conversion_fee, transaction_fee, payment_status, created_at)
VALUES 
(1, 1, 1, 500.00, 100.00, 'PENDING', NOW());

INSERT INTO wallet_transactions (wallet_transaction_id, from_wallet_id, to_wallet_id, amount, transaction_type, transaction_status, created_at)
VALUES 
(1, 1, 2, 11000.00, 'TRANSFER', 'SUCCESS', NOW());

INSERT INTO wallet_transaction_breakdowns (breakdown_id, wallet_transaction_id, amount, description, created_at)
VALUES 
(1, 1, 500.00, 'Conversion fee for auction win', NOW());

INSERT INTO account_transactions (account_transaction_id, wallet_id, amount, transaction_type, transaction_status, created_at)
VALUES 
(1, 1, 2000.00, 'DEPOSIT', 'SUCCESS', NOW());

INSERT INTO audit_logs (log_id, user_id, item_id, action_type, details_json, ip_address, user_agent, created_at)
VALUES 
(1, 1, 1, 'BID_PLACED', '{"amount": 11000}', '127.0.0.1', 'Mozilla/5.0', NOW());
