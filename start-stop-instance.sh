Start/Stop EC2 instance using lambda and event bridge

It is necessary to have at least one EC2 instance already created in your AWS account in order 
to build an automated solution that stops and starts EC2 instances using AWS Lambda and EventBridge.

Prerequisites
EC2
VPC
Lambda
Eventbridge
IAM Role

<img src="https://github.com/jcconstantino/AWS-Script/blob/main/start-stop-instance.png">

1. Go to lambda and create a function for start/stop :
Copy the code and paste it to the code section in lambda : 
=====START ===============
import boto3
region = 'ap-southeast-1'
instances = ['i-048c5dfe1b76b1d02']
ec2 = boto3.client('ec2', region_name=region)

def lambda_handler(event, context):
    ec2.start_instances(InstanceIds=instances)
    print('started your instances: ' + str(instances))
=====STOP ============
import boto3
region = 'ap-southeast-1'
instances = ['i-048c5dfe1b76b1d02']
ec2 = boto3.client('ec2', region_name=region)

def lambda_handler(event, context):
    ec2.stop_instances(InstanceIds=instances)
    print('stopped your instances: ' + str(instances))

Now click deploy to save it your code.

2. Create an IAM policy and attach it to the lambda execution role for both function start and stop:
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogGroup",
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ],
            "Resource": "arn:aws:logs:*:*:*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "ec2:Start*",
                "ec2:Stop*"
            ],
            "Resource": "*"
        }
    ]
}

3. Creating event bridge:
Make rules for EventBridge.

Activate the EventBridge console.
Select "Rules" from the navigation bar, then click "Create rule."
Please include the following information on the "Create rule" page:
a. Name: Give your rule a distinctive name.

b. Enter a description for your rule if you want to.

c. Choose the "Schedule pattern" radio option to define the pattern.
Choose your Schedule Pattern type and define the cron expression for the schedule
4. Cron expressions to schedule time for function triggers
https://docs.aws.amazon.com/AmazonCloudWatch/latest/events/ScheduledEvents.html?source=post_page-----988b0843d010--------------------------------
5. Define the schedule, select a target as AWS Service, and create a rule.


Note: The rule will appear in the Amazon EventBridge interface after you've established it. 
You may see the rule's history to see when it was activated and which targets were called upon, and you can update or remove the rule at any time.
When an event that matches the rule's pattern is found, the rule will immediately begin listening for it and call the designated targets.



