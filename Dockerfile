FROM jenkins/jenkins:lts

USER root

# Install Docker CLI
RUN apt-get update && apt-get install -y docker.io

# Optional: Clean up
RUN apt-get clean

USER jenkins
