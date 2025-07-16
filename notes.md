Dynamic blocks:

dynamic: here we need to mention the repeative blocks

dynamic "setting" {
    for_each = var.settings
    content {
      namespace = setting.value["namespace"]
      name = setting.value["name"]
      value = setting.value["value"]
    }
  }
}

Functions:
Terraform conatin builtin functiosn we cannot create our own functions.
bash: terraform console
max(value1,value2,value3)
min(value1,value2,value3)
length

common tags:
===============
project = "roboshop"
terraform = "true"
version = 1.1

variable tags:
==============
component = "cart"
Name= "cart"
version=1.0

merge tags:
=========
project = "roboshop"
terraform = "true"
component = "cart"
Name= "cart"
version=1.0

Data sources:
=============
variables ----> inputs
outputs -----> print the info after creating the resources

it can query the info from the provider

locals:
============
locals can have expressions,you can assign a name to it and use it wherever you require

local are like variables holding the values agianst keys,
but you can refer variables inside locals,expressions,functions....

can we override the values that given in variables?
no we can't
variables override: we can mention in variables that want to override
locals override: we can mention those variables that no need to override

variables can be overriden, locals cannot be ovveriden

state:
=======
Iaac: Declarative way of creating infra, whatever we declare Iaac tool should follow the sysntax

on which files are declaring 
.tf files ---> it contain desired or declarative  infra ----> expetation
what exsits in aws ---> actual infra ----> reality
state files ---> terraform use this file to track what is created in provider

terraform plan
=============
reads .tf ---> understand what user wants
read state file ---> empty
query the provider ---> alreday infra exsits or not

it starts create
terraform apply:

created infra
terraform plan:
reads .tf files,state file ----> matched

i deleted instance	in console manullay
reads .tf files,state file ----> matched
check provider to verify desired infra vs actual infra


when you change tf files
=======================
.tf ---> understand what user wants
state file ---> not matched

actual infra ----> user don't want route r53 records

terraform uses state files to track what is created in the provider every time.
we run terraform commands terraform check whether the desired infra is matched or not with actula infra thourht the stae file

we cannot put .state files local for this we user s3 buckets:
s3bucket:
keeping state file in local will not work in collabarative environment.
terraform doesn't understand what are the resources created by others
so it may create duplicate resources or else it will give erros

provisioners:
===========
when you create the server using terraform. we can take actions using provisioners
1.local-exec
2.remote-exec

where i am running terraform command that is local to terraform (laptop)
remote means server i created using terraform

After creating server if i do any actions in local that is local-exec
After creating server if i do any actions in remote that is remote-exec

failure behaviour:
if we get any error it agian create from the scratch so we don't want to stop we will face any error then we can use
on_failure = continue means it will not recreate

here we have 2 types of provinsers
creation time provisioners
destory time provisioners

provisioners will run during creation time. If yu want t run while destory we can use
when = destroy

remote exec:
means we need to connect to the server for this we need credinatilas. bacuse we cannot connect directly

multiple-infra-using-terraform:
===========================
dev,prod,qa,sit,uat,pre-prod

lakshmireddy.site

roboshop-dev-mongodb
roboshop-dev-redis
roboshop-dev-mysql


roboshop-UAT-mongodb
roboshop-UAT-redis
roboshop-UAT-mysql

roboshop-PROD-mongodb
roboshop-PROD-redis
roboshop-PROD-mysql
sites:
mongodb-dev.lakshmireddy.site

pros:
====
no need to duplicate the code
consitency

cons:
====
should be very cautious change done in DEV may go to prod alos by mistake
bash:
terraform init -backend-config=dev/backend.tf
terraform plan -var-file=dev/dev.tfvars
terraform apply -var-file=dev/dev.tfvars

If you want to change the environment 
terraform init -reconfigure -backend-config=prod/backend.tf
terraform plan -var-file=prod/prod.tfvars
terraform apply -var-file=prod/prod.tfvars

pros:
====
no need to duplicate the code
consitency

cons:
====
should be very cautious change done in DEV may go to prod aśḍlos by mistake

workspace:
========
workspace means multiple environements
creating workspace:
terraform workspace new dev
select workspace:
terraform workspace select dev
terraform.workspace=dev/prod
lookup(map,key) ---> dev
lookup(map,qa,"t3.micro") 

terraform workspace select prod


Iaac Advanatges:
==================
variables ----> default,terraform.tfvars,command line,ENV variable
conditions ----> expression ? "true" : "false"
loops -----> count based loop, for each loop, dynamic blocks
data types ----> number,bool,string,list,map
functions ----> in builtin functions,merge,toset,length ....
data sources ----> query the exsitsing information in the provider
outputs ----> print the o/p information
Provisioners ----> local exec remote exec
locals ---> assign expression/functions to a variable and use it whatever required
state and remote state ----> s3 with locking
Multiple environements:
		tfvars
		workspace
terraform workspace
terraform workspace create dev ---> It will create a floder in s3 bucket env: ->
dev floder
terraform workspace select dev

terraform.workspace ---> dev/prod
roboshop-infra-dev
roboshop-infra-prod


terraform modules:
==================
DRY ----> functions,variables,ansible roles .....

module ---- common code 
project --- pass the variable which are mandatory

small projects ---> Devops engineers develop modules and use the modules
big projects ----> sep team called platform engineers they devlop the modules indidival project devops engineers use the modules

terraform naming conventions:
=============================

humans ---> terraform_module, terraform-module
use hypen where names are seen by humans

programs ---> _resource names, data source, variables, outputs ,...... etc.
use lower case and numbers
don't repeat resource type in resource name
Resource name should be named this if there is no more descriptive and general name available

use plural for list

modules uses:
=============
centralized code and resuse
enforcing standards throught modules ---> conditons
changes at one place can be cascaded to all
easy maintances

VPC:
on primises:
==========
physical space
power
network
AC
physical security
Buy server
Install OS
configure networking

Data centre == VPC
VPC means an isolated space where we can create project resources and control them




terraform-aws-instance
    variables
    locals
    functions
    resources
    outputs --- instance_id
    data sources
    readme.md 

roboshop-ec2

modules "roboshop" {
    source = "../terraform-aws-instance"
    #mandatory values and values should be given
    var-name = value
    # we can also overide the deafault values

}

output "name" {
    module.roboshop.instance_id  # you will get instance id as a output
}

VPC:

entrance --->village ----> streets ---> Roads
IGW ---->    VPC -------> Subnets ----> Routes

SYS1 ---> SYS2 --->(small connection) CONNECT means networking . He for multiple system connections we use IGW

Example:
pincode ---500032
VPC ---> CIDR
subents -----> streets

32 bits = 4 * 8
why we are creatin 2 availablity zones:
beacuse of disater recovery
1 region altest have 2 availablity zones

manual VPC creation :
=======================

VPC ----> vpc only ---> roboshop --> CIDR = 10.0.0.0/16 ---> create vpc
now need to attach IGW
internet gateway ---> roboshop --> Attach to VPC --> create
now we will create subnets
subnets ---> create subnet ---> name ---> roboshop-public-1a ---> subenet cidr block 
=10.0.1.0/24 ---> create
subnets ---> create subnet ---> name ---> roboshop-public-1b ---> subenet cidr block 
=10.0.2.0/24 ---> create

subnets ---> create subnet ---> name ---> roboshop-private-1a ---> subenet cidr block 
= 10.0.11.0/24 ---> create
subnets ---> create subnet ---> name ---> roboshop-private-1b ---> subenet cidr block 
= 10.0.12.0/24 ---> create

subnets ---> create subnet ---> name ---> roboshop-database-1a ---> subenet cidr block 
= 10.0.21.0/24 ---> create
subnets ---> create subnet ---> name ---> roboshop-database-1b ---> subenet cidr block 
= 10.0.22.0/24 ---> create

Now we will create route tables for each

route table ---> create route table ---> roboshop public ---> vpc ---> create
vpc ---> route table ---> edit ---->
public means ----> 0.0.0.0/0 ---> internet notation----> Internet gateway
subnet assications ---> edit ---> and public ---> save
attach route to public----> vpc ---> route tables ---> edit and attach

Here the request will come from local and internet gateway/ it will conatin routeto the internet

route table ---> create route table ---> roboshop private ---> vpc ---> create
subnet assiocation ---> add private ---dsave
route table ---> create route table ---> roboshop-database ---> vpc ---> create
subnet assiocation ---> add database ---dsave



---------------------
create VPC
Create IGW
attach VPC to IGW
create 2 public subnets
create 2 private subnets
create 2 database subnets
create public route
add inetrent as a route throught IGW
attach public 1a and public 1b
create private route
attach private 1a and private 1b
create database route
attach database 1a and database 1b
-----------------------------------------------------------------------
ROBOSHOP:
============
# frontend
80 ----> http ---> public
443 ----> https --->public sercure
22 ----> ssh ----> login for admins

* before creating instances we need SG


# if we want install any packages or doing anything from private
ex: take vpc real time example
here public will not directly ta with database( means there is no scope for incoming traffic)
but private is can talk with public (means outgoing traffic)

dnf install mysql-server ----> HTTP
outgoing -----> incoming
here waht is incoming traffic and what is outgoing traffic
incoming means someone is connecting wih mysql

consider we have one linux server: that need to hit the repo--->

here ingress traffic is not safe but egress tarffic is safe.
In that case we use NAT gates
It will take the traffic from outside
lest consider we have EC2 in database 

internet<-----tarffic <------NAT gate <-------- EC2
ingress           egress

here ec2 will request NAT gate.it will take traffic.
NAT means it is a service in AWS. It contain Elastic Ip

ec2 public instances on restart then the pubic Ip are changed. But are using rs3 based on the IP's --> It is not work if we restart--->it will change in the backend
NAT gateaway is also background server is in EC2 --->
so while creating the NAT gateway we need to give elastic IP ---> to get static IP
we can request to ISP(internet provier services) to provide static Ip.
They will provide and they will charge. IPv4 ---> here if server restared then the ip is not changed

before creating NAT gate:
===============================
VPC ----> elastip ----> us-east-1 ---> we will get one IP ---> we can use wherever we want
VPC ----> create NAT ------> roboshop-dev ----> allocate elstic ip ---> create

so here
elastic ip ----> NAT gate ----> we need to add route 

NAT gateway doesn't require IGW but if NAT gateway wants to go out it needs go from IGW ----> we added public subnet to IGW

internet<-----IGW <------tarffic <------NAT gate <-------- EC2
ingress                                                   egress

==================


what we complted:
================
VPC
IGW and associate with VPC
subnets
elasti ip
NAT
ROUTE tables
routes
subnets and route table associations
# peering
-=====================

two villages can communicate:
============================
1. should have diffrent pincode
2. roads should be available
default two vpc's by can't connect. If we want we can enable VPC peering.

2nd VPC possiblities:
=====================
my account same region
my account diffrent region

diff account diff region
diff account same region

# here i am connection with default vpc
VPC ---->  peering connection ---> create ---> roboshop-default --->account =my account ----> region=this region ---> vpc id ---> create peering ---> Accept

# now need to create aroad right

roboshop (10.0.0.0/16) ---> default (172.31.0.0/16)

roboshop public ---> default VPC
public RT destination is 172.31.0.0/16
target peering

deafult VPC
destination 10.0.0.0/16
target peering

connections:
==============

VPC ---> route tables ----> roboshop-public-dev ----> routes ---> edit routes --->
add route ---> (172.31.0.0/16) ---> peering connection ----> select -----> save

# now mypublic instance is reach out to default VPC

# now default VPC needs to send the tarffic back

VPC ---> route tables ----> default ----> routes ---> edit routes --->
add route ---> (10.0.0.0/16) ---> peering connection ----> select -----> save
# this is manullay ---> delete after we will do from terraform
===========================  ================================

VPC -----> create ----Vpcforinstance

EC2 ---> default--->t3.micro---->sg (public)---> create ---> lanch
EC2 ---> roboshop--->t3.micro---->sg(private) ---> create ---> lanch

default ---> sudo dnf install nginx ----->systemctl start nginx ---> curl localhost--> It will give resposne
publicip

roboshop ----> curl <default-publicI> ----> It will give resposnes
roboshop ----> curl <default-private> ----> It will not give resposnes ----> beacuse there is no connection b/w them
# now we will create connection b/w them
VPC ----> peering connection ---->roboshop-default ---->roboshop(VPC) -----> my account ---> my region ---> default(vpc) ----> create---> Accept
# now we have generated peering connection
# before taking IP it will check routes
# the traffic will go from subnets
# 1st traffic will go from instances ---> egrss traffic(outbound) ------>
Ec2---->roboshop ----> oubound traffic -----> all all ----> from here the taffic will go out and check in subnet
# curl <default-private> is this Ip in this network 
subnet ----> roboshop-public-us-east-1a ----> route table ----> 10.0.0.0/16 =local  ---> No
                                                                0.0.0.0/0 =IGW ----> Yes
# we need to create route table 
route table ---> roboshop-dev-public ---> here we need to create one route ---> edit ----> 172.31.0.0/16 (CIDR range for default VPC)-----> IGW ----> here we need to entre from the peering ----> peering connection -----> save changes
# till here the traffic come from subnet from it is not conneted to another beacuse there is no route on default side
# we need to add here also
route table ---> default ---> route ---> edit ----> 10.0.0.0/16 ----> peering connection ----> save
# now we will check on roboshop ec2
check with private ip
telent <default-privateip> or we can also do shh ec2-user <ip>
# delete and we will done from terraform


=========================-============================================

------------------------AWS-----------------
eip
aws IGW
NAT gateway
aws_route.database
aws_route.private
aws_route.pubic
aws_route_table.database 
aws_route_table.private
aws_route_table.public
aws_route_table_association.database
aws_route_table_association.database
aws_route_table_association.private
aws_route_table_association.private
aws_route_table_association.public
aws_route_table_association.public
aws_subnet.database
aws_subnet.database
aws_subnet.private
aws_subnet.private
aws_subnet.public
aws_subnet.public

-----------------------------
# now we will add git url and take the code from remote
here we are giving source location from location we need to chage that to git
source = "git:: https://github.com/Lakshmiredddy/Terraform.git?ref=main
terraform init -reconfigure
terraform init -upgrade ---> It will give all updated changes

it will download the module
terraform init --upgrade ----> It will give all latest changes

