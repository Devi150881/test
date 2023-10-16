variable "project_code" {
    description = "Provide the Project code"
    type        = string   
}

variable "environment" {
  type        = string
  description = <<EOT
    (Optional)  The name of the environment where the resources will be deployed.
 
    Options:
      - dev
      - uat
      - stg
      - prd
      - dso
      - mgt
 
    Default: dev
  EOT
 
  default = "dev"
}

variable "zone" {
    description = "Provide the Zone name"
    type        = string  
}

variable "tier" {
    description = "Provide the Tier name"
    type        = string
  
}

variable "custom_name" {
    description = "Provide the service name for which this alb is going to be used"
    type = string
  
}

variable "create_elb" {
  description = "Create the elb or not"
  type        = bool
  default     = true
}

variable "load_balancer_type" {
  description = "The type of load balancer to create. ."
  type        = string
  default     = "application"
}

variable "internal" {
  description = "Boolean determining if the load balancer is internal or externally facing."
  type        = bool
  default     = false
}

variable "enable_cross_zone_load_balancing" {
  description = "Indicates whether cross zone load balancing should be enabled in network load balancers."
  type        = bool
  default     = true
}

variable "enable_deletion_protection" {
  description = "If true, deletion of the load balancer will be disabled via the AWS API. This will prevent Terraform from deleting the load balancer. Defaults to false."
  type        = bool
  default     = false
}

variable "enable_http2" {
    description = "Indicates whether HTTP/2 is enabled in application load balancers. Defaults to true"
    type        = bool
    default     = true
}

variable "enable_waf_fail_open" {
    description = "Indicates whether to allow a WAF-enabled load balancer to route requests to targets if it is unable to forward the request to AWS WAF. Defaults to false"
    type        = bool
    default     = false
}

variable "idle_timeout" {
    description = "The time in seconds that the connection is allowed to be idle. Only valid for Load Balancers of type application. Default: 60."
    type        = number
    default     = 60
}

variable "preserve_host_header" {
    description = "Indicates whether the Application Load Balancer should preserve the Host header in the HTTP request and send it to the target without any change. Defaults to false"
    type = bool
    default = false
}

variable "desync_mitigation_mode" {
    description = "Determines how the load balancer handles requests that might pose a security risk to an application due to HTTP desync. Valid values are monitor, defensive (default), strictest"
    type = string
    default = "defensive"
}

variable "drop_invalid_header_fields" {
    description = "Indicates whether HTTP headers with header fields that are not valid are removed by the load balancer (true) or routed to targets (false). The default is false"
    type = bool
    default = true
}

variable "ip_address_type" {
  description = "The type of IP addresses used by the subnets for your load balancer. The possible values are ipv4 and dualstack."
  type        = string
  default     = "ipv4"
}

variable "subnet_id" {
  description = "A list of subnets to associate with the load balancer. e.g. ['subnet-1a2b3c4d','subnet-1a2b3c4e','subnet-1a2b3c4f']"
  type        = list(string)
  default     = null
}

variable "alb_private_ip_address" {
  description = "A list of Private IPs to associate with the load balancer"
  type        = list(string)
  default     = null
}

variable "allocation_id" {
  description = "Provide EIP "
  type        = list(string)
  default     = null
  
}

variable "logging_enabled" {
  description = "Whether to enable access loggin"
  default     = false
  type        = bool
}

variable "log_bucket_name" {
  description = "S3 bucket to store access logs"
  default     = ""
  type        = string
}

variable "log_bucket_prefix" {
  description = "S3 bucket prefix. Otherwise logs are stored in bucket root"
  default     = ""
  type        = string
}

variable "vpc_id" {
  description = "VPC id where the load balancer and other resources will be deployed."
  type        = string
  default     = null
}

variable "alb_port" {
  description = "Provide the Port number for Load Balancer target group"
  type        = number
  default     = 80
}

variable "alb_hc_port" {
  description = "Provide the Port number for Load Balancer target group"
  type        = number
  default     = 80
}

variable "alb_protocol" {
  description = "Provide the Protocol for Load balancer target group"
  type        = string
  default     = "HTTP"
}

variable "alb_hc_protocol" {
  description = "Provide the Protocol for Load balancer target group health check"
  type        = string
  default     = "HTTP"
}

variable "connection_termination" {
  description = "Whether to terminate connections at the end of the deregistration timeout on Network Load Balancers. See doc for more information. Default is false"
  type = bool
  default = false
}



variable "target_type" {
  description = "Type of target that you must specify when registering targets with this target group"
  type        = string
  default     = "instance"
}

variable "deregistration_delay" {
  description = "Amount time for Elastic Load Balancing to wait before changing the state of a deregistering target from draining to unused. The range is 0-3600 seconds. The default value is 300 seconds."
  type        = number
  default     = 300
}

variable "slow_start" {
  description = "Amount time for targets to warm up before the load balancer sends them a full share of requests. The range is 30-900 seconds or 0 to disable. The default value is 0 seconds."
  type        = number
  default     = 0
}

variable "proxy_protocol_v2" {
  description = "Whether to enable support for proxy protocol v2 on Network Load Balancers. Default is false"
  type        = bool
  default     = false
  }

variable "alb_hc_enabled" {
  description = "Whether health checks are enabled. Defaults to true"
  type        = bool
  default     = true
}

variable "alb_hc_interval" {
  description = "Approximate amount of time, in seconds, between health checks of an individual target. The range is 5-300. For lambda target groups, it needs to be greater than the timeout of the underlying lambda. Defaults to 30."
  type        = number
  default     = 30
  }

variable "alb_hc_path" {
  description = "Destination for the health check request. Required for HTTP/HTTPS ALB and HTTP alb."
  type        = string
  default = "/"
}

variable "alb_hc_healthy_threshold" {
  description = "Number of consecutive health check successes required before considering a target healthy. The range is 2-10. Defaults to 3."
  type        = number
  default     = 3
}

variable "alb_hc_unhealthy_threshold" {
  description = "Number of consecutive health check failures required before considering a target unhealthy. The range is 2-10. Defaults to 3."
  type        = number
  default     = 3
}

variable "alb_hc_timeout" {
  description = "Amount of time, in seconds, during which no response from a target means a failed health check. The range is 2–120 seconds"
  type        = number
  default     = 10
}

variable "enable-stickiness" {
    description = "Boolean to enable / disable stickiness. Default is true"
    type        = bool
    default     = true
}

variable "stickiness-type" {
    description = "The type of sticky sessions. The only current possible values are lb_cookie, app_cookie for ALBs"
    type        = string
    default     = "lb_cookie"
}

variable "cookie_duration" {
    description = "Only used when the type is lb_cookie. The time period, in seconds, during which requests from a client should be routed to the same target. The default value is 1 day (86400 seconds)."
    type        = number
    default     = 86400
  
}
variable "alb_listener_port" {
  description = "Provide the Port number for Load Balancer target group"
  type        = number
  default     = 80
}

variable "alb_listener_protocol" {
  description = "Provide the Protocol for Load balancer target group"
  type        = string
  default     = "HTTP"
}

variable "default_action_type" {
  description = "Type of routing action. Valid values are forward, redirect, fixed-response, authenticate-cognito and authenticate-oidc."
  type        = string
  default     = "forward"
  
}

variable "security_groups" {
  type = list(string)
  
}
