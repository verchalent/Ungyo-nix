#!/usr/bin/env bash

# Get the current date for the output filename
output_file="macos_defaults_$(hostname)_$(date +%Y%m%d_%H%M%S).txt"

# Function to write a header
write_header() {
    echo -e "\n=== $1 ===\n" >> "$output_file"
}

# Get all domains
domains=$(defaults domains | tr ',' '\n' | sed 's/^ *//' | sort)

# Write initial header
echo "macOS Defaults Settings - Generated $(date)" > "$output_file"
echo "================================================" >> "$output_file"

# Process each domain
while IFS= read -r domain; do
    write_header "$domain"
    # Get all keys for the domain and format them
    defaults read "$domain" 2>/dev/null | sed 's/[{"}]//g' | sed 's/;$//' | \
    sed 's/    //' | grep -v '^$' >> "$output_file"
done <<< "$domains"

# Also get global preferences (no domain)
write_header "Global Preferences"
defaults read 2>/dev/null | sed 's/[{"}]//g' | sed 's/;$//' | \
sed 's/    //' | grep -v '^$' >> "$output_file"

echo "Defaults have been written to $output_file"
