import pandas as pd
from pytrends.request import TrendReq

# Connect to Google Trends
pytrends = TrendReq(hl='en-US', tz=330)

# Keywords to compare
keywords = [
    "Grand Theft Auto V",
    "Grand Theft Auto VI"
]

# Build the request
pytrends.build_payload(
    kw_list=keywords,
    cat=0,
    timeframe='today 5-y',
    geo='',
    gprop=''
)

# Get Interest Over Time
df = pytrends.interest_over_time()

# Remove the "isPartial" column if present
if "isPartial" in df.columns:
    df = df.drop(columns=["isPartial"])

# Save CSV
df.to_csv(
    "data/raw/google_trends.csv"
)

print("✅ Google Trends data saved successfully!")