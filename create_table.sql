CREATE DATABASE 파일업로드DB;

USE 파일업로드DB;

CREATE TABLE uploaded_files (
    id INT AUTO_INCREMENT PRIMARY KEY,
    file_name VARCHAR(255) NOT NULL,
    original_file_name VARCHAR(255) NOT NULL,
    description TEXT,
    upload_date DATETIME NOT NULL
); 