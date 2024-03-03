


-- Create table in Hadoop using hiveQL
CREATE TABLE flight_delays(
    Id INT,
    Year INT,
    Month INT,
    DayofMonth INT,
    DayOfWeek INT,
    DepTime INT,
    CRSDepTime INT,
    ArrTime INT,
    CRSArrTime INT,
    UniqueCarrier STRING,
    FlightNum INT,
    TailNum STRING,
    ActualElapsedTime INT,
    CRSElapsedTime INT,
    AirTime INT,
    ArrDelay DOUBLE,
    DepDelay DOUBLE,
    Origin STRING,
    Dest STRING,
    Distance INT,
    TaxiIn INT,
    TaxiOut INT,
    Cancelled INT,
    CancellationCode STRING,
    Diverted DOUBLE,
    CarrierDelay INT,
    WeatherDelay INT,
    NASDelay INT,
    SecurityDelay INT,
    LateAircraftDelay INT
) ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' LOCATION 's3://airline-delay-sewwandie/hadoopSession/';  LOAD DATA INPATH 's3://airline-delay-sewwandie/input/DelayedFlights-updated.csv' OVERWRITE INTO TABLE flight_delays;   

-- Year wise Carrier delay from 2003-2010
SELECT Year, avg((CarrierDelay/ArrDelay)*100) as Year_wise_carrier_delay from flight_delays GROUP BY Year ORDER BY Year DESC;  

-- Year wise NAS delay from 2003-2010
SELECT Year, avg((NASDelay/ArrDelay)*100) as Year_wise_NAS_delay from flight_delays GROUP BY Year ORDER BY Year DESC;

-- Year wise Weather delay from 2003-2010
SELECT Year, avg((WeatherDelay/ArrDelay)*100) as Year_wise_Weather_delay from flight_delays GROUP BY Year ORDER BY Year DESC;

-- Year wise late aircraft delay from 2003-2010
SELECT Year, avg((LateAircraftDelay/ArrDelay)*100) as Year_wise_late_aircraft_delay from flight_delays GROUP BY Year ORDER BY Year DESC;

-- Year wise security delay from 2003-2010
SELECT Year, avg((SecurityDelay/ArrDelay)*100) as Year_wise_security_delay from flight_delays GROUP BY Year ORDER BY Year DESC;

