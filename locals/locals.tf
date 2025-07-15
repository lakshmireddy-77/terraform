locals {
  final_name="${var.project}-${var.environement}-${var.component}"
  ec2_tags = merge(
    var.common_tags,
    {
      environement= "dev"
      version = "1.0"
    }
  )
}
# here we can write some static tags