resource "aws_key_pair" "example_key" {
  key_name   = "${var.key_pair_name}-${var.env}"
  public_key = var.key_pair_value
}
