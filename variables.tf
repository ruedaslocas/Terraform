#en este fichero crearemos las variables para el main 
#variable "nombre de varibale"

#variable para crear RG
variable "nombre_grupo" {
  type        = string
  description = "nombre que se le dara al RG"
}

#variable para dar la localizacion al rg
variable "localizacion_rg" {
  type        = string
  description = "en que region se encuentra en este caso West Europe"
}

variable "nombre_sa" {
  type        = string
  description = "nombre del SA"
}

variable "containers" {
  #crear todos los container para el SA
  type        = list(any)
  description = "nombres para los blob containers"
  default     = ["log", "files", "events", "nts"]
}

