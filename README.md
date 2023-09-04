# hyperflex-lite

`hyperflex-lite` project enables you to automate the setup of HyperFlex policies and profiles in Cisco Intersight using a simplified data model.

You define the required infrastructure, including policies and profiles, using structured YAML data files. These files are then used as inputs for Terraform modules. Users don't need an extensive grasp of Terraform concepts like resources, data, loops, or conditionals, as they exclusively work with the YAML data files.

## Project structure

The `hyperflex-lite` project has the following structure:
- **data** folder : This is where users primarily interact by providing their configuration details in YAML files, which describe the desired HyperFlex infrastructure setup.
- **modules** folder : This contains HyperFlex/Intersight modules. These modules use the Intersight Terraform Provider (available at: https://registry.terraform.io/providers/CiscoDevNet/intersight/latest) for defining variables and interacting with Intersight. Some modules include **locals.tf** files to transform data before working with the provider. Typically, users don't need to configure anything in this folder unless they want to add specific functionalities.
- **main** and **locals** files : These files translate the information from the YAML files and act as inputs for the modules mentioned above.
- **terraform.tfvars** file : Users should input there the Intersight URL, the target organization for resource creation, and custom tags for each created object in this file.

## Usage

1. Begin by cloning this repository.
2. Generate API keys within Intersight.
3. In the **terraform.tfvars** file, if you're using an Intersight appliance instead of SaaS, substitute *endpoint* with the target IP/FQDN of the appliance. Change *organization* to your preferred Intersight organization. If desired, include Intersight *tags* as well.
4. In the **data** folder: Craft your desired policy and profile configurations using YAML syntax. Examples are provided for HyperFlex Datacenter, HyperFlex Edge, and HyperFlex Datacenter-no-FI. To introduce new policies or profiles, duplicate existing code blocks and modify the variables accordingly. If a variable isn't specified, HyperFlex-as-Code typically employs the Intersight default object for that resource.
5. Export Intersight API key ID and Intersight API secret key:
```
export TF_VAR_intersight_api_key_id = <intersight_api_key_id>
export TF_VAR_intersight_api_secret_key = <intersight_api_secret_key>
```
6. Use ```terraform init```, ```terraform plan``` and ```terraform apply``` to implement the configuration to Intersight. Et voilà!

## Validate and Deploy

After executing the Terraform commands, it's essential to verify within your Intersight account that all necessary HyperFlex policies and profiles have been created successfully. It's important to note that this project won't initiate a deployment task automatically; the user needs to perform this step manually.

<!> Using the ```terraform destroy``` command might not effectively erase Cisco HyperFlex resources. Indeed, if policies are attached to profiles that were created by Terraform, the *destroy* command might throw an error. If the elimination of policies and profiles from Cisco Intersight is necessary, you have two options :
- Perform the deletions manually.
- Alternativaly, begin by removing manually the profiles, then the command ```terraform destroy``` should work to remove all the remaining policies.