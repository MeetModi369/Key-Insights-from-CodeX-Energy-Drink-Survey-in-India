-- ----------------------------------------  Demographic Insights  ---------------------------------------------------------
-- 1.1 Who prefers energy drink more
select Gender,count(Respondent_ID) as Count_of_pref
from dim_repondents
group by Gender
order by Count_of_pref desc ;

-- 1.2 Which age group prefers energy drinks more
select age as Age_Group,count(Respondent_ID) as Times_Preferred
from dim_repondents
group by Age_Group
order by Times_Preferred Desc;

-- 1.3 Which type of marketing reaches the most Youth (15-30)
SELECT 
    b.Marketing_channels,
    COUNT(b.Marketing_channels) AS Occurence
FROM dim_repondents a
JOIN fact_survey_responses b 
ON a.Respondent_ID = b.Respondent_ID
WHERE a.age BETWEEN '15-18' AND '19-30'
GROUP BY b.Marketing_channels 
ORDER BY Occurence DESC;

-- ---------------------------------------- Consumer Preferences ---------------------------------------------------------

-- 2.1 What are the preferred ingredients of energy drinks among respondents?
select Ingredients_expected as Ingredients,
	   count(Respondent_ID) as Times_Consumed
from fact_survey_responses
group by Ingredients
order by Times_Consumed desc;

-- 2.2 What packaging preferences do respondents have for energy drinks
select Packaging_preference as Type_of_Packaging,
	   count(Respondent_ID) as Times_Preferred
from fact_survey_responses
group by Type_of_Packaging
order by Times_Preferred desc;

-- ---------------------------------------- Competition Analysis: ---------------------------------------------------------

-- 3.1 Who are the current market leaders?
SELECT Current_brands, COUNT(Respondent_ID) AS Sales_among_10000_respondents
FROM fact_survey_responses
GROUP BY Current_brands
ORDER BY Sales_among_10000_respondents DESC;

-- 3.2 What are the primary reasons consumers prefer those brands over ours?
SELECT Reasons_for_choosing_brands, COUNT(Respondent_ID) AS Count_Of_Response
FROM fact_survey_responses
GROUP BY Reasons_for_choosing_brands
ORDER BY Count_Of_Response DESC ;

-- ---------------------------------------- Marketing Channels and Brand Awareness: ---------------------------------------------------------

-- 4.1 Which marketing channel can be used to reach more customers?
SELECT Marketing_channels, COUNT(Respondent_ID) AS Response, 
	   Round(COUNT(Respondent_ID) / 10000*100 ,1) as Percentage_of_Response
FROM fact_survey_responses
GROUP BY Marketing_channels
ORDER BY Response DESC;

-- ---------------------------------------- Brand Penetration : ---------------------------------------------------------

-- 5.1 Which cities do we need to focus more on?
SELECT c.City, COUNT(r.Respondent_ID) AS Count_of_Response
FROM dim_cities c
JOIN dim_repondents r
ON c.city_id=r.city_id
GROUP BY c.City
ORDER BY Count_of_Response DESC;

-- 5.2 What do people think about our brand?
SELECT Heard_before, COUNT(Respondent_ID) AS Count_of_Response
FROM fact_survey_responses
GROUP BY Heard_before
ORDER BY Count_of_Response DESC;

SELECT Tried_before, COUNT(Respondent_ID) AS Count_of_Response
FROM fact_survey_responses
WHERE Heard_before="Yes"
GROUP BY Tried_before
ORDER BY Count_of_Response DESC;

SELECT Taste_experience, COUNT(Respondent_ID) AS Count_of_Response
FROM fact_survey_responses
Where Tried_before="yes" AND Heard_before="Yes"
GROUP BY Taste_experience
ORDER BY Count_of_Response DESC;

-- ---------------------------------------- Purchase Behavior : ---------------------------------------------------------

-- 6.1 Where do respondents prefer to purchase energy drinks?
SELECT Purchase_location, COUNT(Respondent_ID) AS Times_Purchased
FROM fact_survey_responses
GROUP BY Purchase_location
ORDER BY Times_Purchased DESC;

-- 6.2 What are the typical consumption situations for energy drinks among respondents?
SELECT Typical_consumption_situations, COUNT(Respondent_ID) AS Number_of_times
FROM fact_survey_responses
GROUP BY Typical_consumption_situations
ORDER BY Number_of_times DESC;

-- 6.3 What factors influence respondents' purchase decisions, such as price range and  limited edition packaging?

SELECT Price_range, COUNT(Respondent_ID) AS Number_of_times
FROM fact_survey_responses
GROUP BY Price_range
ORDER BY Number_of_times DESC;

SELECT Limited_edition_packaging, COUNT(Respondent_ID) AS Number_of_times
FROM fact_survey_responses
GROUP BY Limited_edition_packaging
ORDER BY Number_of_times DESC;

-- ---------------------------------------- Product Development : ---------------------------------------------------------

-- 7.1 Which area of business should we focus more on our product development?
SELECT Reasons_for_choosing_brands, COUNT(Respondent_ID) AS Responses
FROM fact_survey_responses
WHERE Current_brands="CodeX"
GROUP BY Reasons_for_choosing_brands
ORDER BY Responses DESC;

select Brand_perception , count(distinct(Response_ID)) as Responses
from fact_survey_responses
WHERE Current_brands="CodeX"
group by Brand_perception
ORDER BY Responses DESC






































