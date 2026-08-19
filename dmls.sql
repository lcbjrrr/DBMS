-- 1. Institutions
INSERT INTO Institutions (inst_id,inst_name, address, years_existence) VALUES 
(1,'MIT', 'Cambridge, MA',55),
(2,'Stanford University', 'Stanford, CA',11),
(3,'Oxford University', 'Oxford, UK',22),
(4,'ETH Zurich', 'Zurich, Switzerland',33),
(5,'University of Tokyo', 'Tokyo, Japan',44);
-- Adding 10 more Institutions (No authors assigned)
INSERT INTO Institutions (inst_id,inst_name, address,years_existence) VALUES 
(6,'Harvard University', 'Cambridge, MA',22),
(7,'California Institute of Technology', 'Pasadena, CA',22),
(8,'Carnegie Mellon University', 'Pittsburgh, PA',22),
(9,'University of Toronto', 'Toronto, Canada',22),
(10,'Tsinghua University', 'Beijing, China',22),
(11,'Max Planck Institute', 'Munich, Germany',22),
(12,'National University of Singapore', 'Singapore',22),
(13,'University of Melbourne', 'Melbourne, Australia',22),
(14,'Sorbonne University', 'Paris, France',22),
(15,'IIT Bombay', 'Mumbai, India',22);

-- 2. Authors
INSERT INTO Authors (author_id, author_name, email, research_field, subfield, orcid, Institutions_inst_id) VALUES 
(1,'Alice Smith', 'alice@mit.edu', 'Computer Science', 'AI', '0000-0001-2', 1),
(2,'Bob Jones', 'bjones@stanford.edu', 'Physics', 'Quantum', '0000-0002-3', 2),
(3,'Charlie Brown', 'cb@oxford.ac.uk', 'Medicine', 'Genetics', '0000-0002-4',3),
(4,'Dana White', 'dana.w@ethz.ch', 'Computer Science', 'Data Science', '0000-0004-5', 4),
(5,'Eve Sato', 'esato@u-tokyo.jp', 'Engineering', 'Robotics', '0000-0005-6', 5);
INSERT INTO Authors (author_id,author_name, email,    Institutions_inst_id) VALUES   (6,'Luiz', 'luiz@oxford.ac.uk',  3);

-- 3. Themes
INSERT INTO Themes (theme_id,theme_name) VALUES 
(1,'Machine Learning'),
(2,'Theoretical Physics'),
(3,'Molecular Biology'),
(4,'Cybersecurity'),
(5,'Renewable Energy');

-- 4. Publishers (General records for Journals and Conferences)
INSERT INTO Publishers (publisher_id, publisher_name, impact_factor) VALUES 
(1,'Nature Publishing', 42.77), -- ID 1
(2,'IEEE', 10.50),            -- ID 2
(3,'ACM', 8.20),             -- ID 3
(4,'Springer', 5.40),         -- ID 4
(5,'Elsevier', 6.10),         -- ID 5
(6,'NeurIPS Foundation', 15.00), -- ID 6 (Conference)
(7,'O''Reilly Media', 2.10);    -- ID 7 (Conference)

-- 5. Journals (Child records - IDs must match Publishers)
INSERT INTO Journals (publisher_id, issn, year, volume, number) VALUES 
(1, '1476-4687', 2024, 625, 7995),
(2, '0018-9219', 2023, 111, 5),
(3, '0001-0782', 2024, 67, 2),
(4, '0028-0836', 2022, 50, 12),
(5, '0022-2836', 2023, 435, 10);

-- 6. Conferences (Child records - IDs must match Publishers)
INSERT INTO Conferences (publisher_id, conf_title, location, conf_date) VALUES 
(6, 'Conference on Neural Information Processing Systems', 'Vancouver, BC', '2024-12-08'),
(7, 'Velocity Conference', 'Berlin, Germany', '2024-06-15');

-- 7. Papers (Keywords stored as JSON strings)
INSERT INTO Papers (paper_id, title, abstract, doi, link, word_count, keywords, Themes_theme_id, Publishers_publisher_id) VALUES 
(1,'Deep Learning in Health', 'A study on AI in hospitals...', '10.1001/abc', 'link.com/1', 4500, '["AI", "Health", "Deep Learning"]', 1, 1),
(2,'Quantum States 101', 'Exploring the basics of qubits...', '10.1002/xyz', 'link.com/2', 3200, '["Physics", "Quantum"]', 2, 2),
(3,'CRISPR Gene Editing', 'New methods for DNA repair...', '10.1003/def', 'link.com/3', 5100, '["Biology", "DNA"]', 3, 3),
(4,'Security in IoT', 'Protecting connected devices...', '10.1004/ghi', 'link.com/4', 2800, '["Security", "IoT"]', 4, 4),
(5,'Solar Cell Efficiency', 'Advancements in PV tech...', '10.1005/jkl', 'link.com/5', 3900, NULL, 5, 5),
(6,'Large Language Models', 'Training scaling laws...', '10.1006/mno', 'link.com/6', 6000, '["LLM", "Transformers"]', 1, 6);

-- 8. Authors_Papers (Junction)
INSERT INTO Authors_Papers (Authors_author_id, Papers_paper_id) VALUES 
(1, 1), -- Alice on Paper 1
(4, 1), -- Dana also on Paper 1 (Co-author)
(2, 2), -- Bob on Paper 2
(3, 3), -- Charlie on Paper 3
(4, 4), -- Dana on Paper 4
(5, 5), -- Eve on Paper 5
(1, 6); -- Alice on Paper 6

