# common
export AWS_ACCESS_KEY_ID=<Your AWS access key ID>
export AWS_SECRET_ACCESS_KEY=<Your AWS secret access key>
export AWS_DEFAULT_REGION=<Your AWS default region>
# deploy-cloudwatch_alarm
LAMBDA_FUNCTION_NAME=<Target lambda function name>
# deploy-chatbot
TARGET_WORKSPACE_ID=<AWS slack workspace ID>
TARGET_CHANNEL_ID=<Slack channel ID>

.PHONY: deploy-cloudwatch_alarm
deploy-cloudwatch_alarm:
	aws cloudformation deploy \
    --template-file cloudwatch_alarm.yml \
    --stack-name CloudWatchAlarmSampleStack \
    --parameter-overrides LambdaFunctionName=$(LAMBDA_FUNCTION_NAME)

.PHONY: deploy-chatbot
deploy-chatbot:
    aws cloudformation deploy \
    --template-file chatbot.yml \
    --stack-name ChatbotSampleStack \
    --capabilities CAPABILITY_NAMED_IAM \
    --parameter-overrides TargetWorkspaceId=$(TARGET_WORKSPACE_ID) TargetChannelId=$(TARGET_CHANNEL_ID)