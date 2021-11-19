module "myvpc_module"{
    source="./modules/vpc"
    vpc_cidr="10.0.0.0/16"
    subnets=[
            {

                "cidr":"10.0.1.0/24"
                "zone":"eu-west-1a"
            },
            {

                "cidr":"10.0.2.0/24"
                "zone":"eu-west-1b"
            },
            {

                "cidr":"10.0.3.0/24"
                "zone":"eu-west-1c"
            }
            ]
}