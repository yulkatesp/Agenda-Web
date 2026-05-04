# Forzamos Tomcat 10 para que sea compatible con tu código de Jakarta EE
FROM tomcat:10.1-jdk17

# Copiamos el war a la carpeta webapps y le cambiamos el nombre a ROOT.war
# para que tu app sea la principal (sin carpetas extra en la URL)
COPY target/Agenda-Web-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
