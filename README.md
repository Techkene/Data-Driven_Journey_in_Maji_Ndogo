# Data-Driven Journey in Maji Ndogo | SQL Data Exploration & Cleaning

A hands-on SQL project exploring water-service data from **Maji Ndogo**. This project demonstrates how SQL can be used to understand an unfamiliar database, investigate water access and quality records, identify data-quality issues, and apply carefully tested corrections.

The work focuses on turning raw operational data into more reliable information that can support analysis and a better understanding of water services.

## Project Overview

The analysis uses the `md_water_services` database. It begins with an exploration of the available tables and records, then moves into targeted queries on water sources, queue times, water-quality assessments, and well-pollution records.

A key part of the project is a data-cleaning exercise: identifying inconsistencies in the `well_pollution` table, testing proposed corrections on a copy, validating the results, and then applying the corrections to the original table.

## Project Objectives

- Understand the structure of the `md_water_services` database.
- Explore the records and fields available across key water-service tables.
- Identify the different types of water sources represented in the data.
- Investigate visits with exceptionally long queue times.
- Examine water-quality scores and well-pollution results.
- Detect inconsistent descriptions and pollution classifications.
- Test data corrections before applying them to the original table.

## Database Tables Explored

| Table | How it is used in the project |
|---|---|
| `location` | Previewing location records |
| `visits` | Exploring visits and identifying queue times above 500 minutes |
| `water_source` | Exploring records and identifying distinct water-source types |
| `data_dictionary` | Reviewing column definitions and descriptions |
| `water_quality` | Investigating subjective quality scores and repeat visits |
| `well_pollution` | Identifying and correcting inconsistent pollution descriptions and results |

## Analysis & Data-Cleaning Workflow

### 1. Database Exploration

- Listed the tables in the `md_water_services` database.
- Previewed records from `location`, `visits`, and `water_source`.
- Queried the data dictionary to understand the available columns.

### 2. Water-Source and Service Investigation

- Retrieved the distinct water-source types.
- Identified visits where `time_in_queue` exceeded 500 minutes.
- Queried water-quality records where the subjective quality score was 10 and the visit count was 2.

### 3. Well-Pollution Data-Quality Checks

The script investigated two types of inconsistencies:

- Descriptions that incorrectly included the word `Clean` before bacteria classifications, including *E. coli* and *Giardia Lamblia*.
- Records marked as `Clean` even though the `biological` value was greater than `0.01`.

### 4. Data Cleaning and Validation

To reduce the risk of changing the source data without checking the proposed fixes, the script:

1. Created a temporary copy named `well_pollution_copy`.
2. Applied the proposed description and result corrections to the copy.
3. Ran a validation query to check for the targeted inconsistencies.
4. Applied the same corrections to the original `well_pollution` table.
5. Dropped the temporary copy after the correction process.

## SQL Skills Demonstrated

- **Database Exploration:** `SHOW TABLES`, `SELECT`, and `LIMIT`
- **Data Filtering:** `WHERE`, `AND`, and comparison operators
- **Unique Values:** `DISTINCT`
- **Pattern Matching:** `LIKE`
- **Data Inspection:** Querying records and a data dictionary
- **Table Creation:** `CREATE TABLE ... AS SELECT`
- **Data Modification:** `UPDATE` and `SET`
- **Data Validation:** Checking records after proposed corrections
- **Table Management:** `DROP TABLE`

## Tools & Technologies

- SQL
- MySQL-style SQL syntax
- Database: `md_water_services`

## Repository Structure

```text
Maji-Ndogo-SQL-Project/
│
├── README.md
└── Data-Driven Journey in Maji Ndogo.sql
