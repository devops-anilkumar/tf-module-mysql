# CREATES CLUSTER
resource "aws_db_instance" "mysql" {
  identifier               = "robot-${var.ENV}-mysql"
  allocated_storage        = 10
  db_name                  = "mydb"
  engine                   = "mysql"
  engine_version           = "5.7"
  instance_class           = "db.t3.micro"
  username                 = "admin1"
  password                 = "RoboShop1"
  parameter_group_name     = aws_db_parameter_group.mysql_pg.name
  skip_final_snapshot      = true    # this will ensure you to take screenshot when you destroy
  db_subnet_group_name     =  aws_db_subnet_group.mysql_subnet_group.name
  vpc_security_group_ids   = [aws_security_group.allow_mysql.id]
}

# CREATES PARAMETER GROUP
resource "aws_db_parameter_group" "mysql_pg" {
  name   = "robot-${var.ENV}-mysql-pg"
  family = "mysql5.7"
}

# CREATES  SUBNET GROUP
resource "aws_db_subnet_group" "mysql_subnet_group" {
  name       = "robot-${var.ENV}-mysql-subnet-group"
  subnet_ids =  data.terraform_remote_state.vpc.outputs.PRIVATE_SUBNET_IDS

  tags = {
    Name = "robot-${var.ENV}-mysql-subnet-group"
  }
}












# resource "aws_elasticache_cluster" "redis" {
#   cluster_id           = "robot-${var.ENV}-redis"
#   engine               = "redis"
#   node_type            = "cache.t3.small"
#   num_cache_nodes      = 1
#   parameter_group_name = aws_elasticache_parameter_group.default.name
#   engine_version       = "6.x"
#   port                 = 6379
#   security_group_ids   =  [aws_security_group.allow_redis.id]
#   subnet_group_name    =  aws_elasticache_subnet_group.redis_subnet_group.name
# }

# #CREATES PARAMETER GROUP
# resource "aws_elasticache_parameter_group" "default" {
#   name            = "robot-${var.ENV}-redis"
#   family          = "redis6.x"
# }

# # CREATES SUBNET GROUP
# resource "aws_elasticache_subnet_group" "redis_subnet_group" {
#   name       = "robot-${var.ENV}-redis-subnet-group"
#   subnet_ids = data.terraform_remote_state.vpc.outputs.PRIVATE_SUBNET_IDS
# }




















