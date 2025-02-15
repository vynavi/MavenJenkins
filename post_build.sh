#!/bin/bash
echo "Post-build operations are being executed..."

# Example: Move the generated .jar file to a specific directory
if [ -f target/*.jar ]; then
    echo "Moving .jar file to /opt/deploy/"
    mv target/*.jar /opt/deploy/
else
    echo "No .jar file found in target directory."
fi

# Additional tasks like logging, cleanup, etc., can be added here
echo "Post-build tasks completed."
