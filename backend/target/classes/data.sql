-- This file seeds 20 sample questions into the database on startup.
-- Spring Boot runs this automatically if spring.jpa.hibernate.ddl-auto=create or create-drop

INSERT INTO question (question, option_a, option_b, option_c, option_d, correct_answer) VALUES
('What does OOP stand for?', 'Object Oriented Programming', 'Open Object Protocol', 'Object Operator Process', 'Online Object Programming', 'A'),
('Which data structure uses LIFO (Last In First Out)?', 'Queue', 'Stack', 'Array', 'Linked List', 'B'),
('What is the time complexity of binary search?', 'O(n)', 'O(n²)', 'O(log n)', 'O(1)', 'C'),
('Which keyword is used to inherit a class in Java?', 'implements', 'extends', 'inherits', 'super', 'B'),
('What does SQL stand for?', 'Structured Query Language', 'Simple Query Language', 'Standard Question Language', 'Sequential Query Language', 'A'),
('Which HTTP method is used to send data to a server?', 'GET', 'DELETE', 'POST', 'PATCH', 'C'),
('What is the default port for HTTP?', '443', '8080', '21', '80', 'D'),
('Which of these is NOT a primitive data type in Java?', 'int', 'boolean', 'String', 'char', 'C'),
('What does REST stand for?', 'Representational State Transfer', 'Remote Execution Standard Transfer', 'Relational State Technology', 'Resource Exchange Standard Transfer', 'A'),
('Which sorting algorithm has the best average-case time complexity?', 'Bubble Sort', 'Merge Sort', 'Insertion Sort', 'Selection Sort', 'B'),
('What is a primary key in a database?', 'A key that encrypts data', 'A unique identifier for each record', 'A foreign reference to another table', 'An index for fast search', 'B'),
('Which layer of OSI model handles routing?', 'Data Link Layer', 'Transport Layer', 'Network Layer', 'Session Layer', 'C'),
('What does JVM stand for?', 'Java Virtual Machine', 'Java Variable Manager', 'Java Version Module', 'Java Verified Memory', 'A'),
('Which of these is an example of a NoSQL database?', 'MySQL', 'PostgreSQL', 'MongoDB', 'Oracle', 'C'),
('What is polymorphism in OOP?', 'A class with no methods', 'Ability of a variable to hold multiple types', 'Hiding internal implementation', 'One interface, multiple implementations', 'D'),
('Which operator is used to access the value at a pointer address in C?', '&', '#', '*', '@', 'C'),
('What is the output of 5 % 2 in most programming languages?', '2', '0', '2.5', '1', 'D'),
('Which protocol is used for secure web communication?', 'HTTP', 'FTP', 'HTTPS', 'SMTP', 'C'),
('What is encapsulation in OOP?', 'Hiding data and exposing only what is needed', 'Running multiple threads simultaneously', 'Inheriting properties from a parent class', 'Allocating memory dynamically', 'A'),
('In a linked list, what does the last node point to?', 'The first node', 'Itself', 'NULL', 'The previous node', 'C');
