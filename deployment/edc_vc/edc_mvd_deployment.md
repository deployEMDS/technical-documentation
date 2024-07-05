## Deployment IONOS Environment with EDC MVD
### Deployment Architecture Overview
**This deployment aims to deploy https://github.com/eclipse-edc/MinimumViableDataspace/tree/mvd-with-dcp-and-mgmtdomains  in the IONOS environment.**
![441dd775-a988-4b2c-844b-f230a1eb96c3.png](images%2F441dd775-a988-4b2c-844b-f230a1eb96c3.png)
#### Deployed IONOS Components:
- Compute Instances:
  - Name:  EDC MVD
  - Type: VCPU-Server-1
  - DHCP: enabled
  - vCPUs: 2
  - RAM: 8 GB 
  - Deployed Components on this Instance:
    - Docker
    - KinD (other cluster engines may work as well - not tested!)
    - Terraform
    - JDK 17+ 
    - k9s 
    - Git
    - a POSIX compliant shell
    - Postman (to comfortably execute REST requests)
    - newman (to run Postman collections from the command line)
    - Deployed and build by following https://github.com/eclipse-edc/MinimumViableDataspace/tree/mvd-with-dcp-and-mgmtdomains, locate under /root/emds_edc_mvd folder`
- Storage Instances:
  - Name: SSD Storage 1 (Attached to Test Case 1 Server) (boot option)
  - Type: SSD Storage
  - Size:   100GB
  - SSH Key: SSH Key 1 - id rsa (key pair:[id_ed25519.zip](ssh-keys%2Fid_ed25519.zip), use it for ssh)
  - Image: ubuntu 24.01-sever-clouding-amd64-20240425
    - username: root
    - password:12345678
- Networks:
  - Name: N\A
  - Type:  Internet Access (via LAN1 with EDC MVD)
  
- Operational:
  - Connect to the deployed server use OpenSSH by Connect via SSH | Products (ionos.com) `e.g. ssh root@5.250.180.17` to connect to EDC MVD 

![4ce97165-9e66-4aa5-8689-a465039e4264.png](images%2F4ce97165-9e66-4aa5-8689-a465039e4264.png)
![c1e8b48e-836b-478c-94ec-dcf3a921b175.png](images%2Fc1e8b48e-836b-478c-94ec-dcf3a921b175.png)
