-- Getting to know our data
-- showing all the table in md_water_services DB
SHOW TABLES;

-- look at the first five row in the location table 
SELECT *
FROM location
LIMIT 5;

-- look at the first five row in the visits table
SELECT *
FROM visits
LIMIT 5;

-- look at the first five row in the water_source table
SELECT *
FROM water_source
LIMIT 5;

-- querying the data dictionary table to get an explanation of each column 
SELECT *
FROM data_dictionary;

-- Diving into the water sources
-- a query to find the unique type of water sources.
SELECT DISTINCT type_of_water_source
FROM water_source;

-- A SQL query that retrieves all records from this table where the time_in_queue is more than some crazy time, say 500 min. How
-- would it feel to queue 8 hours for water.
SELECT *
FROM visits
WHERE time_in_queue > 500;

--  table that contains a quality score for each visit made
-- about a water source that was assigned by a Field surveyor
SELECT *
FROM water_quality;

-- a query to find records where the subject_quality_score is 10-- only looking for home taps-- and where the source
-- was visited a second time.
SELECT *
FROM water_quality
WHERE subjective_quality_score = 10
AND visit_count = 2;

-- a query that checks if the results is Clean but the biological column is > 0.01 in the well pollution table
SELECT *
FROM well_pollution
WHERE biological > 0.01
AND results = "clean";

-- query to identify the records that mistakenly have the word Clean in the description
SELECT *
FROM well_pollution
WHERE description 
LIKE "clean %";

-- A query that correct the data entry issues in the well_pollution table
-- Case 1a: Update descriptions that mistakenly mention
-- `Clean Bacteria: E. coli` to `Bacteria: E. coli`
-- Case 1b: Update the descriptions that mistakenly mention
-- `Clean Bacteria: Giardia Lamblia` to `Bacteria: Giardia Lamblia
-- Case 2: Update the `result` to `Contaminated: Biological` where
-- biological` is greater than 0.01 plus current results is `Clean`

-- Lets make a copy of the well pollution first
CREATE TABLE md_water_services.well_pollution_copy
AS (
SELECT *
FROM md_water_services.well_pollution
);

UPDATE
well_pollution_copy
SET
description = 'Bacteria: E. coli'
WHERE
description = 'Clean Bacteria: E. coli';

UPDATE
well_pollution_copy
SET
description = 'Bacteria: Giardia Lamblia'
WHERE
description = 'Clean Bacteria: Giardia Lamblia';

UPDATE
well_pollution_copy
SET
results = 'Contaminated: Biological'
WHERE
biological > 0.01 AND results = 'Clean';
-- Put a test query here to make sure we fixed the errors.
-- Use the query we used to show all of the erroneous rows

-- checking if our errors are fixed using a SELECT query on the well_pollution_copy table:
SELECT *
FROM well_pollution_copy
WHERE
description LIKE "Clean_%"
OR (results = "Clean" AND biological > 0.01);

-- implementing the change in the well pollution table
UPDATE
well_pollution
SET
description = 'Bacteria: E. coli'
WHERE
description = 'Clean Bacteria: E. coli';

UPDATE
well_pollution
SET
description = 'Bacteria: Giardia Lamblia'
WHERE
description = 'Clean Bacteria: Giardia Lamblia';

UPDATE
well_pollution
SET
results = 'Contaminated: Biological'
WHERE
biological > 0.01 AND results = 'Clean';

-- deleting the copy table
DROP TABLE md_water_services.well_pollution_copy;