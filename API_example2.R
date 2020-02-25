library(httr)
library(jsonlite)
library(tidyverse)

url <- "https://educationdata.urban.org/api/v1/college-university/ipeds/student-faculty-ratio/2017/"

sfr_json <- GET(url = url, 
                user_agent("Georgetown Univ, Student (nbateman@brookings.edu"))

http_status(sfr_json)

#get the contents of the response as a text string
sfr_json <- content(sfr_json, as = "text") # create a character matrix from the JSON
sfr_data <-fromJSON(sfr_json)$results


#Example pulling data only for DC

urlDC <- "https://educationdata.urban.org/api/v1/college-university/ipeds/student-faculty-ratio/2017?fips=11"

sfrDC_json <- GET(url = urlDC, 
                user_agent("Georgetown Univ, Student (nbateman@brookings.edu"))

http_status(sfrDC_json)

#get the contents of the response as a text string
sfrDC_json <- content(sfrDC_json, as = "text") # create a character matrix from the JSON
sfrDC_data <-fromJSON(sfrDC_json)$results