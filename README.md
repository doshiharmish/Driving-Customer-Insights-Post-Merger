# Cross-Company-Insights: Unveiling Customer Sentiment in Fudgemart and Fudgeflix through a Unified Data Warehouse

## Project Goal
In merging Fudgemart Inc. and Fudgeflix Inc, we aim to derive actionable insights by consolidating customer feedback ratings into a unified data warehouse. We concentrate on assessing the performance of both organizations within a competitive market. Employing a combination of a Data warehouse using the Kimball approach and Power BI visualization, our aim is to comprehensively analyze each organization's performance and its collective impact. The resulting insights will inform strategic recommendations for performance enhancement, improved customer experience, and expanded market reach.

## Functional Goal
### 1.	General Customer Review
Business users should possess the capability to analyze customer reviews for diverse products and DVD rentals, considering distinct vendors, directors, and cast members. This functionality aims to identify creative talents resonating most with audiences, thereby informing strategic content acquisition strategies.
### 2.	Category Review
Empower business users to conduct a comprehensive analysis of customer reviews across all available product and DVD categories. This feature facilitates the comparison of customer satisfaction levels, unveiling potential cross-selling opportunities and providing valuable insights for product development decisions.
### 3.	Region Review
Enable users to analyze customer reviews based on geographic regions, revealing regional preferences, identifying potential service gaps, and uncovering opportunities for localized marketing campaigns. This functionality allows for the tracking of evolving customer sentiment and review patterns within each region, enabling proactive adjustments to offerings based on regional dynamics.
### 4.	Company Review
Provide a holistic view of customer reviews for both Fudgemart and Fudgeflix as a unified entity, facilitating an overall performance assessment. Users should be able to track changes in customer sentiment and review patterns pre and post-merger, evaluating the effectiveness of integration efforts and pinpointing areas for continuous improvement.
### 5.	Across Time Product/Title Review:
- Product/Title Evolution: Track customer reviews for products and titles across multiple seasons or release periods, identifying trends in quality, customer satisfaction, and audience engagement over time.
- Seasonal Insights: Enable users to analyze reviews for seasonal products or titles, offering insights into their performance during different seasons and informing decisions related to inventory management and marketing strategies.
- Longitudinal Analysis: Empower users to compare reviews for the same product or title across different periods. This functionality aids in identifying the impact of changes, updates, or marketing campaigns on customer perception, facilitating informed decision-making.

## Data Source Structure for Merger

The OLTP (Online Transaction Processing) system structure comprises tables from both Fudgemart and Fudgeflix. 
**FudgeMart**
![fudgemart-v3](https://github.com/doshiharmish/Cross-Company-Insights/assets/16878994/d10c6d22-a368-432d-8b4d-33609c7a9d8a)

**FudgeFlix**

![fudgeflix-v3](https://github.com/doshiharmish/Cross-Company-Insights/assets/16878994/f35d6c06-0609-493b-95ab-f2c1aa63c566)

The selected tables for integration are as follows:
- Tables from Fudgemart:
1.	fm_customers
2.	fm_products
3.	fm_customer_product_reviews

- Tables from Fudgeflix:
1.	ff_accounts
2.	ff_zipcodes
3.	ff_titles
4.	ff_account_titles



