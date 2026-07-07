import os
import sys
import subprocess

# Dynamically add the parent directory (project root) to sys.path
script_dir = os.path.dirname(os.path.abspath(__file__))
project_root = os.path.dirname(script_dir)
if project_root not in sys.path:
    sys.path.insert(0, project_root)

from Python.utils.logger import logger

def run_all_scripts():
    logger.info("Starting master data processing pipeline from project root...")
    
    # Prepare environment variables with PYTHONPATH and UTF-8 encoding
    env = dict(os.environ)
    env["PYTHONPATH"] = project_root
    env["PYTHONIOENCODING"] = "utf-8"
    
    try:
        # Run sales processor
        logger.info("Running Python/scraping/sales_scraper.py...")
        subprocess.run([sys.executable, "Python/scraping/sales_scraper.py"], check=True, env=env)
        
        # Run youtube cleaner
        logger.info("Running Python/cleaning/youtube_cleaner.py...")
        subprocess.run([sys.executable, "Python/cleaning/youtube_cleaner.py"], check=True, env=env)
        
        # Run country sales processor
        logger.info("Running Python/country_sales_processor.py...")
        subprocess.run([sys.executable, "Python/country_sales_processor.py"], check=True, env=env)
        
        # Run budget and preorders processor
        logger.info("Running Python/cleaning/budget_preorder_processor.py...")
        subprocess.run([sys.executable, "Python/cleaning/budget_preorder_processor.py"], check=True, env=env)
        
        print("\n[SUCCESS] Master pipeline execution finished successfully! All processed files are ready.")
    except Exception as e:
        logger.error(f"Error executing pipeline: {e}")
        sys.exit(1)

if __name__ == "__main__":
    # Ensure we run from the project root, where data/ directory exists
    if os.path.basename(os.getcwd()) == "Python":
        os.chdir("..")
        
    run_all_scripts()
