WITH raw_reviews AS (
    SELECT
        *
    FROM
        AIRBNB.RAW.RAW_REVIEWS
)
SELECT
    listing_id,
    date as review_date,
    comments as review_text,
    sentiment as review_sentiment,
    reviewer_name
FROM
    raw_reviews