FROM maven AS buidstage 
RUN mkdir /opt/wapp1
WORKDIR /opt/wapp1
COPY /opt/webapp1 .
RUN mvn clean install

FROM tomcat
WORKDIR webapps
COPY --from=buildstage /opt/wapp1/target/mywebapp-3.1.war .
RUN rm -rf ROOT && mv mywebapp-3.1.war ROOT.war
EXPOSE 8080

