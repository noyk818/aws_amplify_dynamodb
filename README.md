# Amplify Datastore Memo
Step1 amplify configure<BR>
Step2 amplify init -> project create<BR>
Step3 amplify add api<BR>
Step4 amplify push -> aws push<BR>
Step5 amplify codegen models -> dart add<BR>
Step6 pubspec.yml -> amplify add

即時DyanmoDBへ反映するためにはApp Syncの設定も必要、
利用するためには「amplify add auth」を設定する必要がある

$ amplify add auth<BR>
Using service: Cognito, provided by: awscloudformation<BR>
<BR>
 The current configured provider is Amazon Cognito.<BR>
<BR>
Do you want to use the default authentication and security configuration? Default configuration<BR>
Warning: you will not be able to edit these selections.<BR>
How do you want users to be able to sign in? Username<BR>
Do you want to configure advanced settings? No, I am done.<BR>
