# PhxStarter: a quick setup for Phoenix apps running on AWS EC2 Ubuntu instances

## Setting up

- Create and launch an AWS instance (match ubuntu version with `Dockerfile`)
- Update SSH config file with temporary IP (or Elastic IP) - make sure entry is there for `ubuntu` user and admin user
- Update `nginx_server_address` variable (ansible)
- Run `ansible-galaxy role install geerlingguy.nginx`
- Run `ansible-galaxy role install geerlingguy.postgresql`
- In the ansible dir, generate secrets for `database_password` and `secret_key_base`: `ansible-vault encrypt_string [secret] --name [var]`
- Run `./setup.sh`
- Check that IP address is same after reboot (if IP dynamically allocated) - if not update SSH config again
- Move onto first deploy in section below (page won't load at this point)
- Move on to HTTPS section

## Deployments

- Run `./deploy.sh` - this will take care of building the release, copying it to remote server and starting it

## Setting up HTTPS with domain

- Go to AWS Route 53 and create hosted zone
- Create Elastic IP if not already done and associate it with instance
- Create a DNS record for root domain and `www` (with Elastic IP)
- Update SSH config to reflect new IP if it has changed
- Set `email` and `domain` in ansible setup
- Run `./setup_https.sh`

## Running locally

- Run `mix ecto.create` to create local DB

To start your Phoenix server:

- Run `mix setup` to install and setup dependencies
- Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.
