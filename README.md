# Robot Framework with Python

This repository contains tests written in Robot Framework for automating various tasks using Python. The tests can be run using the robot command, and the results will be stored in a specified directory for further analysis.

# Prerequisites
Before running the tests, make sure you have the following installed:
1. Python 3.13.2
2. Robot Framework: You can install Robot Framework via pip:
```pip install robotframework```
3. Other dependencies: Install any additional libraries required for the tests (e.g., Selenium, Requests, etc.). You can list them in the requirements.txt or install them manually.
```pip install robotframework-seleniumlibrary```
4. PyCharm Extension: IntelliBot (for better support in writing Robot Framework test cases in VS Code)
  - Open PyCharm
  - Go to Extensions (Ctrl+Shift+X)
  - Search for IntelliBot @robotframework
  - Install the extension
  - Restart PyCharm if necessary

# Running the Tests
To run the tests, use the following command:
```robot -d results path/to/your/testFile.robot```
```robot -d results -v env:uat path/to/your/testFile.robot```

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
RobotFramework/
│
├── .github/
│   ├── workflows/
│   │   ├── robot_ci.yml  # File cấu hình GitHub Actions để chạy test tự động
│
├── Libraries/                             
│
├── Resources/      
│   ├── Commons/  
│   │   ├── CommonFunctionality.robot                      
│   ├── Data/   
│   │   ├── RegisterData.robot           
│   ├── PageObjects/    
│   │   ├── HeaderPageObject.robot  
│   │   ├── RegisterPageObject.robot                       
│   ├── PageUIs/  
│   │   ├── HeaderPageUI.py  
│   │   ├── RegisterPageUI.py
│
├── Results/                              
│   ├── log.html                          
│   ├── output.xml                        
│   ├── report.html                       
│
├── Tests/                                
│   ├── nopCommerce/
│   │   ├── FunctionalTestSuite/  
│   │   │   ├── Verify_register_functionality.robot     
│
├── README.md          
├── requirements.txt
├── run_tests.sh              
```

