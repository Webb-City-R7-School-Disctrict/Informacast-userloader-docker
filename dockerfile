# Use an official lightweight base image
FROM ubuntu:20.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install required packages, including Java
RUN apt-get update && \
    apt-get install -y git cron curl openjdk-21-jre && \
    apt-get clean

# Create a user for running the script
RUN useradd -ms /bin/bash loaderuser

# Switch to the root user to set up cron and log file
USER root
WORKDIR /home/loaderuser

# Create the crontab file with the desired command using git pull
RUN echo "0 * * * * cd /home/loaderuser/Informacast-userloader-docker && git pull >> /proc/1/fd/1 && chmod +x /home/loaderuser/Informacast-userloader-docker/loader.sh >> /proc/1/fd/1 && /home/loaderuser/Informacast-userloader-docker/loader.sh --do-upload >> /proc/1/fd/1" > /etc/cron.d/loader-cron

# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/loader-cron

# Apply cron job
RUN crontab /etc/cron.d/loader-cron

# Create necessary directories and set permissions
RUN mkdir -p /var/run/ && \
    touch /var/log/cron.log && \
    chown loaderuser:loaderuser /var/log/cron.log && \
    chown root:root /var/run && chmod 755 /var/run

# Clone Repo
RUN git clone https://github.com/Webb-City-R7-School-Disctrict/Informacast-userloader-docker.git /home/loaderuser/Informacast-userloader-docker && \
    chmod -R 777 /home/loaderuser/Informacast-userloader-docker && \
    chmod +x /home/loaderuser/Informacast-userloader-docker/loader.sh

# Set the default working directory
WORKDIR /home/loaderuser/Informacast-userloader-docker

# Run cron in the foreground
CMD ["cron", "-f"]
