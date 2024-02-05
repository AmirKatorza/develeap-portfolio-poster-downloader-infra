resource "aws_subnet" "public_subnet_1a" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = var.subnet_1a_cidr
  map_public_ip_on_launch = true
  availability_zone       = var.subnet_1a_az

  tags = merge(
    {
      "Name"                   = var.subnet_1a_name
      "kubernetes.io/role/elb" = "1"
    },
    { "kubernetes.io/cluster/${var.cluster_name}" = "owned" }
  )
}

resource "aws_subnet" "public_subnet_1b" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = var.subnet_1b_cidr
  map_public_ip_on_launch = true
  availability_zone       = var.subnet_1b_az

  tags = merge(
    {
      "Name"                   = var.subnet_1b_name
      "kubernetes.io/role/elb" = "1"
    },
    { "kubernetes.io/cluster/${var.cluster_name}" = "owned" }
  )
}