# Terraform_Microservicios-con-Kubernetes-php-mysql

Microservicios con Kubernetes, docker, php y MySql 

**ENTRAR AL POD** 

kubectl exec -it webapp-6b87bc488d-tglb7 -- bash

minikube start

# Dentro de la carpeta webapp

eval $(minikube docker-env)    

minikube ip

docker build -t ip-nueva:5000/webapp:latest .

## Reviso que se ha creado la imagen correctamente en otra terminal

minikube ssh

minikube images

kubectl apply -f webApp-deployment.yml

kubectl apply -f webApp-service.yml

# Dentro de la carpeta mysql

kubectl apply -f mysql-configmap.yml

kubectl apply -f webApp-pv.yml

kubectl apply -f webApp-pvc.yml

kubectl apply -f webApp-deployment.yml

kubectl apply -f webApp-service.yml

kubectl port-forward service/webApp 8080

# Dentro de la carpeta phpmyadmin

kubectl apply -f phpmyadmin-deployment.yml

kubectl apply -f phpmyadmin-deployment.yml

kubectl port-forward service/phpmyadmin 8080:8080

# Documentación de Terraform

https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/service

# Deployment

kubernetes minikube con terraform: terraform para el deployment del primer microservicio

resource "kubernetes_deployment" "example" {

  metadata {

    name = "terraform-example"

    labels = {

      test = "MyExampleApp"

    }

  }
 
  spec {

    replicas = 2
 
    selector {

      match_labels = {

        test = "MyExampleApp"

      }

    }
 
    template {

      metadata {

        labels = {

          test = "MyExampleApp"

        }

      }
 
      spec {

        container {

          image = "miimagen:0.0.2"

          name  = "example"
 
          resources {

            limits = {

              cpu    = "0.5"

              memory = "512Mi"

            }

            requests = {

              cpu    = "250m"

              memory = "50Mi"

            }

          }

        }

      }

    }

  }

}
 
 # Apuntes Abde

kubernetes minikube con terraform 
 
minikube start

eval $(minikube docker-env)             # Unix shells

minikube docker-env | Invoke-Expression # PowerShell

docker build -t foo:0.0.1 .
 
 