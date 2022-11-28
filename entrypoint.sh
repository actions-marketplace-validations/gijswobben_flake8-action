#!/bin/bash -l

# Put the config in a file
if [ -n "$FLAKE8_CONFIG" ]
then
    echo -e "$FLAKE8_CONFIG" > .flake8
fi

# Install additional package (if applicable)
if [ -n "$ADDITIONAL_PACKAGES" ]
then
    pip install -U $ADDITIONAL_PACKAGES
fi

# Generate Flake8 output if there isn't any
if [ -n "$FLAKE8_OUTPUT" ]
then
    flake8 --exit-zero > flake8_results.txt
fi

# Run the command to parse the Flake8 output
python main.py
