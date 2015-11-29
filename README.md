=apiman-docker=
======
 - Docker image for the Apiman ``1.1.9 Final``
 - This image comes with an external **postgres** database (instead of the native **h2**)
 - SSL/TLS is supported, so **Apiman** can be easily deployed to the cloud (EC2, Azure, etc.)


----

#### 1. Prerequisites
 - [Docker](https://gist.github.com/maslick/69291bd5ed649892fe1b)
 - [Docker-compose](https://gist.github.com/maslick/5f77efa8ba0f8df98548)


#### 2. Installation
 ```
 $ ./ssl.sh google.com
 $ ./build.sh
 $ ./run.sh
 ```
 This will:
- Generate a self-signed ssl certificate and deploy it to the keystore (see ``ssl.sh`` for more details)
- Build the docker image
- Run postgres and apiman using ``docker-compose``
 
#### 3. Run
 - Go to Apiman UI:
```
https://{your_host}/apimanui
```
 - Login using ``apiman/apiman123!``
 - Go to Manage Gateways -> New Gateway
 
 ```
 Configuration Endpoint: http://localhost:8080/apiman-gateway-api/
 Username: apimanager
 Password: apiman123!
 ```
 - Import policies. Go to ``System Administration -> Manage Policy Definitions``and use this [json](https://raw.githubusercontent.com/apiman/apiman/master/distro/data/src/main/resources/data/all-policyDefs.json)
 - Add admin role. Click on ``Manage Roles/Permissions`` and then ``New role``.
 - Create new Organization
 - Create new Plan
 - Create new Service
 - Create new Application

The API service will be available at:
```
https://{your_host}/apiman-gateway/{Organization}/{Service}/{version}?apikey={X-API-Key}
```