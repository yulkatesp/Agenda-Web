FROM tomcat:9.0

# Limpiar apps por defecto
RUN rm -rf /usr/local/tomcat/webapps/*

# Copiar tu WAR
COPY target/Agenda-Web-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
