# README

The [docker-compose.yaml](docker-compose.yaml) defines a simple testbed.
[This](https://www.postman.com/i2cat-dev/workspace/deployemds/collection/36812968-e3ff55ce-92d5-4f29-b9c2-6c5e3b4226a8?action=share&creator=36812968) Postman collection relies on this testbed.
To start the testbed.

    docker compose up --detach

To restart the testbed

    docker compose restart

To stop the testbed

    docker compose stop

-   **NOTE:** The certificates used by this testbed should never be used in a production environment.

