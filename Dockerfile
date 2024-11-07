# Start from a base image
FROM tomcat

# Set the working directory (optional)
WORKDIR /usr/local/tomcat/webapps

#copy war package from jenkins server
COPY target/*.war /usr/local/tomcat/webapps/ROOT.war
