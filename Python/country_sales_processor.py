import pandas as pd
from Python.utils.logger import logger

def process_country_sales():
    logger.info("Processing country sales data...")
    df = pd.read_csv("data/raw/country_sales.csv")
    
    # Process or transform country sales if needed
    # For now, we save it directly to processed folder
    df.to_csv("data/processed/country_sales_processed.csv", index=False)
    print("✅ Country sales processed and saved to data/processed/country_sales_processed.csv")

if __name__ == "__main__":
    process_country_sales()
