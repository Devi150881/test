#! /bin/bash
sudo amazon-linux-extras install nginx1 -y
sudo systemctl enable nginx
sudo systemctl start nginx 
sudo aws s3 cp "${s3_path}" /usr/share/nginx/html
sudo systemctl restart nginx 


