# Container image that runs your code
FROM nicnewdigate/kicad-automation-scripts

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
