# Synopsis

A bootstrap procedure for creating a .zip package of the AWS command line utilities, using a linux host docker.

You only need the docker host to rebuild a new version of the AWS CLI.  If you just want to run it, simply download the output zip artifacts and add the contents to your AWS Lambda function .zip file.


# Prerequisites

Besides docker, the other main prerequisite is the ability to shared files.  Two configurations known to work are:

    - A docker-machine provisioned VM running in the (default) virtualbox hypervisor
    - An Ubuntu Linux running docker


# Instructions:

Before running, make sure you can:

    docker ps

If this works, build:

    make

The output will be written to:

    use-awscli-in-awslambda.zip


# Background

AWS Lambda "is an event-driven, serverless computing platform provided by Amazon as a part of the Amazon Web Services." [wikipedia](https://en.wikipedia.org/wiki/AWS_Lambda)

The AWS Command Line Interface (CLI) "is a unified tool to manage your AWS services. With just one tool to download and configure, you can control multiple AWS services from the command line and automate them through scripts."  [AWS](https://aws.amazon.com/cli/).  The AWS CLI is implemented in python.

AWS Lambda is based on a small set of amazon curated machine instances curated by Amazon.  Surprisingly, some or all of these pre-configured images do not provide the AWS CLI.  So if you have a command that works on your machine, write say a python-based AWS lambda function and then try to call the command, it will not work.  There is no supported way to get the commands into lambda.  Neither the AWS bundle installer nor the pip/python installation works normally on lambda.

The article [Running aws-cli Commands Inside An AWS Lambda Function](https://alestic.com/2016/11/aws-lambda-awscli/) describes an undocumented procedure for packaging the AWS CLI.  The main shortcoming of these instructions is lack of a well-documented easy way to obtain the prerequisites for running the script.


# References

"The underlying AWS Lambda execution environment is based on: Amazon Linux AMI version (AMI name: amzn-ami-hvm-2016.03.3.x86_64-gp2" [AWS](http://docs.aws.amazon.com/lambda/latest/dg/current-supported-versions.html).

The Amazon-supported docker images for amazon-linux are all newer than 2016-03: [amazonlinux](https://hub.docker.com/_/amazonlinux/).

This third party has the 2016-03 version of amazon linux, which is what I used:

    https://hub.docker.com/r/ambakshi/amazon-linux/

The scripts probably run on a wide variety of linux distributions, but this project is only tested against the referenced docker image.
