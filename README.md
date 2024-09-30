# Cyberdb

This program is a Python-based database management system for a Cyberpunk-themed role-playing game. It allows users to manage and interact with various game elements such as characters, locations, groups, and encounters.

## Features

- Connect to and manage an Oracle database
- View and add data for characters, groups, locations, regions, and encounters
- Generate random encounters based on zone and time
- Export all data to a file
- Perform keyword searches across tables

## Requirements

- Python 3.x
- Oracle Database
- oracledb Python library

## Setup

1. Ensure you have Python 3.x installed on your system.
2. Install the required Oracle database driver:
   ```
   pip install oracledb
   ```
3. Set up your Oracle database and update the connection details in the script:
   ```python
   username = "your_username"
   password = "your_password"
   dsn = "your_dsn"
   ```

## Usage

Run the main script:

```
python cyberpy.py
```

Follow the on-screen prompts to navigate through the program's features.

## File Structure

- `cyberpy.py`: Main Python script containing the program logic
- `cyberinsert.sql`: SQL script for inserting initial data into the database
- `cyberprogramblock.sql`: SQL script containing stored procedures for database operations

## Database Structure

The program uses the following main tables:

- CHARACTERS
- GROUPS
- LOCATIONS
- REGION
- ENCOUNTERS

And relationship tables:

- AFFILIATIONS
- POINTSOFINTEREST
- ENCOUNTER_CHARACTERS
- ENCOUNTER_GROUPS

## Contributing

Contributions to improve the program are welcome. Please fork the repository and submit a pull request with your changes.

## License

This project is open source and available under the [Apache License](LICENSE).
