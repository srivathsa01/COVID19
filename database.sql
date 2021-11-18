/*Task C.1*/

CREATE TABLE countries (
    location VARCHAR (255) PRIMARY KEY
                         NOT NULL
);
/* Vaccine Manufacturer Names */
CREATE TABLE manufacturers (
    vaccine VARCHAR (255) PRIMARY KEY
                        NOT NULL
);
/* Vaccination Statistics for Australia, Israel, France and the United States */
CREATE TABLE vacc_by_key_countries (
    date                    TEXT,
    location                VARCHAR (255),
    vaccine                 VARCHAR (255),
    people_vaccinated       INT,
    people_fully_vaccinated INT,
    total_boosters          INT,
    source_url              VARCHAR (255),
    FOREIGN KEY (location) REFERENCES countries (location),
    FOREIGN KEY (vaccine) REFERENCES manufacturers (vaccine),
    PRIMARY KEY (date, location, vaccine)
);
/* Country Population and Vaccination Manufacturers */
CREATE TABLE countries_vacc_info (
    location              VARCHAR (255),
    vaccine               VARCHAR (255),
    population            VARCHAR (255),
    last_observation_date TEXT,
    source_name           VARCHAR (255),
    source_website        VARCHAR (255),
    FOREIGN KEY (location) REFERENCES countries (location),
    FOREIGN KEY (vaccine) REFERENCES manufacturers (vaccine),
    PRIMARY KEY (location, vaccine)
);
/* Vaccination Stastics Sorted by Manufacturer by Country*/
CREATE TABLE vacc_by_manufacturer (
    date               TEXT,
    location           VARCHAR (255),
    vaccine            VARCHAR (255),
    total_vaccinations INT,
    FOREIGN KEY (location) REFERENCES countries (location),
    FOREIGN KEY (vaccine) REFERENCES manufacturers (vaccine),
    PRIMARY KEY (date, location, vaccine)
);
/* Vaccination Stastics for All Countries*/
CREATE TABLE vacc_by_all_countries (
    date                    TEXT,
    location                VARCHAR (255),
    people_vaccinated       INT,
    people_fully_vaccinated INT,
    daily_vaccinations_raw  INT,
    daily_vaccinations      INT,
    total_boosters          INT,
    FOREIGN KEY (location) REFERENCES countries (location),
    PRIMARY KEY (date, location)
);
/* Vaccination Stastics by Age Group by Country*/
CREATE TABLE vacc_by_age_group (
    date                                TEXT,
    age_group                           VARCHAR (255),
    location                            VARCHAR (255),
    people_vaccinated_per_hundred       REAL,
    people_fully_vaccinated_per_hundred REAL,
    FOREIGN KEY (location) REFERENCES countries (location)
    PRIMARY KEY (date, age_group, location)
);
/* Vaccination Stastics by state in the USA*/
CREATE TABLE vacc_by_us_states (
    date                    TEXT,
    states                  VARCHAR (255),
    total_distributed       INT,
    people_vaccinated       INT,
    people_fully_vaccinated INT,
    daily_vaccinations_raw  INT,
    daily_vaccinations      INT,
    PRIMARY KEY (date, states)
);