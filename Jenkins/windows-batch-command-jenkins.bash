Windows batch commands are a set of commands used in a **Command Prompt** or a `.bat` script to automate tasks on Windows. Here is a list of commonly used batch commands with examples:

---

### **Basic Commands**

1. **Display Text**:
   ```bat
   echo Hello, World!
   ```
   - Prints `Hello, World!` to the console.

2. **Create a Pause**:
   ```bat
   pause
   ```
   - Waits for user input to continue.

3. **Clear the Screen**:
   ```bat
   cls
   ```
   - Clears the Command Prompt window.

4. **Change Directory**:
   ```bat
   cd C:\Users\YourName\Documents
   ```
   - Changes the current directory to `Documents`.

---

### **File and Folder Management**

1. **Create a Folder**:
   ```bat
   mkdir MyFolder
   ```
   - Creates a folder named `MyFolder`.

2. **Delete a Folder**:
   ```bat
   rmdir MyFolder /s /q
   ```
   - Deletes the folder `MyFolder` and all its contents. `/s` for subdirectories, `/q` for quiet mode.

3. **Create a File**:
   ```bat
   echo This is a test file. > TestFile.txt
   ```
   - Creates `TestFile.txt` and writes "This is a test file."

4. **Delete a File**:
   ```bat
   del TestFile.txt
   ```
   - Deletes `TestFile.txt`.

5. **Rename a File or Folder**:
   ```bat
   ren OldName.txt NewName.txt
   ```
   - Renames `OldName.txt` to `NewName.txt`.

---

### **System Information and Utilities**

1. **Show Current Directory**:
   ```bat
   echo %cd%
   ```
   - Displays the current directory.

2. **Show Environment Variables**:
   ```bat
   set
   ```
   - Lists all environment variables.

3. **System Information**:
   ```bat
   systeminfo
   ```
   - Displays system information.

4. **Task Manager Equivalent**:
   ```bat
   tasklist
   ```
   - Lists running processes.

5. **Kill a Task**:
   ```bat
   taskkill /im notepad.exe /f
   ```
   - Forcefully closes `notepad.exe`.

---

### **Looping and Conditions**

1. **For Loop**:
   ```bat
   for %%f in (*.txt) do echo %%f
   ```
   - Loops through all `.txt` files in the current directory.

2. **If Condition**:
   ```bat
   if exist TestFile.txt (
       echo File exists.
   ) else (
       echo File does not exist.
   )
   ```
   - Checks if `TestFile.txt` exists.

---

### **Networking**

1. **Ping a Server**:
   ```bat
   ping www.google.com
   ```
   - Sends a ping request to Google.

2. **Check Network Configuration**:
   ```bat
   ipconfig
   ```
   - Displays network configuration.

3. **Map a Network Drive**:
   ```bat
   net use Z: \\Server\Share /user:username password
   ```
   - Maps a network drive to `Z:`.

---

### **Redirect Output**

1. **Redirect Output to a File**:
   ```bat
   dir > output.txt
   ```
   - Saves the output of `dir` to `output.txt`.

2. **Append Output to a File**:
   ```bat
   dir >> output.txt
   ```
   - Appends the output of `dir` to `output.txt`.

---

### **Advanced Examples**

1. **Batch Script to Copy Files**:
   ```bat
   xcopy "C:\SourceFolder" "D:\DestinationFolder" /s /e /i
   ```
   - Copies files and directories from `SourceFolder` to `DestinationFolder`.

2. **Batch Script to Run Another Program**:
   ```bat
   start notepad.exe
   ```
   - Opens Notepad.

3. **Shutdown Command**:
   ```bat
   shutdown /s /t 30
   ```
   - Shuts down the system after 30 seconds.

4. **Check System Date and Time**:
   ```bat
   echo %date%
   echo %time%
   ```
   - Displays the current date and time.

---

### **Combine Commands in a Batch File**
Save the following code as `example.bat` and run it:
```bat
@echo off
echo Starting batch script...
mkdir TestFolder
cd TestFolder
echo This is a test file. > TestFile.txt
echo File created successfully!
pause
```

---

Let me know if you have specific use cases or tasks to automate with batch commands!