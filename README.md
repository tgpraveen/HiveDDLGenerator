# HiveDDLGenerator
Given a text/CSV data file with headers, this will automatically generate the corresponding CREATE and LOAD commands to load the file into Hive.

Example of using the bash script:

./HiveDDLGenerator.sh DELIMITER_CHAR "INPUT_FILE.csv" > HIVE_STATEMENTS_OUTPUT_FILE.txt
./HiveDDLGenerator.sh , "Data_File.csv" > hive_statements_for_Data_File.txt
