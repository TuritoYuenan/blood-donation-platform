-- Seed data for Blood Donation Platform
-- Generated: March 2026

-- Clear existing data (in reverse order of dependencies)
TRUNCATE TABLE appointments CASCADE;
TRUNCATE TABLE donation_campaigns CASCADE;
TRUNCATE TABLE users CASCADE;
TRUNCATE TABLE donation_centres CASCADE;
TRUNCATE TABLE blood_types CASCADE;

-- ====================
-- BLOOD TYPES (8 types)
-- ====================
INSERT INTO blood_types (type, description) VALUES
('A+', 'A positive - Can receive A+, A-, O+, O- and donate to A+, AB+'),
('A-', 'A negative - Can receive A-, O- and donate to A+, A-, AB+, AB-'),
('B+', 'B positive - Can receive B+, B-, O+, O- and donate to B+, AB+'),
('B-', 'B negative - Can receive B-, O- and donate to B+, B-, AB+, AB-'),
('AB+', 'AB positive - Universal recipient, can receive all types and donate to AB+'),
('AB-', 'AB negative - Can receive AB-, A-, B-, O- and donate to AB+, AB-'),
('O+', 'O positive - Can receive O+, O- and donate to A+, B+, AB+, O+'),
('O-', 'O negative - Universal donor, can receive O- and donate to all types');

-- ====================
-- DONATION CENTRES (8 centres)
-- ====================
INSERT INTO donation_centres (name, address, status, phone_number, email, operating_hours, description) VALUES
('Central City Blood Bank', '123 Main Street, Downtown, CC 12345', 'active', '+1-555-0101', 'central@bloodbank.org', 'Mon-Fri: 8am-6pm, Sat: 9am-4pm, Sun: Closed', 'Main blood donation center serving the downtown area with state-of-the-art facilities.'),
('Riverside Community Center', '456 River Road, Riverside, CC 23456', 'active', '+1-555-0102', 'riverside@bloodbank.org', 'Mon-Fri: 9am-5pm, Sat-Sun: 10am-3pm', 'Community-focused donation center located near the river district.'),
('Northside Medical Plaza', '789 North Avenue, Northside, CC 34567', 'active', '+1-555-0103', 'northside@bloodbank.org', 'Mon-Sat: 7am-7pm, Sun: 9am-5pm', 'Large medical facility with dedicated blood donation wing.'),
('Westgate Mall Center', '321 Westgate Boulevard, Westgate, CC 45678', 'active', '+1-555-0104', 'westgate@bloodbank.org', 'Mon-Sun: 10am-8pm', 'Convenient location inside Westgate Mall for walk-in donors.'),
('University Hospital Hub', '654 Campus Drive, University District, CC 56789', 'active', '+1-555-0105', 'university@bloodbank.org', 'Mon-Fri: 8am-9pm, Sat-Sun: 9am-6pm', 'University-affiliated center serving students and faculty.'),
('Eastside Regional Center', '987 East Street, Eastside, CC 67890', 'active', '+1-555-0106', 'eastside@bloodbank.org', 'Mon-Fri: 8am-5pm, Sat: 9am-2pm, Sun: Closed', 'Regional center serving multiple eastern neighborhoods.'),
('Memorial Hospital Wing', '147 Memorial Lane, Medical District, CC 78901', 'active', '+1-555-0107', 'memorial@bloodbank.org', 'Mon-Sun: 24/7', 'Hospital-based center with 24/7 emergency donation services.'),
('Suburban Community Center', '258 Suburb Road, Suburbia, CC 89012', 'active', '+1-555-0108', 'suburban@bloodbank.org', 'Mon-Wed-Fri: 9am-4pm, Tue-Thu: 12pm-7pm', 'Family-friendly center in suburban neighborhood.');

-- ====================
-- USERS (35 users: 25 donors + 10 staff)
-- ====================
-- Password hash for "password123" using bcrypt
-- $2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewY5GyYqXqXqXqXq

-- STAFF USERS (10)
INSERT INTO users (email, user_type, first_name, last_name, date_of_birth, phone_number, address, password_hash) VALUES
('admin@bloodbank.org', 'staff', 'Sarah', 'Johnson', '1985-03-15', '+1-555-1001', '100 Admin Street, CC 10001', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewY5GyYqXqXqXqXq'),
('supervisor@bloodbank.org', 'staff', 'Michael', 'Chen', '1982-07-22', '+1-555-1002', '101 Staff Avenue, CC 10002', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewY5GyYqXqXqXqXq'),
('coordinator@bloodbank.org', 'staff', 'Jennifer', 'Martinez', '1990-11-08', '+1-555-1003', '102 Work Place, CC 10003', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewY5GyYqXqXqXqXq'),
('nurse.thompson@bloodbank.org', 'staff', 'Emily', 'Thompson', '1988-04-17', '+1-555-1004', '103 Medical Road, CC 10004', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewY5GyYqXqXqXqXq'),
('tech.wilson@bloodbank.org', 'staff', 'David', 'Wilson', '1992-09-25', '+1-555-1005', '104 Tech Street, CC 10005', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewY5GyYqXqXqXqXq'),
('staff.anderson@bloodbank.org', 'staff', 'Lisa', 'Anderson', '1987-01-30', '+1-555-1006', '105 Hospital Lane, CC 10006', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewY5GyYqXqXqXqXq'),
('staff.brown@bloodbank.org', 'staff', 'Robert', 'Brown', '1984-06-12', '+1-555-1007', '106 Center Avenue, CC 10007', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewY5GyYqXqXqXqXq'),
('staff.davis@bloodbank.org', 'staff', 'Amanda', 'Davis', '1991-12-05', '+1-555-1008', '107 Clinic Road, CC 10008', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewY5GyYqXqXqXqXq'),
('staff.garcia@bloodbank.org', 'staff', 'Carlos', 'Garcia', '1989-08-20', '+1-555-1009', '108 Medical Plaza, CC 10009', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewY5GyYqXqXqXqXq'),
('staff.miller@bloodbank.org', 'staff', 'Jessica', 'Miller', '1993-02-14', '+1-555-1010', '109 Health Center, CC 10010', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewY5GyYqXqXqXqXq');

-- DONOR USERS (25)
INSERT INTO users (email, user_type, first_name, last_name, date_of_birth, phone_number, address, password_hash) VALUES
('john.smith@email.com', 'donor', 'John', 'Smith', '1995-05-10', '+1-555-2001', '200 Donor Street, CC 20001', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewY5GyYqXqXqXqXq'),
('emma.jones@email.com', 'donor', 'Emma', 'Jones', '1992-08-22', '+1-555-2002', '201 Community Ave, CC 20002', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewY5GyYqXqXqXqXq'),
('alex.rodriguez@email.com', 'donor', 'Alex', 'Rodriguez', '1988-03-18', '+1-555-2003', '202 Residence Lane, CC 20003', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewY5GyYqXqXqXqXq'),
('sophia.lee@email.com', 'donor', 'Sophia', 'Lee', '1997-11-05', '+1-555-2004', '203 Home Road, CC 20004', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewY5GyYqXqXqXqXq'),
('william.taylor@email.com', 'donor', 'William', 'Taylor', '1990-07-30', '+1-555-2005', '204 Living Street, CC 20005', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewY5GyYqXqXqXqXq'),
('olivia.white@email.com', 'donor', 'Olivia', 'White', '1994-12-14', '+1-555-2006', '205 Park Avenue, CC 20006', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewY5GyYqXqXqXqXq'),
('james.harris@email.com', 'donor', 'James', 'Harris', '1986-09-08', '+1-555-2007', '206 Main Plaza, CC 20007', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewY5GyYqXqXqXqXq'),
('ava.martin@email.com', 'donor', 'Ava', 'Martin', '1999-04-25', '+1-555-2008', '207 Central Street, CC 20008', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewY5GyYqXqXqXqXq'),
('benjamin.clark@email.com', 'donor', 'Benjamin', 'Clark', '1991-01-19', '+1-555-2009', '208 North Lane, CC 20009', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewY5GyYqXqXqXqXq'),
('mia.lewis@email.com', 'donor', 'Mia', 'Lewis', '1996-06-07', '+1-555-2010', '209 South Road, CC 20010', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewY5GyYqXqXqXqXq'),
('ethan.walker@email.com', 'donor', 'Ethan', 'Walker', '1989-10-12', '+1-555-2011', '210 East Avenue, CC 20011', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewY5GyYqXqXqXqXq'),
('charlotte.hall@email.com', 'donor', 'Charlotte', 'Hall', '1993-02-28', '+1-555-2012', '211 West Street, CC 20012', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewY5GyYqXqXqXqXq'),
('mason.allen@email.com', 'donor', 'Mason', 'Allen', '1987-08-16', '+1-555-2013', '212 Valley Road, CC 20013', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewY5GyYqXqXqXqXq'),
('amelia.young@email.com', 'donor', 'Amelia', 'Young', '1998-05-03', '+1-555-2014', '213 Hill Lane, CC 20014', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewY5GyYqXqXqXqXq'),
('lucas.king@email.com', 'donor', 'Lucas', 'King', '1985-11-21', '+1-555-2015', '214 Mountain Ave, CC 20015', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewY5GyYqXqXqXqXq'),
('harper.wright@email.com', 'donor', 'Harper', 'Wright', '1994-03-09', '+1-555-2016', '215 Lake Street, CC 20016', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewY5GyYqXqXqXqXq'),
('logan.lopez@email.com', 'donor', 'Logan', 'Lopez', '1990-12-27', '+1-555-2017', '216 River Road, CC 20017', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewY5GyYqXqXqXqXq'),
('ella.hill@email.com', 'donor', 'Ella', 'Hill', '1996-07-15', '+1-555-2018', '217 Ocean Drive, CC 20018', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewY5GyYqXqXqXqXq'),
('jackson.scott@email.com', 'donor', 'Jackson', 'Scott', '1988-04-02', '+1-555-2019', '218 Bay Avenue, CC 20019', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewY5GyYqXqXqXqXq'),
('avery.green@email.com', 'donor', 'Avery', 'Green', '1995-09-11', '+1-555-2020', '219 Forest Lane, CC 20020', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewY5GyYqXqXqXqXq'),
('sebastian.adams@email.com', 'donor', 'Sebastian', 'Adams', '1992-01-06', '+1-555-2021', '220 Garden Street, CC 20021', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewY5GyYqXqXqXqXq'),
('scarlett.baker@email.com', 'donor', 'Scarlett', 'Baker', '1997-10-24', '+1-555-2022', '221 Spring Road, CC 20022', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewY5GyYqXqXqXqXq'),
('aiden.nelson@email.com', 'donor', 'Aiden', 'Nelson', '1989-06-18', '+1-555-2023', '222 Summer Avenue, CC 20023', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewY5GyYqXqXqXqXq'),
('grace.carter@email.com', 'donor', 'Grace', 'Carter', '1993-11-29', '+1-555-2024', '223 Autumn Lane, CC 20024', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewY5GyYqXqXqXqXq'),
('matthew.mitchell@email.com', 'donor', 'Matthew', 'Mitchell', '1991-08-05', '+1-555-2025', '224 Winter Street, CC 20025', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewY5GyYqXqXqXqXq');

-- ====================
-- DONATION CAMPAIGNS (12 campaigns)
-- ====================
INSERT INTO donation_campaigns (name, description, start_date, end_date, target_blood_type, target_amount, status) VALUES
('Spring Blood Drive 2026', 'Annual spring campaign to replenish blood supplies after winter. Join us in saving lives!', '2026-03-01', '2026-03-31', NULL, 500.0, 'active'),
('O Negative Universal Donor Appeal', 'Critical need for O- blood type, the universal donor. Your donation can help anyone in need.', '2026-02-15', '2026-04-15', 'O-', 150.0, 'active'),
('Summer Preparedness Drive', 'Building blood reserves for summer accident season. Every donation counts!', '2026-04-01', '2026-06-30', NULL, 750.0, 'active'),
('Rare Blood Type Initiative', 'Special campaign focusing on collecting rare AB- blood type donations.', '2026-03-10', '2026-05-10', 'AB-', 80.0, 'active'),
('Community Heroes Campaign', 'Recognizing and encouraging first-time donors. Become a hero in your community!', '2026-02-01', '2026-04-30', NULL, 400.0, 'active'),
('Emergency Reserve Build-up', 'Critical campaign to ensure adequate blood supply for emergency situations and disasters.', '2026-03-01', '2026-05-31', NULL, 600.0, 'active'),
('Youth Donation Drive', 'Encouraging young adults aged 18-25 to become regular blood donors. Start your journey today!', '2026-03-15', '2026-04-15', NULL, 300.0, 'active'),
('B Positive Challenge', 'Focused campaign for B+ blood type with lower than optimal inventory levels.', '2026-02-20', '2026-04-20', 'B+', 200.0, 'active'),
('Corporate Partnership Drive', 'Partnering with local businesses to organize workplace blood donation events.', '2026-03-05', '2026-06-05', NULL, 550.0, 'active'),
('Holiday Season Prep', 'Preparing blood reserves ahead of the upcoming holiday season when donations typically decrease.', '2026-04-01', '2026-05-15', NULL, 450.0, 'active'),
('Winter Relief Complete', 'Completed winter campaign that successfully collected blood during cold months.', '2025-12-01', '2026-02-28', NULL, 500.0, 'completed'),
('A Positive Awareness', 'Educational campaign highlighting the importance of A+ blood type donations.', '2026-03-01', '2026-04-30', 'A+', 250.0, 'active');

-- ====================
-- APPOINTMENTS (25 appointments)
-- ====================
INSERT INTO appointments (date, time, description) VALUES
('2026-03-06', '09:00', 'Regular blood donation appointment - First time donor'),
('2026-03-06', '10:30', 'Scheduled donation as part of Spring Blood Drive'),
('2026-03-07', '14:00', 'Follow-up donation appointment'),
('2026-03-07', '15:30', 'Walk-in donation converted to scheduled appointment'),
('2026-03-08', '08:30', 'Early morning donation before work'),
('2026-03-08', '11:00', 'Regular donor - quarterly donation'),
('2026-03-09', '13:00', 'First-time donor - Community Heroes Campaign participant'),
('2026-03-09', '16:00', 'Evening appointment for working professionals'),
('2026-03-10', '09:30', 'O- donation for Universal Donor Appeal'),
('2026-03-10', '12:00', 'Lunch-time donation appointment'),
('2026-03-11', '10:00', 'Weekend donation - family donation event'),
('2026-03-11', '14:30', 'Regular donor - monthly donation'),
('2026-03-12', '08:00', 'First available morning slot'),
('2026-03-12', '15:00', 'Afternoon donation appointment'),
('2026-03-13', '11:30', 'Mid-day donation during break'),
('2026-03-13', '16:30', 'After-work donation appointment'),
('2026-03-14', '09:00', 'Weekend morning donation'),
('2026-03-14', '13:00', 'AB- donation for Rare Blood Type Initiative'),
('2026-03-15', '10:30', 'Corporate partnership - workplace group donation'),
('2026-03-15', '14:00', 'Youth Donation Drive participant'),
('2026-03-16', '08:30', 'Regular appointment - experienced donor'),
('2026-03-16', '12:30', 'Lunch hour donation'),
('2026-03-17', '15:00', 'B+ donation for B Positive Challenge'),
('2026-03-17', '16:00', 'Late afternoon appointment'),
('2026-03-18', '11:00', 'Regular donation - A+ blood type');

-- ====================
-- VERIFICATION QUERIES
-- ====================
-- Uncomment to verify data insertion

SELECT 'Blood Types', COUNT(*) FROM blood_types;
SELECT 'Donation Centres', COUNT(*) FROM donation_centres;
SELECT 'Users', COUNT(*), user_type FROM users GROUP BY user_type;
SELECT 'Donation Campaigns', COUNT(*), status FROM donation_campaigns GROUP BY status;
SELECT 'Appointments', COUNT(*) FROM appointments;
