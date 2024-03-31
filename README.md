# bigquery-ecommerce

https://airbyte.com/tutorials/building-an-e-commerce-data-pipeline-a-hands-on-guide-to-using-airbyte-dbt-dagster-and-bigquery

`poetry new <bg_ecommerce>`

`poetry add dbt-bigquery dagster dagster-webserver dagster-dbt dagster-airbyte`

`poetry shell`

`poetry install`

> Create airbyte connections using airbyte UI or Terraform

>> airbyte UI

1. set up airbyte source 
2. set up airbyte destination 
3. create connection

>> Terraform

1. create directory, add `provider.tf` and run `terraform init`
2. Configure :
- `main.tf`, 
- `variable.tf` [variable template] 
- and `vars.tfvars` [customised variables (add to .gitignore)] 
3. Run: `terraform plan --out temp -var-file=vars.tfvars`  to load customised variables
4. Run `terraform apply "temp" ` to initialize 

> dbt

`dbt init` and follow prompts the screens, 

- project: <dbt_project>
- datasetID, <transformed_data> 

cd <dbt_project>

run: `dbt debug` to confirm if all is working.

>> add models

1. marts
2. sources
3. staging

> Dagster

`dagster project scaffold --name dagster_ecommerce`

>> dagster-airbyte

Ensure that module is installed in the dagster directory so dagster can read it 

>> dagster-dbt

You can create a Dagster project that wraps your dbt project by using the dagster-dbt command line interface. Make sure you're in the directory where your `dbt_project.yml` is. 

`dagster-dbt project scaffold --project-name <name>`

In general, it's up to you where to put your Dagster project. It's most common to put your Dagster project at the root of your git repository.

Note: The dagster-dbt project scaffold command creates the Dagster project in whatever directory you run it from. If that's a different directory from where your `dbt_project.yml` lives, then you'll need to provide a value for the --dbt-project-dir option so that Dagster knows where to look for your dbt project.

>> configure Dagster .py files

1. assets.py

The assets.py script is where the configurations for both dbt and Airbyte are managed.

2. constans.py

The constants.py script sets up the dbt project directory. It determines the path to the dbt manifest file.

3. definitions.py

Finally, the definitions.py script brings everything together. It configures a Dagster job by combining assets, schedules, and resources.

4. schedules.py

`DAGSTER_DBT_PARSE_PROJECT_ON_LOAD=1 dagster dev ` to run dagster UI

>> Bigquery

After the dbt jobs have completed, check your BigQuery console to ensure the views have been created in the transformed_data dataset..


