# Maven settings and aliases

# Provide alias to execute Maven without verifying SSL certificates for artifact downloads
alias mvn-insecure='mvn -Dmaven.resolver.transport=wagon -Dmaven.wagon.http.ssl.insecure=true'
