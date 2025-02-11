# 🏡 dbt Airbnb Transformation  

## 📌 Overview  
This project implements **dbt (Data Build Tool)** to transform and model Airbnb data using **Snowflake** as the database. It leverages **modular SQL development** to create **structured, reusable, and optimized data models** for better analytics. The project follows **best practices for ELT (Extract, Load, Transform) workflows**, improving data consistency, efficiency, and scalability.

---

## 🚀 Functionalities Implemented  

### 🏗️ Data Transformation & Cleansing  
- Standardized and cleansed Airbnb dataset for consistency.  
- Applied **filtering, deduplication, and typecasting** to maintain data integrity.  

### 🏛️ Data Materialization  
- Implemented **ephemeral, view, table, and incremental models** for optimized query performance.  
- Efficient data transformation using **incremental loading strategies** in **Snowflake**.  

### 🔄 Source Freshness & Snapshots  
- Implemented **source freshness checks** to validate real-time data updates in **Snowflake**.  
- Created **snapshot models** for tracking historical changes in Airbnb listings.  

### 🛠️ Custom & Dynamic Testing  
- Implemented **singular and generic tests** to validate data integrity.  
- Leveraged **dbt_utils** for custom tests, such as **not_null_proportion** and **expression_is_true**.  
- Integrated **Great Expectations via dbt_expectations** for robust data quality checks.  

### 🏗️ Macros & Custom Functions  
- Created **custom dbt macros** for parameterized transformations.  
- Developed **reusable SQL logic** to optimize data pipelines.  

### 📖 Comprehensive Documentation  
- Added **metadata-rich dbt documentation** for models and sources.  
- Automated **schema.yml documentation** generation.  

### 📊 Power BI Dashboards  
- Exported dbt-transformed tables to **Power BI** for visualization.  
- Created interactive dashboards to track Airbnb performance insights.  

### ⛓️ Orchestration with Dagster  
- Integrated **Dagster** for end-to-end pipeline orchestration.  
- Automated **dbt runs and tests** as part of a structured data pipeline.  

---

## 🛠️ Setup & Installation  

### 1️⃣ Clone the Repository  
```bash
git clone https://github.com/Shiva-prakash-perumal/dbt-airbnb-transformation.git
cd dbt-airbnb-transformation
```

### 2️⃣ Move Dagster Directory Out  
Since **Dagster** needs to run independently, move the `dagster/` directory **outside** the dbt project folder:  
```bash
mv dagster ../dagster_project
```

### 3️⃣ Create and Activate a Virtual Environment  
```bash
python -m venv dbt_env
source dbt_env/bin/activate  # For macOS/Linux
dbt_env\Scripts\activate     # For Windows
```

### 4️⃣ Install Dependencies  
Ensure you have `dbt` and other dependencies installed:  
```bash
pip install dbt-core dbt-snowflake dbt-utils dbt-expectations dagster dagster-dbt dagster-webserver
```

### 5️⃣ Configure dbt Profile for Snowflake  
Set up your `profiles.yml` file in `~/.dbt/` (for macOS/Linux) or `%USERPROFILE%\.dbt\` (for Windows).

Example `profiles.yml` for **Snowflake**:
```yaml
airbnb_project:
  target: dev
  outputs:
    dev:
      type: snowflake
      account: your_snowflake_account
      user: your_username
      password: your_password
      role: your_role
      database: your_database
      warehouse: your_warehouse
      schema: public
      threads: 4
      client_session_keep_alive: False
```
*Modify the connection details to match your Snowflake setup.*

### 6️⃣ Run Dagster Server  
Now, move to the Dagster project directory and start the Dagster UI and dbt pipeline:  
```bash
cd ../dagster_project
DAGSTER_DBT_PARSE_PROJECT_ON_LOAD=1 dagster dev # For macOS/Linux
```
This will launch the Dagster **webserver** and automatically parse your dbt project.

---

## 🚀 Running dbt Commands  

### 1️⃣ Test Connection  
Ensure dbt is correctly configured by running:  
```bash
dbt debug
```

### 2️⃣ Run dbt Models  
Execute the transformation models in **Snowflake**:  
```bash
dbt run
```

### 3️⃣ Test Data Models  
Run data quality checks:  
```bash
dbt test
```

### 4️⃣ Generate dbt Documentation  
```bash
dbt docs generate
dbt docs serve
```
This will open an interactive documentation UI in your browser.

### 5️⃣ Run Source Freshness Check  
```bash
dbt source freshness
```

### 6️⃣ Execute Snapshots  
```bash
dbt snapshot
```
### 7️⃣ Passing a time range to our incremental model
```
dbt run --select fct_reviews  --vars '{start_date: "2024-02-15 00:00:00", end_date: "2024-03-15 23:59:59"}'
```

### 8️⃣ Run dbt with Dagster  
Once the Dagster UI is running, you can trigger dbt runs from the Dagster dashboard. Alternatively, execute:  
```bash
dagster pipeline execute -p dbt_airbnb_pipeline
```

---

## 📁 Project Structure  

```
dbt-airbnb-transformation/
│── models/                  # dbt models (SQL transformations)
│   ├── staging/             # Staging models
│   ├── marts/               # Final analytics-ready tables
│   ├── intermediate/        # Intermediate transformations
│── seeds/                   # Static reference data
│── tests/                   # Custom data tests
│── macros/                  # Custom dbt macros
│── snapshots/               # Snapshot models for historical tracking
│── dashboards/              # Power BI Reports & Visualization Exports
│── dbt_project.yml          # dbt project configuration
│── README.md                # Project documentation
../dagster_project/           # Dagster orchestration (moved outside dbt folder)
```

---

## 🏆 Key Features  
✔️ **Modular & Scalable**: dbt ensures structured and maintainable transformations.  
✔️ **Automated Testing**: Includes built-in `dbt test` and `dbt_expectations` for data quality.  
✔️ **Efficient Source Freshness Tracking**: Ensures real-time updates in **Snowflake**.  
✔️ **Snapshot-Based Change Tracking**: Maintains historical changes in Airbnb listings.  
✔️ **Optimized SQL Models**: Efficiently transforms Airbnb datasets for analytics.  
✔️ **Seamless Integration with Snowflake**: Uses **Snowflake** as the primary data warehouse.  
✔️ **Orchestration with Dagster**: Automates dbt workflows with **Dagster**.  

---

## Feel free to fork the repo!!  

## Happy Coding!!

