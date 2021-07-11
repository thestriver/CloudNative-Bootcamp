import sys
import boto3


try:
    def main():
        create_s3bucket(bucket_name)

except Exception as  e :
    print(e)


def create_s3bucket(bucket_name, region=None):
    if region is None:
        s3_client = boto3.client('s3')
        bucket = s3_client.create_bucket(Bucket=bucket_name)

        print(bucket)
    else:
        s3_bucket = boto3.client(
            's3',
        )
        location = {'LocationConstraint': 'eu-west-2'}

        bucket = s3_bucket.create_bucket(
            Bucket=bucket_name,
            ACL='private',
            CreateBucketConfiguration=location
        )

        print(bucket)

bucket_name = sys.argv[1]


if __name__ == '__main__':
    main()


# Errors

#1 boto3 not found
#/usr/local/bin/python3 /Users/mahmud/Documents/Code/Cloud-Native-Bootcamp/Week2/Scripting/Python/s3bucket.py cloudskillscodevore
#2 bucket_name = sys.argv[1] IndexError: list index out of range
#  Command + Shift + P - Run Python file in terminal


#3 Error: botocore.exceptions.ClientError: An error occurred (IllegalLocationConstraintException) when calling the CreateBucket operation: The unspecified location constraint is incompatible for the region specific endpoint this request was sent to.
# Solution: https://github.com/aws/aws-cli/issues/2603#issuecomment-428220985
