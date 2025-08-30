-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 30, 2025 at 08:35 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `financial_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `budgets`
--

CREATE TABLE `budgets` (
  `id` int(11) NOT NULL,
  `period` enum('Annually','Monthly','Daily') NOT NULL,
  `department` varchar(100) NOT NULL,
  `cost_center` varchar(120) NOT NULL,
  `amount_allocated` decimal(12,2) NOT NULL,
  `amount_used` decimal(12,2) NOT NULL DEFAULT 0.00,
  `approved_by` varchar(120) DEFAULT NULL,
  `approval_status` enum('Pending','Approved','Rejected') DEFAULT 'Pending',
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `budgets`
--

INSERT INTO `budgets` (`id`, `period`, `department`, `cost_center`, `amount_allocated`, `amount_used`, `approved_by`, `approval_status`, `description`, `created_at`, `updated_at`) VALUES
(2, 'Monthly', 'Operations', 'Labor', 1000000.00, 100000.00, 'Juan Dela Cruz', 'Approved', 'Payment for laborers during monthly operation', '2025-08-14 14:09:54', '2025-08-14 14:09:54'),
(3, 'Monthly', 'Maintenance', 'Maintenance', 300000.00, 50000.00, 'Mark Avelino', 'Approved', 'Maintenance for cranes and other equipment during operations', '2025-08-14 14:11:18', '2025-08-14 14:11:18'),
(4, 'Daily', 'Accounting', 'Truck Lease', 10000.00, 10000.00, 'Francislloyd Manabat', 'Approved', 'Sudden cost due to accident during driving', '2025-08-14 14:13:28', '2025-08-14 14:13:28'),
(7, 'Monthly', 'Operations', 'Maintenance', 1111110.00, 100000.00, 'Juan Dela Cruz', 'Approved', 'asd', '2025-08-16 18:17:34', '2025-08-16 18:18:08'),
(8, 'Monthly', 'Operations', 'Crane Rental', 1000000.00, 150000.00, 'Francislloyd Manabat', 'Approved', 'asd', '2025-08-16 18:19:04', '2025-08-16 18:19:04'),
(9, 'Daily', 'Operations', 'Fuel', 100000.00, 10000.00, 'Mark Avelino', 'Approved', 'asdasd', '2025-08-16 18:19:39', '2025-08-16 18:19:39'),
(11, 'Annually', 'Administration', 'Labor', 1000000.00, 400000.00, 'Juan Dela Cruz', 'Approved', 'budget for 2026', '2025-08-20 15:05:59', '2025-08-27 06:02:19'),
(12, 'Monthly', 'Logistics', 'Fuel', 150000.00, 142000.00, 'John Manager', 'Approved', 'Monthly fuel allocation for delivery trucks', '2025-01-15 00:30:00', '2025-08-30 18:18:29'),
(13, 'Monthly', 'Logistics', 'Truck Lease', 80000.00, 80000.00, 'John Manager', 'Approved', 'Monthly truck lease payments', '2025-01-15 00:35:00', '2025-08-30 18:18:29'),
(14, 'Monthly', 'Operations', 'Labor', 200000.00, 185000.00, 'Sarah Director', 'Approved', 'Operations staff monthly salaries', '2025-01-15 01:00:00', '2025-08-30 18:18:29'),
(15, 'Monthly', 'Operations', 'RFID', 25000.00, 22000.00, 'Sarah Director', 'Approved', 'RFID system maintenance and tags', '2025-01-15 01:15:00', '2025-08-30 18:18:29'),
(16, 'Monthly', 'Maintenance', 'Maintenance', 75000.00, 68000.00, 'Mike Supervisor', 'Approved', 'Regular equipment maintenance', '2025-01-15 02:00:00', '2025-08-30 18:18:29'),
(17, 'Monthly', 'Maintenance', 'Crane Rental', 45000.00, 41000.00, 'Mike Supervisor', 'Approved', 'Crane rental for loading operations', '2025-01-15 02:15:00', '2025-08-30 18:18:29'),
(18, 'Monthly', 'Accounting', 'Labor', 60000.00, 58000.00, 'Finance Head', 'Approved', 'Accounting department salaries', '2025-01-15 03:00:00', '2025-08-30 18:18:29'),
(19, 'Monthly', 'Administration', 'Labor', 45000.00, 43000.00, 'HR Manager', 'Approved', 'Administrative staff salaries', '2025-01-15 03:30:00', '2025-08-30 18:18:29'),
(20, 'Monthly', 'Logistics', 'Fuel', 155000.00, 158000.00, 'John Manager', 'Approved', 'Fuel costs increased due to price hike', '2025-02-15 00:30:00', '2025-08-30 18:18:29'),
(21, 'Monthly', 'Logistics', 'Truck Lease', 80000.00, 80000.00, 'John Manager', 'Approved', 'Monthly truck lease payments', '2025-02-15 00:35:00', '2025-08-30 18:18:29'),
(22, 'Monthly', 'Operations', 'Labor', 200000.00, 195000.00, 'Sarah Director', 'Approved', 'Operations staff monthly salaries', '2025-02-15 01:00:00', '2025-08-30 18:18:29'),
(23, 'Monthly', 'Operations', 'RFID', 25000.00, 28000.00, 'Sarah Director', 'Approved', 'Additional RFID readers purchased', '2025-02-15 01:15:00', '2025-08-30 18:18:29'),
(24, 'Monthly', 'Maintenance', 'Maintenance', 75000.00, 82000.00, 'Mike Supervisor', 'Approved', 'Major equipment overhaul required', '2025-02-15 02:00:00', '2025-08-30 18:18:29'),
(25, 'Monthly', 'Maintenance', 'Crane Rental', 45000.00, 43000.00, 'Mike Supervisor', 'Approved', 'Crane rental for loading operations', '2025-02-15 02:15:00', '2025-08-30 18:18:29'),
(26, 'Monthly', 'Accounting', 'Labor', 60000.00, 59000.00, 'Finance Head', 'Approved', 'Accounting department salaries', '2025-02-15 03:00:00', '2025-08-30 18:18:29'),
(27, 'Monthly', 'Administration', 'Labor', 45000.00, 44000.00, 'HR Manager', 'Approved', 'Administrative staff salaries', '2025-02-15 03:30:00', '2025-08-30 18:18:29'),
(28, 'Monthly', 'Logistics', 'Fuel', 180000.00, 175000.00, 'John Manager', 'Approved', 'Peak season fuel requirements', '2025-03-15 00:30:00', '2025-08-30 18:18:29'),
(29, 'Monthly', 'Logistics', 'Truck Lease', 85000.00, 85000.00, 'John Manager', 'Approved', 'Additional truck lease for peak season', '2025-03-15 00:35:00', '2025-08-30 18:18:29'),
(30, 'Monthly', 'Operations', 'Labor', 220000.00, 218000.00, 'Sarah Director', 'Approved', 'Peak season overtime payments', '2025-03-15 01:00:00', '2025-08-30 18:18:29'),
(31, 'Monthly', 'Operations', 'RFID', 30000.00, 32000.00, 'Sarah Director', 'Approved', 'Peak season RFID system upgrades', '2025-03-15 01:15:00', '2025-08-30 18:18:29'),
(32, 'Monthly', 'Maintenance', 'Maintenance', 90000.00, 95000.00, 'Mike Supervisor', 'Approved', 'Increased maintenance due to heavy usage', '2025-03-15 02:00:00', '2025-08-30 18:18:29'),
(33, 'Monthly', 'Maintenance', 'Crane Rental', 60000.00, 58000.00, 'Mike Supervisor', 'Approved', 'Additional crane rental for peak period', '2025-03-15 02:15:00', '2025-08-30 18:18:29'),
(34, 'Monthly', 'Accounting', 'Labor', 65000.00, 64000.00, 'Finance Head', 'Approved', 'Peak season accounting workload', '2025-03-15 03:00:00', '2025-08-30 18:18:29'),
(35, 'Monthly', 'Administration', 'Labor', 50000.00, 48000.00, 'HR Manager', 'Approved', 'Administrative support for peak season', '2025-03-15 03:30:00', '2025-08-30 18:18:29'),
(36, 'Monthly', 'Logistics', 'Fuel', 160000.00, 162000.00, 'John Manager', 'Approved', 'Post-peak fuel consumption', '2025-04-15 00:30:00', '2025-08-30 18:18:29'),
(37, 'Monthly', 'Logistics', 'Truck Lease', 80000.00, 80000.00, 'John Manager', 'Approved', 'Monthly truck lease payments', '2025-04-15 00:35:00', '2025-08-30 18:18:29'),
(38, 'Monthly', 'Operations', 'Labor', 205000.00, 198000.00, 'Sarah Director', 'Approved', 'Operations staff monthly salaries', '2025-04-15 01:00:00', '2025-08-30 18:18:29'),
(39, 'Monthly', 'Operations', 'RFID', 25000.00, 24000.00, 'Sarah Director', 'Approved', 'Regular RFID maintenance', '2025-04-15 01:15:00', '2025-08-30 18:18:29'),
(40, 'Monthly', 'Maintenance', 'Maintenance', 80000.00, 77000.00, 'Mike Supervisor', 'Approved', 'Regular maintenance schedule', '2025-04-15 02:00:00', '2025-08-30 18:18:29'),
(41, 'Monthly', 'Maintenance', 'Crane Rental', 50000.00, 47000.00, 'Mike Supervisor', 'Approved', 'Standard crane rental', '2025-04-15 02:15:00', '2025-08-30 18:18:29'),
(42, 'Monthly', 'Accounting', 'Labor', 60000.00, 59500.00, 'Finance Head', 'Approved', 'Accounting department salaries', '2025-04-15 03:00:00', '2025-08-30 18:18:29'),
(43, 'Monthly', 'Administration', 'Labor', 45000.00, 44500.00, 'HR Manager', 'Approved', 'Administrative staff salaries', '2025-04-15 03:30:00', '2025-08-30 18:18:29'),
(44, 'Monthly', 'Logistics', 'Fuel', 165000.00, 168000.00, 'John Manager', 'Approved', 'Gradual increase in fuel costs', '2025-05-15 00:30:00', '2025-08-30 18:18:29'),
(45, 'Monthly', 'Logistics', 'Truck Lease', 80000.00, 80000.00, 'John Manager', 'Approved', 'Monthly truck lease payments', '2025-05-15 00:35:00', '2025-08-30 18:18:29'),
(46, 'Monthly', 'Operations', 'Labor', 200000.00, 192000.00, 'Sarah Director', 'Approved', 'Operations staff monthly salaries', '2025-05-15 01:00:00', '2025-08-30 18:18:29'),
(47, 'Monthly', 'Operations', 'RFID', 25000.00, 26500.00, 'Sarah Director', 'Approved', 'RFID system improvements', '2025-05-15 01:15:00', '2025-08-30 18:18:29'),
(48, 'Monthly', 'Maintenance', 'Maintenance', 75000.00, 73000.00, 'Mike Supervisor', 'Approved', 'Routine maintenance activities', '2025-05-15 02:00:00', '2025-08-30 18:18:29'),
(49, 'Monthly', 'Maintenance', 'Crane Rental', 45000.00, 44000.00, 'Mike Supervisor', 'Approved', 'Regular crane operations', '2025-05-15 02:15:00', '2025-08-30 18:18:29'),
(50, 'Monthly', 'Accounting', 'Labor', 60000.00, 58500.00, 'Finance Head', 'Approved', 'Accounting department salaries', '2025-05-15 03:00:00', '2025-08-30 18:18:29'),
(51, 'Monthly', 'Administration', 'Labor', 45000.00, 43500.00, 'HR Manager', 'Approved', 'Administrative staff salaries', '2025-05-15 03:30:00', '2025-08-30 18:18:29'),
(52, 'Monthly', 'Logistics', 'Fuel', 185000.00, 182000.00, 'John Manager', 'Approved', 'Mid-year peak season fuel', '2025-06-15 00:30:00', '2025-08-30 18:18:29'),
(53, 'Monthly', 'Logistics', 'Truck Lease', 85000.00, 85000.00, 'John Manager', 'Approved', 'Additional vehicles for peak demand', '2025-06-15 00:35:00', '2025-08-30 18:18:29'),
(54, 'Monthly', 'Operations', 'Labor', 225000.00, 220000.00, 'Sarah Director', 'Approved', 'Peak operations staffing', '2025-06-15 01:00:00', '2025-08-30 18:18:29'),
(55, 'Monthly', 'Operations', 'RFID', 35000.00, 37000.00, 'Sarah Director', 'Approved', 'Peak season RFID requirements', '2025-06-15 01:15:00', '2025-08-30 18:18:29'),
(56, 'Monthly', 'Maintenance', 'Maintenance', 95000.00, 98000.00, 'Mike Supervisor', 'Approved', 'Intensive maintenance during peak', '2025-06-15 02:00:00', '2025-08-30 18:18:29'),
(57, 'Monthly', 'Maintenance', 'Crane Rental', 65000.00, 62000.00, 'Mike Supervisor', 'Approved', 'Peak season crane requirements', '2025-06-15 02:15:00', '2025-08-30 18:18:29'),
(58, 'Monthly', 'Accounting', 'Labor', 65000.00, 63000.00, 'Finance Head', 'Approved', 'Increased accounting workload', '2025-06-15 03:00:00', '2025-08-30 18:18:29'),
(59, 'Monthly', 'Administration', 'Labor', 50000.00, 49000.00, 'HR Manager', 'Approved', 'Peak season administrative support', '2025-06-15 03:30:00', '2025-08-30 18:18:29'),
(60, 'Monthly', 'Logistics', 'Fuel', 170000.00, 174000.00, 'John Manager', 'Approved', 'Summer fuel consumption', '2025-07-15 00:30:00', '2025-08-30 18:18:29'),
(61, 'Monthly', 'Logistics', 'Truck Lease', 80000.00, 80000.00, 'John Manager', 'Approved', 'Monthly truck lease payments', '2025-07-15 00:35:00', '2025-08-30 18:18:29'),
(62, 'Monthly', 'Operations', 'Labor', 210000.00, 205000.00, 'Sarah Director', 'Approved', 'Operations staff monthly salaries', '2025-07-15 01:00:00', '2025-08-30 18:18:29'),
(63, 'Monthly', 'Operations', 'RFID', 28000.00, 29000.00, 'Sarah Director', 'Approved', 'RFID system maintenance', '2025-07-15 01:15:00', '2025-08-30 18:18:29'),
(64, 'Monthly', 'Maintenance', 'Maintenance', 85000.00, 88000.00, 'Mike Supervisor', 'Approved', 'Summer maintenance schedule', '2025-07-15 02:00:00', '2025-08-30 18:18:29'),
(65, 'Monthly', 'Maintenance', 'Crane Rental', 55000.00, 53000.00, 'Mike Supervisor', 'Approved', 'Standard crane operations', '2025-07-15 02:15:00', '2025-08-30 18:18:29'),
(66, 'Monthly', 'Accounting', 'Labor', 62000.00, 61000.00, 'Finance Head', 'Approved', 'Accounting department salaries', '2025-07-15 03:00:00', '2025-08-30 18:18:29'),
(67, 'Monthly', 'Administration', 'Labor', 47000.00, 46000.00, 'HR Manager', 'Approved', 'Administrative staff salaries', '2025-07-15 03:30:00', '2025-08-30 18:18:29'),
(68, 'Monthly', 'Logistics', 'Fuel', 175000.00, 171000.00, 'John Manager', 'Approved', 'Current month fuel allocation', '2025-08-15 00:30:00', '2025-08-30 18:18:29'),
(69, 'Monthly', 'Logistics', 'Truck Lease', 80000.00, 80000.00, 'John Manager', 'Approved', 'Monthly truck lease payments', '2025-08-15 00:35:00', '2025-08-30 18:18:29'),
(70, 'Monthly', 'Operations', 'Labor', 215000.00, 208000.00, 'Sarah Director', 'Approved', 'Operations staff monthly salaries', '2025-08-15 01:00:00', '2025-08-30 18:18:29'),
(71, 'Monthly', 'Operations', 'RFID', 30000.00, 31000.00, 'Sarah Director', 'Approved', 'RFID system upgrades', '2025-08-15 01:15:00', '2025-08-30 18:18:29'),
(72, 'Monthly', 'Maintenance', 'Maintenance', 90000.00, 85000.00, 'Mike Supervisor', 'Approved', 'Current maintenance activities', '2025-08-15 02:00:00', '2025-08-30 18:18:29'),
(73, 'Monthly', 'Maintenance', 'Crane Rental', 60000.00, 57000.00, 'Mike Supervisor', 'Approved', 'August crane operations', '2025-08-15 02:15:00', '2025-08-30 18:18:29'),
(74, 'Monthly', 'Accounting', 'Labor', 63000.00, 62000.00, 'Finance Head', 'Approved', 'Accounting department salaries', '2025-08-15 03:00:00', '2025-08-30 18:18:29'),
(75, 'Monthly', 'Administration', 'Labor', 48000.00, 47000.00, 'HR Manager', 'Approved', 'Administrative staff salaries', '2025-08-15 03:30:00', '2025-08-30 18:18:29'),
(76, 'Annually', 'Operations', 'RFID', 300000.00, 180000.00, 'CEO', 'Approved', 'Annual RFID system contract', '2025-01-05 02:00:00', '2025-08-30 18:18:29'),
(77, 'Annually', 'Maintenance', 'Maintenance', 800000.00, 420000.00, 'Operations VP', 'Approved', 'Annual maintenance contract', '2025-01-05 02:30:00', '2025-08-30 18:18:29'),
(78, 'Daily', 'Logistics', 'Fuel', 5000.00, 4800.00, 'Shift Manager', 'Approved', 'Daily fuel allocation for urgent deliveries', '2025-08-29 22:00:00', '2025-08-30 18:18:29'),
(79, 'Daily', 'Operations', 'Labor', 8000.00, 7500.00, 'Shift Manager', 'Approved', 'Daily overtime allocation', '2025-08-29 22:30:00', '2025-08-30 18:18:29'),
(80, 'Monthly', 'Logistics', 'Fuel', 200000.00, 0.00, NULL, 'Pending', 'September fuel budget request - higher due to expected price increase', '2025-08-31 06:00:00', '2025-08-30 18:18:29'),
(81, 'Monthly', 'Operations', 'RFID', 50000.00, 0.00, NULL, 'Pending', 'RFID system expansion project', '2025-08-31 06:15:00', '2025-08-30 18:18:29'),
(82, 'Monthly', 'Maintenance', 'Crane Rental', 40000.00, 0.00, 'Mike Supervisor', 'Rejected', 'Crane rental budget too low for September needs', '2025-08-31 07:00:00', '2025-08-30 18:18:29');

-- --------------------------------------------------------

--
-- Table structure for table `chart_of_accounts`
--

CREATE TABLE `chart_of_accounts` (
  `id` int(11) NOT NULL,
  `account_code` varchar(10) NOT NULL,
  `account_name` varchar(100) NOT NULL,
  `account_type` enum('Asset','Liability','Equity','Income','Expense') NOT NULL,
  `description` text DEFAULT NULL,
  `status` enum('Active','Inactive') DEFAULT 'Active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chart_of_accounts`
--

INSERT INTO `chart_of_accounts` (`id`, `account_code`, `account_name`, `account_type`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, '1001', 'Cash', 'Asset', 'Main company cash account', 'Active', '2025-08-30 14:51:55', '2025-08-30 14:51:55'),
(2, '2001', 'Accounts Payable', 'Liability', 'Amounts owed to suppliers', 'Active', '2025-08-30 14:51:55', '2025-08-30 14:51:55'),
(3, '4001', 'Revenue', 'Income', 'Sales and service income', 'Active', '2025-08-30 14:51:55', '2025-08-30 14:51:55'),
(4, '5001', 'Fuel Expenses', 'Expense', 'Fuel for vehicles', 'Active', '2025-08-30 14:51:55', '2025-08-30 14:51:55'),
(5, '5002', 'Vehicle Maintenance', 'Expense', 'Vehicle maintenance and repairs', 'Active', '2025-08-30 14:51:55', '2025-08-30 14:51:55');

-- --------------------------------------------------------

--
-- Table structure for table `collections`
--

CREATE TABLE `collections` (
  `id` int(11) NOT NULL,
  `client_name` varchar(255) NOT NULL,
  `invoice_no` varchar(50) NOT NULL,
  `billing_date` date NOT NULL,
  `due_date` date NOT NULL,
  `amount_base` decimal(12,2) NOT NULL DEFAULT 0.00,
  `vat_applied` enum('Yes','No') NOT NULL DEFAULT 'No',
  `vat_rate` decimal(5,2) NOT NULL DEFAULT 12.00,
  `vat_amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `amount_due` decimal(12,2) NOT NULL DEFAULT 0.00,
  `amount_paid` decimal(12,2) NOT NULL DEFAULT 0.00,
  `penalty` decimal(12,2) NOT NULL DEFAULT 0.00,
  `mode_of_payment` varchar(50) NOT NULL,
  `payment_status` enum('Unpaid','Partial','Paid') NOT NULL,
  `receipt_type` varchar(50) NOT NULL,
  `collector_name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `collections`
--

INSERT INTO `collections` (`id`, `client_name`, `invoice_no`, `billing_date`, `due_date`, `amount_base`, `vat_applied`, `vat_rate`, `vat_amount`, `amount_due`, `amount_paid`, `penalty`, `mode_of_payment`, `payment_status`, `receipt_type`, `collector_name`, `created_at`) VALUES
(7, 'clienttest5', 'test-00000005', '2025-08-03', '2025-08-10', 10000.00, 'Yes', 12.00, 1200.00, 11200.00, 1000.00, 911.20, 'Cash', 'Partial', 'VAT Receipt', 'collectortest5', '2025-08-16 16:04:46'),
(8, 'clienttest', 'test-00000000', '2025-08-17', '2025-08-24', 1000000.00, 'No', 12.00, 0.00, 1000000.00, 1000000.00, 0.00, 'Cash', 'Paid', 'Acknowledgment', 'collectortest', '2025-08-16 18:22:18'),
(9, 'clienttest1', 'test-00000001', '2025-08-17', '2025-08-24', 100000.00, 'Yes', 12.00, 12000.00, 112000.00, 10000.00, 0.00, 'Cash', 'Partial', 'Acknowledgment', 'collectortest1', '2025-08-16 18:24:41'),
(10, 'clienttest2', 'test-00000002', '2025-08-10', '2025-08-16', 100000.00, 'Yes', 12.00, 12000.00, 112000.00, 50000.00, 850.00, 'Cash', 'Partial', 'VAT Receipt', 'collectortest2', '2025-08-16 18:25:43'),
(11, 'clienttest3', 'test-00000003', '2025-07-13', '2025-07-20', 100000.00, 'Yes', 12.00, 12000.00, 112000.00, 10000.00, 3604.00, 'Bank Transfer', 'Partial', 'Acknowledgment', 'collectortest3', '2025-08-16 18:26:53'),
(12, 'clienttest4', 'test-00000004', '2025-06-17', '2025-07-22', 50000.00, 'No', 12.00, 0.00, 50000.00, 0.00, 2100.00, 'Cash', 'Unpaid', 'Acknowledgment', 'collectortest4', '2025-08-16 18:28:29'),
(13, 'clienttest6', 'test-00000006', '2025-07-27', '2025-08-10', 174760.00, 'Yes', 12.00, 20971.20, 195731.20, 30000.00, 1844.39, 'Bank Transfer', 'Partial', 'VAT Receipt', 'collectortest6', '2025-08-16 18:30:04'),
(16, 'clienttest7', 'test-00000007', '2025-08-27', '2025-09-03', 100000.00, 'Yes', 12.00, 12000.00, 112000.00, 112000.00, 0.00, 'Cash', 'Paid', 'VAT Receipt', 'collectortest7', '2025-08-27 06:01:10');

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` int(11) NOT NULL,
  `expense_date` date NOT NULL,
  `category` varchar(100) NOT NULL,
  `vendor` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `remarks` text NOT NULL,
  `tax_type` varchar(50) NOT NULL,
  `tax_amount` decimal(10,2) DEFAULT 0.00,
  `receipt_file` varchar(255) DEFAULT NULL,
  `payment_method` varchar(50) NOT NULL,
  `vehicle` varchar(255) DEFAULT NULL,
  `job_linked` varchar(255) DEFAULT NULL,
  `approved_by` varchar(255) DEFAULT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `expense_date`, `category`, `vendor`, `amount`, `remarks`, `tax_type`, `tax_amount`, `receipt_file`, `payment_method`, `vehicle`, `job_linked`, `approved_by`, `status`, `created_at`, `updated_at`) VALUES
(1, '2024-08-15', 'Fuel', 'Shell Gas Station', 10500.00, 'Fuel for crane operations', 'VAT', 1260.00, NULL, 'Cash', 'Crane Unit 01', 'Job #2024-001', 'John Manager', 'Approved', '2025-08-22 16:58:23', '2025-08-23 13:23:13'),
(2, '2024-08-14', 'Repair & Maintenance', 'Auto Parts Co.', 2500.00, 'Engine oil change and filter replacement', 'VAT', 300.00, NULL, 'Bank', 'Truck Unit 02', 'Job #2024-002', 'Sarah Supervisor', 'Approved', '2025-08-22 16:58:23', '2025-08-22 16:58:23'),
(3, '2024-08-13', 'Toll & Parking', 'NLEX Toll', 250.00, 'Toll fees for project delivery', 'Exempted', 0.00, NULL, 'Cash', 'Delivery Truck 03', 'Job #2024-001', 'Mike Coordinator', 'Approved', '2025-08-22 16:58:23', '2025-08-22 16:58:23'),
(4, '2024-08-12', 'Supplies', 'Hardware Store', 800.00, 'Safety equipment and tools', 'Withholding', 16.00, NULL, 'Bank', NULL, 'Maintenance', 'John Manager', 'Pending', '2025-08-22 16:58:23', '2025-08-22 16:58:23'),
(5, '2024-08-11', 'Other', 'Office Supplies Inc.', 350.00, 'Office materials and documentation', 'None', 0.00, NULL, 'Cash', NULL, NULL, NULL, 'Rejected', '2025-08-22 16:58:23', '2025-08-22 16:58:23');

-- --------------------------------------------------------

--
-- Table structure for table `journal_entries`
--

CREATE TABLE `journal_entries` (
  `id` int(11) NOT NULL,
  `entry_id` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `account_code` varchar(10) NOT NULL,
  `debit` decimal(15,2) DEFAULT 0.00,
  `credit` decimal(15,2) DEFAULT 0.00,
  `description` text NOT NULL,
  `reference` varchar(50) DEFAULT NULL,
  `source_module` varchar(50) DEFAULT NULL,
  `approved_by` varchar(100) DEFAULT NULL,
  `status` enum('Draft','Posted','Cancelled') DEFAULT 'Posted',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `journal_entries`
--

INSERT INTO `journal_entries` (`id`, `entry_id`, `date`, `account_code`, `debit`, `credit`, `description`, `reference`, `source_module`, `approved_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 'GL-1001', '2025-07-10', '5001', 8000.00, 0.00, 'Truck Fuel - Petron', 'COL-2001', 'Expenses', 'Admin', 'Posted', '2025-08-30 14:51:55', '2025-08-30 14:51:55'),
(2, 'GL-1002', '2025-07-11', '4001', 0.00, 25000.00, 'Client Payment - ABC Construction', 'COL-2002', 'Collections', 'Admin', 'Posted', '2025-08-30 14:51:55', '2025-08-30 14:51:55');

-- --------------------------------------------------------

--
-- Table structure for table `liquidation_records`
--

CREATE TABLE `liquidation_records` (
  `id` int(11) NOT NULL,
  `liquidation_id` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `employee` varchar(100) NOT NULL,
  `purpose` text NOT NULL,
  `total_amount` decimal(15,2) NOT NULL,
  `status` enum('Pending','Approved','Rejected') DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `liquidation_records`
--

INSERT INTO `liquidation_records` (`id`, `liquidation_id`, `date`, `employee`, `purpose`, `total_amount`, `status`, `created_at`, `updated_at`) VALUES
(1, 'LQ-2025-001', '2025-08-01', 'John Doe', 'Fuel Reimbursement', 1500.00, 'Approved', '2025-08-30 14:51:55', '2025-08-30 14:51:55');

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `success` tinyint(1) DEFAULT 0,
  `attempted_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login_attempts`
--

INSERT INTO `login_attempts` (`id`, `ip_address`, `username`, `success`, `attempted_at`) VALUES
(74, '::1', 'admin', 1, '2025-08-30 12:53:44'),
(75, '::1', 'testuser', 1, '2025-08-30 12:54:33'),
(76, '::1', 'admin', 1, '2025-08-30 14:32:30'),
(77, '::1', 'admin', 1, '2025-08-30 14:42:44'),
(78, '::1', 'admin', 1, '2025-08-30 15:03:38'),
(79, '::1', 'admin', 1, '2025-08-30 16:11:22'),
(80, '::1', 'admin', 1, '2025-08-30 16:30:23'),
(81, '::1', 'admin', 1, '2025-08-30 17:22:22'),
(82, '::1', 'admin', 1, '2025-08-30 18:08:17');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','user') NOT NULL DEFAULT 'user',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `username`, `password`, `role`, `created_at`, `updated_at`, `is_active`) VALUES
(1, 'admin@system.com', 'admin', '$2y$10$cBzjiYnpoPsVWBR/Iv.8q.CTFH9UVX78KtPO15WGfXa1RaEusgv6.', 'admin', '2025-08-26 21:30:57', '2025-08-27 05:08:20', 1),
(5, 'testuser@gmail.com', 'testuser', '$2y$10$JdzfERQRwXG9dpvp.upm1eDhUIEfba9H5JsuVNTH5EfDWv2adKFGW', 'user', '2025-08-26 22:39:59', '2025-08-27 04:57:46', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_sessions`
--

CREATE TABLE `user_sessions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `session_id` varchar(255) NOT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `expires_at` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `budgets`
--
ALTER TABLE `budgets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chart_of_accounts`
--
ALTER TABLE `chart_of_accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `account_code` (`account_code`);

--
-- Indexes for table `collections`
--
ALTER TABLE `collections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `journal_entries`
--
ALTER TABLE `journal_entries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `entry_id` (`entry_id`),
  ADD KEY `account_code` (`account_code`);

--
-- Indexes for table `liquidation_records`
--
ALTER TABLE `liquidation_records`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `liquidation_id` (`liquidation_id`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_ip_time` (`ip_address`,`attempted_at`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `user_sessions`
--
ALTER TABLE `user_sessions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `session_id` (`session_id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `budgets`
--
ALTER TABLE `budgets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `chart_of_accounts`
--
ALTER TABLE `chart_of_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `collections`
--
ALTER TABLE `collections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `journal_entries`
--
ALTER TABLE `journal_entries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `liquidation_records`
--
ALTER TABLE `liquidation_records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user_sessions`
--
ALTER TABLE `user_sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `journal_entries`
--
ALTER TABLE `journal_entries`
  ADD CONSTRAINT `journal_entries_ibfk_1` FOREIGN KEY (`account_code`) REFERENCES `chart_of_accounts` (`account_code`);

--
-- Constraints for table `user_sessions`
--
ALTER TABLE `user_sessions`
  ADD CONSTRAINT `user_sessions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
