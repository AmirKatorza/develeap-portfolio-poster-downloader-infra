resource "aws_subnet" "public_subnets" {
  count                   = var.num_subnets
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = cidrsubnet(var.vpc_cidr, var.cidr_offset, count.index)
  map_public_ip_on_launch = var.map_public_ip_on_launch
  availability_zone       = element(data.aws_availability_zones.available.names, count.index % length(data.aws_availability_zones.available.names))

  tags = merge(
    {
      "Name"                   = "${var.vpc_name}-subnet-${count.index + 1}"
      "kubernetes.io/role/elb" = "1"
    },
    { "kubernetes.io/cluster/${var.cluster_name}" = "owned" }
  )
}

data "aws_availability_zones" "available" {
  state = "available"
}