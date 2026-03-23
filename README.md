# Bike-Share Case Study

Tools: SQL (BigQuery)

This project analyzes user behavior in a bike-share dataset to identify differences between casual and member riders and provide data-driven recommendations.

Bike-Share Case Study: Casual vs Member Behavior

Business Problem:
The objective of this analysis is to understand how casual riders differ from annual members and identify strategies to convert casual users into members. 

Data Description:
The dataset contains ride-level data including timestamps, station information, and user type (casual vs member).

## Data Source

The dataset used in this project is the Cyclistic bike-share dataset provided as part of the Google Data Analytics Capstone Case Study.

It contains historical trip data including ride timestamps, station information, and user type classification (casual vs member).

Due to size constraints, the raw dataset is not included in this repository.

Process:
Removed invalid records (negative or unrealistic ride durations)
Calculated ride length using timestamp differences
Extracted day of week and hour from ride timestamps
Performed analysis using SQL in BigQuery

Key Insights:
1. Ride Frequency
Members generate a higher number of rides, indicating consistent and repeated usage.
2. Ride Duration
Casual riders have longer average ride durations, suggesting they use the service for leisure rather than routine transportation.
3. Weekly Behavior
Casual riders are significantly more active on weekends, while members ride more consistently during weekdays.
4. Daily Patterns
Members show peak usage during commuting hours (morning and evening), whereas casual riders peak during midday hours.

Recommendations:
Target weekend users:
 Introduce promotions during weekends when casual rider activity is highest


Leverage recreational usage:
 Position memberships as beneficial for leisure and longer rides


Offer trial memberships:
 Encourage conversion by lowering the entry barrier for casual users


Use time-based incentives:
 Promote memberships during peak casual usage hours
Additional Opportunities for Analysis
With more data, further analysis could include:
User retention and repeat usage
Conversion rates from casual to member
Geographic usage patterns
