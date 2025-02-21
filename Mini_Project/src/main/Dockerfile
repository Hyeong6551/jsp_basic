FROM tomcat:9-jdk11

# MySQL JDBC 드라이버 설치
ADD https://repo1.maven.org/maven2/com/mysql/mysql-connector-j/8.0.33/mysql-connector-j-8.0.33.jar /usr/local/tomcat/lib/

# 웹 애플리케이션 복사
COPY webapp/ /usr/local/tomcat/webapps/ROOT/ 