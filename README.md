
## 📌 Project Overview
This project analyzes **10,000 digital marketing campaigns** conducted between **January 2025 and January 2026** across five advertising channels:

- Search
- Display
- Social
- Email
- Influencer

The objective is to evaluate campaign performance, identify the most and least efficient marketing channels, and recommend budget allocation strategies based on ROI and engagement metrics.


## 🎯 Business Objective
Determine which marketing channels deliver the highest return on investment (ROI) and identify opportunities to optimize advertising spend.


## 🛠️ Tools Used
- **MySQL** – Data validation and analysis
- **Google Sheets** – Dashboard creation and data visualization


## 📊 Data Validation
The dataset was validated using SQL before analysis.

Validation checks included:
- Total row count
- Data type verification
- Missing value detection
- Duplicate Campaign ID check
- Negative and invalid value detection
- Date validation
- Funnel logic validation (Leads ≤ Clicks, Conversions ≤ Leads)
- ROI formula verification
- Outlier detection

**Result:** ✅ All validation checks passed. No data cleaning was required.

## 📈 Key Insights

- **Search** delivered the highest average ROI (**1.013**) among all channels.
- **Social** recorded the lowest average ROI (**0.988**).
- CTR remained consistent across all channels (approximately **5.4–5.5%**).
- Overall ROI remained stable throughout the year, with slight declines in **September** and **November**.
- Underperforming channels changed from month to month, indicating execution-related issues rather than consistently poor channel performance.
- Higher CTR generally aligned with higher ROI, with Search and Email outperforming other channels.

---

## 💡 Recommendations

- Reallocate **5–10%** of advertising budget from **Social** to **Search**.
- Monitor ROI at the **monthly channel level** instead of relying solely on annual performance reviews.
- Investigate monthly performance drops to improve campaign execution.


- Business Recommendations
