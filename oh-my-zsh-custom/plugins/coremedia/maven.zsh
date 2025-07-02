# Maven settings and aliases

# Provide alias to execute Maven without verifying SSL certificates for artifact downloads
alias mvn-insecure='mvn -Dmaven.resolver.transport=wagon -Dmaven.wagon.http.ssl.insecure=true'

# Development environment for Maven and Java
export _JAVA_OPTIONS='-Djava.net.preferIPv4Stack=true -Djava.awt.headless=true'
export MAVEN_OPTS='-Xms256m -Xmx2048m -Dfile.encoding=UTF-8'

# Configure Maven Split Local Repositories
#export _JAVA_OPTIONS="${_JAVA_OPTIONS} \
#    -Daether.enhancedLocalRepository.split=true \
#    -Daether.priority.io.takari.aether.localrepo.TakariLocalRepositoryManagerFactory=1"
