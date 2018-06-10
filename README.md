Purpose: To finish configuring an automation control host.  This is intended to be a "Part II" to the prep_auto_server.bash script stored in a different repo.

Customization:
* there are variables in the playbook ensure_control_platform.yml that include generic defaults

Outputs:
* ensures additional Ansible dependencies
* ensures a directory called 'sandbox' in $HOME/current_user as a known working directory
* ensures a password hashing script is present
* sets up a ISO library template as a prerequisite for Hashicorp packer
* ensures local service accounts in an ansible vault and password
* ensures an include directory structure and local environmental variable files
* installs Hashicorp packer (and additional dependencies) to be used an imager
* sets up an example inventory that can be used with projects that follow this one
* ensures root account credential for other hosts as a sane default
* makes an attempt to guess locale settings to be used as semi-sane defaults
* does housekeeping (cleans up prior prep_auto_script)

Next Steps (after playbook is run):
* copy the example inventory to something useful (e.g. 'build' or 'infrastructure')
* customize the example inventory 

Caveats:
* assumes a minimal network that has Internet access
* assumes DNS is functional (possibly provided by upstream servers)
* assumes that the inventory and repo directory created by prep_auto_server.bash are present
