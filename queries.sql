-- Bike Share Case Study Queries
-- 1. Data preparation
-- 2. User type comparison
-- 3. Weekly behavior
-- 4. Hourly behavior

-- Create ride length and time features
SELECT
  ride_id,
  member_casual,
  started_at,
  ended_at,
  TIMESTAMP_DIFF(ended_at, started_at, MINUTE) AS ride_length,
  FORMAT_TIMESTAMP('%A', started_at) AS day_of_week,
  EXTRACT(HOUR FROM started_at) AS hour
FROM `project-6769b975-f352-4104-986.bike_trips.bike_data`
WHERE 
  TIMESTAMP_DIFF(ended_at, started_at, MINUTE) > 0
  AND TIMESTAMP_DIFF(ended_at, started_at, MINUTE) < 1440;

-- Compare total rides and average ride length
SELECT
  member_casual,
  COUNT(*) AS total_rides,
  AVG(TIMESTAMP_DIFF(ended_at, started_at, MINUTE)) AS avg_ride_length
FROM `project-6769b975-f352-4104-986.bike_trips.bike_data`
WHERE 
  TIMESTAMP_DIFF(ended_at, started_at, MINUTE) > 0
  AND TIMESTAMP_DIFF(ended_at, started_at, MINUTE) < 1440
GROUP BY member_casual;

-- Analyze ride patterns by day of week
WITH cleaned_data AS (
  SELECT
    member_casual,
    TIMESTAMP_DIFF(ended_at, started_at, MINUTE) AS ride_length,
    FORMAT_TIMESTAMP('%A', started_at) AS day_of_week
FROM `project-6769b975-f352-4104-986.bike_trips.bike_data`
  WHERE 
    TIMESTAMP_DIFF(ended_at, started_at, MINUTE) > 0
    AND TIMESTAMP_DIFF(ended_at, started_at, MINUTE) < 1440
)

SELECT
  member_casual,
  day_of_week,
  COUNT(*) AS total_rides,
  AVG(ride_length) AS avg_ride_length
FROM cleaned_data
GROUP BY member_casual, day_of_week
ORDER BY member_casual, total_rides DESC;

-- Analyze ride patterns by hour of day
WITH cleaned_data AS (
  SELECT
    member_casual,
    TIMESTAMP_DIFF(ended_at, started_at, MINUTE) AS ride_length,
    EXTRACT(HOUR FROM started_at) AS hour
FROM `project-6769b975-f352-4104-986.bike_trips.bike_data`
  WHERE 
    TIMESTAMP_DIFF(ended_at, started_at, MINUTE) > 0
    AND TIMESTAMP_DIFF(ended_at, started_at, MINUTE) < 1440
)

SELECT
  member_casual,
  hour,
  COUNT(*) AS total_rides
FROM cleaned_data
GROUP BY member_casual, hour
ORDER BY member_casual, hour;
