-- This file seeds sample questions into the database on startup.
-- Spring Boot runs this automatically if spring.jpa.hibernate.ddl-auto=create or create-drop

INSERT INTO question (question, option_a, option_b, option_c, option_d, correct_answer,category) VALUES
-- ============================================================
-- OOP - 24 QUESTIONS
-- ============================================================

('What is encapsulation in OOP?', 'Hiding data and exposing only what is needed', 'Running multiple threads simultaneously', 'Inheriting properties from a parent class', 'Allocating memory dynamically', 'A', 'OOP'),
('What is polymorphism in OOP?', 'A class with no methods', 'Ability of a variable to hold multiple types', 'Hiding internal implementation', 'One interface, multiple implementations', 'D', 'OOP'),
('Which keyword is used to inherit a class in Java?', 'implements', 'extends', 'inherits', 'super', 'B', 'OOP'),
('What does OOP stand for?', 'Object Oriented Programming', 'Open Object Protocol', 'Object Operator Process', 'Online Object Programming', 'A', 'OOP'),
('Which OOP concept allows a class to acquire properties of another class?', 'Encapsulation', 'Inheritance', 'Polymorphism', 'Abstraction', 'B', 'OOP'),
('Which OOP principle combines data and methods inside a single unit?', 'Inheritance', 'Polymorphism', 'Encapsulation', 'Abstraction', 'C', 'OOP'),
('Which keyword refers to the current object in Java?', 'super', 'this', 'self', 'current', 'B', 'OOP'),
('Which keyword is used to call a parent class constructor in Java?', 'this', 'parent', 'super', 'base', 'C', 'OOP'),
('What is method overloading?', 'Defining multiple classes with the same name', 'Defining methods with the same name but different parameters', 'Overriding a parent method', 'Hiding a method', 'B', 'OOP'),
('What is method overriding?', 'Creating multiple constructors', 'Changing variable visibility', 'Providing a subclass implementation of a parent method', 'Creating a static method', 'C', 'OOP'),
('Which concept hides complex implementation details from the user?', 'Inheritance', 'Abstraction', 'Overloading', 'Composition', 'B', 'OOP'),
('Which type of class cannot be instantiated directly in Java?', 'Final class', 'Static class', 'Abstract class', 'Public class', 'C', 'OOP'),
('Which relationship represents a strong whole-part relationship?', 'Association', 'Aggregation', 'Composition', 'Inheritance', 'C', 'OOP'),
('Which access modifier provides the widest access in Java?', 'private', 'protected', 'default', 'public', 'D', 'OOP'),
('Can a Java class directly extend multiple classes?', 'Yes', 'No', 'Only if classes are abstract', 'Only if classes are final', 'B', 'OOP'),
('Which feature allows one interface to have different implementations?', 'Encapsulation', 'Inheritance', 'Polymorphism', 'Compilation', 'C', 'OOP'),
('Which keyword prevents a Java class from being inherited?', 'static', 'abstract', 'final', 'private', 'C', 'OOP'),
('What is a constructor primarily used for?', 'Destroying objects', 'Initializing objects', 'Overriding methods', 'Hiding variables', 'B', 'OOP'),
('Which principle states that implementation details should be hidden?', 'Encapsulation', 'Inheritance', 'Polymorphism', 'Coupling', 'A', 'OOP'),
('What is an interface mainly used to define?', 'Object memory', 'A contract of methods', 'Database records', 'Private variables only', 'B', 'OOP'),
('Which relationship describes a general connection between objects?', 'Association', 'Compilation', 'Inheritance', 'Instantiation', 'A', 'OOP'),
('What is dynamic method dispatch associated with?', 'Compile-time polymorphism', 'Runtime polymorphism', 'Encapsulation', 'Data hiding', 'B', 'OOP'),
('Which SOLID principle states that a class should have one reason to change?', 'Open-Closed Principle', 'Single Responsibility Principle', 'Liskov Substitution Principle', 'Dependency Inversion Principle', 'B', 'OOP'),
('Which SOLID principle says software entities should be open for extension but closed for modification?', 'Single Responsibility Principle', 'Open-Closed Principle', 'Interface Segregation Principle', 'Dependency Inversion Principle', 'B', 'OOP'),

-- ============================================================
-- DATA STRUCTURES - 22 QUESTIONS
-- ============================================================

('In a linked list, what does the last node point to?', 'The first node', 'Itself', 'NULL', 'The previous node', 'C', 'Data Structures'),
('Which data structure uses LIFO (Last In First Out)?', 'Queue', 'Stack', 'Array', 'Linked List', 'B', 'Data Structures'),
('Which data structure follows FIFO ordering?', 'Stack', 'Queue', 'Tree', 'Graph', 'B', 'Data Structures'),
('Which data structure is commonly used to implement recursion?', 'Queue', 'Stack', 'Heap', 'Graph', 'B', 'Data Structures'),
('What is the average search time in a well-designed hash table?', 'O(n)', 'O(log n)', 'O(1)', 'O(n log n)', 'C', 'Data Structures'),
('Which data structure stores elements in contiguous memory locations?', 'Linked List', 'Array', 'Tree', 'Graph', 'B', 'Data Structures'),
('Which data structure is best suited for representing hierarchical data?', 'Stack', 'Queue', 'Tree', 'Array', 'C', 'Data Structures'),
('In a binary tree, what is the maximum number of children a node can have?', '1', '2', '3', 'Unlimited', 'B', 'Data Structures'),
('Which traversal visits the left subtree, root, and right subtree?', 'Preorder', 'Inorder', 'Postorder', 'Level order', 'B', 'Data Structures'),
('Which traversal visits the root before its subtrees?', 'Inorder', 'Postorder', 'Preorder', 'Level order', 'C', 'Data Structures'),
('Which data structure is commonly used for breadth-first search?', 'Stack', 'Queue', 'Heap', 'Hash table', 'B', 'Data Structures'),
('Which data structure is commonly used for depth-first search?', 'Queue', 'Stack', 'Array only', 'Hash table', 'B', 'Data Structures'),
('What is the worst-case search time in a singly linked list?', 'O(1)', 'O(log n)', 'O(n)', 'O(n log n)', 'C', 'Data Structures'),
('Which data structure allows insertion and deletion from both ends?', 'Deque', 'Stack', 'Heap', 'Binary tree', 'A', 'Data Structures'),
('What is the root of a tree?', 'The deepest node', 'A node with no parent', 'A node with no children', 'The last inserted node', 'B', 'Data Structures'),
('Which tree maintains a balance condition based on subtree heights?', 'Binary Search Tree', 'AVL Tree', 'Expression Tree', 'Trie', 'B', 'Data Structures'),
('What is the balance factor of an AVL tree node?', 'Left height plus right height', 'Left height minus right height', 'Number of children', 'Tree depth', 'B', 'Data Structures'),
('Which data structure is particularly useful for implementing priority queues?', 'Heap', 'Stack', 'Linked List', 'Trie', 'A', 'Data Structures'),
('Which structure is used to efficiently store strings based on prefixes?', 'Heap', 'Trie', 'Stack', 'Graph', 'B', 'Data Structures'),
('What is a leaf node in a tree?', 'A node with two children', 'A node with no children', 'The root node', 'A node with one parent and one child', 'B', 'Data Structures'),
('Which data structure represents connections between entities?', 'Array', 'Graph', 'Stack', 'Queue', 'B', 'Data Structures'),
('What is the time complexity of accessing an array element by index?', 'O(n)', 'O(log n)', 'O(1)', 'O(n log n)', 'C', 'Data Structures'),

-- ============================================================
-- ALGORITHMS - 22 QUESTIONS
-- ============================================================

('Which sorting algorithm has the best average-case time complexity?', 'Bubble Sort', 'Merge Sort', 'Insertion Sort', 'Selection Sort', 'B', 'Algorithms'),
('What is the time complexity of binary search?', 'O(n)', 'O(n²)', 'O(log n)', 'O(1)', 'C', 'Algorithms'),
('Which algorithm repeatedly selects the smallest remaining element?', 'Merge Sort', 'Selection Sort', 'Quick Sort', 'Binary Search', 'B', 'Algorithms'),
('What is the worst-case time complexity of Quick Sort?', 'O(log n)', 'O(n)', 'O(n log n)', 'O(n²)', 'D', 'Algorithms'),
('What is the average-case time complexity of Quick Sort?', 'O(n²)', 'O(n log n)', 'O(log n)', 'O(1)', 'B', 'Algorithms'),
('Which sorting algorithm divides the array and merges sorted portions?', 'Bubble Sort', 'Merge Sort', 'Selection Sort', 'Linear Search', 'B', 'Algorithms'),
('What is the worst-case time complexity of Merge Sort?', 'O(n)', 'O(log n)', 'O(n log n)', 'O(n²)', 'C', 'Algorithms'),
('Which search algorithm checks elements sequentially?', 'Binary Search', 'Linear Search', 'Hash Search', 'Jump Search', 'B', 'Algorithms'),
('Binary search requires the input data to be what?', 'Random', 'Sorted', 'Duplicated', 'Hashed', 'B', 'Algorithms'),
('Which algorithm finds the shortest path from a source in a graph with non-negative edge weights?', 'DFS', 'Dijkstra', 'Kruskal', 'Binary Search', 'B', 'Algorithms'),
('Which algorithm is commonly used to find a minimum spanning tree?', 'Kruskal', 'Binary Search', 'KMP', 'Floyd-Warshall', 'A', 'Algorithms'),
('Which algorithm can find all-pairs shortest paths?', 'Dijkstra only', 'Floyd-Warshall', 'Binary Search', 'DFS', 'B', 'Algorithms'),
('What technique solves a problem by breaking it into overlapping subproblems?', 'Greedy method', 'Dynamic programming', 'Backtracking only', 'Hashing', 'B', 'Algorithms'),
('Which technique chooses the locally optimal option at each step?', 'Dynamic programming', 'Greedy algorithm', 'Divide and conquer', 'Recursion only', 'B', 'Algorithms'),
('Merge Sort is an example of which design technique?', 'Greedy', 'Divide and conquer', 'Dynamic programming', 'Backtracking', 'B', 'Algorithms'),
('What is the main goal of Big-O notation?', 'Measure exact execution time', 'Describe asymptotic growth rate', 'Measure memory size only', 'Count programming languages', 'B', 'Algorithms'),
('Which algorithm is commonly used to detect cycles in an undirected graph?', 'DFS', 'Binary Search', 'Merge Sort', 'Counting Sort', 'A', 'Algorithms'),
('Which algorithm is useful for pattern matching in strings?', 'KMP', 'Dijkstra', 'Kruskal', 'Prim', 'A', 'Algorithms'),
('Which algorithm uses a prefix function for efficient string matching?', 'KMP', 'DFS', 'Heap Sort', 'Dijkstra', 'A', 'Algorithms'),
('What is the time complexity of traversing all elements of an array?', 'O(1)', 'O(log n)', 'O(n)', 'O(n²)', 'C', 'Algorithms'),
('Which sorting algorithm repeatedly swaps adjacent elements when they are out of order?', 'Bubble Sort', 'Merge Sort', 'Heap Sort', 'Radix Sort', 'A', 'Algorithms'),
('Which algorithm is generally suitable for finding a minimum spanning tree using growing sets?', 'Prim', 'Binary Search', 'KMP', 'Floyd-Warshall', 'A', 'Algorithms'),

-- ============================================================
-- DATABASES - 23 QUESTIONS
-- ============================================================

('What is a primary key in a database?', 'A key that encrypts data', 'A unique identifier for each record', 'A foreign reference to another table', 'An index for fast search', 'B', 'Databases'),
('Which of these is an example of a NoSQL database?', 'MySQL', 'PostgreSQL', 'MongoDB', 'Oracle', 'C', 'Databases'),
('What does SQL stand for?', 'Structured Query Language', 'Simple Query Language', 'Standard Question Language', 'Sequential Query Language', 'A', 'Databases'),
('Which SQL command is used to retrieve data?', 'GET', 'SELECT', 'FETCHDB', 'READ', 'B', 'Databases'),
('Which SQL command is used to add new rows?', 'INSERT', 'ADD', 'UPDATE', 'CREATE', 'A', 'Databases'),
('Which SQL command modifies existing records?', 'CHANGE', 'UPDATE', 'MODIFY TABLE', 'ALTER ROW', 'B', 'Databases'),
('Which SQL command removes rows from a table?', 'REMOVE', 'DELETE', 'DROP ROW', 'CLEAR', 'B', 'Databases'),
('Which SQL clause filters rows?', 'ORDER BY', 'WHERE', 'GROUP BY', 'HAVING', 'B', 'Databases'),
('Which clause sorts query results?', 'SORT BY', 'ORDER BY', 'GROUP BY', 'ARRANGE', 'B', 'Databases'),
('Which SQL keyword removes duplicate results?', 'UNIQUE', 'DISTINCT', 'SINGLE', 'DIFFERENT', 'B', 'Databases'),
('Which key uniquely identifies a row?', 'Foreign key', 'Primary key', 'Candidate value', 'Secondary key', 'B', 'Databases'),
('Which key establishes a relationship between tables?', 'Primary key', 'Foreign key', 'Unique key', 'Composite key', 'B', 'Databases'),
('What does normalization primarily reduce?', 'Security', 'Data redundancy', 'Query syntax', 'Indexes', 'B', 'Databases'),
('Which normal form removes repeating groups?', '1NF', '2NF', '3NF', 'BCNF', 'A', 'Databases'),
('Which SQL operation combines rows from multiple tables?', 'JOIN', 'MERGE DATABASE', 'CONNECT', 'COMBINE', 'A', 'Databases'),
('Which JOIN returns matching rows from both tables?', 'LEFT JOIN', 'RIGHT JOIN', 'INNER JOIN', 'FULL JOIN', 'C', 'Databases'),
('Which SQL function calculates the number of rows?', 'TOTAL()', 'COUNT()', 'NUMBER()', 'ROWS()', 'B', 'Databases'),
('Which SQL function calculates an average?', 'MEAN()', 'AVG()', 'AVERAGE()', 'MID()', 'B', 'Databases'),
('Which command creates a new table?', 'MAKE TABLE', 'CREATE TABLE', 'NEW TABLE', 'ADD TABLE', 'B', 'Databases'),
('What does ACID stand for in database transactions?', 'Atomicity, Consistency, Isolation, Durability', 'Access, Control, Integrity, Data', 'Atomicity, Control, Index, Durability', 'Access, Consistency, Isolation, Data', 'A', 'Databases'),
('Which property ensures a transaction is treated as one unit?', 'Consistency', 'Isolation', 'Atomicity', 'Durability', 'C', 'Databases'),
('Which database object can improve query performance?', 'Trigger', 'Index', 'Cursor', 'View only', 'B', 'Databases'),
('Which SQL clause groups rows with the same values?', 'GROUP BY', 'ORDER BY', 'WHERE', 'JOIN BY', 'A', 'Databases'),

-- ============================================================
-- WEB DEVELOPMENT - 24 QUESTIONS
-- ============================================================

('What does REST stand for?', 'Representational State Transfer', 'Remote Execution Standard Transfer', 'Relational State Technology', 'Resource Exchange Standard Transfer', 'A', 'Web Development'),
('What is the default port for HTTP?', '443', '8080', '21', '80', 'D', 'Web Development'),
('Which HTTP method is used to send data to a server?', 'GET', 'DELETE', 'POST', 'PATCH', 'C', 'Web Development'),
('Which protocol is used for secure web communication?', 'HTTP', 'FTP', 'HTTPS', 'SMTP', 'C', 'Web Development'),
('Which language is primarily used to structure web pages?', 'CSS', 'HTML', 'SQL', 'Java', 'B', 'Web Development'),
('Which language is primarily used to style web pages?', 'HTML', 'CSS', 'SQL', 'XML', 'B', 'Web Development'),
('Which language is commonly used to add interactivity to web pages?', 'JavaScript', 'SQL', 'CSS', 'XML', 'A', 'Web Development'),
('What does CSS stand for?', 'Computer Style Syntax', 'Cascading Style Sheets', 'Creative Styling System', 'Coded Style Sheets', 'B', 'Web Development'),
('What does HTML stand for?', 'HyperText Markup Language', 'HighText Machine Language', 'Hyperlink Text Management Language', 'Home Tool Markup Language', 'A', 'Web Development'),
('Which HTTP status code means Not Found?', '200', '301', '404', '500', 'C', 'Web Development'),
('Which HTTP status code indicates a successful request?', '200', '301', '404', '500', 'A', 'Web Development'),
('Which HTTP status code commonly indicates an internal server error?', '201', '301', '404', '500', 'D', 'Web Development'),
('Which protocol is commonly used to transfer web pages securely?', 'HTTP', 'HTTPS', 'FTP', 'SMTP', 'B', 'Web Development'),
('What does URL stand for?', 'Uniform Resource Locator', 'Universal Routing Link', 'Unified Resource Language', 'User Resource Locator', 'A', 'Web Development'),
('Which HTTP method is generally idempotent and used to retrieve resources?', 'POST', 'GET', 'CONNECT', 'PATCH', 'B', 'Web Development'),
('Which technology allows a browser to make asynchronous HTTP requests?', 'AJAX', 'FTP', 'SMTP', 'DNS', 'A', 'Web Development'),
('Which format is commonly used for data exchange in REST APIs?', 'JSON', 'EXE', 'BMP', 'DLL', 'A', 'Web Development'),
('What does API stand for?', 'Application Programming Interface', 'Application Process Integration', 'Advanced Programming Internet', 'Application Protocol Instruction', 'A', 'Web Development'),
('Which HTML element creates a hyperlink?', '<a>', '<link>', '<href>', '<url>', 'A', 'Web Development'),
('Which CSS property changes text color?', 'font-style', 'background', 'color', 'text-decoration', 'C', 'Web Development'),
('Which JavaScript keyword declares a block-scoped variable that can be reassigned?', 'const', 'let', 'fixed', 'static', 'B', 'Web Development'),
('What is responsive web design?', 'Designing only for desktops', 'Designing pages to adapt to different screen sizes', 'Using only JavaScript', 'Using database-driven pages only', 'B', 'Web Development'),
('Which HTTP method is commonly used to partially update a resource?', 'GET', 'POST', 'PATCH', 'HEAD', 'C', 'Web Development'),
('What does DOM stand for?', 'Document Object Model', 'Data Object Management', 'Document Oriented Method', 'Dynamic Object Manager', 'A', 'Web Development'),

-- ============================================================
-- JAVA - 22 QUESTIONS
-- ============================================================

('What does JVM stand for?', 'Java Virtual Machine', 'Java Variable Manager', 'Java Version Module', 'Java Verified Memory', 'A', 'Java'),
('Which of these is NOT a primitive data type in Java?', 'int', 'boolean', 'String', 'char', 'C', 'Java'),
('Which keyword creates an object in Java?', 'create', 'new', 'object', 'make', 'B', 'Java'),
('Which Java collection does not allow duplicate elements?', 'List', 'Set', 'Queue', 'ArrayList', 'B', 'Java'),
('Which collection maintains insertion order and allows duplicates?', 'HashSet', 'ArrayList', 'TreeSet', 'Map', 'B', 'Java'),
('Which interface stores key-value pairs?', 'List', 'Set', 'Map', 'Queue', 'C', 'Java'),
('Which exception occurs when dividing an integer by zero?', 'NullPointerException', 'ArithmeticException', 'IOException', 'ClassCastException', 'B', 'Java'),
('Which keyword is used to handle exceptions?', 'try', 'catch', 'Both try and catch', 'handle', 'C', 'Java'),
('Which block executes whether or not an exception occurs?', 'catch', 'finally', 'throw', 'throws', 'B', 'Java'),
('Which keyword explicitly throws an exception?', 'throws', 'throw', 'exception', 'raise', 'B', 'Java'),
('Which keyword declares that a method may throw exceptions?', 'throw', 'throws', 'catch', 'try', 'B', 'Java'),
('Which Java feature allows automatic memory management?', 'Pointers', 'Garbage collection', 'Manual allocation', 'Destructors', 'B', 'Java'),
('Which method is the entry point of a Java application?', 'start()', 'run()', 'main()', 'init()', 'C', 'Java'),
('What is the size of a Java int?', '8 bits', '16 bits', '32 bits', '64 bits', 'C', 'Java'),
('Which primitive type stores true or false?', 'bool', 'boolean', 'bit', 'logical', 'B', 'Java'),
('Which keyword is used to define a constant variable?', 'constant', 'final', 'static', 'immutable', 'B', 'Java'),
('Which Java class is commonly used for mutable strings?', 'String', 'StringBuilder', 'Character', 'Text', 'B', 'Java'),
('Which keyword is used to implement an interface?', 'extends', 'implements', 'inherits', 'interface', 'B', 'Java'),
('Which keyword is used when one class inherits another class?', 'implements', 'extends', 'inherits', 'superclass', 'B', 'Java'),
('Which Java collection stores elements in sorted order?', 'HashSet', 'TreeSet', 'ArrayList', 'LinkedList', 'B', 'Java'),
('What does JDK stand for?', 'Java Development Kit', 'Java Deployment Kernel', 'Java Data Kit', 'Java Development Kernel', 'A', 'Java'),
('What does JRE stand for?', 'Java Runtime Environment', 'Java Resource Engine', 'Java Runtime Extension', 'Java Resource Environment', 'A', 'Java'),

-- ============================================================
-- NETWORKING - 21 QUESTIONS
-- ============================================================

('Which layer of OSI model handles routing?', 'Data Link Layer', 'Transport Layer', 'Network Layer', 'Session Layer', 'C', 'Networking'),
('What does IP stand for?', 'Internet Protocol', 'Internal Process', 'Internet Program', 'Interface Protocol', 'A', 'Networking'),
('Which protocol translates domain names into IP addresses?', 'HTTP', 'DNS', 'FTP', 'SMTP', 'B', 'Networking'),
('Which protocol is connection-oriented?', 'UDP', 'TCP', 'IP', 'ARP', 'B', 'Networking'),
('Which protocol is connectionless?', 'TCP', 'UDP', 'HTTP', 'FTP', 'B', 'Networking'),
('Which layer of the OSI model is responsible for end-to-end delivery?', 'Network', 'Transport', 'Session', 'Physical', 'B', 'Networking'),
('How many layers are in the OSI model?', '5', '6', '7', '8', 'C', 'Networking'),
('Which OSI layer is responsible for MAC addresses?', 'Physical', 'Data Link', 'Network', 'Transport', 'B', 'Networking'),
('Which device forwards packets between networks?', 'Switch', 'Router', 'Hub', 'Repeater', 'B', 'Networking'),
('Which device primarily operates at the Data Link layer?', 'Router', 'Switch', 'Gateway', 'Modem', 'B', 'Networking'),
('Which protocol is used to automatically assign IP addresses?', 'DNS', 'DHCP', 'FTP', 'ARP', 'B', 'Networking'),
('Which protocol is commonly used to send email?', 'SMTP', 'HTTP', 'DNS', 'SNMP', 'A', 'Networking'),
('Which protocol is commonly used to retrieve email from a server?', 'SMTP', 'POP3', 'ARP', 'DHCP', 'B', 'Networking'),
('Which protocol provides secure remote login?', 'Telnet', 'SSH', 'FTP', 'HTTP', 'B', 'Networking'),
('Which protocol is the secure alternative to HTTP?', 'FTP', 'HTTPS', 'SSH', 'SMTP', 'B', 'Networking'),
('What is the default port of HTTPS?', '21', '25', '80', '443', 'D', 'Networking'),
('What is the default port of FTP control connection?', '20', '21', '53', '443', 'B', 'Networking'),
('Which protocol maps an IP address to a MAC address on a local network?', 'DNS', 'ARP', 'DHCP', 'ICMP', 'B', 'Networking'),
('Which protocol is commonly used by ping?', 'TCP', 'UDP', 'ICMP', 'FTP', 'C', 'Networking'),
('What does LAN stand for?', 'Local Area Network', 'Large Area Network', 'Linked Access Network', 'Local Access Node', 'A', 'Networking'),
('What does WAN stand for?', 'Wide Area Network', 'Wireless Access Network', 'Web Area Node', 'Wide Access Node', 'A', 'Networking'),

-- ============================================================
-- C PROGRAMMING - 21 QUESTIONS
-- ============================================================

('Which symbol is used to declare a pointer in C?', '&', '*', '#', '@', 'B', 'C Programming'),
('Which function is used to print output in C?', 'print()', 'printf()', 'display()', 'cout()', 'B', 'C Programming'),
('Which function is used to read formatted input in C?', 'input()', 'scanf()', 'read()', 'cin()', 'B', 'C Programming'),
('Which header file contains printf() and scanf()?', 'stdlib.h', 'string.h', 'stdio.h', 'math.h', 'C', 'C Programming'),
('Which header file contains malloc()?', 'stdio.h', 'stdlib.h', 'string.h', 'memory.h', 'B', 'C Programming'),
('Which operator gives the address of a variable?', '*', '&', '%', '#', 'B', 'C Programming'),
('Which operator dereferences a pointer?', '&', '*', '->', '%', 'B', 'C Programming'),
('What is the index of the first element in a C array?', '0', '1', '-1', 'Depends on compiler', 'A', 'C Programming'),
('Which loop executes its body at least once?', 'for', 'while', 'do-while', 'foreach', 'C', 'C Programming'),
('Which keyword exits a loop immediately?', 'continue', 'break', 'exitloop', 'stop', 'B', 'C Programming'),
('Which keyword skips the current iteration?', 'break', 'skip', 'continue', 'pass', 'C', 'C Programming'),
('Which function allocates dynamic memory in C?', 'alloc()', 'malloc()', 'new()', 'memory()', 'B', 'C Programming'),
('Which function releases dynamically allocated memory?', 'delete()', 'free()', 'release()', 'remove()', 'B', 'C Programming'),
('Which format specifier is used for an integer?', '%f', '%c', '%d', '%s', 'C', 'C Programming'),
('Which format specifier is used for a floating-point value with printf?', '%d', '%f', '%c', '%x', 'B', 'C Programming'),
('Which format specifier represents a character?', '%c', '%s', '%d', '%p', 'A', 'C Programming'),
('Which keyword declares a structure in C?', 'class', 'struct', 'record', 'object', 'B', 'C Programming'),
('Which keyword defines a constant-like macro?', '#define', 'constmacro', 'macro', 'constant', 'A', 'C Programming'),
('Which function compares two strings in C?', 'strcompare()', 'strcmp()', 'compare()', 'stringcmp()', 'B', 'C Programming'),
('Which header file contains string functions such as strlen()?', 'stdio.h', 'stdlib.h', 'string.h', 'ctype.h', 'C', 'C Programming'),
('Which operator is used to access the value at a pointer address in C?', '&', '#', '*', '@', 'C', 'C Programming'),

-- ============================================================
-- PROGRAMMING - 21 QUESTIONS
-- ============================================================

('What is the output of 5 % 2 in most programming languages?', '2', '0', '2.5', '1', 'D', 'Programming'),
('What is a variable?', 'A fixed program output', 'A named storage location for data', 'A compiler error', 'A programming language', 'B', 'Programming'),
('What is an algorithm?', 'A programming language', 'A step-by-step procedure for solving a problem', 'A database', 'A hardware component', 'B', 'Programming'),
('Which data type generally represents true or false values?', 'Integer', 'Boolean', 'Character', 'String', 'B', 'Programming'),
('What is a compiler?', 'A program that translates source code into machine or intermediate code', 'A database server', 'A text editor', 'A network protocol', 'A', 'Programming'),
('What is debugging?', 'Writing documentation', 'Finding and fixing errors in a program', 'Compiling code', 'Designing hardware', 'B', 'Programming'),
('What is a syntax error?', 'An error caused by invalid language structure', 'A hardware failure', 'A network error', 'A database record', 'A', 'Programming'),
('What is recursion?', 'A function calling itself', 'A loop that never runs', 'A variable changing type', 'A program terminating', 'A', 'Programming'),
('What is an infinite loop?', 'A loop that executes exactly once', 'A loop whose termination condition is never reached', 'A loop without variables', 'A loop with no body', 'B', 'Programming'),
('Which operator is commonly used for logical AND?', '||', '&&', '!', '&=', 'B', 'Programming'),
('Which operator is commonly used for logical OR?', '&&', '||', '!', '|=', 'B', 'Programming'),
('What is an array?', 'A collection of elements stored under one identifier', 'A function', 'A database', 'A compiler', 'A', 'Programming'),
('What is a function?', 'A reusable block of code that performs a task', 'A hardware device', 'A database row', 'A network packet', 'A', 'Programming'),
('What is source code?', 'Human-readable program instructions', 'Machine hardware', 'Database storage', 'Binary network traffic', 'A', 'Programming'),
('What is a runtime error?', 'An error occurring while a program is executing', 'An error in program formatting only', 'A compiler installation', 'A documentation issue', 'A', 'Programming'),
('What is type casting?', 'Converting a value from one data type to another', 'Deleting a variable', 'Creating a database', 'Compiling a program', 'A', 'Programming'),
('What does IDE stand for?', 'Integrated Development Environment', 'Internet Development Engine', 'Internal Data Editor', 'Integrated Data Execution', 'A', 'Programming'),
('Which paradigm focuses on functions and immutable data?', 'Procedural programming', 'Functional programming', 'Assembly programming', 'Markup programming', 'B', 'Programming'),
('What is pseudocode?', 'Informal representation of an algorithm using structured language', 'Executable machine code', 'Database syntax', 'A network protocol', 'A', 'Programming'),
('What is code refactoring?', 'Changing code structure without changing its intended behavior', 'Deleting the entire program', 'Changing hardware', 'Adding random features', 'A', 'Programming'),
('What is version control used for?', 'Tracking changes to files and collaborating on code', 'Running antivirus scans', 'Compiling Java only', 'Creating network connections', 'A', 'Programming');