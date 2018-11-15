FROM maven:latest

## Build WAR from github repo, keep *.war files and cleanup build environment (for smaller docker image)
RUN git clone --depth 1 https://github.com/MassBank/MassBank-web.git ; \
    ln -s /MassBank-web/MassBank-Project /project ; \
    mvn clean package -f /project ; \
    cp /project/MassBank/target/MassBank.war / ; \
    cp /project/api/target/api.war / ; \ 
    rm -rf /MassBank-web .m2 

# This was the manual invocation:
# docker run --rm -v $HOME/.m2:/root/.m2 -v $PWD/MassBank-Project:/project -v $PWD/conf/full-service.conf:/etc/massbank.conf -v $PWD/../MassBank-data:/MassBank-data maven:latest mvn clean package -f /project^C
