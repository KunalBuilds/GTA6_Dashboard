import pandas as pd

# Average selling prices
gta5_price = 3500
gta6_price = 5000

# -----------------------------
# GTA V Sales
# -----------------------------

gta5 = pd.read_csv("data/raw/gta5_sales.csv")

gta5["Revenue_INR_Crore"] = gta5["Copies_Sold_Million"] * (gta5_price / 10)

gta5.to_csv(
    "data/processed/gta5_sales_processed.csv",
    index=False
)

print("✅ GTA V sales processed.")

# -----------------------------
# GTA VI Projection
# -----------------------------

gta6 = pd.read_csv("data/raw/gta6_projection.csv")

gta6["Expected_Revenue_INR_Crore"] = (
    gta6["Expected_Copies_Sold_Million"]
    * (gta6_price / 10)
)

gta6.to_csv(
    "data/processed/gta6_projection_processed.csv",
    index=False
)

print("✅ GTA VI projection processed.")

print("\nAll files processed successfully.")