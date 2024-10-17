## Requirements

* Have Java available on your local machine and accessible by command line.

* Have the necessary information present to connect to your Active Directory, e.g. host name, port number, authentication mechanism, etc.


## Usage

1. Set up your distribution lists and security groups.

2. Set up your distribution list and security group tags. 

3. Rename/Copy the config.groovy.sample file to config.groovy and make the necessary modifications that best fit your company (see the config.groovy.sample file itself for modification directions).

4. If necessary (for debugging purposes), repeat Step 3 with the log4j.properties.sample file and make the necessary modifications that best fit your company (see the log4j.properties.sample file itself for modification directions).

5. Run the user loader. For more information on using the user loader, refer to its Help by running --help from your command line for the loader.sh or loader.bat file.

---

https://help.wcr7.net/books/singlewire-informacast-and-intercom-hardware/page/bulk-user-upload

## Docker setup:
#### You must provide a config.groovy, as well as the 2 following Environment Variables
| Environment Variable | Description                                       |
|----------------------|---------------------------------------------------|
| `GITHUB_REPO`        | Your GitHub private repository containing the userload and config file. (EXCLUDE "HTTPS://" example: github.com/Some-Username/Informacast-User-Loader.git) |
| `GITHUB_TOKEN`       | Your GitHub personal access token for authentication to clone the private repository. |