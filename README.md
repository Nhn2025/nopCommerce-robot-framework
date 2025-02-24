# Robot Framework with Python

This repository contains tests written in Robot Framework for automating various tasks using Python. The tests can be run using the robot command, and the results will be stored in a specified directory for further analysis.

# Prerequisites
Before running the tests, make sure you have the following installed:
1. Python 3.13.2
2. Robot Framework: You can install Robot Framework via pip:
```pip install robotframework```
3. Other dependencies: Install any additional libraries required for the tests (e.g., Selenium, Requests, etc.). You can list them in the requirements.txt or install them manually.
```pip install robotframework-seleniumlibrary```

# Running the Tests
To run the tests, use the following command:
```robot -d results path/to/your/testFile.robot```

# Parameters:
```-d results```: This option specifies the directory where the test results will be stored. In this case, the results will be placed in a folder called results.
```path/to/your/testFile.robot:``` Replace this with the path to the specific .robot file or directory containing the test files you want to run.
For example, if you want to run a test file named fileName.robot located in the Tests/... directory, use this command:
```robot -d results Tests/.../fileName.robot```
The test results will be saved in the results directory, including logs and reports that you can review.

# Viewing Results
After running the tests, the following files will be generated in the results directory:
```log.html```: Detailed log of the test execution.
```report.html```: A high-level summary of the test run.
You can open these files in a web browser to view the results.

# Example Folder Structure
Here's an example of what your project directory might look like:

```
RotbotFramework/
│
├── Libraries/                            # Custom libraries or reusable code
│
├── Resources/                            # Resource files such as data, images, etc.
│
├── Results/                              # Folder to store the results of test executions
│   ├── log.html                          # Log file containing execution details
│   ├── output.xml                        # XML file with structured test results
│   └── report.html                       # HTML report summarizing the test results
│
├── Tests/                                # Folder for test scripts
│   ├── eBay/                             # eBay-related test cases
│   │   ├── FunctionalTestSuite/          # Test suite for eBay functionality
│   │   │   ├── BasicSearch.robot        # Test script for eBay's basic search functionality
│   ├── Google/                           # Google-related test cases
│   │   ├── FunctionalTestSuite/          # Test suite for Google functionality
│   │   │   ├── GoogleSearch.robot       # Test script for Google's search functionality
│   └── OrangeHRM/                        # OrangeHRM-related test cases
│       ├── FunctionalTestSuite/          # Test suite for OrangeHRM functionality
│       │   ├── HRMLogin.robot           # Test script for HRM login functionality (example)
│
└── README.md                             # Project documentation, setup, and instructions
```

# Contributing
If you'd like to contribute to this project, feel free to open an issue or submit a pull request. Please make sure to follow the existing code style and include test coverage for new features or fixes.

# License
This project is licensed under the MIT License - see the LICENSE file for details.

