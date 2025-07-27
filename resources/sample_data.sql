-- Users
INSERT INTO users (user_id, email, password, full_name, phone_number, kyc_status, status, created_at, updated_at) VALUES
(1, 'alice@example.com', 'pass123', 'Alice Sharma', '9876543210', 'VERIFIED', 'ACTIVE', NOW(), NOW()),
(2, 'bob@example.com', 'pass456', 'Bob Verma', '9123456789', 'PENDING', 'ACTIVE', NOW(), NOW()),
(3, 'charlie@example.com', 'charlie123', 'Charlie Singh', '9000000003', 'VERIFIED', 'INACTIVE', NOW(), NOW()),
(4, 'diana@example.com', 'diana123', 'Diana Kapoor', '9000000004', 'VERIFIED', 'ACTIVE', NOW(), NOW()),
(5, 'eric@example.com', 'eric123', 'Eric Dsouza', '9000000005', 'PENDING', 'ACTIVE', NOW(), NOW()),
(6, 'fiona@example.com', 'fiona123', 'Fiona Desai', '9000000006', 'VERIFIED', 'ACTIVE', NOW(), NOW()),
(7, 'george@example.com', 'george123', 'George Patil', '9000000007', 'VERIFIED', 'ACTIVE', NOW(), NOW()),
(8, 'hannah@example.com', 'hannah123', 'Hannah Nair', '9000000008', 'VERIFIED', 'INACTIVE', NOW(), NOW()),
(9, 'ian@example.com', 'ian123', 'Ian Kulkarni', '9000000009', 'PENDING', 'ACTIVE', NOW(), NOW()),
(10, 'julia@example.com', 'julia123', 'Julia Khan', '9000000010', 'VERIFIED', 'ACTIVE', NOW(), NOW());

-- Wallets
INSERT INTO wallets (wallet_id, user_id, balance, status, created_at) VALUES
(1, 1, 5000.00, 'ACTIVE', NOW()),
(2, 2, 3000.00, 'ACTIVE', NOW()),
(3, 3, 7000.00, 'INACTIVE', NOW()),
(4, 4, 12000.00, 'ACTIVE', NOW()),
(5, 5, 8000.00, 'ACTIVE', NOW()),
(6, 6, 15000.00, 'ACTIVE', NOW()),
(7, 7, 20000.00, 'ACTIVE', NOW()),
(8, 8, 2500.00, 'INACTIVE', NOW()),
(9, 9, 1000.00, 'ACTIVE', NOW()),
(10, 10, 9000.00, 'ACTIVE', NOW());

-- Bank Accounts
INSERT INTO bank_accounts (bank_account_id, user_id, account_number, ifsc_code, bank_name, created_at) VALUES
(1, 1, '1234567890', 'HDFC0001', 'HDFC Bank', NOW()),
(2, 2, '2345678901', 'ICIC0002', 'ICICI Bank', NOW()),
(3, 3, '3456789012', 'SBIN0003', 'SBI', NOW()),
(4, 4, '4567890123', 'KKBK0004', 'Kotak Bank', NOW()),
(5, 5, '5678901234', 'AXIS0005', 'Axis Bank', NOW()),
(6, 6, '6789012345', 'PNB0006', 'PNB', NOW()),
(7, 7, '7890123456', 'YESB0007', 'Yes Bank', NOW()),
(8, 8, '8901234567', 'BOI0008', 'Bank of India', NOW()),
(9, 9, '9012345678', 'UBIN0009', 'Union Bank', NOW()),
(10, 10, '0123456789', 'BARB0010', 'Bank of Baroda', NOW());

-- Items
INSERT INTO items (item_id, item_name, description, start_price, reserve_price, auction_id, status, listing_fee, gross_hide_fee, created_at, updated_at) VALUES
(1, 'Smartphone', 'Brand new phone', 10000.00, 15000.00, 1, 'ACTIVE', 100.00, 50.00, NOW(), NOW()),
(2, 'Laptop', 'Gaming laptop', 30000.00, 40000.00, 2, 'ACTIVE', 150.00, 75.00, NOW(), NOW()),
(3, 'Smartwatch', 'Fitness smartwatch', 2000.00, 3000.00, 3, 'ACTIVE', 50.00, 25.00, NOW(), NOW()),
(4, 'Tablet', 'Android tablet', 8000.00, 10000.00, 4, 'ACTIVE', 90.00, 45.00, NOW(), NOW()),
(5, 'TV', 'LED Smart TV', 25000.00, 30000.00, 5, 'ACTIVE', 120.00, 60.00, NOW(), NOW()),
(6, 'Headphones', 'Noise-cancelling', 2000.00, 3500.00, 6, 'ACTIVE', 40.00, 20.00, NOW(), NOW()),
(7, 'Camera', 'DSLR Camera', 18000.00, 25000.00, 7, 'ACTIVE', 110.00, 55.00, NOW(), NOW()),
(8, 'Speakers', 'Bluetooth Speakers', 3000.00, 4000.00, 8, 'ACTIVE', 30.00, 15.00, NOW(), NOW()),
(9, 'Router', 'Dual-band router', 1500.00, 2500.00, 9, 'ACTIVE', 20.00, 10.00, NOW(), NOW()),
(10, 'Monitor', '4K Monitor', 12000.00, 18000.00, 10, 'ACTIVE', 70.00, 35.00, NOW(), NOW());

-- Auctions
INSERT INTO auctions (auction_id, item_id, auction_name, start_time, end_time, status, created_at) VALUES
(1, 1, 'Smartphone Auction', NOW(), DATE_ADD(NOW(), INTERVAL 15 MINUTE), 'ACTIVE', NOW()),
(2, 2, 'Laptop Auction', NOW(), DATE_ADD(NOW(), INTERVAL 30 MINUTE), 'ACTIVE', NOW()),
(3, 3, 'Smartwatch Auction', NOW(), DATE_ADD(NOW(), INTERVAL 20 MINUTE), 'ACTIVE', NOW()),
(4, 4, 'Tablet Auction', NOW(), DATE_ADD(NOW(), INTERVAL 10 MINUTE), 'ACTIVE', NOW()),
(5, 5, 'TV Auction', NOW(), DATE_ADD(NOW(), INTERVAL 25 MINUTE), 'ACTIVE', NOW()),
(6, 6, 'Headphone Auction', NOW(), DATE_ADD(NOW(), INTERVAL 18 MINUTE), 'ACTIVE', NOW()),
(7, 7, 'Camera Auction', NOW(), DATE_ADD(NOW(), INTERVAL 35 MINUTE), 'ACTIVE', NOW()),
(8, 8, 'Speakers Auction', NOW(), DATE_ADD(NOW(), INTERVAL 5 MINUTE), 'ACTIVE', NOW()),
(9, 9, 'Router Auction', NOW(), DATE_ADD(NOW(), INTERVAL 12 MINUTE), 'ACTIVE', NOW()),
(10, 10, 'Monitor Auction', NOW(), DATE_ADD(NOW(), INTERVAL 40 MINUTE), 'ACTIVE', NOW());

-- Bids
INSERT INTO bids (bid_id, item_id, bidder_id, bid_amount, timestamp) VALUES
(1, 1, 2, 11000.00, NOW()),
(2, 1, 4, 13000.00, NOW()),
(3, 2, 6, 32000.00, NOW()),
(4, 2, 5, 35000.00, NOW()),
(5, 3, 7, 2500.00, NOW()),
(6, 4, 9, 9000.00, NOW()),
(7, 5, 10, 27000.00, NOW()),
(8, 6, 2, 2200.00, NOW()),
(9, 7, 3, 20000.00, NOW()),
(10, 8, 1, 3500.00, NOW());

-- Winning Bids
INSERT INTO winning_bids (win_id, item_id, bid_id, conversion_fee, transaction_fee, payment_status, created_at) VALUES
(1, 1, 2, 500.00, 100.00, 'PENDING', NOW()),
(2, 2, 4, 1000.00, 200.00, 'PAID', NOW()),
(3, 3, 5, 100.00, 50.00, 'PENDING', NOW()),
(4, 4, 6, 300.00, 75.00, 'PENDING', NOW()),
(5, 5, 7, 800.00, 120.00, 'PAID', NOW()),
(6, 6, 8, 150.00, 40.00, 'PENDING', NOW()),
(7, 7, 9, 600.00, 110.00, 'PAID', NOW()),
(8, 8, 10, 90.00, 25.00, 'PENDING', NOW()),
(9, 9, 1, 100.00, 15.00, 'PENDING', NOW()),
(10, 10, 3, 200.00, 50.00, 'PENDING', NOW());

-- Wallet Transactions
INSERT INTO wallet_transactions (wallet_transaction_id, from_wallet_id, to_wallet_id, amount, transaction_type, transaction_status, created_at) VALUES
(1, 1, 2, 13000.00, 'TRANSFER', 'SUCCESS', NOW()),
(2, 6, 5, 35000.00, 'TRANSFER', 'SUCCESS', NOW()),
(3, 7, 3, 2500.00, 'TRANSFER', 'FAILED', NOW()),
(4, 10, 9, 27000.00, 'TRANSFER', 'SUCCESS', NOW()),
(5, 2, 1, 2200.00, 'TRANSFER', 'SUCCESS', NOW()),
(6, 3, 4, 20000.00, 'TRANSFER', 'SUCCESS', NOW()),
(7, 4, 5, 3500.00, 'TRANSFER', 'SUCCESS', NOW()),
(8, 5, 6, 1500.00, 'TRANSFER', 'SUCCESS', NOW()),
(9, 6, 7, 900.00, 'TRANSFER', 'SUCCESS', NOW()),
(10, 7, 8, 2000.00, 'TRANSFER', 'PENDING', NOW());

-- Wallet Transaction Breakdowns
INSERT INTO wallet_transaction_breakdowns (breakdown_id, wallet_transaction_id, amount, description, created_at) VALUES
(1, 1, 500.00, 'Conversion fee for auction win', NOW()),
(2, 2, 1000.00, 'Platform service fee', NOW()),
(3, 3, 200.00, 'Retry fee', NOW()),
(4, 4, 300.00, 'Transaction fee', NOW()),
(5, 5, 100.00, 'Adjustment fee', NOW()),
(6, 6, 600.00, 'Service charges', NOW()),
(7, 7, 150.00, 'Late fee', NOW()),
(8, 8, 50.00, 'Gateway fee', NOW()),
(9, 9, 120.00, 'Commission', NOW()),
(10, 10, 80.00, 'Tax deduction', NOW());

-- Account Transactions
INSERT INTO account_transactions (account_transaction_id, wallet_id, amount, transaction_type, transaction_status, created_at) VALUES
(1, 1, 5000.00, 'DEPOSIT', 'SUCCESS', NOW()),
(2, 2, 3000.00, 'DEPOSIT', 'SUCCESS', NOW()),
(3, 3, 4000.00, 'WITHDRAWAL', 'FAILED', NOW()),
(4, 4, 7000.00, 'DEPOSIT', 'SUCCESS', NOW()),
(5, 5, 1000.00, 'WITHDRAWAL', 'SUCCESS', NOW()),
(6, 6, 9000.00, 'DEPOSIT', 'SUCCESS', NOW()),
(7, 7, 2000.00, 'WITHDRAWAL', 'SUCCESS', NOW()),
(8, 8, 500.00, 'WITHDRAWAL', 'FAILED', NOW()),
(9, 9, 1000.00, 'DEPOSIT', 'SUCCESS', NOW()),
(10, 10, 6000.00, 'DEPOSIT', 'SUCCESS', NOW());

-- Audit Logs
INSERT INTO audit_logs (log_id, user_id, item_id, action_type, details_json, ip_address, user_agent, created_at) VALUES
(1, 1, 1, 'BID_PLACED', '{"amount":13000}', '127.0.0.1', 'Mozilla', NOW()),
(2, 2, 2, 'BID_PLACED', '{"amount":35000}', '127.0.0.2', 'Chrome', NOW()),
(3, 3, 3, 'LOGIN_ATTEMPT', '{}', '127.0.0.3', 'Edge', NOW()),
(4, 4, 4, 'ITEM_LISTED', '{}', '127.0.0.4', 'Mozilla', NOW()),
(5, 5, 5, 'BID_PLACED', '{"amount":27000}', '127.0.0.5', 'Safari', NOW()),
(6, 6, 6, 'BID_PLACED', '{"amount":2200}', '127.0.0.6', 'Opera', NOW()),
(7, 7, 7, 'PROFILE_UPDATED', '{}', '127.0.0.7', 'Mozilla', NOW()),
(8, 8, 8, 'BID_PLACED', '{"amount":3500}', '127.0.0.8', 'Chrome', NOW()),
(9, 9, 9, 'BID_PLACED', '{"amount":1500}', '127.0.0.9', 'Edge', NOW()),
(10, 10, 10, 'BID_PLACED', '{"amount":12000}', '127.0.0.10', 'Chrome', NOW());
