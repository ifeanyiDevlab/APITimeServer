 resource "aws_ecs_cluster" "main" {}
     resource "aws_ecs_task_definition" "app" {
       family                   = "ecs-task"
       network_mode             = "awsvpc"
       requires_compatibilities = ["FARGATE"]
       cpu                      = "256"
       memory                   = "512"
       container_definitions    = jsonencode([{
         name  = "app-container"
         image = var.container_image
         portMappings = [{
        containerPort = 5000,
        hostPort = 5000 }]
       }])
     }
