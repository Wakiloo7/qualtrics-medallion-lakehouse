SELECT
  CONCAT(survey_id, '_', response_id) AS survey_response_key,
  response_id,
  survey_id,
  region,
  department,
  respondent_type,
  finished,
  score,
  CASE
    WHEN score >= 9 THEN 'Promoter (9-10)'
    WHEN score >= 7 THEN 'Passive (7-8)'
    WHEN score >= 1 THEN 'Detractor (1-6)'
    ELSE 'Not Scored'
  END AS nps_bucket
FROM {{ source('silver', 'qualtrics_responses') }}