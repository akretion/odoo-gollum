# Docker image for the odoo module gollum

Add the following code in your docker-compose

```
gollum:
  image: akretion/gollum
  environment:
    - GOLLUM_PATH=/opt/wiki
  volumes:
    - .wiki:/opt/wiki
```
