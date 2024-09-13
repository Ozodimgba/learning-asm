#!/bin/bash

# Check if a filename was provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <filename.s>"
    exit 1
fi

# Get the filename without extension
filename=$(basename "$1" .s)

# Assemble
echo "Assembling $1..."
riscv64-linux-gnu-as -o "$filename.o" "$1"
if [ $? -ne 0 ]; then
    echo "Assembly failed!"
    exit 1
fi

# Link
echo "Linking..."
riscv64-linux-gnu-ld -o "$filename" "$filename.o"
if [ $? -ne 0 ]; then
    echo "Linking failed!"
    exit 1
fi

# Run
echo "Running..."
qemu-riscv64 "./$filename"

# Clean up
echo "Cleaning up..."
rm "$filename.o" "$filename"