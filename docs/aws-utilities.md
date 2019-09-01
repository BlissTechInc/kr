# AWS Utilities
## Upgrade mysql on EC2 to match RDS
On the EC2 instance, invoke the following commands:
1. `sudo rpm -Uvh https://download.mysql.org/pub/repos/yum/9.6/redhat/rhel-6-x86_64/pgdg-ami201503-96-9.6-2.noarch.rpm`
2. `sudo yum install mysql96`

Now you can use utilities like pg_dump to get the latest backup of the production database

## mysql into db

After following steps 1 & 2 above to install mysql into the EC2 instance, do the following:

1. Run the following command:
  ```
  mysql -h <endpoint> <rds-instance-name> -U <rds-username>
  ```
  - `<endpoint>` should be replaced with the endpoint url found on the RDS instance (ex. `<rds-instance-name>.<some-code>.<amazon-region>.rds.amazonaws.com`)
  - `<rds-instance-name>` should be replaced with the name of the db instance you want to mysql into
2. When prompted, enter the pw for the db

## Get backup of the production database
With data:

````pg_dump -h <rds endpoint> -U <username> <dbname> > filename_with_data.out````

Schema only (no data):

````pg_dump -h <rds endpoint> -U <username> -s <dbname> > filename_no_data.out````
