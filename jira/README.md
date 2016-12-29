
## Running:

Start mysql container:
```
docker run --name jira-mysql -e MYSQL_ROOT_PASSWORD=my-secret-pw -d -v $HOME/jira-mysql:/var/lib/mysql mysql
```

Start jira container:
```
docker run -d -p 48080:8080 --name jira -v $HOME/jira-backup:/opt/atlassian/jira-home/export --link jira-mysql:mysql bsantanna/jira
```
