resource "aws_key_pair" "tf-demo" {
  key_name   = "tf-demo"
  public_key = file("tf-demo.pub")
  # public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC53gxxSdkQrW8FZT1NjjndJ0iQ3kMOHSY3AfeeIAlA0XCVSN0DQaPgK2jKR5bMXytiemnIfioLmvZHPU4Aun7PAVFFjGwULXOwqIccVZ86afdbtDyB0lr+7NtTBlsFF2ne0XtSpgSugyKXsdmurSMFbO76mbHHLh8dBcSyUmx/+K6V/ZMVq0cTsAbKsAd5zmh4GSgK3Arg96oMH5ELn2GC7EgX64L8ClW7kLcB5PjUDmGycYW88s9zOjImRTvBk6rscOaYrWljHst2TfukupFXuzKb1A6UWq36cq4U6dtrjrXSKauyRTyS1Hjl2bUId0PI98+O/l1+GlGoo+LiMB0DnF4oJQOyuFEvVGxcQMhOKKcpsRL/a3iudXRdqW0Bqk5z8Rsjf4jRx1hts8n8nbfIpRrAYu2Z/0AxYC1ecKKKPjHViMPUTkIRj1es38iiIrwlf3WdFf/nnxzw27Esod6H+aj6cnFL4nuQLqoB8W+AnKAIUBEsH/FlwzQIHE3ndDc= akhilesh.trivedi@akhilesh-2.local"
}
resource "aws_instance" "my_ec2" {
  count         = var.instance_count
  ami           = lookup(var.AMI, var.region)
  instance_type = var.instance_type
  key_name      = aws_key_pair.tf-demo.key_name
  user_data     = file("install_httpd.sh")
  tags = {
    # name = "Terraform-${count.index + 1}"
    name = element(var.instance_tags, count.index)
  }
}
