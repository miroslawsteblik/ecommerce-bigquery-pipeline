from setuptools import find_packages, setup

setup(
    name="dagster_ecommerce",
    version="0.0.1",
    packages=find_packages(),
    install_requires=[
        "dagster",
        "dagster-cloud",
        "dagster-dbt",
        "dbt-bigquery",
        "dbt-bigquery",
        "dbt-bigquery",
    ],
    extras_require={
        "dev": [
            "dagster-webserver",
        ]
    },
)