import yfinance as yf
import os

# Define sector-based tickers
sectors = {
    "tech_stocks": ["AAPL", "MSFT", "NVDA", "META", "AMZN"],
    "defense_stocks": ["LMT", "NOC", "RTX", "GD", "AVAV"],
    "etfs_general": ["VOOG", "SMH", "RING", "SCHA", "VIG", "SPY", "QQQ", "IWM", "IEFA", "EEM"],
    "etfs_sector": ["XLK", "XLF", "XLV", "XLE", "XLP", "XLU", "XLI", "XLB", "XLRE", "XLY"],
    "etfs_global": ["VGK", "EWJ", "FXI", "VWO", "IGF"],
    "etfs_commodities": ["GLD", "SLV", "USO", "DBA", "TIP"],
    "etfs_thematic": ["BOTZ", "HACK", "ICLN", "ARKG", "UFO"]
}

# Set date range
start_date = "2015-01-01"
end_date = "2025-01-01"

# Create folders and download data
for sector, tickers in sectors.items():
    os.makedirs(sector, exist_ok=True)
    print(f"\n📁 Downloading data for sector: {sector}")
    
    for ticker in tickers:
        try:
            print(f"⏳ Fetching {ticker}...")
            data = yf.download(ticker, start=start_date, end=end_date)
            file_path = os.path.join(sector, f"{ticker}.csv")
            data.to_csv(file_path)
            print(f"✅ Saved {ticker} to {file_path}")
        except Exception as e:
            print(f"❌ Failed to download {ticker}: {e}")