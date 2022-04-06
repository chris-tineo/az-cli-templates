#####1-Get Secret from KeyVault and use it as a Variable. The secret was configured previously in Terraform Cloud.
tokenVault=$(az keyvault secret show --name githubtoken --vault-name keyvwebsprd01 --query "value" -o tsv)

#####2-Update the Static Web App resource (created using TF) to integrate with GitHub repo
az staticwebapp update --name ststwebsprd01 -g RGWEBSITE01PROD -s https://github.com/chris-tineo/html-docs-hello-world --branch master --debug --token $tokenVault

#####3-Swapping slots
###Not possible using Az CLI
