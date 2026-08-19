-- Final Schema for SQLite
-- Generated for research paper management with inheritance for Publishers

-- 1. Table: Institutions
CREATE TABLE Institutions (
    inst_id INTEGER PRIMARY KEY AUTOINCREMENT,
    inst_name VARCHAR(33) NOT NULL,
    address VARCHAR(55) NOT NULL,
	years_existence integer
);

-- 2. Table: Authors
CREATE TABLE Authors (
    author_id INTEGER PRIMARY KEY AUTOINCREMENT,
    author_name VARCHAR(77) NOT NULL,
    email VARCHAR(66) NOT NULL,
    research_field VARCHAR(33),
    subfield VARCHAR(44),
    orcid CHARACTER(11),
    Institutions_inst_id INTEGER NOT NULL,
    CONSTRAINT Authors_Institutions FOREIGN KEY (Institutions_inst_id)
    REFERENCES Institutions (inst_id)
);

-- 3. Table: Themes
CREATE TABLE Themes (
    theme_id INTEGER PRIMARY KEY AUTOINCREMENT,
    theme_name VARCHAR(55) NOT NULL
);

-- 4. Table: Publishers (Parent table)
CREATE TABLE Publishers (
    publisher_id INTEGER PRIMARY KEY AUTOINCREMENT,
    publisher_name VARCHAR(44) NOT NULL,
    impact_factor DECIMAL(3,2) NOT NULL
);

-- 5. Table: Journals (Child of Publishers)
-- Note: publisher_id is PK but NOT autoincrement (inherits from Publishers)
CREATE TABLE Journals (
    publisher_id INTEGER PRIMARY KEY,
    issn CHARACTER(9) NOT NULL,
    year INTEGER,
    volume INTEGER,
    number INTEGER,
    CONSTRAINT Journals_Publishers FOREIGN KEY (publisher_id)
    REFERENCES Publishers (publisher_id) ON DELETE CASCADE
);

-- 6. Table: Conferences (Child of Publishers)
-- Note: publisher_id is PK but NOT autoincrement (inherits from Publishers)
CREATE TABLE Conferences (
    publisher_id INTEGER PRIMARY KEY,
    conf_title VARCHAR(100) NOT NULL,
    location VARCHAR(66),
    conf_date DATE,
    CONSTRAINT Conferences_Publishers FOREIGN KEY (publisher_id)
    REFERENCES Publishers (publisher_id) ON DELETE CASCADE
);

-- 7. Table: Papers
CREATE TABLE Papers (
    paper_id INTEGER PRIMARY KEY AUTOINCREMENT,
    title VARCHAR(77) NOT NULL,
    abstract CLOB NOT NULL,
    doi CHARACTER(11),
    link VARCHAR(22),
    word_count INTEGER NOT NULL,
    keywords JSON, -- Multi-value list (NULL allowed)
    Themes_theme_id INTEGER NOT NULL,
    Publishers_publisher_id INTEGER NOT NULL,
    CONSTRAINT Papers_Themes FOREIGN KEY (Themes_theme_id)
    REFERENCES Themes (theme_id),
    CONSTRAINT Papers_Publishers FOREIGN KEY (Publishers_publisher_id)
    REFERENCES Publishers (publisher_id)
);

-- 8. Table: Authors_Papers (Junction Table)
CREATE TABLE Authors_Papers (
    Authors_author_id INTEGER NOT NULL,
    Papers_paper_id INTEGER NOT NULL,
    CONSTRAINT Authors_Papers_pk PRIMARY KEY (Authors_author_id, Papers_paper_id),
    CONSTRAINT Authors_Papers_Authors FOREIGN KEY (Authors_author_id)
    REFERENCES Authors (author_id) ON DELETE CASCADE,
    CONSTRAINT Authors_Papers_Papers FOREIGN KEY (Papers_paper_id)
    REFERENCES Papers (paper_id) ON DELETE CASCADE
);

