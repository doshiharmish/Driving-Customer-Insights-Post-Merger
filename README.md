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

## Data Integration Strategy Overview
In merging Fudgemart Inc. and Fudgeflix Inc., our data integration strategy involves employing Kimball's Bus Matrix and High-Level Dimensional Modeling. The Bus Matrix acts as a guide, detailing key business processes and dimensions for incorporation into the data warehouse. It aligns organizational goals with dimensional structures for efficient data integration. Concurrently, High-Level Dimensional Modeling represents data entities, emphasizing relationships between dimensions and facts. For a deeper understanding, please take a look at the attached Excel sheets showing the Bus Matrix and Dimensional Model as valuable references, providing insights into our data integration strategy.

## STAR Schema Overview

The STAR schema implemented in this data warehouse centers around a central fact table, **FactReviews**, seamlessly connecting with three vital dimension tables: **DimDate, DimCustomers, and DimProducts**.
- **FactReviews**: This table holds essential key performance indicators linked to customer reviews. It serves as the primary source for analyzing and evaluating customer feedback, providing crucial insights into product performance.
- **DimDate**: It captures temporal information, enabling analysis based on various time granularities such as day, week, month, quarter, and year. This dimension lays the groundwork for time-related insights, supporting trend analysis and seasonal patterns.
- **DimCustomers**: Designed to represent customer-related attributes, DimCustomers offers a comprehensive view of customer details.
- **DimProducts**: Serving as a repository for product-related information, DimProducts facilitates in-depth analysis of product performance and categorization.

  <img width="276" alt="MOLAP Screenshot - Copy" src="https://github.com/doshiharmish/Cross-Company-Insights/assets/16878994/13c01d14-a498-4fbb-8e0c-6545d2ad32aa">

## Extract-Transfer-Load (ETL) Pipeline Overview

![image](https://github.com/doshiharmish/Cross-Company-Insights/assets/16878994/33d02f87-4c3a-4dda-ab50-09fa77f3ba97)

To populate our data warehouse, we have implemented an ETL (Extract, Transform, Load) pipeline utilizing Microsoft SQL Server Integration Services (SSIS). The following steps outline our ETL process:
1. **DimCustomer:**
- Extracting data from the source to the staging table.
- Transformations:
    - Deriving the source column based on the data source.
    - Combining the First Name and Last Name into the "Name" column.
    - Replacing Null values with 'N/A'.
- Loading the transformed data into the dimension table.
2. **DimProduct:**
- Extracting data from the source to the staging table.
- Transformations:
    - Extracting only the Year from the date for Fudgemart data.
    - Deriving the source column based on the data source.
    - Replacing Null values with 'N/A'.
- Loading the transformed data into the dimension table.

3. **DimDate:**
- Extracting data without transformations and loading it directly into the dimension table.
4. **FactReviews:**
- Extracting data, converting product ID from number to string for Fudgemart data, and extracting Fudgeflix data as is to the staging table.
- Transformations:
    - Deriving the source column based on the data source.
    - Performing lookups and deriving date keys based on dates.
    - Performing lookups and deriving customer keys based on customer IDs.
    - Performing lookups and deriving product keys based on product IDs.
- Merging the transformed data and loading it into the fact table.

## Insights

![image](https://github.com/doshiharmish/Cross-Company-Insights/assets/16878994/b8309a3e-ffe4-4e58-acef-0c570fdb2adc)

### Insights for Overall Company (Merged)
-  The overall customer rating for the merged company is 2.30/5.
-  There is a notable decreasing trend in customer ratings from 2009 to 2013.
-  The highest-rated category was Houseware from 2009 to 2012, but it became the lowest-rated category in 2013.
-  Movies have the highest number of reviews, totaling 2172, while houseware has the lowest count with only 95 reviews.
-  The state of New York received the highest number of reviews with an average rating of 2.78.
-  The highest-rated product is  the Blu-Ray DVD Player with an exceptional rating of 4.14.

### Insights for Fudgemart
-  The company's overall rating for Fudgemart is 2.49.
-  The Clothing category receives the highest number of reviews.
-  The state of California has the highest number of reviews for Fudgemart, totaling 451.
-  New Jersey is the highest-rated state for Fudgemart.
  
### Insights for FudgeFlix
-  The company's overall rating for FudgeFlix is 2.22.
-  Movies receive the highest number of reviews for FudgeFlix.
-  The state of New York leads in the number of reviews for FudgeFlix, with 730 reviews.
-  Florida is the highest-rated state for FudgeFlix.


## Recommendations
- Introduce new products tailored to customer choice demographics to enhance market appeal.
- Enable cross-selling opportunities across diverse markets by leveraging customer data and implementing a unified single sign-on system.
- Encourage customer review submissions through incentivization for valuable feedback.
- Leverage customer reviews as insights to drive product development strategies.
- Foster innovations through the strategic implementation of technology.
- Prioritize focus on quality, pricing strategies, and harnessing competition for sustained market growth.

## Assumptions
- The data provided for both Fudgemart and FudgeFlix is accurate, complete, and representative of the actual customer reviews and product information.
- Customer feedback and ratings are reliable indicators of product satisfaction and market performance.
## Datasource
<br> <a href = 'https://github.com/mafudge/learn-databases'> Database Link </a>
