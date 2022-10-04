/*Subnets Block*/
variable "sn-reserved" { type = list(string) }
variable "sn-db" { type = list(string) }
variable "sn-app" { type = list(string) }
variable "sn-web" { type = list(string) }
variable "sn-zone" {type = list(string)}

/*AZs us-east-1*/
variable "azs" { type = list(string) }

/*security group*/
variable "sg-ports" { type = list(number)}

