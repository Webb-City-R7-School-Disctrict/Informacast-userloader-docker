# Docker Compose Setup

## Clone this repo
  ```
  git clone https://github.com/Webb-City-R7-School-District/Informacast-userloader-docker.git
```

## Enter the repo directory
```
cd Informacast-userloader-docker
```

## Build the image
```
docker build -t icf_userloader:latest .
```


## Place your config.groovy in the "config" directory

## Start the compose
 ```
 docker-compose up -d
 ```

## Testing
You can test the upload by running the following command
```
docker exec -it informacast-userloader-docker-userloader-1 /bin/bash -c "cd /home/loaderuser/Informacast-userloader && ./loader.sh --do-upload"
```

---

## Using Portainer

## Copy the link to this repository
```
https://github.com/Webb-City-R7-School-District/Informacast-userloader-docker.git
```

## Build the image
1. In portainer, go to images, and click " + Build a new image "
2. set the name as icf_userloader:latest
3. Go to the "URL" option
4. Paste in the Repository URL
5. Click "Build Image"

## Setup the stack
1. Go to Stacks > Add a Stack
2. set the name as icf_userloader
3. Click "Repository"
4. Paste in the Repository URL
5. Scroll down to "Enviroment Variables"
6. Click " + Add an enviroment variable"
7. Set the name as CONFIG and the vlaue as config (ENSURE YOU MATCH LETTER CASING)
   ![image](https://github.com/user-attachments/assets/ced30846-679f-4724-ad6b-ec3841d6525a)
9. leave all else default and click "Deploy the stack"

## Add in config file
1. Go to Volumes
2. Find the volume icf_userloader_config > click browse
3. in the top right, click the upload icon
4. select and upload your config.groovy file

## Testing
You can enter the console of the container in the stack and run the following to test
```
./loader-sh --do-upload
```
