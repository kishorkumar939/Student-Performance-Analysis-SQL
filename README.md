# Student Performance Tracking System (MySQL)

## 📋 Project Overview
This project manages and analyzes the academic performance of **60 students** over a **5-year period** (2021–2025), totaling **300 records**.

## 🗂️ Files in this Repository
- **`table_setup.sql`**: Contains the `CREATE TABLE` schema with a composite primary key.
- **`insert_data.sql`**: Contains all **300 student records** populated via `INSERT INTO` statements.
- **`analysis_queries.sql`**: Includes analytical reports like yearly toppers, subject-wise averages, and individual history tracking.

## 🚀 How to Run
1. Execute `table_setup.sql` to build the database structure.
2. Execute `insert_data.sql` to load the data.
3. Use `analysis_queries.sql` to generate insights.

## 📊 Key Insights Tracked
- **Individual History:** 5-year academic journey of specific students.
- **Aggregated Stats:** Average scores of passing students and class-wise performance.
- **Performance Ranking:** Identification of yearly toppers and the "Gold Medalist."
- **At-Risk Students:** Tracking students with persistent failure trends.
