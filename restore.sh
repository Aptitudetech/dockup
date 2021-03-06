#!/bin/bash

# Find last backup file
LAST_BACKUP=$(aws s3 ls s3://$S3_BUCKET_NAME | cut -d ' ' -f5 | grep ^$BACKUP_NAME | sort -r | head -n1)

# Download backup from S3
aws s3 cp s3://$S3_BUCKET_NAME/$LAST_BACKUP $LAST_BACKUP

# Extract backup
tar -zxf $LAST_BACKUP
