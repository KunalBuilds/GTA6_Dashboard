import json
import pandas as pd

from Python.utils.youtube_client import get_youtube_client
from Python.utils.logger import logger

youtube = get_youtube_client()

# -------------------------------
# Load configuration
# -------------------------------

with open("config/game.json", "r") as file:
    config = json.load(file)

games = config["games"]

data = []

# -------------------------------
# Loop through every game
# -------------------------------

for game in games:

    logger.info(f"Searching {game['game']}")

    search_response = youtube.search().list(
        part="snippet",
        q=game["query"],
        maxResults=1,
        type="video"
    ).execute()

    video = search_response["items"][0]

    video_id = video["id"]["videoId"]

    # -------------------------------
    # Second API Call
    # -------------------------------

    stats_response = youtube.videos().list(
        part="statistics,contentDetails,snippet",
        id=video_id
    ).execute()

    info = stats_response["items"][0]

    row = {

        "Game": game["game"],

        "Title": info["snippet"]["title"],

        "Channel": info["snippet"]["channelTitle"],

        "Published Date": info["snippet"]["publishedAt"],

        "Views": info["statistics"].get("viewCount", 0),

        "Likes": info["statistics"].get("likeCount", 0),

        "Comments": info["statistics"].get("commentCount", 0),

        "Duration": info["contentDetails"]["duration"],

        "Video ID": video_id,

        "URL": f"https://www.youtube.com/watch?v={video_id}"

    }

    data.append(row)

    print(f"[SUCCESS] {game['game']} collected.")

# -------------------------------
# Save CSV
# -------------------------------

df = pd.DataFrame(data)

df.to_csv(
    "data/raw/youtube_data.csv",
    index=False
)

print("\nDataset Saved Successfully!")