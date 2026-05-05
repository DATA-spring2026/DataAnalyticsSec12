# Office planning

# Define the known

employees = 38
pod = 6

# Calculate the unknown

# How many pods do need in the new floorplan?

full_pods = employees / pod

filled_pods = employees // pod
remaining_emp = employees % pod


# Show the results

print()
print("# of employees divided by pod size", full_pods)

print()
print("Number of completely full pods", filled_pods)
print("Number of employees remaining", remaining_emp)


# Hot dogs at the company picnic

# Start with the known
hot_dog_pack = 10
bun_pack = 8

hot_dog_allocation = 2

# Calculate some hot dog math -- calculate the unknown

hot_dogs_needed = employees * hot_dog_allocation

full_packs = hot_dogs_needed // hot_dog_pack

hot_dogs_still_needed = hot_dogs_needed % hot_dog_pack

if hot_dogs_still_needed != 0:
    full_packs = full_packs + 1

# Display results

print()
print("Hot dogs needed:", hot_dogs_needed)
print("Full packs to buy based on packs of 10:", full_packs)
print("Hot dogs used from extra pack: ", hot_dogs_still_needed)

