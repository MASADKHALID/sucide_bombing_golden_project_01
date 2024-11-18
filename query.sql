create database sucide_bombing;
use sucide_bombing;
CREATE TABLE clean_table (
    Date VARCHAR(255),
    Islamic_Date VARCHAR(255),
    Blast_Day_Type VARCHAR(255),
    Holiday_Type VARCHAR(255),
    Time VARCHAR(255),
    City VARCHAR(255),
    Province VARCHAR(255),
    Location VARCHAR(255),
    Location_Category VARCHAR(255),
    Location_Sensitivity VARCHAR(255),
    Open_Closed_Space VARCHAR(255),
    Influencing_Event_Event VARCHAR(500),
    Target_Type VARCHAR(255),
    Targeted_Sect_if_any VARCHAR(255),
    Killed_Min FLOAT,
    Killed_Max FLOAT,
    Injured_Min FLOAT,
    Injured_Max VARCHAR(255),
    No_of_Suicide_Blasts FLOAT,
    Explosive_Weight_max VARCHAR(255),
    Hospital_Names VARCHAR(255),
    Temperature_C FLOAT
);
select *
from clean_table;

SELECT 
    City, 
    Province, 
    Killed_Max, 
    Injured_Max 
INTO high_casualty_insights
FROM clean_table
WHERE Killed_Max >= 10;

SELECT 
    Province, 
    Targeted_Sect_if_any, 
    Killed_Max 
INTO sectarian_violence_insights
FROM clean_table
WHERE Targeted_Sect_if_any IS NOT NULL;

SELECT 
    Province, 
    No_of_Suicide_Blasts, 
    Killed_Max 
INTO suicide_blast_insights
FROM clean_table
WHERE No_of_Suicide_Blasts > 0;

SELECT 
    Province, 
    Target_Type, 
    COUNT(*) AS Incident_Count 
INTO region_target_insights
FROM clean_table
GROUP BY Province, Target_Type;

SELECT 
    Temperature_C, 
    Killed_Max 
INTO temperature_casualty_insights
FROM clean_table
WHERE Temperature_C IS NOT NULL;

SELECT 
    Target_Type, 
    SUM(Killed_Max) AS Total_Killed 
INTO casualty_focus_insights
FROM clean_table
WHERE LOWER(Target_Type) IN ('civilian', 'military', 'police')
GROUP BY Target_Type;


SELECT 
    Province, 
    COUNT(*) AS Blast_Count
INTO province_blast_count
FROM clean_table
GROUP BY Province
ORDER BY Blast_Count DESC;

SELECT 
    Blast_Day_Type, 
    COUNT(*) AS Blast_Count
INTO blast_day_type_count
FROM clean_table
GROUP BY Blast_Day_Type
ORDER BY Blast_Count DESC;

SELECT 
    Location, 
    Open_Closed_Space, 
    COUNT(*) AS Blast_Count
INTO location_open_closed_blast_count
FROM clean_table
GROUP BY Location, Open_Closed_Space
ORDER BY Blast_Count DESC;
















