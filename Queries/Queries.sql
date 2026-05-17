-- 1. Average focus score of users

SELECT 
    u.Username,
    AVG(f.Score) AS AverageFocusScore
FROM Users u
JOIN FocusScores f
ON u.UserID = f.UserID
GROUP BY u.Username
ORDER BY AverageFocusScore DESC;



-- 2. Most blocked applications

SELECT 
    AppName,
    COUNT(*) AS BlockCount
FROM BlockedApps
GROUP BY AppName
ORDER BY BlockCount DESC;



-- 3. Daily focus performance summary

SELECT 
    Date,
    TotalFocusTime,
    DistractionCount,
    BlockedAppCount
FROM DailySummaries
ORDER BY Date DESC;



-- 4. Users who completed their goals

SELECT 
    u.Username,
    COUNT(*) AS GoalsCompleted
FROM Users u
JOIN GoalLogs g
ON u.UserID = g.UserID
WHERE g.IsGoalMet = 1
GROUP BY u.Username
ORDER BY GoalsCompleted DESC;



-- 5. Active blocking rules

SELECT 
    AppName,
    UsageThresholdMinutes,
    BlockDurationMinutes
FROM CustomBlockRules
WHERE IsActive = 1
ORDER BY BlockDurationMinutes DESC;



-- 6. Most used applications

SELECT 
    AppName,
    SUM(DurationMinutes) AS TotalUsageMinutes
FROM AppsUsed
GROUP BY AppName
ORDER BY TotalUsageMinutes DESC;



-- 7. Successful focus sessions

SELECT 
    u.Username,
    COUNT(*) AS SuccessfulSessions
FROM Users u
JOIN Sessions s
ON u.UserID = s.UserID
WHERE s.WasSuccessful = 1
GROUP BY u.Username
ORDER BY SuccessfulSessions DESC;



-- 8. Reward statistics

SELECT 
    r.Title,
    COUNT(ur.UserRewardID) AS TimesEarned
FROM Rewards r
JOIN UserRewards ur
ON r.RewardID = ur.RewardID
GROUP BY r.Title
ORDER BY TimesEarned DESC;



-- 9. User notification activity

SELECT 
    u.Username,
    COUNT(n.NotificationID) AS TotalNotifications
FROM Users u
JOIN Notifications n
ON u.UserID = n.UserID
GROUP BY u.Username
ORDER BY TotalNotifications DESC;



-- 10. Average daily screen time

SELECT 
    AVG(TotalScreenTime) AS AverageScreenTime
FROM DailySummaries;