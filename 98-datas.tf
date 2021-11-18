data "template_file" "user_data" {
  template = file("${path.module}/resources.d/script.sh")
}

data "aws_secretsmanager_secret" "mysecretexample" {
  arn = "arn:aws:secretsmanager:eu-west-1:492100326379:secret:mykeysecret-GbasxP"
}