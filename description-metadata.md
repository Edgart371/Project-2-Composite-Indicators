<img src="https://bit.ly/2VnXWr2" alt="Ironhack Logo" width="100"/>

# Project 2 - Composite Indicators - Data Sources & Metadata

*Ferdi / Edgar / Natan*
*[DA, Paris & 05/22]*

## Data Sources

 "The connections set up to a database from a server"
 
 The data was compiled by the World Bank (https://data.worldbank.org/indicator/) and is comprised from several sources listed below.
 We scraped it in CSV files after connection an API to the World Bank Database using Python and the Pandas, Matplotlib & Wbgapi wrappers.
 The CSV files were then processed and analysed in SQL so as to create a composite indicator.

- Research and development expenditure (% of GDP)
    UNESCO Institute for Statistics (https://data.worldbank.org/indicator/GB.XPD.RSDV.GD.ZS)
- High-technology exports (% of manufactured exports)
    United Nations, Comtrade database through the WITS platform (https://data.worldbank.org/indicator/TX.VAL.TECH.MF.ZS)
- Scientific and technical journal articles
    National Science Foundation, Science and Engineering Indicators (https://data.worldbank.org/indicator/IP.JRN.ARTC.SC)
- Patent applications, residents
    World Intellectual Property Organization (WIPO), WIPO Patent Report: Statistics on Worldwide Patent Activity
    (https://data.worldbank.org/indicator/IP.PAT.RESD)
- Patent applications, nonresidents
    World Intellectual Property Organization (WIPO), WIPO Patent Report: Statistics on Worldwide Patent Activity
    (https://data.worldbank.org/indicator/IP.PAT.NRES)
  
## MetaData

  "A description of the scope and significance of the data at hand"

|                       Data                            |              Description                                                                                              | 
| :----------------------------------------------------:|:---------------------------------------------------------------------------------------------------------------------:| 
| Data Source                                           | File name of the data source                                                                                          | 
| ESP (CountryID)                                       | Identification code of a given country, Formatted as XXX                                                              |  
| YEXXXX (Year)                                         | Yearly data between 2014 - 2018, Formatted as YEXXXX                                                                  | 
| :----------------------------------------------------:|:---------------------------------------------------------------------------------------------------------------------:| 
| Research and development expenditure (% of GDP)       | All expenditures for R&D within the business enterprise sector (BERD) on the national territory during a given period | 
| High-technology exports (% of manufactured exports)   | Products with high R&D intensity as a % of manufactured goods exports                                                 | 
| Scientific and technical journal articles (#)         | Number of scientific & engineering articles published in the following fields: physics, biology, chemistry, mathematics, clinical medicine, biomedical|  
| Patent applications, residents (#)                    | For which the first-named applicant or assignee is a resident of the state concerned                                  | 
| Patent applications, nonresidents (#)                 | Patents granted on the basis of a non-resident application                                                            | 

## Additional Links

[Repository](https://github.com/Edgart371/Project2)  
[Jira](https://edgartome.atlassian.net/jira/software/projects/P2S/boards/2/roadmap)
