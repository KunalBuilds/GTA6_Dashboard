import pandas as pd
from Python.utils.logger import logger

def process_budget_and_preorders():
    logger.info("Processing budget, preorders, and social media datasets...")
    
    # Process budget
    budget_df = pd.read_csv("data/raw/budget.csv")
    budget_df.to_csv("data/processed/budget_processed.csv", index=False)
    print("✅ Budget data processed and saved to data/processed/budget_processed.csv")

    # Process preorders
    preorder_df = pd.read_csv("data/raw/preorders.csv")
    preorder_df.to_csv("data/processed/preorders_processed.csv", index=False)
    print("✅ Preorder data processed and saved to data/processed/preorders_processed.csv")

    # Process social media
    social_df = pd.read_csv("data/raw/social_media.csv")
    social_df.to_csv("data/processed/social_media_processed.csv", index=False)
    print("✅ Social media data processed and saved to data/processed/social_media_processed.csv")

if __name__ == "__main__":
    process_budget_and_preorders()
