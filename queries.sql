# Query to get active user data for retention
query1 = """
SELECT User_ID, Purchases FROM Users WHERE Last_Login_Date > '2024-01-01' AND Active = 1;
"""

#Calculate user activity (monthly)
query2 = """
SELECT
    EXTRACT(MONTH FROM Signup_Date) AS Signup_Month,
    COUNT(DISTINCT User_ID) AS Active_Users
FROM Users
WHERE Active = 1
GROUP BY EXTRACT(MONTH FROM Signup_Date);
"""

#Query for Group A (users who signed up before 2023)
query3 = """
SELECT User_ID, Purchases
FROM Users
WHERE Signup_Date < '2023-01-01' AND Active = 1;
"""

#Query for Group B (users who signed up after 2023)
query4 = """
SELECT User_ID, Purchases
FROM Users
WHERE Signup_Date >= '2023-01-01' AND Active = 1;
"""

#Query for Group B (even user IDs)
query6 = """
SELECT User_ID, Purchases
FROM Users
WHERE MOD(User_ID, 2) = 0 AND Active = 1;
"""
#Query for Group A (50% of active users, randomly assigned)
query7 = """
SELECT User_ID, Purchases
FROM Users
WHERE RAND() <= 0.5 AND Active = 1;
"""
#Query for Group B (remaining 50% of active users)
query8 = """
SELECT User_ID, Purchases
FROM Users
WHERE RAND() > 0.5 AND Active = 1;
"""

