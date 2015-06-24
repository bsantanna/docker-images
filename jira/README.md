# Atlassian Jira Image

## Building:
```
docker build -t bsantanna/jira .
```

## Running:
```
docker run -d -p 48080:8080 --name jira -v .../jira-backup:/opt/atlassian/jira-home/export bsantanna/jira
```
