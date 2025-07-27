CREATE DATABASE auction_platform;
use auction_platform;

-- USERS
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    email VARCHAR(125),
    password TEXT,
    full_name VARCHAR(100),
    phone_number VARCHAR(10),
    kyc_status ENUM('PENDING', 'VERIFIED', 'REJECTED'),
    status ENUM('ACTIVE', 'INACTIVE'),
    created_at DATETIME,
    updated_at DATETIME
);

-- WALLETS
CREATE TABLE wallets (
    wallet_id INT PRIMARY KEY,
    user_id INT,
    balance DECIMAL(12,2),
    status ENUM('ACTIVE', 'BLOCKED'),
    created_at DATETIME,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- WALLET TRANSACTIONS
CREATE TABLE wallet_transactions (
    wallet_transaction_id INT PRIMARY KEY,
    from_wallet_id INT,
    to_wallet_id INT,
    amount DECIMAL(12,2),
    transaction_type ENUM('DEBIT', 'CREDIT', 'TRANSFER'),
    transaction_status ENUM('SUCCESS', 'FAILED', 'PENDING'),
    created_at DATETIME,
    FOREIGN KEY (from_wallet_id) REFERENCES wallets(wallet_id),
    FOREIGN KEY (to_wallet_id) REFERENCES wallets(wallet_id)
);

-- WALLET TRANSACTION BREAKDOWNS
CREATE TABLE wallet_transaction_breakdowns (
    breakdown_id INT PRIMARY KEY,
    wallet_transaction_id INT,
    amount DECIMAL(12,2),
    description TEXT,
    created_at DATETIME,
    FOREIGN KEY (wallet_transaction_id) REFERENCES wallet_transactions(wallet_transaction_id)
);

-- ACCOUNT TRANSACTIONS
CREATE TABLE account_transactions (
    account_transaction_id INT PRIMARY KEY,
    wallet_id INT,
    amount DECIMAL(12,2),
    transaction_type ENUM('WITHDRAWAL', 'DEPOSIT'),
    transaction_status ENUM('SUCCESS', 'FAILED', 'PENDING'),
    created_at DATETIME,
    FOREIGN KEY (wallet_id) REFERENCES wallets(wallet_id)
);

-- BANK ACCOUNTS
CREATE TABLE bank_accounts (
    bank_account_id INT PRIMARY KEY,
    user_id INT,
    account_number VARCHAR(30),
    ifsc_code VARCHAR(15),
    bank_name VARCHAR(100),
    created_at DATETIME,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- ITEMS
CREATE TABLE items (
    item_id INT PRIMARY KEY,
    item_name VARCHAR(255),
    description TEXT,
    start_price DECIMAL(12,2),
    reserve_price DECIMAL(12,2),
    auction_id INT,
    status ENUM('ACTIVE', 'SOLD', 'EXPIRED'),
    listing_fee DECIMAL(12,2),
    gross_hide_fee DECIMAL(12,2),
    created_at DATETIME,
    updated_at DATETIME
);

-- AUCTIONS
CREATE TABLE auctions (
    auction_id INT PRIMARY KEY,
    item_id INT,
    auction_name VARCHAR(255),
    start_time DATETIME,
    end_time DATETIME,
    status ENUM('ACTIVE', 'COMPLETED', 'CANCELLED'),
    created_at DATETIME,
    FOREIGN KEY (item_id) REFERENCES items(item_id)
);

-- BIDS
CREATE TABLE bids (
    bid_id INT PRIMARY KEY,
    item_id INT,
    bidder_id INT,
    bid_amount DECIMAL(12,2),
    timestamp DATETIME,
    FOREIGN KEY (item_id) REFERENCES items(item_id),
    FOREIGN KEY (bidder_id) REFERENCES users(user_id)
);

-- WINNING BIDS
CREATE TABLE winning_bids (
    win_id INT PRIMARY KEY,
    item_id INT,
    bid_id INT,
    conversion_fee DECIMAL(12,2),
    transaction_fee DECIMAL(12,2),
    payment_status ENUM('PENDING', 'PAID', 'FAILED'),
    created_at DATETIME,
    FOREIGN KEY (item_id) REFERENCES items(item_id),
    FOREIGN KEY (bid_id) REFERENCES bids(bid_id)
);

-- AUDIT LOGS
CREATE TABLE audit_logs (
    log_id INT PRIMARY KEY,
    user_id INT,
    item_id INT,
    action_type VARCHAR(25),
    details_json JSON,
    ip_address VARCHAR(45),
    user_agent TEXT,
    created_at DATETIME,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (item_id) REFERENCES items(item_id)
);