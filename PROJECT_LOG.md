## 2026-07-03

Goal:
Initialize the project

Completed:
- Repository setup
- The initial research design
- Research sub-questions for phase 1 and 2

Next:
- Re-read article on street names
- Import OSM data

## 2026-07-06 & 2026-07-07

Goals: 
- Re-read article on street names
- Import OSM data

Decisions made:
- Docker for postgis
- osm2pgsql installed on wsl
- python will be used globally installed in wsl also

Completed:
- Design of project architecture
- Re-read the article
- Download Turkey Geofabrik extract (607 MB)
- Enable hstore extension
- Import using osm2pgsql (in 4m25s)

Next:
- Explore schema
- Identify Istanbul boundary
- Extract named streets

## 2026-07-09

Goal:
Ask and answer exploration questions

### Questions for exploration of the dataset

#### Dataset overview

- What is the size and structure of the imported OSM dataset?
- Which tables were created by osm2pgsql? 
- What is the size of each table? 

#### Data model
- Which imported table best represents street features for this research?
- What information is available for street features? 
- What attributes are available in each of the main tables? 
- Can all required information be obtained from a single table? If not, where is the missing information stored? 

#### Feature representation

- What uniquely identifies a feature? 
- Can a single street be represented by multiple OSM line features?
- Can several features have the same name? 
- What kind of details are there?

#### Preparing the research dataset  

- How to approach filtering the roads/streets of istanbul to create a smaller dataset?
- Which street types should be included in the analysish? 
- Are street names standardized? 

Completed:
- Questions answered
- Queries saved in .sql files
- Explore schema
- Identify Istanbul boundary
- Create and initial view od roads in Istanbul
- Data visually checked in QGIS

Next:
- Extract named streets