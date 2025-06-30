# n8n-configuration
My N8N Docker configuration


## Auto updating
Open crontab
`crontab -e`

Add this line and save
`0 3 * * 0 ~/n8n-configuration/update-n8n.sh >> ~/n8n-configuration/update-n8n.log 2>&1`
