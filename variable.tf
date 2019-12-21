variable "vm_config" {
  type = object({
    name    = string,
    vm_size = string,
  })
}

variable "witelist" {
  type = list(any)
}
