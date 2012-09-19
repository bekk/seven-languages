# Run an Io program from a file
# "Hello World!" println

# Execute the code in a slot given its name
SlotMachine := Object clone
SlotMachine slot := method("Dette er en slot" println)
SlotMachine slot

