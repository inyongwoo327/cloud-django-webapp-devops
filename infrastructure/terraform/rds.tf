resource "aws_db_parameter_group" "postgres16" {
  name        = "custom-postgres16"
  family      = "postgres16"
  description = "Custom parameter group for PostgreSQL 16.3"
}

resource "aws_db_instance" "default" {
    allocated_storage = 20
    engine = "postgres"
    engine_version = "16.3"
    instance_class = "db.t3.micro"
    #name = "mydatabase"
    username = "mydatabaseuser"
    password = "mypassword"
    parameter_group_name = aws_db_parameter_group.postgres16.name
    skip_final_snapshot  = true
    vpc_security_group_ids = [aws_security_group.eks.id]
    db_subnet_group_name = aws_db_subnet_group.default.name

    tags = {
        Name = "mydatabase-instance"
    }
}

resource "aws_db_subnet_group" "default" {
  name       = "main-subnet-group"
  subnet_ids = aws_subnet.public[*].id

  tags = {
    Name = "main-subnet-group"
  }
}