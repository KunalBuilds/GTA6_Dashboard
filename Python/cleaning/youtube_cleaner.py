import pandas as pd
from Python.utils.logger import logger

def clean_youtube_data():
    logger.info("Cleaning YouTube data...")
    df = pd.read_csv("data/raw/youtube_data.csv")
    df["Engagement_Rate_Percent"] = ((df["Likes"] + df["Comments"]) / df["Views"]) * 100
    df["View_To_Like_Ratio"] = df["Views"] / df["Likes"]
    
    # Save cleaned file
    df.to_csv("data/cleaned/youtube_data_cleaned.csv", index=False)
    print("✅ YouTube data cleaned and saved to data/cleaned/youtube_data_cleaned.csv")

if __name__ == "__main__":
    clean_youtube_data()
